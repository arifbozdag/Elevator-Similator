`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2016 11:16:19 AM
// Design Name: 
// Module Name: timer
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
//                  https://learn.digilentinc.com/Documents/262
//////////////////////////////////////////////////////////////////////////////////


module timer(
    input logic clk,
    input logic reset,
    input logic hold,
    output logic clk_div
    );
    
    localparam constantNumber = 1070000000;
    
    logic [31:0] count;
     
    always_ff@(posedge clk, posedge reset)
    begin
        if (reset == 1'b1)
            count <= 32'b0;
        else if (count == constantNumber - 1)
            count <= 32'b0;
        else if(!hold)
            count <= count + 1;
    end  

    always_ff@(posedge clk, posedge reset)
    begin
        if (reset == 1'b1)
            clk_div <= 1'b0;
        else if (count == constantNumber - 1)
            clk_div <= ~clk_div;
        else
            clk_div <= clk_div;
    end
    
endmodule