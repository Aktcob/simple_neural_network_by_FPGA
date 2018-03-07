/*-- ***************************************************************************
-- ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          myip_v1_0
-- Version:           1.00.a
-- Description:       Example Axi Streaming core (Verilog).
-- Date:              Mon Sep 15 15:41:21 2014 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     Verilog 2001
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
--
--
-- Definition of Ports
-- ACLK              : Synchronous clock
-- ARESETN           : System reset, active low
-- S_AXIS_TREADY  : Ready to accept data in
-- S_AXIS_TDATA   :  Data in 
-- S_AXIS_TLAST   : Optional data in qualifier
-- S_AXIS_TVALID  : Data in is valid
-- M_AXIS_TVALID  :  Data out is valid
-- M_AXIS_TDATA   : Data Out
-- M_AXIS_TLAST   : Optional data out qualifier
-- M_AXIS_TREADY  : Connected slave device is ready to accept data out
--
-------------------------------------------------------------------------------
*/

module nnip_v1_0 
	(
		// DO NOT EDIT BELOW THIS LINE ////////////////////
		ACLK,
		ARESETN,
		S_AXIS_TREADY,
		S_AXIS_TDATA,
		S_AXIS_TLAST,
		S_AXIS_TVALID,
		M_AXIS_TVALID,
		M_AXIS_TDATA,
		M_AXIS_TLAST,
		M_AXIS_TREADY
		// DO NOT EDIT ABOVE THIS LINE ////////////////////
	);

input                          ACLK;    // Synchronous clock
input                          ARESETN; // System reset, active low
// slave in interface
output                         S_AXIS_TREADY;  // Ready to accept data in
input      [31 : 0]            S_AXIS_TDATA;   // Data in
input                          S_AXIS_TLAST;   // Optional data in qualifier
input                          S_AXIS_TVALID;  // Data in is valid
// master out interface
output                         M_AXIS_TVALID;  // Data out is valid
output     [31 : 0]            M_AXIS_TDATA;   // Data Out
output                         M_AXIS_TLAST;   // Optional data out qualifier
input                          M_AXIS_TREADY;  // Connected slave device is ready to accept data out

