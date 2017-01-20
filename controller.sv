`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2016 08:15:06 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input logic CLK,
    input logic reset,
    input logic dest_less,
    input logic dest_more,
    input logic hold,
    input logic CLK2,
    input logic input_h,
    output logic dest_ld,
    output logic dest_clr,
    output logic floor_ld,
    output logic floor_clr,
    output logic mux_sig,
    output logic dir,
    output logic run,
    output logic hold2,
    output logic timer_reset,
    output logic [2:0] state_value
    );
    
    logic [2:0] state, nextstate;
    assign state_value = state;
    
    always_ff@(posedge CLK)
        if(reset)
            state <= 3'b100;
        else
            state <= nextstate;
            
    always_comb
        case(state)
            3'b000:
                begin
                    if( (!dest_less && !dest_more) || (dest_less && dest_more) )
                        begin
                            if(input_h)
                                begin
                                    nextstate = 3'b000;
                                    dest_ld = 1;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                                    dir = 0;    run = 0;    hold2 = 0; timer_reset = 0;
                                end
                            else
                                begin
                                    nextstate = 3'b000;
                                    dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                                    dir = 0;    run = 0;    hold2 = 0; timer_reset = 0;
                                end
                        end
                    else if(!dest_less && dest_more)
                        begin
                            nextstate = 3'b001;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 1;    run = 1;    hold2 = 0; timer_reset = 1;
                        end
                    else if(dest_less && !dest_more)
                        begin
                            nextstate = 3'b101;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 0;    run = 1;    hold2 = 0; timer_reset = 1;
                        end
                end
            
            3'b001:
                begin
                    if(!hold && !CLK2)
                        begin
                            nextstate = 3'b001;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 1;    run = 1;    hold2 = 0; timer_reset = 0;
                        end
                    else if(!hold && CLK2)
                        begin
                            nextstate = 3'b011;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 1;    run = 0;    hold2 = 0; timer_reset = 0;
                        end
                    else if(hold)
                        begin
                            nextstate = 3'b010;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 1;    run = 0;    hold2 = 1; timer_reset = 0;
                        end
                end
            
            3'b010:
                begin
                    if(!hold)
                        begin
                            nextstate = 3'b001;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 1;    run = 1;    hold2 = 0; timer_reset = 0;
                        end
                    else
                        begin
                            nextstate = 3'b010;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 1;    run = 0;    hold2 = 1; timer_reset = 0;
                        end
                end
            
            3'b011:
                begin
                    nextstate = 3'b000;
                    dest_ld = 0;    dest_clr = 0;   floor_ld = 1;   floor_clr = 0;  mux_sig = 1;    
                    dir = 0;    run = 0;    hold2 = 0; timer_reset = 0;
                end
                
            3'b101:
                begin
                    if(!hold && !CLK2)
                        begin
                            nextstate = 3'b101;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 0;    run = 1;    hold2 = 0; timer_reset = 0;
                        end
                    else if(!hold && CLK2)
                        begin
                            nextstate = 3'b111;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 0;    run = 0;    hold2 = 0; timer_reset = 0;
                        end
                    else if(hold)
                        begin
                            nextstate = 3'b110;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 0;    run = 0;    hold2 = 1; timer_reset = 0;
                        end
                end
                
            3'b110:
                begin
                    if(!hold)
                        begin
                            nextstate = 3'b101;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 0;    run = 1;    hold2 = 0; timer_reset = 0;
                        end
                    else
                        begin
                            nextstate = 3'b110;
                            dest_ld = 0;    dest_clr = 0;   floor_ld = 0;   floor_clr = 0;  mux_sig = 0;    
                            dir = 0;    run = 0;    hold2 = 1; timer_reset = 0;
                        end 
                end
            
            3'b111:
                begin
                    nextstate = 3'b000;
                    dest_ld = 0;    dest_clr = 0;   floor_ld = 1;   floor_clr = 0;  mux_sig = 0;    
                    dir = 0;    run = 0;    hold2 = 0; timer_reset = 0;
                end
            
            3'b100:
                begin
                    nextstate = 3'b000;
                    dest_ld = 0;    dest_clr = 1;   floor_ld = 0;   floor_clr = 1;  mux_sig = 0;    
                    dir = 0;    run = 0;    hold2 = 0; timer_reset = 0;
                end
            
            default:
                begin
                    nextstate = 3'b000;
                    dest_ld = 0;    dest_clr = 1;   floor_ld = 0;   floor_clr = 1;  mux_sig = 0;    
                    dir = 0;    run = 0;    hold2 = 0; timer_reset = 0;
                end            
                
        endcase
        
    
endmodule
