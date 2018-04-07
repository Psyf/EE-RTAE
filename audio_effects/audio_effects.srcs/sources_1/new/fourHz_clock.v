`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2018 10:39:20
// Design Name: 
// Module Name: fourHz_clock
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


module fourHz_clock(
        input CLK,
        output reg slowclk
    );
    reg [23:0] count = 23'b0;
    initial begin
        slowclk = 0;
    end
    always @ (posedge CLK) begin
        count <= count + 1;
        slowclk <= (count == 23'b0) ? ~slowclk : slowclk;
    end
    
endmodule
