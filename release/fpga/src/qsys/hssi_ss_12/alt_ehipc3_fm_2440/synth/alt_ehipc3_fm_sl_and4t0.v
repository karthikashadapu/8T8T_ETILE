// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.




`timescale 1ps/1ps

// DESCRIPTION
// 4 input AND gate.  Latency 0.

module alt_ehipc3_fm_sl_and4t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [3:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b1,1'b1,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h8000000000000000;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7sx+HuuD+yAoj98wdj4l86fu4Lc51V++xOMXPxQrpkCT+BpM0B/fznS+ANmGt+aETyFsN3m8yxBi/0jjrW4CAko5FmlKoOuuEWCap1FwCcC4ZZ7gbBa8S1ms9FHMCqT/0sCuzmdXhcH6CHi/8keH2VacpPs40ruuuN1Ji/qZ5802x0r449+4/29ebLUfFU+mMjghfOckf8nZi0su4XJG1MMCuJzv2POQd3bqp9E0yPn5GK+erj/V8A4hipteflJHbCyzVHCOkI78EsyOyEIFijIV0clSmKbQjxf3a9ByY5MBjmNY7xIlRgFiZYZccYKAPxiZ+L+p0aHwveU75hJNJmU4/myiKOgZYoMyB1Xcbjrquk5xyJCgCZsMxoM+27H/5MxK66J91nGbD0jFY1epkam3aLgdIgeirPjLx+f0gt3ZYsIAAOgW6WLKsjl2Nefj+BVKfPj3mbxBP9A05q0rT50zFsJbxei+219k+2AclDokStVn1fdfVwHUFernr95cVODtzXdUXtRHR/IMRqysfWm6+mYf48M7/G53brkuqi5I+VSDN7Zhlyz6Fvm+cTAKuvzBDyUItxv5Fr9rZEsGm+WAtUSfQDHc+mnS6h0aAn9oDoRY2/Eo0vsinA4/+dBGRdRE5MlymONinAVeR86X6gxQRkZNqQR5+5b/lVNG/40ww6savCrtEJgARALq7tw6SomjUDVxWzADBdrc68WyYPs/quTHRL6GHwx6MhLfB9tnkw8Bt6pNRrQFLp2mqz22fB+3oH7oqLtYy9JAJInqrKT"
`endif