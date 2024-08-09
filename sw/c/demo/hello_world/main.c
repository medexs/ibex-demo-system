// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdbool.h>

#include "demo_system.h"
#include "gpio.h"
#include "timer.h"

// GPI
#define SW0_MASK  0x1
#define SW(n)     (SW0_MASK << n)
#define BTNL_MASK ((SW0_MASK << 15) << 1)
#define BTNR_MASK ((SW0_MASK << 15) << 2)
#define BTNU_MASK ((SW0_MASK << 15) << 3)
#define BTND_MASK ((SW0_MASK << 15) << 4)

// GPO
#define LED0_MASK 0x1
#define LED(n)    (LED0_MASK << n)

void test_uart_irq_handler(void) __attribute__((interrupt));

void test_uart_irq_handler(void) {
  int uart_in_char;

  while ((uart_in_char = uart_in(DEFAULT_UART)) != -1) {
    uart_out(DEFAULT_UART, uart_in_char);
    uart_out(DEFAULT_UART, '\r');
    uart_out(DEFAULT_UART, '\n');
  }
}

int main(void) {
  install_exception_handler(UART_IRQ_NUM, &test_uart_irq_handler);
  uart_enable_rx_int();

  // This indicates how often the timer gets updated.
  timer_init();
  timer_enable(5000000);

  uint64_t last_elapsed_time = get_elapsed_time();

  // Reset LEDs to having just one on
  set_outputs(GPIO_OUT, LED(0));

  while (1) {
    uint64_t cur_time = get_elapsed_time();

    if (cur_time != last_elapsed_time) {
      last_elapsed_time = cur_time;

      // Disable interrupts whilst outputting to prevent output for RX IRQ
      // happening in the middle
      set_global_interrupt_enable(0);

      // Print this to UART (use the screen command to see it).
      puts("Hello World! ");
      puthex(last_elapsed_time);
      puts("   Input Value: ");
      uint32_t in_val = read_gpio(GPIO_IN_DBNC);
      puthex(in_val);
      putchar('\n');

      // Re-enable interrupts with output complete
      set_global_interrupt_enable(1);

      // Cycle through LEDs unless BTNL is pressed
      // uint32_t out_val = read_gpio(GPIO_OUT);
      // out_val = (out_val << 1) & 0xF;
      // if ((in_val & BTNL_MASK) || (out_val == 0)) {
      //   out_val = LED(0);
      // }
      // set_outputs(GPIO_OUT, out_val);

      // Shift LED0 left/right based on BTNL/BTNR
      uint32_t out_val = read_gpio(GPIO_OUT);
      if (in_val & BTNL_MASK)
        out_val = out_val & LED(15) ? LED(0) : out_val << 1;
      else if (in_val & BTNR_MASK)
        out_val = out_val & LED(0) ? LED(15) : out_val >> 1;

      set_outputs(GPIO_OUT, out_val);
    }

    asm volatile("wfi");
  }
}
