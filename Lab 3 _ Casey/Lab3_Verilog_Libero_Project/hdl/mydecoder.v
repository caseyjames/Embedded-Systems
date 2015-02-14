// mydecoder.v

module mydecoder( S, TP0, TP1, TP2, TP3, TP4, Y);
    
    input [1:0] S;
    input TP1, TP3;
    output reg [3:0] Y;
    output reg TP0, TP2, TP4;

    reg [1:0] temp;

    always @* 
        begin
        case (temp)
            2'b00: Y = 4'b0111;
            2'b01: Y = 4'b1011;
            2'b10: Y = 4'b1101;
            2'b11: Y = 4'b1110;
            default Y = 4'b1111;
        endcase

        TP0 = S[0];
        TP2 = S[1];
        TP4 = Y[1];
        temp[0] = TP1;
        temp[1] = TP3;
        end
endmodule