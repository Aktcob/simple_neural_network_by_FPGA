`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2017 15:26:08
// Design Name: 
// Module Name: SIGMOD
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


module SIGMOD(clk,X,Y,enable_sigmod);
    input clk,enable_sigmod;
    input [18:0]X;
    output [18:0]Y;
    reg [18:0]Y_reg;
    wire [18:0]Y;
    
    always@(posedge clk)
    begin
    if(enable_sigmod)
        begin
        if(X[18]==0)
        begin
            Y_reg = (X>>2) + 5000;
            if(Y_reg>10000) Y_reg = 10000;
        end
        else begin
            if((X[17:0]>>2)<5000) begin
            Y_reg<= 5000 - (X[17:0]>>2);
            end
            else Y_reg<=0;
        end
        end
    end
 
    assign Y=Y_reg;
endmodule
