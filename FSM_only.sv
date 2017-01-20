`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2016 10:51:42 AM
// Design Name: 
// Module Name: FSM_only
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


module FSM_only(
    input logic DIR,
    input logic RUN,
    input logic CLK,
    //input logic clk_input,
    //input logic reset,
    //input logic clear,
    output logic [3:0] JC
    );
    
    logic reset, clear;
    
    assign reset = 0;
    assign clear = 0;
    
    clock_divider cd1(CLK, out);
    motor_FSM f1(DIR, RUN, out, reset_pulse, JC);
    //pulse_controller p1(CLK, clk_input, clear, clk_pulse);
    pulse_controller p2(CLK, reset, clear, reset_pulse);
    
endmodule
