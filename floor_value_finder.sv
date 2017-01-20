`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2016 11:27:21 AM
// Design Name: 
// Module Name: floor_value_finder
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


module floor_value_finder(
    input logic button0,
    input logic button1,
    input logic button2,
    input logic button3,
    input logic button4,
    output logic load,
    output logic [2:0] dest
    );
    
    logic load;
    logic [4:0] col;
    
    always_comb
    begin
        col[0] = button0;
        col[1] = button1;
        col[2] = button2;
        col[3] = button3;
        col[4] = button4;
        load = button0 + button1 + button2 + button3 + button4;
        end
    
    always_comb
        case(col)
            5'b00001 : dest = 3'b000;
            5'b00010 : dest = 3'b001;
            5'b00100 : dest = 3'b010;
            5'b01000 : dest = 3'b011;
            5'b10000 : dest = 3'b100;
            default : dest = 3'b000;
        endcase
        
endmodule
