`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2017 20:12:36
// Design Name: 
// Module Name: add
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


module add(clk,data_1,data_2,data_3,data_4,data_5,data_6,data_7,data_8,data_9,data_10,data_11,data_12,data_13,addresult,enable_add );
    input  clk;
    input  [18:0] data_1;
    input  [18:0] data_2;
    input  [18:0] data_3;
    input  [18:0] data_4;
    input  [18:0] data_5;
    input  [18:0] data_6;
    input  [18:0] data_7;
    input  [18:0] data_8;
    input  [18:0] data_9;
    input  [18:0] data_10;
    input  [18:0] data_11;
    input  [18:0] data_12;
    input  [18:0] data_13;
    input  enable_add;
    output [18:0] addresult;
    
    reg [18:0] wires[12:0];
    reg [17:0] data_result1;
    reg [17:0] data_result2;
    wire[18:0] addresult;
    integer i;
    always@ (posedge clk)
    if(enable_add==1)
    begin
    data_result1=0;
    data_result2=0;
    wires[0] = data_1;
    wires[1] = data_2;
    wires[2] = data_3;
    wires[3] = data_4;
    wires[4] = data_5;
    wires[5] = data_6;
    wires[6] = data_7;
    wires[7] = data_8;
    wires[8] = data_9;
    wires[9] = data_10;
    wires[10] = data_11;
    wires[11] = data_12;
    wires[12] = data_13;
    for(i=0;i<13;i=i+1)
    begin
    if(wires[i][18]==0) data_result1[17:0] = data_result1[17:0] + wires[i][17:0];
    else data_result2[17:0] = data_result2[17:0] + wires[i][17:0];
    end
    end
    assign addresult[17:0] = (data_result1>data_result2)? (data_result1-data_result2):(data_result2-data_result1);
    assign addresult[18] = (data_result1>data_result2)? 0:1;
endmodule
