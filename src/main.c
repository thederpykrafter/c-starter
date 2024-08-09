#include "terminal.h"
#include <unistd.h>


void hello() {
  printc("green", "Hello,");
  printc("blue", " world!\n");
}

int main() {
  enter_buffer();
  clear_term();
  hello();
  sleep(5);
  exit_buffer();

  return 0;
}
