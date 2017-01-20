`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2016 09:02:33 PM
// Design Name: 
// Module Name: Elevator_Simulator
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


module Elevator_Simulator(
    input logic CLK,
    input logic hold,
    input logic reset,
    input logic button0,
    input logic button1,
    input logic button2,
    input logic button3,
    input logic button4,
    output logic [3:0] motor,
    output logic [6:0] sevenSeg,
    output logic [2:0] X_out,
    output logic [2:0] state_value
    );
    
    logic dest_less, dest_more, hold, CLK2, dest_ld, dest_clr, floor_ld, floor_clr, mux_sig, dir, run, hold2, timer_reset, input_h;
    logic [2:0] X;
    
    assign X_out = X;
    
    floor_value_finder fvf(button0, button1, button2, button3, button4, input_h, X);
    
    timer t1(CLK, timer_reset, hold2, CLK2);
    
    controller cnt1 (CLK, reset, dest_less, dest_more, hold, CLK2, input_h, dest_ld, dest_clr, floor_ld, floor_clr, mux_sig, dir, run, hold2, timer_reset, state_value);
    
    Datapath dp1 (CLK, mux_sig, dest_ld, dest_clr, floor_ld, floor_clr, dir, run, hold2, X, dest_less, dest_more, sevenSeg, motor);
    
    
    
endmodule

