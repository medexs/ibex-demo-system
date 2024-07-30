// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This is the top level SystemVerilog file that connects the IO on the Basys3 board to the Ibex Demo System.
module top_basys3 #(
  parameter SRAMInitFile = ""
) (
  // These inputs are defined in data/pins_basys3.xdc
  input         IO_CLK,
  input         IO_RST_N,
  input  [ 3:0] SW,
  input  [ 3:0] BTN,
  output [15:0] LED,
  input         UART_RX,
  output        UART_TX
);

  logic clk_sys, rst_sys_n;

  // Instantiating the Ibex Demo System.
  ibex_demo_system #(
    .GpiWidth     ( 8            ),
    .GpoWidth     ( 16           ),
    .PwmWidth     ( 0            ),
    .SRAMInitFile ( SRAMInitFile )
  ) u_ibex_demo_system (
    //input
    .clk_sys_i (clk_sys),
    .rst_sys_ni(rst_sys_n),
    .gp_i      ({SW, BTN}),
    .uart_rx_i (UART_RX),

    //output
    .gp_o     (LED),
    .pwm_o    (),
    .uart_tx_o(UART_TX),

    .spi_rx_i (),
    .spi_tx_o (),
    .spi_sck_o(),

    .trst_ni(1'b1),
    .tms_i  (1'b0),
    .tck_i  (1'b0),
    .td_i   (1'b0),
    .td_o   ()
  );

  // Generating the system clock and reset for the FPGA.
  clkgen_xil7series clkgen(
    .IO_CLK(IO_CLK),
    .IO_RST_N(~IO_RST_N),
    .clk_sys(clk_sys),
    .rst_sys_n(rst_sys_n)
  );

endmodule
