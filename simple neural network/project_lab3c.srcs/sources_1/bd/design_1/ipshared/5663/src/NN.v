`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2017 21:59:31
// Design Name: 
// Module Name: NN
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


module NN(
     clk,enable_cal,
     inputdata0,inputdata1,inputdata2,inputdata3,inputdata4,inputdata5,inputdata6,inputdata7,inputdata8,inputdata9,inputdata10,inputdata11,inputdata12,
     label_y0,label_y1,label_y2,out_y0,out_y1,out_y2,
     W0,W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16,W17,W18,W19,W20,W21,W22,W23,W24,W25,W26,W27,W28,W29,W30,W31,W32,W33,W34,W35,W36,W37,W38,W39,W40,W41,W42,W43,W44,W45,W46,W47,W48,W49,W50,W51,
     WW0,WW1,WW2,WW3,WW4,WW5,WW6,WW7,WW8,WW9,WW10,WW11,
     d_W0,d_W1,d_W2,d_W3,d_W4,d_W5,d_W6,d_W7,d_W8,d_W9,d_W10,d_W11,d_W12,d_W13,d_W14,d_W15,d_W16,d_W17,d_W18,d_W19,d_W20,d_W21,d_W22,d_W23,d_W24,d_W25,d_W26,d_W27,d_W28,d_W29,d_W30,d_W31,d_W32,d_W33,d_W34,d_W35,d_W36,d_W37,d_W38,d_W39,d_W40,d_W41,d_W42,d_W43,d_W44,d_W45,d_W46,d_W47,d_W48,d_W49,d_W50,d_W51,
     d_WW0,d_WW1,d_WW2,d_WW3,d_WW4,d_WW5,d_WW6,d_WW7,d_WW8,d_WW9,d_WW10,d_WW11
     
    );
    input clk,enable_cal;
    input [24:0] W0,W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16,W17,W18,W19,W20,W21,W22,W23,W24,W25,W26,W27,W28,W29,W30,W31,W32,W33,W34,W35,W36,W37,W38,W39,W40,W41,W42,W43,W44,W45,W46,W47,W48,W49,W50,W51;
    input [24:0]WW0,WW1,WW2,WW3,WW4,WW5,WW6,WW7,WW8,WW9,WW10,WW11;
    output [24:0]d_W0,d_W1,d_W2,d_W3,d_W4,d_W5,d_W6,d_W7,d_W8,d_W9,d_W10,d_W11,d_W12,d_W13,d_W14,d_W15,d_W16,d_W17,d_W18,d_W19,d_W20,d_W21,d_W22,d_W23,d_W24,d_W25,d_W26,d_W27,d_W28,d_W29,d_W30,d_W31,d_W32,d_W33,d_W34,d_W35,d_W36,d_W37,d_W38,d_W39,d_W40,d_W41,d_W42,d_W43,d_W44,d_W45,d_W46,d_W47,d_W48,d_W49,d_W50,d_W51;
    output [24:0]d_WW0,d_WW1,d_WW2,d_WW3,d_WW4,d_WW5,d_WW6,d_WW7,d_WW8,d_WW9,d_WW10,d_WW11;
    input [24:0]label_y0,label_y1,label_y2;
    input [24:0] inputdata0,inputdata1,inputdata2,inputdata3,inputdata4,inputdata5,inputdata6,inputdata7,inputdata8,inputdata9,inputdata10,inputdata11,inputdata12;
    output [24:0]out_y0,out_y1,out_y2;
//    output [24:0] hidden_y0,hidden_y1,hidden_y2,hidden_y3,test;
    wire [24:0] W [51:0];
    wire [24:0] WW[11:0];
    reg [24:0] label_y[2:0];
    reg [24:0] n;

    wire [24:0]d_W0,d_W1,d_W2,d_W3,d_W4,d_W5,d_W6,d_W7,d_W8,d_W9,d_W10,d_W11,d_W12,d_W13,d_W14,d_W15,d_W16,d_W17,d_W18,d_W19,d_W20,d_W21,d_W22,d_W23,d_W24,d_W25,d_W26,d_W27,d_W28,d_W29,d_W30,d_W31,d_W32,d_W33,d_W34,d_W35,d_W36,d_W37,d_W38,d_W39,d_W40,d_W41,d_W42,d_W43,d_W44,d_W45,d_W46,d_W47,d_W48,d_W49,d_W50,d_W51;
    wire [24:0]d_WW0,d_WW1,d_WW2,d_WW3,d_WW4,d_WW5,d_WW6,d_WW7,d_WW8,d_WW9,d_WW10,d_WW11;
    wire [24:0] multi_error_y[2:0];
    wire [24:0] wx_out[51:0];
    wire [24:0] add_out[3:0];
    wire [24:0] hidden_y0,hidden_y1,hidden_y2,hidden_y3;
    wire [24:0] wwx_out[11:0];
    wire [24:0] add_y[2:0];
    wire [24:0] out_y0,out_y1,out_y2;
    wire [24:0] M_error_y[2:0];
    wire [24:0] error_y[11:0];
    wire [24:0] n_error_y[11:0];
    wire [24:0] delta_WW_y[11:0];
    wire [24:0] M_error_hid0[2:0];
    wire [24:0] M_error_hid1[2:0];
    wire [24:0] M_error_hid2[2:0];
    wire [24:0] M_error_hid3[2:0];
    wire [24:0] E_hid_3[3:0];
    wire [24:0] M_error_hid[3:0];
    wire [24:0] error_hid[3:0];
    wire [24:0] n_error_hid[3:0];
    wire [24:0] delta_W_y[51:0];
    wire [24:0] test;
//    reg enable_wx,enable_add,enable_sigmod;
    
    
    always @ (posedge clk)
    begin
    label_y[0]=label_y0;
    label_y[1]=label_y1;
    label_y[2]=label_y2;
    n=50;
    end
    assign W[0][24:0]=W0[24:0];
    assign W[1][24:0]=W1[24:0];
    assign W[2][24:0]=W2[24:0];
    assign W[3][24:0]=W3[24:0];
    assign W[4][24:0]=W4[24:0];
    assign W[5][24:0]=W5[24:0];
    assign W[6][24:0]=W6[24:0];
    assign W[7][24:0]=W7[24:0];
    assign W[8][24:0]=W8[24:0];
    assign W[9][24:0]=W9[24:0];
    assign W[10][24:0]=W10[24:0];
    assign W[11][24:0]=W11[24:0];
    assign W[12][24:0]=W12[24:0];
    assign W[13][24:0]=W13[24:0];
    assign W[14][24:0]=W14[24:0];
    assign W[15][24:0]=W15[24:0];
    assign W[16][24:0]=W16[24:0];
    assign W[17][24:0]=W17[24:0];
    assign W[18][24:0]=W18[24:0];
    assign W[19][24:0]=W19[24:0];
    assign W[20][24:0]=W20[24:0];
    assign W[21][24:0]=W21[24:0];
    assign W[22][24:0]=W22[24:0];
    assign W[23][24:0]=W23[24:0];
    assign W[24][24:0]=W24[24:0];
    assign W[25][24:0]=W25[24:0];
    assign W[26][24:0]=W26[24:0];
    assign W[27][24:0]=W27[24:0];
    assign W[28][24:0]=W28[24:0];
    assign W[29][24:0]=W29[24:0];
    assign W[30][24:0]=W30[24:0];
    assign W[31][24:0]=W31[24:0];
    assign W[32][24:0]=W32[24:0];
    assign W[33][24:0]=W33[24:0];
    assign W[34][24:0]=W34[24:0];
    assign W[35][24:0]=W35[24:0];
    assign W[36][24:0]=W36[24:0];
    assign W[37][24:0]=W37[24:0];
    assign W[38][24:0]=W38[24:0];
    assign W[39][24:0]=W39[24:0];
    assign W[40][24:0]=W40[24:0];
    assign W[41][24:0]=W41[24:0];
    assign W[42][24:0]=W42[24:0];
    assign W[43][24:0]=W43[24:0];
    assign W[44][24:0]=W44[24:0];
    assign W[45][24:0]=W45[24:0];
    assign W[46][24:0]=W46[24:0];
    assign W[47][24:0]=W47[24:0];
    assign W[48][24:0]=W48[24:0];
    assign W[49][24:0]=W49[24:0];
    assign W[50][24:0]=W50[24:0];
    assign W[51][24:0]=W51[24:0];
    
    assign WW[0][24:0]=WW0[24:0];
    assign WW[1][24:0]=WW1[24:0];
    assign WW[2][24:0]=WW2[24:0];
    assign WW[3][24:0]=WW3[24:0];
    assign WW[4][24:0]=WW4[24:0];
    assign WW[5][24:0]=WW5[24:0];
    assign WW[6][24:0]=WW6[24:0];
    assign WW[7][24:0]=WW7[24:0];
    assign WW[8][24:0]=WW8[24:0];
    assign WW[9][24:0]=WW9[24:0];
    assign WW[10][24:0]=WW10[24:0];
    assign WW[11][24:0]=WW11[24:0];


    assign d_WW0[24:0]=delta_WW_y[0][24:0];
    assign d_WW1[24:0]=delta_WW_y[1][24:0];
    assign d_WW2[24:0]=delta_WW_y[2][24:0];
    assign d_WW3[24:0]=delta_WW_y[3][24:0];
    assign d_WW4[24:0]=delta_WW_y[4][24:0];
    assign d_WW5[24:0]=delta_WW_y[5][24:0];
    assign d_WW6[24:0]=delta_WW_y[6][24:0];
    assign d_WW7[24:0]=delta_WW_y[7][24:0];
    assign d_WW8[24:0]=delta_WW_y[8][24:0];
    assign d_WW9[24:0]=delta_WW_y[9][24:0];
    assign d_WW10[24:0]=delta_WW_y[10][24:0];
    assign d_WW11[24:0]=delta_WW_y[11][24:0];
    
    assign d_W0[24:0]=delta_W_y[0][24:0];
    assign d_W1[24:0]=delta_W_y[1][24:0];
    assign d_W2[24:0]=delta_W_y[2][24:0];
    assign d_W3[24:0]=delta_W_y[3][24:0];
    assign d_W4[24:0]=delta_W_y[4][24:0];
    assign d_W5[24:0]=delta_W_y[5][24:0];
    assign d_W6[24:0]=delta_W_y[6][24:0];
    assign d_W7[24:0]=delta_W_y[7][24:0];
    assign d_W8[24:0]=delta_W_y[8][24:0];
    assign d_W9[24:0]=delta_W_y[9][24:0];
    assign d_W10[24:0]=delta_W_y[10][24:0];
    assign d_W11[24:0]=delta_W_y[11][24:0];
    assign d_W12[24:0]=delta_W_y[12][24:0];
    assign d_W13[24:0]=delta_W_y[13][24:0];
    assign d_W14[24:0]=delta_W_y[14][24:0];
    assign d_W15[24:0]=delta_W_y[15][24:0];
    assign d_W16[24:0]=delta_W_y[16][24:0];
    assign d_W17[24:0]=delta_W_y[17][24:0];
    assign d_W18[24:0]=delta_W_y[18][24:0];
    assign d_W19[24:0]=delta_W_y[19][24:0];
    assign d_W20[24:0]=delta_W_y[20][24:0];
    assign d_W21[24:0]=delta_W_y[21][24:0];
    assign d_W22[24:0]=delta_W_y[22][24:0];
    assign d_W23[24:0]=delta_W_y[23][24:0];
    assign d_W24[24:0]=delta_W_y[24][24:0];
    assign d_W25[24:0]=delta_W_y[25][24:0];
    assign d_W26[24:0]=delta_W_y[26][24:0];
    assign d_W27[24:0]=delta_W_y[27][24:0];
    assign d_W28[24:0]=delta_W_y[28][24:0];
    assign d_W29[24:0]=delta_W_y[29][24:0];
    assign d_W30[24:0]=delta_W_y[30][24:0];
    assign d_W31[24:0]=delta_W_y[31][24:0];
    assign d_W32[24:0]=delta_W_y[32][24:0];
    assign d_W33[24:0]=delta_W_y[33][24:0];
    assign d_W34[24:0]=delta_W_y[34][24:0];
    assign d_W35[24:0]=delta_W_y[35][24:0];
    assign d_W36[24:0]=delta_W_y[36][24:0];
    assign d_W37[24:0]=delta_W_y[37][24:0];
    assign d_W38[24:0]=delta_W_y[38][24:0];
    assign d_W39[24:0]=delta_W_y[39][24:0];
    assign d_W40[24:0]=delta_W_y[40][24:0];
    assign d_W41[24:0]=delta_W_y[41][24:0];
    assign d_W42[24:0]=delta_W_y[42][24:0];
    assign d_W43[24:0]=delta_W_y[43][24:0];
    assign d_W44[24:0]=delta_W_y[44][24:0];
    assign d_W45[24:0]=delta_W_y[45][24:0];
    assign d_W46[24:0]=delta_W_y[46][24:0];
    assign d_W47[24:0]=delta_W_y[47][24:0];
    assign d_W48[24:0]=delta_W_y[48][24:0];
    assign d_W49[24:0]=delta_W_y[49][24:0];
    assign d_W50[24:0]=delta_W_y[50][24:0];
    assign d_W51[24:0]=delta_W_y[51][24:0];
 
//    enable_wx = 1;
//    enable_add = 1;
//    enable_sigmod = 1;

    
////enable_wx = 1;
////enable_add = 1;
////enable_sigmod = 1;
//    parameter initial_state= 4'b0000;
//    parameter calculate_error= 4'b0001;
//    parameter calculate_delta_weights= 4'b0010;
//    parameter change_weights= 4'b0011;
//    always@(posedge clk)
//    begin
//        if(reset) state<=initial_state;
//        case (state)
        
//        initial_state: 
//        begin
//        state<=calculate_error;
//        end
        
//        calculate_error: 
//        begin
//        state<=calculate_delta_weights;
//        end
        
//        calculate_delta_weights: 
//        begin
//        state<=change_weights;
//        end
        
//       change_weights: 
//        begin
//        state<=initial_state;
//        end
//        endcase
//    end
   
        assign wx_out[0][23:0]=((W[0][23:0]*inputdata0[23:0])>>13);assign wx_out[0][24]=(W[0][24]==inputdata0[24])?0:1;
        assign wx_out[1][23:0]=((W[1][23:0]*inputdata1[23:0])>>13);assign wx_out[1][24]=(W[1][24]==inputdata1[24])?0:1;
        assign wx_out[2][23:0]=((W[2][23:0]*inputdata2[23:0])>>13);assign wx_out[2][24]=(W[2][24]==inputdata2[24])?0:1;
        assign wx_out[3][23:0]=((W[3][23:0]*inputdata3[23:0])>>13);assign wx_out[3][24]=(W[3][24]==inputdata3[24])?0:1;
        assign wx_out[4][23:0]=((W[4][23:0]*inputdata4[23:0])>>13);assign wx_out[4][24]=(W[4][24]==inputdata4[24])?0:1;
        assign wx_out[5][23:0]=((W[5][23:0]*inputdata5[23:0])>>13);assign wx_out[5][24]=(W[5][24]==inputdata5[24])?0:1;
        assign wx_out[6][23:0]=((W[6][23:0]*inputdata6[23:0])>>13);assign wx_out[6][24]=(W[6][24]==inputdata6[24])?0:1;
        assign wx_out[7][23:0]=((W[7][23:0]*inputdata7[23:0])>>13);assign wx_out[7][24]=(W[7][24]==inputdata7[24])?0:1;
        assign wx_out[8][23:0]=((W[8][23:0]*inputdata8[23:0])>>13);assign wx_out[8][24]=(W[8][24]==inputdata8[24])?0:1;
        assign wx_out[9][23:0]=((W[9][23:0]*inputdata9[23:0])>>13);assign wx_out[9][24]=(W[9][24]==inputdata9[24])?0:1;
        assign wx_out[10][23:0]=((W[10][23:0]*inputdata10[23:0])>>13);assign wx_out[10][24]=(W[10][24]==inputdata10[24])?0:1;
        assign wx_out[11][23:0]=((W[11][23:0]*inputdata11[23:0])>>13);assign wx_out[11][24]=(W[11][24]==inputdata11[24])?0:1;
        assign wx_out[12][23:0]=((W[12][23:0]*inputdata12[23:0])>>13);assign wx_out[12][24]=(W[12][24]==inputdata12[24])?0:1;
        
        assign wx_out[13][23:0]=((W[13][23:0]*inputdata0[23:0])>>13);assign wx_out[13][24]=(W[13][24]==inputdata0[24])?0:1;
        assign wx_out[14][23:0]=((W[14][23:0]*inputdata1[23:0])>>13);assign wx_out[14][24]=(W[14][24]==inputdata1[24])?0:1;
        assign wx_out[15][23:0]=((W[15][23:0]*inputdata2[23:0])>>13);assign wx_out[15][24]=(W[15][24]==inputdata2[24])?0:1;
        assign wx_out[16][23:0]=((W[16][23:0]*inputdata3[23:0])>>13);assign wx_out[16][24]=(W[16][24]==inputdata3[24])?0:1;
        assign wx_out[17][23:0]=((W[17][23:0]*inputdata4[23:0])>>13);assign wx_out[17][24]=(W[17][24]==inputdata4[24])?0:1;
        assign wx_out[18][23:0]=((W[18][23:0]*inputdata5[23:0])>>13);assign wx_out[18][24]=(W[18][24]==inputdata5[24])?0:1;
        assign wx_out[19][23:0]=((W[19][23:0]*inputdata6[23:0])>>13);assign wx_out[19][24]=(W[19][24]==inputdata6[24])?0:1;
        assign wx_out[20][23:0]=((W[20][23:0]*inputdata7[23:0])>>13);assign wx_out[20][24]=(W[20][24]==inputdata7[24])?0:1;
        assign wx_out[21][23:0]=((W[21][23:0]*inputdata8[23:0])>>13);assign wx_out[21][24]=(W[21][24]==inputdata8[24])?0:1;
        assign wx_out[22][23:0]=((W[22][23:0]*inputdata9[23:0])>>13);assign wx_out[22][24]=(W[22][24]==inputdata9[24])?0:1;
        assign wx_out[23][23:0]=((W[23][23:0]*inputdata10[23:0])>>13);assign wx_out[23][24]=(W[23][24]==inputdata10[24])?0:1;
        assign wx_out[24][23:0]=((W[24][23:0]*inputdata11[23:0])>>13);assign wx_out[24][24]=(W[24][24]==inputdata11[24])?0:1;
        assign wx_out[25][23:0]=((W[25][23:0]*inputdata12[23:0])>>13);assign wx_out[25][24]=(W[25][24]==inputdata12[24])?0:1;
        
        assign wx_out[26][23:0]=((W[26][23:0]*inputdata0[23:0])>>13);assign wx_out[26][24]=(W[26][24]==inputdata0[24])?0:1;
        assign wx_out[27][23:0]=((W[27][23:0]*inputdata1[23:0])>>13);assign wx_out[27][24]=(W[27][24]==inputdata1[24])?0:1;
        assign wx_out[28][23:0]=((W[28][23:0]*inputdata2[23:0])>>13);assign wx_out[28][24]=(W[28][24]==inputdata2[24])?0:1;
        assign wx_out[29][23:0]=((W[29][23:0]*inputdata3[23:0])>>13);assign wx_out[29][24]=(W[29][24]==inputdata3[24])?0:1;
        assign wx_out[30][23:0]=((W[30][23:0]*inputdata4[23:0])>>13);assign wx_out[30][24]=(W[30][24]==inputdata4[24])?0:1;
        assign wx_out[31][23:0]=((W[31][23:0]*inputdata5[23:0])>>13);assign wx_out[31][24]=(W[31][24]==inputdata5[24])?0:1;
        assign wx_out[32][23:0]=((W[32][23:0]*inputdata6[23:0])>>13);assign wx_out[32][24]=(W[32][24]==inputdata6[24])?0:1;
        assign wx_out[33][23:0]=((W[33][23:0]*inputdata7[23:0])>>13);assign wx_out[33][24]=(W[33][24]==inputdata7[24])?0:1;
        assign wx_out[34][23:0]=((W[34][23:0]*inputdata8[23:0])>>13);assign wx_out[34][24]=(W[34][24]==inputdata8[24])?0:1;
        assign wx_out[35][23:0]=((W[35][23:0]*inputdata9[23:0])>>13);assign wx_out[35][24]=(W[35][24]==inputdata9[24])?0:1;
        assign wx_out[36][23:0]=((W[36][23:0]*inputdata10[23:0])>>13);assign wx_out[36][24]=(W[36][24]==inputdata10[24])?0:1;
        assign wx_out[37][23:0]=((W[37][23:0]*inputdata11[23:0])>>13);assign wx_out[37][24]=(W[37][24]==inputdata11[24])?0:1;
        assign wx_out[38][23:0]=((W[38][23:0]*inputdata12[23:0])>>13);assign wx_out[38][24]=(W[38][24]==inputdata12[24])?0:1;
        
        assign wx_out[39][23:0]=((W[39][23:0]*inputdata0[23:0])>>13);assign wx_out[39][24]=(W[39][24]==inputdata0[24])?0:1;
        assign wx_out[40][23:0]=((W[40][23:0]*inputdata1[23:0])>>13);assign wx_out[40][24]=(W[40][24]==inputdata1[24])?0:1;
        assign wx_out[41][23:0]=((W[41][23:0]*inputdata2[23:0])>>13);assign wx_out[41][24]=(W[41][24]==inputdata2[24])?0:1;
        assign wx_out[42][23:0]=((W[42][23:0]*inputdata3[23:0])>>13);assign wx_out[42][24]=(W[42][24]==inputdata3[24])?0:1;
        assign wx_out[43][23:0]=((W[43][23:0]*inputdata4[23:0])>>13);assign wx_out[43][24]=(W[43][24]==inputdata4[24])?0:1;
        assign wx_out[44][23:0]=((W[44][23:0]*inputdata5[23:0])>>13);assign wx_out[44][24]=(W[44][24]==inputdata5[24])?0:1;
        assign wx_out[45][23:0]=((W[45][23:0]*inputdata6[23:0])>>13);assign wx_out[45][24]=(W[45][24]==inputdata6[24])?0:1;
        assign wx_out[46][23:0]=((W[46][23:0]*inputdata7[23:0])>>13);assign wx_out[46][24]=(W[46][24]==inputdata7[24])?0:1;
        assign wx_out[47][23:0]=((W[47][23:0]*inputdata8[23:0])>>13);assign wx_out[47][24]=(W[47][24]==inputdata8[24])?0:1;
        assign wx_out[48][23:0]=((W[48][23:0]*inputdata9[23:0])>>13);assign wx_out[48][24]=(W[48][24]==inputdata9[24])?0:1;
        assign wx_out[49][23:0]=((W[49][23:0]*inputdata10[23:0])>>13);assign wx_out[49][24]=(W[49][24]==inputdata10[24])?0:1;
        assign wx_out[50][23:0]=((W[50][23:0]*inputdata11[23:0])>>13);assign wx_out[50][24]=(W[50][24]==inputdata11[24])?0:1;
        assign wx_out[51][23:0]=((W[51][23:0]*inputdata12[23:0])>>13);assign wx_out[51][24]=(W[51][24]==inputdata12[24])?0:1;                                            
                                                    
   
    
   
    
    add A0(.clk(clk),.data_1(wx_out[0][24:0]),.data_2(wx_out[1][24:0]),.data_3(wx_out[2][24:0]),.data_4(wx_out[3][24:0]),.data_5(wx_out[4][24:0]),.data_6(wx_out[5][24:0]),.data_7(wx_out[6][24:0]),.data_8(wx_out[7][24:0]),.data_9(wx_out[8][24:0]),.data_10(wx_out[9][24:0]),.data_11(wx_out[10][24:0]),.data_12(wx_out[11][24:0]),.data_13(wx_out[12][24:0]),.addresult(add_out[0][24:0]),.enable_add(enable_cal));
    add A1(.clk(clk),.data_1(wx_out[13][24:0]),.data_2(wx_out[14][24:0]),.data_3(wx_out[15][24:0]),.data_4(wx_out[16][24:0]),.data_5(wx_out[17][24:0]),.data_6(wx_out[18][24:0]),.data_7(wx_out[19][24:0]),.data_8(wx_out[20][24:0]),.data_9(wx_out[21][24:0]),.data_10(wx_out[22][24:0]),.data_11(wx_out[23][24:0]),.data_12(wx_out[24][24:0]),.data_13(wx_out[25][24:0]),.addresult(add_out[1][24:0]),.enable_add(enable_cal));
    add A2(.clk(clk),.data_1(wx_out[26][24:0]),.data_2(wx_out[27][24:0]),.data_3(wx_out[28][24:0]),.data_4(wx_out[29][24:0]),.data_5(wx_out[30][24:0]),.data_6(wx_out[31][24:0]),.data_7(wx_out[32][24:0]),.data_8(wx_out[33][24:0]),.data_9(wx_out[34][24:0]),.data_10(wx_out[35][24:0]),.data_11(wx_out[36][24:0]),.data_12(wx_out[37][24:0]),.data_13(wx_out[38][24:0]),.addresult(add_out[2][24:0]),.enable_add(enable_cal));
    add A3(.clk(clk),.data_1(wx_out[39][24:0]),.data_2(wx_out[40][24:0]),.data_3(wx_out[41][24:0]),.data_4(wx_out[42][24:0]),.data_5(wx_out[43][24:0]),.data_6(wx_out[44][24:0]),.data_7(wx_out[45][24:0]),.data_8(wx_out[46][24:0]),.data_9(wx_out[47][24:0]),.data_10(wx_out[48][24:0]),.data_11(wx_out[49][24:0]),.data_12(wx_out[50][24:0]),.data_13(wx_out[51][24:0]),.addresult(add_out[3][24:0]),.enable_add(enable_cal));

    SIGMOD S0(.clk(clk),.X(add_out[0][24:0]),.enable_sigmod(enable_cal),.Y(hidden_y0));
    SIGMOD S1(.clk(clk),.X(add_out[1][24:0]),.enable_sigmod(enable_cal),.Y(hidden_y1));
    SIGMOD S2(.clk(clk),.X(add_out[2][24:0]),.enable_sigmod(enable_cal),.Y(hidden_y2));
    SIGMOD S3(.clk(clk),.X(add_out[3][24:0]),.enable_sigmod(enable_cal),.Y(hidden_y3));
    
    assign wwx_out[0][23:0]=((WW[0][23:0]*hidden_y0[23:0])>>13);assign wwx_out[0][24]=(WW[0][24]==hidden_y0[24])?0:1;
    assign wwx_out[1][23:0]=((WW[1][23:0]*hidden_y1[23:0])>>13);assign wwx_out[1][24]=(WW[1][24]==hidden_y1[24])?0:1;
    assign wwx_out[2][23:0]=((WW[2][23:0]*hidden_y2[23:0])>>13);assign wwx_out[2][24]=(WW[2][24]==hidden_y2[24])?0:1;
    assign wwx_out[3][23:0]=((WW[3][23:0]*hidden_y3[23:0])>>13);assign wwx_out[3][24]=(WW[3][24]==hidden_y3[24])?0:1;
    assign wwx_out[4][23:0]=((WW[4][23:0]*hidden_y0[23:0])>>13);assign wwx_out[4][24]=(WW[4][24]==hidden_y0[24])?0:1;
    assign wwx_out[5][23:0]=((WW[5][23:0]*hidden_y1[23:0])>>13);assign wwx_out[5][24]=(WW[5][24]==hidden_y1[24])?0:1;
    assign wwx_out[6][23:0]=((WW[6][23:0]*hidden_y2[23:0])>>13);assign wwx_out[6][24]=(WW[6][24]==hidden_y2[24])?0:1;
    assign wwx_out[7][23:0]=((WW[7][23:0]*hidden_y3[23:0])>>13);assign wwx_out[7][24]=(WW[7][24]==hidden_y3[24])?0:1;
    assign wwx_out[8][23:0]=((WW[8][23:0]*hidden_y0[23:0])>>13);assign wwx_out[8][24]=(WW[8][24]==hidden_y0[24])?0:1;
    assign wwx_out[9][23:0]=((WW[9][23:0]*hidden_y1[23:0])>>13);assign wwx_out[9][24]=(WW[9][24]==hidden_y1[24])?0:1;
    assign wwx_out[10][23:0]=((WW[10][23:0]*hidden_y2[23:0])>>13);assign wwx_out[10][24]=(WW[10][24]==hidden_y2[24])?0:1;
    assign wwx_out[11][23:0]=((WW[11][23:0]*hidden_y3[23:0])>>13);assign wwx_out[11][24]=(WW[11][24]==hidden_y3[24])?0:1;
    
    
    add AA0(.clk(clk),.data_1(wwx_out[0][24:0]),.data_2(wwx_out[1][24:0]),.data_3(wwx_out[2][24:0]),.data_4(wwx_out[3][24:0]),.data_5(0),.data_6(0),.data_7(0),.data_8(0),.data_9(0),.data_10(0),.data_11(0),.data_12(0),.data_13(0),.addresult(add_y[0][24:0]),.enable_add(enable_cal));
    add AA1(.clk(clk),.data_1(wwx_out[4][24:0]),.data_2(wwx_out[5][24:0]),.data_3(wwx_out[6][24:0]),.data_4(wwx_out[7][24:0]),.data_5(0),.data_6(0),.data_7(0),.data_8(0),.data_9(0),.data_10(0),.data_11(0),.data_12(0),.data_13(0),.addresult(add_y[1][24:0]),.enable_add(enable_cal));
    add AA2(.clk(clk),.data_1(wwx_out[8][24:0]),.data_2(wwx_out[9][24:0]),.data_3(wwx_out[10][24:0]),.data_4(wwx_out[11][24:0]),.data_5(0),.data_6(0),.data_7(0),.data_8(0),.data_9(0),.data_10(0),.data_11(0),.data_12(0),.data_13(0),.addresult(add_y[2][24:0]),.enable_add(enable_cal));

    SIGMOD SS0(.clk(clk),.X(add_y[0][24:0]),.enable_sigmod(enable_cal),.Y(out_y0));
    SIGMOD SS1(.clk(clk),.X(add_y[1][24:0]),.enable_sigmod(enable_cal),.Y(out_y1));
    SIGMOD SS2(.clk(clk),.X(add_y[2][24:0]),.enable_sigmod(enable_cal),.Y(out_y2));
    
    minus My0(.clk(clk),.a(label_y[0]),.b(out_y0),.y(multi_error_y[0]));
    minus My1(.clk(clk),.a(label_y[1]),.b(out_y1),.y(multi_error_y[1]));
    minus My2(.clk(clk),.a(label_y[2]),.b(out_y2),.y(multi_error_y[2]));
    
    wire [24:0]outy0p,outy1p,outy2p;
    assign outy0p=10000-out_y0;
    assign outy1p=10000-out_y1;
    assign outy2p=10000-out_y2;
    assign M_error_y[0][23:0]=((out_y0[23:0]*outy0p[23:0])>>13);assign M_error_y[0][24]=(out_y0[24]==outy0p[24])?0:1;
    assign error_y[0][23:0]=((M_error_y[0][23:0]*multi_error_y[0][23:0])>>13);assign error_y[0][24]=(M_error_y[0][24]==multi_error_y[0][24])?0:1;
    assign M_error_y[1][23:0]=((out_y1[23:0]*outy1p[23:0])>>13);assign M_error_y[1][24]=(out_y1[24]==outy1p[24])?0:1;
    assign error_y[1][23:0]=((M_error_y[1][23:0]*multi_error_y[1][23:0])>>13);assign error_y[1][24]=(M_error_y[1][24]==multi_error_y[1][24])?0:1;
    assign M_error_y[2][23:0]=((out_y2[23:0]*outy2p[23:0])>>13);assign M_error_y[2][24]=(out_y2[24]==outy2p[24])?0:1;
    assign error_y[2][23:0]=((M_error_y[2][23:0]*multi_error_y[2][23:0])>>13);assign error_y[2][24]=(M_error_y[2][24]==multi_error_y[2][24])?0:1;
    
    
    assign n_error_y[0][23:0]=((n*error_y[0][23:0])>>13);assign n_error_y[0][24]=(n[24]==error_y[0][24])?0:1;
    assign n_error_y[1][23:0]=((n*error_y[1][23:0])>>13);assign n_error_y[1][24]=(n[24]==error_y[1][24])?0:1;
    assign n_error_y[2][23:0]=((n*error_y[2][23:0])>>13);assign n_error_y[2][24]=(n[24]==error_y[2][24])?0:1;
    
    assign delta_WW_y[0][23:0]=((hidden_y0[23:0]*n_error_y[0][23:0])>>13);assign delta_WW_y[0][24]=(hidden_y0[24]==n_error_y[0][24])?0:1;  
    assign delta_WW_y[1][23:0]=((hidden_y1[23:0]*n_error_y[0][23:0])>>13);assign delta_WW_y[1][24]=(hidden_y1[24]==n_error_y[0][24])?0:1;
    assign delta_WW_y[2][23:0]=((hidden_y2[23:0]*n_error_y[0][23:0])>>13);assign delta_WW_y[2][24]=(hidden_y2[24]==n_error_y[0][24])?0:1;
    assign delta_WW_y[3][23:0]=((hidden_y3[23:0]*n_error_y[0][23:0])>>13);assign delta_WW_y[3][24]=(hidden_y3[24]==n_error_y[0][24])?0:1;
    assign delta_WW_y[4][23:0]=((hidden_y0[23:0]*n_error_y[1][23:0])>>13);assign delta_WW_y[4][24]=(hidden_y0[24]==n_error_y[1][24])?0:1;
    assign delta_WW_y[5][23:0]=((hidden_y1[23:0]*n_error_y[1][23:0])>>13);assign delta_WW_y[5][24]=(hidden_y1[24]==n_error_y[1][24])?0:1;
    assign delta_WW_y[6][23:0]=((hidden_y2[23:0]*n_error_y[1][23:0])>>13);assign delta_WW_y[6][24]=(hidden_y2[24]==n_error_y[1][24])?0:1;
    assign delta_WW_y[7][23:0]=((hidden_y3[23:0]*n_error_y[1][23:0])>>13);assign delta_WW_y[7][24]=(hidden_y3[24]==n_error_y[1][24])?0:1;
    assign delta_WW_y[8][23:0]=((hidden_y0[23:0]*n_error_y[2][23:0])>>13);assign delta_WW_y[8][24]=(hidden_y0[24]==n_error_y[2][24])?0:1;
    assign delta_WW_y[9][23:0]=((hidden_y1[23:0]*n_error_y[2][23:0])>>13);assign delta_WW_y[9][24]=(hidden_y1[24]==n_error_y[2][24])?0:1;
    assign delta_WW_y[10][23:0]=((hidden_y2[23:0]*n_error_y[2][23:0])>>13);assign delta_WW_y[10][24]=(hidden_y2[24]==n_error_y[2][24])?0:1;
    assign delta_WW_y[11][23:0]=((hidden_y3[23:0]*n_error_y[2][23:0])>>13);assign delta_WW_y[11][24]=(hidden_y3[24]==n_error_y[2][24])?0:1;

    assign M_error_hid0[0][23:0]=((error_y[0][23:0]*WW[0][23:0])>>13);assign M_error_hid0[0][24]=(error_y[0][24]==WW[0][24])?0:1;
    assign M_error_hid0[1][23:0]=((error_y[1][23:0]*WW[4][23:0])>>13);assign M_error_hid0[1][24]=(error_y[1][24]==WW[4][24])?0:1;
    assign M_error_hid0[2][23:0]=((error_y[2][23:0]*WW[8][23:0])>>13);assign M_error_hid0[2][24]=(error_y[2][24]==WW[8][24])?0:1;
    
    assign M_error_hid1[0][23:0]=((error_y[0][23:0]*WW[1][23:0])>>13);assign M_error_hid1[0][24]=(error_y[0][24]==WW[1][24])?0:1;
    assign M_error_hid1[1][23:0]=((error_y[1][23:0]*WW[5][23:0])>>13);assign M_error_hid1[1][24]=(error_y[1][24]==WW[5][24])?0:1;
    assign M_error_hid1[2][23:0]=((error_y[2][23:0]*WW[9][23:0])>>13);assign M_error_hid1[2][24]=(error_y[2][24]==WW[9][24])?0:1;
    
    assign M_error_hid2[0][23:0]=((error_y[0][23:0]*WW[2][23:0])>>13);assign M_error_hid2[0][24]=(error_y[0][24]==WW[2][24])?0:1;
    assign M_error_hid2[1][23:0]=((error_y[1][23:0]*WW[6][23:0])>>13);assign M_error_hid2[1][24]=(error_y[1][24]==WW[6][24])?0:1;
    assign M_error_hid2[2][23:0]=((error_y[2][23:0]*WW[10][23:0])>>13);assign M_error_hid2[2][24]=(error_y[2][24]==WW[10][24])?0:1;
    
    assign M_error_hid3[0][23:0]=((error_y[0][23:0]*WW[3][23:0])>>13);assign M_error_hid3[0][24]=(error_y[0][24]==WW[3][24])?0:1;
    assign M_error_hid3[1][23:0]=((error_y[1][23:0]*WW[7][23:0])>>13);assign M_error_hid3[1][24]=(error_y[1][24]==WW[7][24])?0:1;
    assign M_error_hid3[2][23:0]=((error_y[2][23:0]*WW[11][23:0])>>13);assign M_error_hid3[2][24]=(error_y[2][24]==WW[11][24])?0:1;
//    multi2 M_E_hid0_0( .clk(clk),.data_1(error_y[0]),.data_2(WW[0]),.multiresult(M_error_hid0[0]),.enable_wx(enable_cal));
//    multi2 M_E_hid0_1( .clk(clk),.data_1(error_y[1]),.data_2(WW[4]),.multiresult(M_error_hid0[1]),.enable_wx(enable_cal));
//    multi2 M_E_hid0_2( .clk(clk),.data_1(error_y[2]),.data_2(WW[8]),.multiresult(M_error_hid0[2]),.enable_wx(enable_cal));
    
//    multi2 M_E_hid1_0( .clk(clk),.data_1(error_y[0]),.data_2(WW[1]),.multiresult(M_error_hid1[0]),.enable_wx(enable_cal));
//    multi2 M_E_hid1_1( .clk(clk),.data_1(error_y[1]),.data_2(WW[5]),.multiresult(M_error_hid1[1]),.enable_wx(enable_cal));
//    multi2 M_E_hid1_2( .clk(clk),.data_1(error_y[2]),.data_2(WW[9]),.multiresult(M_error_hid1[2]),.enable_wx(enable_cal));
     
//    multi2 M_E_hid2_0( .clk(clk),.data_1(error_y[0]),.data_2(WW[2]),.multiresult(M_error_hid2[0]),.enable_wx(enable_cal));
//    multi2 M_E_hid2_1( .clk(clk),.data_1(error_y[1]),.data_2(WW[6]),.multiresult(M_error_hid2[1]),.enable_wx(enable_cal));
//    multi2 M_E_hid2_2( .clk(clk),.data_1(error_y[2]),.data_2(WW[10]),.multiresult(M_error_hid2[2]),.enable_wx(enable_cal));
     
//    multi2 M_E_hid3_0( .clk(clk),.data_1(error_y[0]),.data_2(WW[3]),.multiresult(M_error_hid3[0]),.enable_wx(enable_cal));
//    multi2 M_E_hid3_1( .clk(clk),.data_1(error_y[1]),.data_2(WW[7]),.multiresult(M_error_hid3[1]),.enable_wx(enable_cal));
//    multi2 M_E_hid3_2( .clk(clk),.data_1(error_y[2]),.data_2(WW[11]),.multiresult(M_error_hid3[2]),.enable_wx(enable_cal));
     
    add E_hid0_3(.clk(clk),.data_1(M_error_hid0[0]),.data_2(M_error_hid0[1]),.data_3(M_error_hid0[2]),.data_4(0),.data_5(0),.data_6(0),.data_7(0),.data_8(0),.data_9(0),.data_10(0),.data_11(0),.data_12(0),.data_13(0),.addresult(E_hid_3[0]),.enable_add(enable_cal));
    add E_hid1_3(.clk(clk),.data_1(M_error_hid1[0]),.data_2(M_error_hid1[1]),.data_3(M_error_hid1[2]),.data_4(0),.data_5(0),.data_6(0),.data_7(0),.data_8(0),.data_9(0),.data_10(0),.data_11(0),.data_12(0),.data_13(0),.addresult(E_hid_3[1]),.enable_add(enable_cal)); 
    add E_hid2_3(.clk(clk),.data_1(M_error_hid2[0]),.data_2(M_error_hid2[1]),.data_3(M_error_hid2[2]),.data_4(0),.data_5(0),.data_6(0),.data_7(0),.data_8(0),.data_9(0),.data_10(0),.data_11(0),.data_12(0),.data_13(0),.addresult(E_hid_3[2]),.enable_add(enable_cal));
    add E_hid3_3(.clk(clk),.data_1(M_error_hid3[0]),.data_2(M_error_hid3[1]),.data_3(M_error_hid3[2]),.data_4(0),.data_5(0),.data_6(0),.data_7(0),.data_8(0),.data_9(0),.data_10(0),.data_11(0),.data_12(0),.data_13(0),.addresult(E_hid_3[3]),.enable_add(enable_cal));
    wire [24:0]hidden_y0p,hidden_y1p,hidden_y2p,hidden_y3p;
    assign hidden_y0p=10000-hidden_y0;
    assign hidden_y1p=10000-hidden_y1;
    assign hidden_y2p=10000-hidden_y2;
    assign hidden_y3p=10000-hidden_y3;
    assign M_error_hid[0][23:0]=((hidden_y0[23:0]*hidden_y0p[23:0])>>13);assign M_error_hid[0][24]=(hidden_y0[24]==hidden_y0p[24])?0:1;
    assign error_hid[0][23:0]=((M_error_hid[0][23:0]*E_hid_3[0][23:0])>>13);assign error_hid[0][24]=(M_error_hid[0][24]==E_hid_3[0][24])?0:1;
    
    assign M_error_hid[1][23:0]=((hidden_y1[23:0]*hidden_y1p[23:0])>>13);assign M_error_hid[1][24]=(hidden_y1[24]==hidden_y1p[24])?0:1;
    assign error_hid[1][23:0]=((M_error_hid[1][23:0]*E_hid_3[1][23:0])>>13);assign error_hid[1][24]=(M_error_hid[1][24]==E_hid_3[1][24])?0:1;
    
    assign M_error_hid[2][23:0]=((hidden_y2[23:0]*hidden_y2p[23:0])>>13);assign M_error_hid[2][24]=(hidden_y2[24]==hidden_y2p[24])?0:1;
    assign error_hid[2][23:0]=((M_error_hid[2][23:0]*E_hid_3[2][23:0])>>13);assign error_hid[2][24]=(M_error_hid[2][24]==E_hid_3[2][24])?0:1;
    
    assign M_error_hid[3][23:0]=((hidden_y3[23:0]*hidden_y3p[23:0])>>13);assign M_error_hid[3][24]=(hidden_y3[24]==hidden_y3p[24])?0:1;
    assign error_hid[3][23:0]=((M_error_hid[3][23:0]*E_hid_3[3][23:0])>>13);assign error_hid[3][24]=(M_error_hid[3][24]==E_hid_3[3][24])?0:1;

    assign n_error_hid[0][23:0]=((n[23:0]*error_hid[0][23:0])>>13);assign n_error_hid[0][24]=(n[24]==error_hid[0][24])?0:1;
    assign n_error_hid[1][23:0]=((n[23:0]*error_hid[1][23:0])>>13);assign n_error_hid[1][24]=(n[24]==error_hid[1][24])?0:1;
    assign n_error_hid[2][23:0]=((n[23:0]*error_hid[2][23:0])>>13);assign n_error_hid[2][24]=(n[24]==error_hid[2][24])?0:1;
    assign n_error_hid[3][23:0]=((n[23:0]*error_hid[3][23:0])>>13);assign n_error_hid[3][24]=(n[24]==error_hid[3][24])?0:1;

    assign delta_W_y[0][23:0]=((inputdata0[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[0][24]=(inputdata0[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[1][23:0]=((inputdata1[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[1][24]=(inputdata1[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[2][23:0]=((inputdata2[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[2][24]=(inputdata2[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[3][23:0]=((inputdata3[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[3][24]=(inputdata3[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[4][23:0]=((inputdata4[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[4][24]=(inputdata4[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[5][23:0]=((inputdata5[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[5][24]=(inputdata5[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[6][23:0]=((inputdata6[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[6][24]=(inputdata6[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[7][23:0]=((inputdata7[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[7][24]=(inputdata7[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[8][23:0]=((inputdata8[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[8][24]=(inputdata8[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[9][23:0]=((inputdata9[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[9][24]=(inputdata9[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[10][23:0]=((inputdata10[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[10][24]=(inputdata10[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[11][23:0]=((inputdata11[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[11][24]=(inputdata11[24]==n_error_hid[0][24])?0:1;
    assign delta_W_y[12][23:0]=((inputdata12[23:0]*n_error_hid[0][23:0])>>13);assign delta_W_y[12][24]=(inputdata12[24]==n_error_hid[0][24])?0:1;
    
    assign delta_W_y[13][23:0]=((inputdata0[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[13][24]=(inputdata0[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[14][23:0]=((inputdata1[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[14][24]=(inputdata1[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[15][23:0]=((inputdata2[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[15][24]=(inputdata2[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[16][23:0]=((inputdata3[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[16][24]=(inputdata3[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[17][23:0]=((inputdata4[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[17][24]=(inputdata4[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[18][23:0]=((inputdata5[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[18][24]=(inputdata5[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[19][23:0]=((inputdata6[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[19][24]=(inputdata6[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[20][23:0]=((inputdata7[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[20][24]=(inputdata7[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[21][23:0]=((inputdata8[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[21][24]=(inputdata8[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[22][23:0]=((inputdata9[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[22][24]=(inputdata9[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[23][23:0]=((inputdata10[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[23][24]=(inputdata10[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[24][23:0]=((inputdata11[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[24][24]=(inputdata11[24]==n_error_hid[1][24])?0:1;
    assign delta_W_y[25][23:0]=((inputdata12[23:0]*n_error_hid[1][23:0])>>13);assign delta_W_y[25][24]=(inputdata12[24]==n_error_hid[1][24])?0:1;
    
    assign delta_W_y[26][23:0]=((inputdata0[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[26][24]=(inputdata0[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[27][23:0]=((inputdata1[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[27][24]=(inputdata1[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[28][23:0]=((inputdata2[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[28][24]=(inputdata2[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[29][23:0]=((inputdata3[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[29][24]=(inputdata3[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[30][23:0]=((inputdata4[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[30][24]=(inputdata4[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[31][23:0]=((inputdata5[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[31][24]=(inputdata5[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[32][23:0]=((inputdata6[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[32][24]=(inputdata6[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[33][23:0]=((inputdata7[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[33][24]=(inputdata7[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[34][23:0]=((inputdata8[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[34][24]=(inputdata8[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[35][23:0]=((inputdata9[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[35][24]=(inputdata9[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[36][23:0]=((inputdata10[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[36][24]=(inputdata10[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[37][23:0]=((inputdata11[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[37][24]=(inputdata11[24]==n_error_hid[2][24])?0:1;
    assign delta_W_y[38][23:0]=((inputdata12[23:0]*n_error_hid[2][23:0])>>13);assign delta_W_y[38][24]=(inputdata12[24]==n_error_hid[2][24])?0:1;
        
    assign delta_W_y[39][23:0]=((inputdata0[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[39][24]=(inputdata0[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[40][23:0]=((inputdata1[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[40][24]=(inputdata1[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[41][23:0]=((inputdata2[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[41][24]=(inputdata2[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[42][23:0]=((inputdata3[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[42][24]=(inputdata3[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[43][23:0]=((inputdata4[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[43][24]=(inputdata4[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[44][23:0]=((inputdata5[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[44][24]=(inputdata5[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[45][23:0]=((inputdata6[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[45][24]=(inputdata6[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[46][23:0]=((inputdata7[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[46][24]=(inputdata7[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[47][23:0]=((inputdata8[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[47][24]=(inputdata8[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[48][23:0]=((inputdata9[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[48][24]=(inputdata9[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[49][23:0]=((inputdata10[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[49][24]=(inputdata10[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[50][23:0]=((inputdata11[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[50][24]=(inputdata11[24]==n_error_hid[3][24])?0:1;
    assign delta_W_y[51][23:0]=((inputdata12[23:0]*n_error_hid[3][23:0])>>13);assign delta_W_y[51][24]=(inputdata12[24]==n_error_hid[3][24])?0:1;
//    multi3 delta_W_0_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata0),.multiresult(delta_W_y[0]),.enable_wx(enable_cal));
//    multi3 delta_W_1_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata1),.multiresult(delta_W_y[1]),.enable_wx(enable_cal));
//    multi3 delta_W_2_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata2),.multiresult(delta_W_y[2]),.enable_wx(enable_cal));
//    multi3 delta_W_3_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata3),.multiresult(delta_W_y[3]),.enable_wx(enable_cal));
//    multi3 delta_W_4_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata4),.multiresult(delta_W_y[4]),.enable_wx(enable_cal));
//    multi3 delta_W_5_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata5),.multiresult(delta_W_y[5]),.enable_wx(enable_cal));
//    multi3 delta_W_6_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata6),.multiresult(delta_W_y[6]),.enable_wx(enable_cal));
//    multi3 delta_W_7_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata7),.multiresult(delta_W_y[7]),.enable_wx(enable_cal));
//    multi3 delta_W_8_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata8),.multiresult(delta_W_y[8]),.enable_wx(enable_cal));
//    multi3 delta_W_9_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata9),.multiresult(delta_W_y[9]),.enable_wx(enable_cal));
//    multi3 delta_W_10_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata10),.multiresult(delta_W_y[10]),.enable_wx(enable_cal));
//    multi3 delta_W_11_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata11),.multiresult(delta_W_y[11]),.enable_wx(enable_cal));
//    multi3 delta_W_12_0(.clk(clk),.data_1(n_error_hid[0]),.data_2(inputdata12),.multiresult(delta_W_y[12]),.enable_wx(enable_cal));
    
//    multi3 delta_W_0_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata0),.multiresult(delta_W_y[13]),.enable_wx(enable_cal));
//    multi3 delta_W_1_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata1),.multiresult(delta_W_y[14]),.enable_wx(enable_cal));
//    multi3 delta_W_2_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata2),.multiresult(delta_W_y[15]),.enable_wx(enable_cal));
//    multi3 delta_W_3_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata3),.multiresult(delta_W_y[16]),.enable_wx(enable_cal));
//    multi3 delta_W_4_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata4),.multiresult(delta_W_y[17]),.enable_wx(enable_cal));
//    multi3 delta_W_5_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata5),.multiresult(delta_W_y[18]),.enable_wx(enable_cal));
//    multi3 delta_W_6_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata6),.multiresult(delta_W_y[19]),.enable_wx(enable_cal));
//    multi3 delta_W_7_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata7),.multiresult(delta_W_y[20]),.enable_wx(enable_cal));
//    multi3 delta_W_8_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata8),.multiresult(delta_W_y[21]),.enable_wx(enable_cal));
//    multi3 delta_W_9_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata9),.multiresult(delta_W_y[22]),.enable_wx(enable_cal));
//    multi3 delta_W_10_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata10),.multiresult(delta_W_y[23]),.enable_wx(enable_cal));
//    multi3 delta_W_11_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata11),.multiresult(delta_W_y[24]),.enable_wx(enable_cal));
//    multi3 delta_W_12_1(.clk(clk),.data_1(n_error_hid[1]),.data_2(inputdata12),.multiresult(delta_W_y[25]),.enable_wx(enable_cal));
    
//    multi3 delta_W_0_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata0),.multiresult(delta_W_y[26]),.enable_wx(enable_cal));
//    multi3 delta_W_1_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata1),.multiresult(delta_W_y[27]),.enable_wx(enable_cal));
//    multi3 delta_W_2_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata2),.multiresult(delta_W_y[28]),.enable_wx(enable_cal));
//    multi3 delta_W_3_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata3),.multiresult(delta_W_y[29]),.enable_wx(enable_cal));
//    multi3 delta_W_4_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata4),.multiresult(delta_W_y[30]),.enable_wx(enable_cal));
//    multi3 delta_W_5_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata5),.multiresult(delta_W_y[31]),.enable_wx(enable_cal));
//    multi3 delta_W_6_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata6),.multiresult(delta_W_y[32]),.enable_wx(enable_cal));
//    multi3 delta_W_7_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata7),.multiresult(delta_W_y[33]),.enable_wx(enable_cal));
//    multi3 delta_W_8_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata8),.multiresult(delta_W_y[34]),.enable_wx(enable_cal));
//    multi3 delta_W_9_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata9),.multiresult(delta_W_y[35]),.enable_wx(enable_cal));
//    multi3 delta_W_10_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata10),.multiresult(delta_W_y[36]),.enable_wx(enable_cal));
//    multi3 delta_W_11_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata11),.multiresult(delta_W_y[37]),.enable_wx(enable_cal));
//    multi3 delta_W_12_2(.clk(clk),.data_1(n_error_hid[2]),.data_2(inputdata12),.multiresult(delta_W_y[38]),.enable_wx(enable_cal));
    
//    multi3 delta_W_0_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata0),.multiresult(delta_W_y[39]),.enable_wx(enable_cal));
//    multi3 delta_W_1_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata1),.multiresult(delta_W_y[40]),.enable_wx(enable_cal));
//    multi3 delta_W_2_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata2),.multiresult(delta_W_y[41]),.enable_wx(enable_cal));
//    multi3 delta_W_3_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata3),.multiresult(delta_W_y[42]),.enable_wx(enable_cal));
//    multi3 delta_W_4_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata4),.multiresult(delta_W_y[43]),.enable_wx(enable_cal));
//    multi3 delta_W_5_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata5),.multiresult(delta_W_y[44]),.enable_wx(enable_cal));
//    multi3 delta_W_6_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata6),.multiresult(delta_W_y[45]),.enable_wx(enable_cal));
//    multi3 delta_W_7_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata7),.multiresult(delta_W_y[46]),.enable_wx(enable_cal));
//    multi3 delta_W_8_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata8),.multiresult(delta_W_y[47]),.enable_wx(enable_cal));
//    multi3 delta_W_9_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata9),.multiresult(delta_W_y[48]),.enable_wx(enable_cal));
//    multi3 delta_W_10_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata10),.multiresult(delta_W_y[49]),.enable_wx(enable_cal));
//    multi3 delta_W_11_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata11),.multiresult(delta_W_y[50]),.enable_wx(enable_cal));
//    multi3 delta_W_12_3(.clk(clk),.data_1(n_error_hid[3]),.data_2(inputdata12),.multiresult(delta_W_y[51]),.enable_wx(enable_cal));
    
    

endmodule
