`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2018 14:25:23
// Design Name: 
// Module Name: five_hz_clock
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


module five_hz_clock(
        input CLK,
        output reg PULSE
    );
    reg [22:0] COUNT = 22'b0;
    initial begin
        PULSE = 0;
    end
    always @ (posedge CLK) begin
        PULSE <= (COUNT == 22'b0) ? ~PULSE : PULSE;
        COUNT <= COUNT + 1;
    end
        
    
endmodule
