`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name: Audio Effects
// Module Name: clk_fiftyM
// Description: 
//          Takes in 100 MHz clock from the Basys3 FPGA 
//          and generates a 50 MHz clock as output 
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
