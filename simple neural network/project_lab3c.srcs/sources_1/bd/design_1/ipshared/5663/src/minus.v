`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2017 22:36:30
// Design Name: 
// Module Name: minus
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


module minus( clk,a,b,y);
    input clk;
    input [18:0]a,b;
    output[18:0]y;
    
    wire [18:0]y;
    
    assign y[17:0] = (a>b)? (a-b):(b-a);
    assign y[18] = (a>b)? 0:1;
    
    
    
endmodule
