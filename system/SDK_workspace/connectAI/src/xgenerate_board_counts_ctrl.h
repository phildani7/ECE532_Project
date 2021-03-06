// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2012.2
// Copyright (C) 2012 Xilinx Inc. All rights reserved.
// 
// ==============================================================

// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/SC)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        others - reserved
// 0x10 : reserved
// 0x14 : Data signal of board_addr
//        bit 31~0 - board_addr[31:0] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of result_addr
//        bit 31~0 - result_addr[31:0] (Read/Write)
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XGENERATE_BOARD_COUNTS_CTRL_ADDR_AP_CTRL          0x00
#define XGENERATE_BOARD_COUNTS_CTRL_ADDR_GIE              0x04
#define XGENERATE_BOARD_COUNTS_CTRL_ADDR_IER              0x08
#define XGENERATE_BOARD_COUNTS_CTRL_ADDR_ISR              0x0c
#define XGENERATE_BOARD_COUNTS_CTRL_ADDR_BOARD_ADDR_DATA  0x14
#define XGENERATE_BOARD_COUNTS_CTRL_BITS_BOARD_ADDR_DATA  32
#define XGENERATE_BOARD_COUNTS_CTRL_ADDR_RESULT_ADDR_DATA 0x1c
#define XGENERATE_BOARD_COUNTS_CTRL_BITS_RESULT_ADDR_DATA 32
