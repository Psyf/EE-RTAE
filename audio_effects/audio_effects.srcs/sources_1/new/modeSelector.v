`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2018 08:15:37
// Design Name: 
// Module Name: modeSelector
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


module modeSelector(
    input [11:0] MIC_IN, 
    input [11:0] mic_delay_out,
    input [11:0] melody_out, 
    input [2:0] mode, 
    output reg [11:0] speaker_out
    );
    
    always @ (mode) begin
        if (mode == 0) speaker_out = 12'b0; 
        else if (mode == 1) speaker_out = MIC_IN;  
        else if (mode == 2) speaker_out = mic_delay_out; 
        else if (mode == 3) speaker_out = melody_out; 
    end 
    
endmodule
