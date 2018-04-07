`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2018 10:37:46
// Design Name: 
// Module Name: morse_code
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module morse_code(
        input clk,
        input mode, 
        output reg[11:0] speaker_out,
        output reg led
    );
    reg [11:0] song [0:72];
    initial begin 
        song[0] = 12'b101010101010; 
        song[1] = 12'b0;
        song[2] = 12'b101010101010;  
        song[3] = 12'b0;
        song[4] = 12'b101010101010; //S
        song[5] = 12'b0;
        song[6] = 12'b0; 
        song[7] = 12'b111111111111; 
        song[8] = 12'b0; 
        song[9] = 12'b111111111111;
        song[10] = 12'b0;
        song[11] = 12'b111111111111;
        song[12] = 12'b111111111111; //U
        song[13] = 12'b0;
        song[14] = 12'b111111111111;
        song[15] = 12'b0;
        song[16] = 12'b111111111111; //EE
        song[17] = 12'b111111111111;
        song[18] = 12'b0; 
        song[19] = 12'b111111111111;
        song[20] = 12'b0; 
        song[21] = 12'b111111111111;
        song[22] = 12'b111111111111;
        song[23] = 12'b0; 
        song[24] = 12'b111111111111;
        song[25] = 12'b111111111111;
        song[26] = 12'b0; 
        song[27] = 12'b111111111111;
        song[28] = 12'b111111111111;
        song[29] = 12'b0; //2
        song[30] = 12'b0;  
        song[31] = 12'b111111111111;
        song[32] = 12'b111111111111;
        song[33] = 12'b0; 
        song[34] = 12'b111111111111;
        song[35] = 12'b111111111111;
        song[36] = 12'b0; 
        song[37] = 12'b111111111111;
        song[38] = 12'b111111111111;
        song[39] = 12'b0; 
        song[40] = 12'b111111111111;
        song[41] = 12'b111111111111;
        song[42] = 12'b0; 
        song[43] = 12'b111111111111;
        song[44] = 12'b111111111111;
        song[45] = 12'b0; //0
        song[46] = 12'b111111111111;
        song[47] = 12'b0; 
        song[48] = 12'b111111111111;
        song[49] = 12'b0; 
        song[50] = 12'b111111111111;
        song[51] = 12'b111111111111;
        song[52] = 12'b0; 
        song[53] = 12'b111111111111;
        song[54] = 12'b111111111111;
        song[55] = 12'b0; 
        song[56] = 12'b111111111111;
        song[57] = 12'b111111111111;
        song[58] = 12'b0; //2
        song[59] = 12'b111111111111;
        song[60] = 12'b111111111111;
        song[61] = 12'b0; 
        song[62] = 12'b111111111111; 
        song[63] = 12'b0; 
        song[64] = 12'b111111111111; 
        song[65] = 12'b0; 
        song[66] = 12'b111111111111; 
        song[67] = 12'b0; 
        song[68] = 12'b111111111111; 
        song[69] = 12'b0; //6 
        song[70] = 12'b0; 
        song[71] = 12'b0; 
        song[72] = 12'b0; //silence
    end    
    
    reg [6:0] counter = 7'b0; 
    always @ (posedge clk) begin
      counter <= (counter == 1001000) ? 7'b0 : counter+1;
      speaker_out <= song[counter]; 
      led <= (song[counter] == 12'b0) ? 0 : 1&mode; 
    end 
    
endmodule
