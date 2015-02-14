// woreg.v  -- a write only register
module woreg( clk, nreset, wr_en, data_in, to_dec); 
 
//Inputs Declarations 
input clk; //Clock
input nreset; //active low reset 
input wr_en; //Write Enable 
input [7:0] data_in; //Button data input from APB3
 
//output Declarations 
output [1:0] to_dec; //Data Output wires to decoder
 
//reg Declaration (write-only)
reg [7:0] bt_val; //Stores button value state

//map reg values to decoder
assign to_dec[0] = bt_val[0];
assign to_dec[1] = bt_val[1];

//write to register 
always @(posedge clk, negedge nreset) 
 begin : WRITE_GEN 
 if(nreset == 1'b0)
 begin
    bt_val <= 8'h00;
 end
 else if(wr_en)
 begin 
    bt_val <= data_in;
 end 
 end 
endmodule