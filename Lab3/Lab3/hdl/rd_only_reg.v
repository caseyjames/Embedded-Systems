///////////////////////////////////////////////////////////////////////////////////////////////////
//
// READ ONLY REG
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

module rd_only_reg(
input clk, 
input nreset, 
input rd_en, 
input data_in, 
output data_out, 
output led_port);

//reg Declarations 
reg [7:0] ledioreg; 
//the io register 
reg [7:0] data_out; 
//Data Output 
wire [7:0] led_port;
//map led register to leds 
assign led_port = ledioreg;

//read encoder  
always @(posedge clk, negedge nreset) 
begin : READ_GEN  
if(nreset == 1'b0)  
begin  
data_out <= 8'h00;  
end  
else if(rd_en) 
begin  
data_out <= ledioreg; 
end 
end

endmodule

