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
// 2 input AND gate.  Latency 0.

module alt_ehipc3_fm_sl_and2t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [1:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b1,1'b1,1'b1,1'b1,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h8000000000000000;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7sLGz7tkP6GhVJic3uDQa6WCtjDxd7eml7oNAARkuQJ/U/8RJkxlLwEi1pur6zNhpiOZ97D1UQsfw92Lpwl6Gy0E5sVAkdWLWVAZtSN+zRXITTN8K8W1sDmOVzFXPKqoqOpNrmGkTP9xbNgW5I+XjBJMDANxn6+E0CzMGc14ocKNbdGjdGlfQQo89f7cBPM8d+fbKKWT56CZAWLP8+oct0jKZS4dFy8zzjicFkdNoU/L1IXBl+T+shgQE3xnicgTqPfUd9HXKFIGu6EBtvAcTsPAzRD3O/WJfZ4Dph5uP3obbgexTKlw6UQSnArehHQLbjps4NvD1YkNq+k5RxSJChogHE2ViilUc9LbtYnuDCwy+OQIVL7qMnq01zaw2R8Y/mOa+QKmFVYDo0RkwXTh3Kax18W2VP/2O9lpwrDO5TXiOi6hwZ7np6B6NL+SOtAa2RZ2QWiSEyxF9vZrLdAk6+fhCJBFGrstO5bMcwzf6UeSP8ZRb+pxPvusSyS3BK7tCrv/9SWhtog73FPG/Ycw0ra5klDFPyh0wrbMPfJ2pjAOU4kiS+mmcj2LzvvZQRfu6zcw0gArUOHIeBsQ+7CXRg/DColGE4TeZl9U/D5tu3P5+y+WbgRYqb0jjf3FcS01/vWEMghVuBAsngBmli0O/hNtKheOxyN6kpQ1qrTidI6iBzQhYio+NubK9NdWWL58+k5c9IOMi2GAXPWCCug3sUM+2Zv0Jj8gB5JqXZu1y6pMQT9bKLBWhy+m3YaxWeuUv9gcequ8bMI18gsQM0KWXHC"
`endif