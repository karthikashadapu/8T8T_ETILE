SOURCES = pcap_parser.c
EXE = out

CC = gcc
LDFLAGS = -lpcap -lm

.PHONY: all
all: output

.PHONY: output
output: 
	$(CC) -o $(EXE) $(SOURCES) $(LDFLAGS)

.PHONY: clean
clean :
	rm -rf *.o out
