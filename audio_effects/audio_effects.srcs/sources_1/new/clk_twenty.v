`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2018 15:24:03
// Design Name: 
// Module Name: clk_twenty
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


module clk_twenty(input CLOCK,output reg new_clk);
    reg [11:0] COUNT = 11'b0;
    initial begin
        new_clk = 0;
    end
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == 2499)? 0 : COUNT + 1;
        new_clk <= (COUNT == 0) ? ~new_clk : new_clk;
    end
endmodule
