`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2018 11:15:42
// Design Name: 
// Module Name: mic_delay
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


module mic_delay(
    input clk, 
    input [1:0] varDelay,  
    input [11:0] MIC_in, 
    output reg [11:0] SPEAKER_OUT 
    );
    
    //NOTE: depending on switch, vary k
    reg [1:0] k;
    always @ (varDelay) begin 
        if (varDelay == 2'b00) k=2'b00; 
        else k=varDelay;
    end   
    
    reg [16:0]i = 0; 
    reg [11:0] memory [0:99999]; 
    //NOTE: how to initialize at 0
    always @ (posedge clk) begin
        i <= (i==99999)? 0 : i+1; 
        memory[(i+1+(20000*k))%100000] <= MIC_in;   
        SPEAKER_OUT <= memory[i];  
    end 
endmodule
