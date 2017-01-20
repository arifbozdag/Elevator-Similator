`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2016 07:30:54 PM
// Design Name: 
// Module Name: comparator
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


module comparator(
    input logic [2:0] dest,
    input logic [2:0] floor,
    output logic dest_less,
    output logic dest_more
    );
    
    always_comb
        if(dest < floor)
            begin
                dest_less = 1;
                dest_more = 0;
            end
        else if (dest > floor)
            begin
                dest_less = 0;
                dest_more = 1;
            end
        else
            begin
                dest_less = 0;
                dest_more = 0;
            end
    
endmodule
