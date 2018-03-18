`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2018 15:59:18
// Design Name: 
// Module Name: clk_20k
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


module clk_twentyK(
    input CLK, 
    output reg PULSE
    );
    reg [11:0] COUNT = 12'b0; 
    initial begin
        PULSE = 0; 
    end
    
    always @ (posedge CLK) begin  
        COUNT <= (COUNT == 2499) ? 0 : COUNT + 1; 
        PULSE <= (COUNT == 0) ? ~PULSE : PULSE; 
    end
    
endmodule
