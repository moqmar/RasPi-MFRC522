#include "MFRC522.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  int status;
  unsigned char backBits;
  unsigned char *uid;

  MFRC522_Init(getenv("MFRC522_SPIDEV"));

  while (status != MI_OK) {
    while ((status = MFRC522_Request(PICC_REQIDL, &backBits)) != MI_OK)
      usleep(500);
    status = MFRC522_Anticoll(&uid);
    if (status == MI_OK) {
      printf("%02x %02x %02x %02x\n", uid[0], uid[1], uid[2], uid[3]);
      return 0;
    }
  }
}
