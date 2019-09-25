`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2019 09:36:03 AM
// Design Name: 
// Module Name: ALUHandler
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


module ALUcontrol(
    input BTNL,
    input BTNR,
    input BTNC,
    input CLK,
    input [15:0]SW,
    
    output reg [15:0]LED,
    output reg LED17_G,
    output reg LED16_R,
    output  [7:0]CA,
    output  [7:0]AN
    );
    
    reg loadLeft;
    reg loadRight;
    
    ValueLoader number(.loadLeft(loadLeft), .loadRight(loadRight), .SW(SW), .CLK(CLK), .CA(CA), .AN(AN), .Value(Value));
    ALU control(.CLK(CLK), .A(A), .B(B), .CTL(CTL), .result(result), .zeroFlag(zeroFlag), .negativeFlag(negativeFlag));
    //Initialize variables
    initial begin
 
     loadLeft = 0;
     loadRight = 0;
    end
    
    always@(posedge CLK) begin
        LED <= result;
        if(BTNL == 1)begin
            loadLeft<=1;
        end
        else begin
        loadLeft<=0;
        end
        if (BTNR == 1)begin
            loadRight<=1;
        end
        else begin
        loadRight<=0;
        end
        if (BTNC == 1)begin
        loadLeft <= A;
        loadRight <= B;
        end
        
    end
  
endmodule