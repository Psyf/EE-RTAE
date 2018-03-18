`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2018 15:33:02
// Design Name: 
// Module Name: clk_fifty
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


module clk_fifty(input CLOCK, output reg new_clk);
    reg COUNT = 1'b0;
    initial begin
        new_clk = 0;
    end
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        new_clk <= (COUNT == 0) ? ~new_clk : new_clk;
    end
endmodule
