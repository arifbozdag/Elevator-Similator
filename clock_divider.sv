`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2016 10:58:29 AM
// Design Name: 
// Module Name: clock_divider
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



module clock_divider(
    input logic clk,
    output logic out
    );

    logic [18:0] count;
    
    always_ff@(posedge clk)
        count <= count + 1;
    
    always_comb
    if(count[18:17])
       out = 0;
    else 
       out = 1;

endmodule

/*
    logic [23:0] count;

    always_ff@(posedge clk)
        if(count == 24'b10011000100101101000000)
            begin
            count <= 24'b00000000000000000000000;
            out <= 1;
            end
        else
            begin
            count <= count + 1;
            out <= 0;
            end 
         */