// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2012.2
// Copyright (C) 2012 Xilinx Inc. All rights reserved.
// 
// ==============================================================



`timescale 1 ns / 1 ps




module generate_board_counts_result_p3_core (q, ra, ce, reset, clk
, d, wa, we);
    parameter READ_PORT_COUNT=32'd1;
    parameter WRITE_PORT_COUNT=32'd2;
    parameter DATA_WIDTH=32'd32;
    parameter ADDRESS_WIDTH=32'd1;
    parameter WORD_COUNT=32'd2;

    output [READ_PORT_COUNT*DATA_WIDTH-1:0] q;
    input [READ_PORT_COUNT*ADDRESS_WIDTH-1:0]  ra;
    input [READ_PORT_COUNT-1:0]  ce;
    input [WRITE_PORT_COUNT*DATA_WIDTH-1:0] d;
    input [WRITE_PORT_COUNT*ADDRESS_WIDTH-1:0] wa;
    input [WRITE_PORT_COUNT-1:0]               we;
    input                                      reset;
    input                                      clk;

    integer                                    i,j;

    reg [DATA_WIDTH-1:0]                       mem [0:WORD_COUNT-1];
    reg [ADDRESS_WIDTH-1:0]                    rat;
    reg [ADDRESS_WIDTH-1:0]                    rai [READ_PORT_COUNT-1:0];
    reg [ADDRESS_WIDTH-1:0]                    rai_reg [READ_PORT_COUNT-1:0];
    reg [DATA_WIDTH-1:0]                       di [WRITE_PORT_COUNT-1:0];
    reg [DATA_WIDTH-1:0]                       dt;
    reg [ADDRESS_WIDTH-1:0]                    wat;
    reg [ADDRESS_WIDTH-1:0]                    wai [WRITE_PORT_COUNT-1:0];




    // Split input data
    always @ (d) begin
        for (i=0;i<WRITE_PORT_COUNT;i=i+1) begin
            for (j=0;j<DATA_WIDTH;j=j+1) begin
                dt[j]=d[i*DATA_WIDTH+j];
            end
            di[i]=dt;
        end
    end

    // Split write addresses
    always @ (wa) begin
        for (i=0;i<WRITE_PORT_COUNT;i=i+1) begin
            for (j=0;j<ADDRESS_WIDTH;j=j+1) begin
                wat[j]=wa[i*ADDRESS_WIDTH+j];
            end
            wai[i]=wat;
        end
    end

    // Write memory
    always @ (posedge clk) begin
        for (j=0;j<WRITE_PORT_COUNT;j=j+1) begin
            if (we[j]) begin
                mem[wai[j]] <= di[j];
            end
        end
    end

    // Split read addresses
    always @ (ra) begin
        for (i=0;i<READ_PORT_COUNT;i=i+1) begin
            for (j=0;j<ADDRESS_WIDTH;j=j+1) begin
                rat[j]=ra[i*ADDRESS_WIDTH+j];
            end
            rai[i]=rat;
        end
    end

    // guide read addresses using CE
    always @ (posedge clk) begin
        for (i=0;i<READ_PORT_COUNT;i=i+1) begin
            if ( ce[i] ) begin
                rai_reg[i] <= rai[i];
            end
        end
    end


    // Memory read
    genvar x;
    generate
        for (x = 0; x < READ_PORT_COUNT; x = x + 1) begin : gen_q
            assign q[x*DATA_WIDTH+DATA_WIDTH-1:x*DATA_WIDTH] = (rai_reg[x]<WORD_COUNT)?
                mem[rai_reg[x]] : {DATA_WIDTH{1'b0}};
        end
    endgenerate

endmodule


module generate_board_counts_result_p3 (
    address0,
    ce0,
    q0,
    we0,
    d0,

    address1,
    ce1,
    we1,
    d1,

    reset,
    clk);


parameter DataWidth = 32'd32;
parameter AddressRange = 32'd2;
parameter AddressWidth = 32'd1;

input[AddressWidth-1:0] address0;
input ce0;
output[DataWidth-1:0] q0;
input we0;
input[DataWidth-1:0] d0;
input[AddressWidth-1:0] address1;
input ce1;
input we1;
input[DataWidth-1:0] d1;
input reset;
input clk;


reg[DataWidth-1:0] q0;
wire[1 * DataWidth - 1:0] mem_q;
wire[DataWidth - 1:0] mem_q0;
wire[2 - 1:0] mem_we;
wire[2 * DataWidth - 1:0] mem_d;
wire[2 * AddressWidth - 1:0] mem_wa;
wire[1 * AddressWidth - 1:0]  mem_ra;
wire[1 - 1:0]  mem_ce;


wire __re__[0:2-1];
wire __we__[0:2-1];
wire [AddressWidth-1:0] __addr__[0:2-1];


generate_board_counts_result_p3_core #(
    .READ_PORT_COUNT( 1 ),
    .WRITE_PORT_COUNT( 2 ),
    .DATA_WIDTH( DataWidth ),
    .ADDRESS_WIDTH( AddressWidth ),
    .WORD_COUNT( AddressRange ))
core_inst (
    .q( mem_q ),
    .ra( mem_ra ),
    .ce( mem_ce ),
    .d( mem_d ),
    .wa( mem_wa ),
    .we( mem_we ),
    .reset( reset ),
    .clk( clk ));


assign mem_q0 =  mem_q[1 * DataWidth - 1 : 0 * DataWidth];

always @ (mem_q0) begin
        q0 = mem_q0;
end

assign mem_ra = {address0};
assign mem_ce = {ce0};

assign mem_we[1] = we0;

assign mem_we[0] = we1;

assign mem_d = {d0, d1};

assign mem_wa = {address0, address1};

assign __re__[0]   = ce0 & ~we0;
assign __we__[0]   = ce0 & we0;
assign __addr__[0] = address0;
assign __re__[1]   = 1'b0;
assign __we__[1]   = ce1 & we1;
assign __addr__[1] = address1;


// check collision
always @(posedge clk) begin : check_collision
    integer i, j, f;
    f = 0;
    for (i = 0; i < 1; i = i + 1) begin
        for (j = i + 1; j < 2; j = j + 1) begin
            if (__addr__[i] == __addr__[j]) begin
                if (__we__[i] & __we__[j]) begin
                    $display("Warning: collision occurred.");
                    $display("    Port %0d  : write", i);
                    $display("    Port %0d  : write", j);
                    $display("    Address : %0d(0x%0h)", __addr__[i], __addr__[i]);
                    f = 1;
                end
                else if (__we__[i] & __re__[j]) begin
                    $display("Warning: collision occurred.");
                    $display("    Port %0d  : write", i);
                    $display("    Port %0d  : read", j);
                    $display("    Address : %0d(0x%0h)", __addr__[i], __addr__[i]);
                    f = 1;
                end
                else if (__re__[i] & __we__[j]) begin
                    $display("Warning: collision occurred.");
                    $display("    Port %0d  : read", i);
                    $display("    Port %0d  : write", j);
                    $display("    Address : %0d(0x%0h)", __addr__[i], __addr__[i]);
                    f = 1;
                end
                if (f) begin
                    // $finish;
                end
            end
        end
    end
end


endmodule