//----------------------------------------
// Implementation Section
//----------------------------------------
// In this section, we povide an example implementation of MODULE myip_v1_0
// that does the following:
//
// 1. Read all inputs
// 2. Add each input to the contents of register 'sum' which
//    acts as an accumulator
// 3. After all the inputs have been read, write out the
//    content of 'sum' into the output stream NUMBER_OF_OUTPUT_WORDS times
//
// You will need to modify this example for
// MODULE myip_v1_0 to implement your coprocessor

   // Total number of input data.
      localparam NUMBER_OF_INPUT_WORDS  = 16;
   
      // Total number of output data
      localparam NUMBER_OF_OUTPUT_WORDS = 2;
   
      // Define the states of state machine
      localparam Idle  = 4'b1000;
      localparam Read_Inputs = 4'b0100;
      localparam Write_Outputs  = 4'b0010;
      localparam Computing = 4'b0001;
      reg [31:0] data[15:0];
    
      reg [3:0] state;
      integer index,i,count;
      // Accumulator to hold sum of inputs read at any point in time
      reg [95:0] result;
      reg [24:0]W[51:0];
      reg [24:0]WW[11:0];
      wire [24:0]delta_W[51:0];
      wire [24:0]delta_WW[11:0];
      wire [24:0]out_y0,out_y1,out_y2;
      reg enable_cal;
      // Counters to store the number inputs read & outputs written
      reg [NUMBER_OF_INPUT_WORDS - 1:0] nr_of_reads;
      reg [NUMBER_OF_OUTPUT_WORDS - 1:0] nr_of_writes;
   
      // CAUTION:
      // The sequence in which data are read in should be
      // consistent with the sequence they are written
   
      assign S_AXIS_TREADY = (state == Read_Inputs);
      assign M_AXIS_TVALID = (state == Write_Outputs);
      assign M_AXIS_TLAST = (state == Write_Outputs) & (nr_of_writes == 0);
   
      assign M_AXIS_TDATA = ( nr_of_writes == 2) ? result[95:64] :( nr_of_writes == 1) ? result[63:32] : (result[31:0]);
   
   
      always @(posedge ACLK) 
      begin
   
         /****** Synchronous reset (active low) ******/
         if (!ARESETN)
           begin
              // CAUTION: make sure your reset polarity is consistent with the
              // system reset polarity               
                nr_of_reads   <= 0;
                nr_of_writes  <= 0;
                result<= 0;
                enable_cal<=0;
                count<=0;
                for(i=0;i<52;i=i+1)
                begin
                if(i==0||i==14||i==28||i==42) 
                W[i]=100;
                else W[i]=0;
                end                
                for(i=0;i<12;i=i+1)
                begin
                if(i==0||i==5||i==10) 
                WW[i]=100;
                else WW[i]=0;
                end
                state         <= Idle;   
           end
         /************** state machines **************/
         else
           case (state)
   
             Idle:
               if (S_AXIS_TVALID == 1)
               begin
                 state          <= Read_Inputs;
                 nr_of_reads    <= NUMBER_OF_INPUT_WORDS;
                 result <= 0;
               end
   
             Read_Inputs:
               if (S_AXIS_TVALID == 1) 
               begin
                 // --- Coprocessor function happens below --- //
                 if (nr_of_reads > 0)
                 begin
                   data[16-nr_of_reads][31:0] <= S_AXIS_TDATA;
                 end
   
                 // --- Coprocessor function happens above --- //
                 if (nr_of_reads == 0)
                   begin
                     index        <=0;
                     state        <=Computing;                  
                     nr_of_writes <= NUMBER_OF_OUTPUT_WORDS - 1;
                   end
                 else
                   nr_of_reads <= nr_of_reads - 1;
               end
   
             Computing:
               begin
               enable_cal <=1;
               count <= count+1;
               if(count==30)begin
               result[31:0]<=out_y0;
               result[63:32]<=out_y1;
               result[95:64]<=out_y2;
               state <= Write_Outputs;
               enable_cal <=0;
               count <=0;
               end
   //            result <= data1 *data2;
   //            nr_of_writes <= NUMBER_OF_OUTPUT_WORDS - 1;
               
               end
               
             Write_Outputs:
               if (M_AXIS_TREADY == 1) 
               begin
                 if (nr_of_writes == 0) 
                    for(i=0;i<52;i=i+1)
                     begin
                     if(delta_W[i][24]==W[i][24])
                         begin
                         W[i][23:0]=W[i][23:0]+delta_W[i][23:0];
                         end
                     else
                     begin
                         if(delta_W[i][23:0]>W[i][23:0])
                         begin
                         W[i][23:0]=delta_W[i][23:0]-W[i][23:0];
                         W[i][24]=delta_W[i][24];
                         end
                         else begin
                         W[i][23:0]=W[i][23:0]-delta_W[i][23:0];
                         end
                     end
                     state <= Idle;
                     end                  
                 else                 
                    nr_of_writes <= nr_of_writes - 1;                  
               end
           endcase
      end
 NN retrrt(
            .clk(ACLK),.enable_cal,
            .inputdata0(data[0]),.inputdata1(data[1]),.inputdata2(data[2]),.inputdata3(data[3]),.inputdata4(data[4]),.inputdata5(data[5]),.inputdata6(data[6]),.inputdata7(data[7]),.inputdata8(data[8]),.inputdata9(data[9]),.inputdata10(data[10]),.inputdata11(data[11]),.inputdata12(data[12]),
            .label_y0(data[13]),.label_y1(data[14]),.label_y2(data[15]),.out_y0,.out_y1,.out_y2,
            .W0(W[0]),.W1(W[1]),.W2(W[2]),.W3(W[3]),.W4(W[4]),.W5(W[5]),.W6(W[6]),.W7(W[7]),.W8(W[8]),.W9(W[9]),.W10(W[10]),.W11(W[11]),
            .W12(W[12]),.W13(W[13]),.W14(W[14]),.W15(W[15]),.W16(W[16]),.W17(W[17]),.W18(W[18]),.W19(W[19]),.W20(W[20]),.W21(W[21]),.W22(W[22]),
            .W23(W[23]),.W24(W[24]),.W25(W[25]),.W26(W[26]),.W27(W[27]),.W28(W[28]),.W29(W[29]),.W30(W[30]),.W31(W[31]),.W32(W[32]),.W33(W[33]),
            .W34(W[34]),.W35(W[35]),.W36(W[36]),.W37(W[37]),.W38(W[38]),.W39(W[39]),.W40(W[40]),.W41(W[41]),.W42(W[42]),.W43(W[43]),.W44(W[44]),
            .W45(W[45]),.W46(W[46]),.W47(W[47]),.W48(W[48]),.W49(W[49]),.W50(W[50]),.W51(W[51]),
            .WW0(WW[0]),.WW1(WW[1]),.WW2(WW[2]),.WW3(WW[3]),.WW4(WW[4]),.WW5(WW[5]),.WW6(WW[6]),.WW7(WW[7]),.WW8(WW[8]),.WW9(WW[9]),.WW10(WW[10]),.WW11(WW[11]),
           .d_W0(delta_W[0]),.d_W1(delta_W[1]),.d_W2(delta_W[2]),.d_W3(delta_W[3]),.d_W4(delta_W[4]),.d_W5(delta_W[5]),.d_W6(delta_W[6]),.d_W7(delta_W[7]),.d_W8(delta_W[8]),.d_W9(delta_W[9]),.d_W10(delta_W[10]),.d_W11(delta_W[11]),
           .d_W12(delta_W[12]),.d_W13(delta_W[13]),.d_W14(delta_W[14]),.d_W15(delta_W[15]),.d_W16(delta_W[16]),.d_W17(delta_W[17]),.d_W18(delta_W[18]),.d_W19(delta_W[19]),.d_W20(delta_W[20]),.d_W21(delta_W[21]),.d_W22(delta_W[22]),
           .d_W23(delta_W[23]),.d_W24(delta_W[24]),.d_W25(delta_W[25]),.d_W26(delta_W[26]),.d_W27(delta_W[27]),.d_W28(delta_W[28]),.d_W29(delta_W[29]),.d_W30(delta_W[30]),.d_W31(delta_W[31]),.d_W32(delta_W[32]),.d_W33(delta_W[33]),
           .d_W34(delta_W[34]),.d_W35(delta_W[35]),.d_W36(delta_W[36]),.d_W37(delta_W[37]),.d_W38(delta_W[38]),.d_W39(delta_W[39]),.d_W40(delta_W[40]),.d_W41(delta_W[41]),.d_W42(delta_W[42]),.d_W43(delta_W[43]),.d_W44(delta_W[44]),
           .d_W45(delta_W[45]),.d_W46(delta_W[46]),.d_W47(delta_W[47]),.d_W48(delta_W[48]),.d_W49(delta_W[49]),.d_W50(delta_W[50]),.d_W51(delta_W[51]),
           .d_WW0(delta_WW[0]),.d_WW1(delta_WW[1]),.d_WW2(delta_WW[2]),.d_WW3(delta_WW[3]),.d_WW4(delta_WW[4]),.d_WW5(delta_WW[5]),.d_WW6(delta_WW[6]),.d_WW7(delta_WW[7]),.d_WW8(delta_WW[8]),.d_WW9(delta_WW[9]),.d_WW10(delta_WW[10]),.d_WW11(delta_WW[11])
           );   
   endmodule