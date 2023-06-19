CFLAGS += -g

mfrc522-read:	mfrc522-read.o MFRC522.o spi.o gpio.o
	$(CC) $(CFLAGS) -o $@ mfrc522-read.o MFRC522.o spi.o gpio.o

mfrc522-read.o:	mfrc522-read.c
	$(CC) $(CFLAGS) -c $< -o $@

MFRC522.o:	MFRC522.c
	$(CC) $(CFLAGS) -c $< -o $@

spi.o:	spi.c
	$(CC) $(CFLAGS) -c $< -o $@

gpio.o:	gpio.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o Read
