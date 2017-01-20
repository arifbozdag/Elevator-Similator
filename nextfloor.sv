`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2016 07:22:39 PM
// Design Name: 
// Module Name: nextfloor
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


module nextfloor(
    input logic [2:0] floor,
    input logic mux_sig,
    output logic [2:0] mux
    );
    
    always_comb
        case(mux_sig)
            1: mux = floor + 3'b001;
            0: mux = floor - 3'b001;
        endcase
    

endmodule
