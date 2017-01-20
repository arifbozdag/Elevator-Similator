`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2016 11:02:19 AM
// Design Name: 
// Module Name: elevator_display
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


module elevator_display(
    input logic [2:0] state,
    input logic hold, 
    output logic [6:0] C
    );
    
	always@(state)
	   if(!hold)
	       begin
			    case(state)
                3'b000 : C = 7'b1000000; //0
                3'b001 : C = 7'b1111001; //1
                3'b010 : C = 7'b0100100; //2
                3'b011 : C = 7'b0110000; //3
                3'b100 : C = 7'b0011001; //4
                3'b101 : C = 7'b0000110; //E
                3'b110 : C = 7'b0000110; //E
                3'b111 : C = 7'b0000110; //E
                default : C = 7'b0000110; //E
                endcase
            end
    else
        C = 7'b0001001; //H

endmodule 