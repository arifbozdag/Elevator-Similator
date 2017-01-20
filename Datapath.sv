`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2016 06:45:20 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input logic CLK,
    input logic mux_sig,
    input logic dest_ld,
    input logic dest_clr,
    input logic floor_ld,
    input logic floor_clr,
    input logic dir,
    input logic run,
    input logic hold2,
    input logic [2:0] X,
    output logic dest_less,
    output logic dest_more,
    output logic [6:0] sevenSeg,
    output logic [3:0] motor
    );
    
    logic [2:0] dest, floor, mux;
    
    comparator cmp1(dest, floor, dest_less, dest_more);
    
    nextfloor nf1(floor, mux_sig, mux);
    
    elevator_display(floor, hold2, sevenSeg);
    
    FSM_only(dir, run, CLK, motor);
    
    
    always_ff@(posedge CLK)
        begin
            if(dest_clr)
                dest <= 3'b000;
            
            else if(dest_ld)
                dest <= X;
                
            if(floor_clr)
                floor <= 3'b000;
            
            else if(floor_ld)
                floor <= mux;
        end
    
    
    
endmodule
