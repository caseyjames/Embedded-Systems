// woregwrp.v
module woregwrp(
 PCLK,
 PENABLE,
 PSEL,
 PRESERN,
 PWRITE,
 PREADY,
 PSLVERR,
 PWDATA,
 S,
 TPS);

input PCLK,PENABLE, PSEL, PRESERN, PWRITE;
input [7:0] PWDATA;
output [1:0] S;
output PREADY, PSLVERR;
output [4:0] TPS;//test points

wire wr_enable;

// define write-enable wire signal
assign wr_enable = (PENABLE && PWRITE && PSEL);

woreg woreg_0(.clk(PCLK), .nreset(PRESERN), .wr_en(wr_enable), 
              .data_in(PWDATA), .to_dec(S));
 
assign PREADY = 1'b1; 
assign PSLVERR = 1'b0;

assign TPS[0] = PCLK;
assign TPS[1] = PWRITE;
assign TPS[2] = PSEL;
assign TPS[3] = PENABLE;
assign TPS[4] = PREADY; 
 
endmodule