`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 22:35:27
// Design Name: 
// Module Name: melody
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


module melody(
    input CLK,
    input [7:1] keys,
    input [1:0] varPitch, 
    output reg [11:0] SPEAKER_OUT, 
    output reg [6:0] melody_disp 
);
    reg [17:0] counter = 18'b0; 
    reg [17:0] limit = 18'b0; 
    reg [2:0] k = 3'b0;
    initial begin
        SPEAKER_OUT = 12'b0; 
    end 
    
    always @ (posedge CLK) begin
        counter <= (counter > limit) ? 0 : counter + 1; 
        SPEAKER_OUT <= (counter == 0) ? ~SPEAKER_OUT : SPEAKER_OUT; 
        
        // {To Do} @Harun, write to melody Disp for assigning the correct note on 7-seg
         if (keys[7]) begin 
         limit <= 101238/(1+varPitch); 
         k = 6;
         end
         else if (keys[6]) begin 
         limit <= 113636/(1+varPitch);
         k = 5;
         end
         else if (keys[5]) begin 
         limit <= 127551/(1+varPitch); 
         k = 4;
         end
         else if (keys[4]) begin 
         limit <= 143173/(1+varPitch); 
         k = 3;
         end 
         else if (keys[3]) begin 
         limit <= 151686/(1+varPitch); 
         k = 2;
         end
         else if (keys[2]) begin 
         limit <= 170262/(1+varPitch); 
         k = 1;
         end
         else if (keys[1]) begin 
         limit <= 191112/(1+varPitch); 
         k = 0;
         end
         else limit <= 0;
         
         case(k)
            0: melody_disp = 7'b0110001; //c
            1: melody_disp = 7'b1000010; //d
            2: melody_disp = 7'b0110000; //e
            3: melody_disp = 7'b0111000; //f
            4: melody_disp = 7'b0100000; //g but looks like a '6'
            5: melody_disp = 7'b0000010; //a
            6: melody_disp = 7'b1100000; //b
         endcase
            
    end 
endmodule
