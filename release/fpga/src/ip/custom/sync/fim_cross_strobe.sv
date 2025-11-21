// Copyright 2020 Intel Corporation.
//
// THIS SOFTWARE MAY CONTAIN PREPRODUCTION CODE AND IS PROVIDED BY THE
// COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
// OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Description
//-----------------------------------------------------------------------------
//
// This is a register based circuit for moving a single cycle pulse from 
// one clock domain to another.
//
// This single cycle pulse clock crossing module is generally used in 
// multiple cycle path formulation to move a bus of signals from one clock domain 
// to another.
//
//-----------------------------------------------------------------------------

`timescale 1ps/1ps

module fim_cross_strobe #(
   parameter SYNC_NO_CUT = 1
)(
   // Source clock domain
   input  logic din_clk,
   input  logic din_srst,
   input  logic din_pulse,

   // Destination clock domain
   input  logic dout_clk,
   input  logic dout_srst,
   output logic dout_pulse
);

//---------------------------
// Embedded SDC 
//---------------------------
// Toggle the level of din_togl when a pulse is detected on din_pulse input
// din_togl will remain at the same signal level until the next din_pulse assertion 
logic din_togl;

always_ff @(posedge din_clk) begin
   if (din_srst)
      din_togl <= 1'b0;
   else
      din_togl <= din_togl ^ din_pulse;
end

// Synchronize din_togl on to dout_clk domain with 2-stage synchronizer chains
logic togl_s;

fim_resync #(
   .SYNC_CHAIN_LENGTH (2),
   .WIDTH             (1),
   .INIT_VALUE        (0),
   .NO_CUT            (SYNC_NO_CUT)
) sr (
   .clk   (dout_clk),
   .reset (1'b0),
   .d     (din_togl),
   .q     (togl_s)
);

// Last stage synchronizer register 
logic last_togl_s;

always_ff @(posedge dout_clk) begin
   if (dout_srst)
      last_togl_s <= 1'b0;
   else
      last_togl_s <= togl_s;
end

// Generate dout_pulse from togl_s and last_togl_s
assign dout_pulse = togl_s ^ last_togl_s;

endmodule

