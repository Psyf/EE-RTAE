`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Saif Uddin Mahmud
// Matric No. : A0170896N
// Project Name: Audio Effects 
// Module Name: mic_delay
// Description: 
//    Set SW[2:0] = 3'b010 to use this mode 
//    Value of SW[15:14] is amount of delay in seconds. For example, if it is  
//    3'b001 you will get 1 second delay.
//
//    The system makes use of the concept of circular buffer and writes ahead of read. 
//    Your delay value will determine how far away. The indices were calculated keeping the 
//    20 KHz clock in mind. Using any other clock will need the values to be readjusted and 
//    perhaps even use a different size of register for memory
//
//    As an added Feature, the module outputs the number of seconds of delay in the 7-segment 
//    display. You have to ensure that {displayChange} switch is set correctly {To Do} @Saif
//////////////////////////////////////////////////////////////////////////////////


module mic_delay(
    input clk, 
    input [1:0] varDelay,  
    input [11:0] MIC_in, 
    output reg [11:0] SPEAKER_OUT, 
    output reg [6:0] seg 
    );

    reg [1:0] k;
    always @ (varDelay) begin 
        if (varDelay == 2'b00) k=2'b00; 
        else k=varDelay;
    end   
    
    reg [16:0]i = 0; 
    reg [11:0] memory [0:99999]; 
    
    always @ (posedge clk) begin
        i <= (i==99999)? 0 : i+1; 
        memory[(i+1+(20000*k))%100000] <= MIC_in;   
        SPEAKER_OUT <= memory[i];  
        
        case (k)
            0 : seg = 7'b1000000; 
            1 : seg = 7'b1111001; 
            2 : seg = 7'b0100100; 
            3 : seg = 7'b0110000; 
        endcase 
    end 
endmodule
