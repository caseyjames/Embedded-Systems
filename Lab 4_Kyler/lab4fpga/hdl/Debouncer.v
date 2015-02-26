///////////////////////////////////////////////////////////////////////////////////////////////////
// 
//
// SWITCH DEBOUNCER
// Debounces 1 switch
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 
module Debouncer(
input clk, nreset, sw_in,				
output reg sw_db);
					  
parameter N = 23,
db_time = 1000; //debouncer counter size

reg   ff1;
reg   ff2;
reg [N-1:0] counter;

wire sclr;

assign sclr = (ff1 ^ ff2); //sclr clear the counter when the switched change
assign en = counter[N-1];

//FF1 and FF2
always @ (posedge clk)
begin
	if (~nreset) begin
		ff1 <= 1'b0;
		ff2 <= 1'b0;
	end

	else begin
		ff1 <= sw_in;
		ff2 <= ff1;
	end
end

//COUNTER
always @ (posedge clk)
begin
	if (~nreset | sclr)
		counter <= 0;
	else if(counter < db_time)
		counter <= counter + 1;
end


//FF3
always @ (posedge clk)
begin
	if (~nreset)
		sw_db <= 1'b0;
	else if (counter >= db_time)
		sw_db <= ff2;
end


endmodule

