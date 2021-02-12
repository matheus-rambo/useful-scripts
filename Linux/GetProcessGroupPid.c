#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {

 if(argc < 2) {
     printf("Usage: %s <pid>\n", argv[0]);
     return 1;
  }
  pid_t pp= atoi(argv[1]);
  printf("Group pid is: %u\n", getpgid(pp));
  return 0;
}
