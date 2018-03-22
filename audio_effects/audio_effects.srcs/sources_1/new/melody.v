`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 22:35:27
// Design Name: 
// Module Name: melody
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


module melody(
    input CLK,
    input [7:1] keys,
    output reg [11:0] SPEAKER_OUT 
);
    reg [17:0] counter = 18'b0; 
    reg [17:0] limit = 18'b0; 
    
    initial begin
        SPEAKER_OUT = 12'b0; 
    end 
    
    always @ (posedge CLK) begin
        counter <= (counter < limit) ? 0 : counter + 1; 
        SPEAKER_OUT <= (counter == 0) ? ~SPEAKER_OUT : SPEAKER_OUT; 
        //DEBUG: how to create a proper 12 bit pulse?
        //read up on DA2CompRef.vhd
        //Also decide on improvement 
        
        case (keys)    
            1 : limit <= 191112;
            2 : limit <= 170262; 
            4 : limit <= 151686; 
            8 : limit <= 143173; 
            16 : limit <= 127551; 
            32 : limit <= 113636; 
            64 : limit <= 101238; 
            default : limit <= 0;   
        endcase
    end 
endmodule
