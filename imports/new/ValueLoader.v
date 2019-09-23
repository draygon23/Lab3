`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2019 05:16:44 PM
// Design Name: 
// Module Name: ValueLoader
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


module ValueLoader(
    input loadLeft,
    input loadRight,
    input [15:0] SW,
    input countdown,
    input CLK,
    output [7:0] AN,
    output [7:0] CA,
    output reg countdownComplete
    );
    
    //declare important variables
    reg[31:0] Value;
    SevenSegment SevenSegment (.VALUE(Value), .CLK(CLK), .AN(AN), .CA(CA));
    
    //initialize Value
    initial begin
        Value = 32'h00000000;
    end
    
    
    
    always@(posedge CLK) begin
        //when load left is pulled high, load the right value
        if(Value==0)
            begin
            countdownComplete<=1;
            end
        else
            begin
            countdownComplete<=0;
            end
        if(loadLeft) begin
            //countdownComplete <= 0;
            Value[31:16] <= SW[15:0];
            end
        //when load right is pulled high, load the right value
        else if(loadRight) begin
            //countdownComplete <= 0;
            Value[15:0] <= SW[15:0];
            end
        else if(countdown) begin
            if(Value == 0) begin
                //countdownComplete <= 1;
                Value <= 0;
                end
            else begin
                Value <= Value - 1;
                end
            end
        end
        
        
endmodule