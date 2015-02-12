/////////////////////////////////////////////
//
//   READ ONLY REG WRAPPER
//
//////////////////////////////////////////////
module rd_reg_wrp(PCLK,  PENABLE,  PSEL,  PRESERN,  PWRITE,  PREADY,  PSLVERR,  PWDATA,  PRDATA,  LEDCON,  TPS);
input PCLK,PENABLE, PSEL, PRESERN, PWRITE; 
input [7:0] PWDATA; 
output [7:0] PRDATA, LEDCON; 
output PREADY, PSLVERR; 
output [4:0] TPS;//test points
wire rd_enable; 
assign rd_enable = (!PWRITE && PSEL); //Data is ready during first cycle to make it availble on the bus 

//when PENABLE is asserted
rd_only_reg rd_reg(.clk(PCLK), .nreset(PRESERN), .wr_en(wr_enable),  .rd_en(rd_enable), .data_in(PWDATA), .data_out(PRDATA),  .led_port(LEDCON)); 

assign PREADY = 1'b1; 
assign PSLVERR = 1'b0;
assign TPS[0] = PCLK;

assign TPS[1] = PWRITE; 
assign TPS[2] = PSEL; 
assign TPS[3] = PENABLE; 
assign TPS[4] = PREADY; 
endmodule

