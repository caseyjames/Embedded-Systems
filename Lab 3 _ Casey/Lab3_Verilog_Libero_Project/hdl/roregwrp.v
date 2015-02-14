// roregwrp.v
module roregwrp(
 PCLK,
 PENABLE,
 PSEL,
 PRESERN,
 PWRITE,
 PREADY,
 PSLVERR,
 PRDATA,
 Y,
 TPS);

input PCLK,PENABLE, PSEL, PRESERN, PWRITE;
input [3:0] Y;
output [7:0] PRDATA;
output PREADY, PSLVERR;
output [4:0] TPS;//test points

wire rd_enable; //only needs the read enable signal

assign rd_enable = (!PWRITE && PSEL); //Data is ready during first
//cycle to make it availble on the bus when PENABLE is asserted

roreg roreg_0(.clk(PCLK), .nreset(PRESERN),
.rd_en(rd_enable), .from_dec(Y), .data_out(PRDATA));
 
assign PREADY = 1'b1; 
assign PSLVERR = 1'b0;

assign TPS[0] = PCLK;
assign TPS[1] = PWRITE;
assign TPS[2] = PSEL;
assign TPS[3] = PENABLE;
assign TPS[4] = PREADY; 
 
endmodule