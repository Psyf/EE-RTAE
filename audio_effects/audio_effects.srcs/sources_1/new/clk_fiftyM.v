`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2018 16:30:25
// Design Name: 
// Module Name: clk_fiftyM
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


module clk_fiftyM(
    input CLK, 
    output reg PULSE
    );
    reg COUNT = 1'b0; 
    initial begin 
        PULSE = 0; 
    end 
    
    always @ (posedge CLK) begin
        COUNT <= ~COUNT; 
        PULSE <= (COUNT == 0) ? ~PULSE : PULSE; 
    end 
endmodule
