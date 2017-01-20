`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2016 10:55:44 AM
// Design Name: 
// Module Name: motor_FSM
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


module motor_FSM(
    input logic DIR,
    input logic RUN,
    input logic CLK,
    input logic reset,
    output logic [3:0] led_output
    //output logic [1:0] state
    );

    logic [1:0] state, nextstate;
    
    always_comb
        if(DIR == 1) nextstate = state + 2'b01;
        else nextstate = state - 2'b01;


    always_ff@(posedge CLK, posedge reset)
        if(reset)
            state <= 2'b00;
        else
            if( RUN )
              state <= nextstate;
        
                
    always_comb
        case (state) 
            2'b00: led_output = 4'b1010;
    
            2'b01: led_output = 4'b0110;
            
            2'b10: led_output = 4'b0101;

            2'b11: led_output = 4'b1001;
            
            default: led_output = 4'b1010;
        endcase

endmodule
