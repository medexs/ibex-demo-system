## Clock signal
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { IO_CLK }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { IO_CLK }];

## Reset
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { IO_RST }]; # BTNC

## Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { SW[0]  }]; # SW0
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { SW[1]  }]; # SW1
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { SW[2]  }]; # SW2
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports { SW[3]  }]; # SW3
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { SW[4]  }]; # SW4
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { SW[5]  }]; # SW5
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { SW[6]  }]; # SW6
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { SW[7]  }]; # SW7
set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { SW[8]  }]; # SW8
set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports { SW[9]  }]; # SW9
set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports { SW[10] }]; # SW10
set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports { SW[11] }]; # SW11
set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports { SW[12] }]; # SW12
set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports { SW[13] }]; # SW13
set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports { SW[14] }]; # SW14
set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { SW[15] }]; # SW15

## LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { LED[0]  }]; # LD0
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { LED[1]  }]; # LD1
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { LED[2]  }]; # LD2
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { LED[3]  }]; # LD3
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { LED[4]  }]; # LD4
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { LED[5]  }]; # LD5
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { LED[6]  }]; # LD6
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { LED[7]  }]; # LD7
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { LED[8]  }]; # LD8
set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports { LED[9]  }]; # LD9
set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports { LED[10] }]; # LD10
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { LED[11] }]; # LD11
set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports { LED[12] }]; # LD12
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { LED[13] }]; # LD13
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { LED[14] }]; # LD14
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { LED[15] }]; # LD15

## Buttons
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { BTN[0] }]; # BTNL
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { BTN[1] }]; # BTNR
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { BTN[2] }]; # BTNU
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { BTN[3] }]; # BTND

## USB-UART Interface
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { UART_TX }];
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { UART_RX }];

## Quad SPI Flash
#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { qspi_cs }];
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[0] }];
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[1] }];
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[2] }];
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[3] }];