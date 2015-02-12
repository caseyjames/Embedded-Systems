///////////////////////////////////////////////////////////////////////////////////////////////////
// 
// BINARY TO UNIARY ENCODER
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 
module b2u_encoder( S, TP0, TP1, TP2, TP3, TP4, Y );
input [1:0] S;
input TP1, TP3;
output [3:0] Y;
output TP0, TP2, TP4;
reg [3:0] Y;
reg TP0, TP2, TP4;
reg [1:0] temp;
always @(*) begin
case (temp)
2'b00: Y = 4'b1000;
2'b01: Y = 4'b1100;
2'b10: Y = 4'b1110;
2'b11: Y = 4'b1111;
default Y = 4'b1111;
endcase
TP0 = S[0];
TP2 = S[1];
TP4 = Y[0];
temp [0] = TP1;
temp [1] = TP3;
end
endmodule

