`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Project Name: Audio Effects
// Module Name: clk_20k
// Description: 
//          Takes in 100 MHz clock from the Basys3 FPGA 
//          and generates a 20 KHz clock as output 
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
