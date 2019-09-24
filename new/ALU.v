`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2019 09:34:57 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
        input CLK,
        input [7:0] A,
        input [7:0] B,
        input [2:0] CTL,
        output reg [7:0] result,
        output reg zeroFlag,
        output reg negativeFlag
    );
    initial begin
        result <= 0;
    end
    
    
    always@(posedge CLK) begin
        
        //defined operations in ButkaStandard
        case(CTL)
        0: result = A + B;
        1: result = A - B;
        2: result = ~A;
        3: result = A << B;
        4: result = A >> B;
        5: result = A & B;
        6: result = A | B;
        7: result = A;
        endcase
        
        //Required Zero Flag in ButkaStandard
        if(result == 0) begin
            zeroFlag <= 1;
        end
        else begin
            zeroFlag <= 0;
        end
        
        //Required NegativeFlag in ButkaStandard
        negativeFlag = result[7];
        
        
    end
    
    
endmodule
