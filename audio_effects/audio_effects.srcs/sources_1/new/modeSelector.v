`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: modeSelector
// Project Name: Audio Effects
// Description: 
//       This MUX takes care of integration of all the new modules
//       SW[2:0] used to change between modes
//           > 3'000 for disabling headphones
//           > 3'b001 for MIC with no delay
//           > 3'b010 for MIC with delay            
//           > 3'b011 for Musical Instrument 
//           > 3'b1xx for Kill Switch (Extra Feature #1)
//        
//       The module checks the status of the switches and links the correct output to use 
//       SPEAKER_OUT. This is done by using a if/else statments
//////////////////////////////////////////////////////////////////////////////////

module modeSelector(
    input [11:0] MIC_IN, 
    input [11:0] mic_delay_out,
    input [11:0] melody_out, 
    input [11:0] morse_out, 
    input [2:0] mode, 
    output reg [11:0] speaker_out
    );
    
    always @ (mode) begin
        if (mode[2] == 1'b1) speaker_out = morse_out; 
        else if (mode == 0) speaker_out = 12'b0; 
        else if (mode == 1) speaker_out = MIC_IN;  
        else if (mode == 2) speaker_out = mic_delay_out; 
        else if (mode == 3) speaker_out = melody_out;  
    end 
    
endmodule
