# use @<command> to supress make echoing command
CC = gcc
CFLAGS = -g
OUT_FILE = test_prog

default: all

all: build install

test: build run

build: src/main.c
	@[[ ! -d bin ]] && mkdir bin
	$(CC) $(CFLAGS) -o bin/$(OUT_FILE) src/main.c

install: bin/$(OUT_FILE)
	cp bin/$(OUT_FILE) /usr/bin

uninstall: bin/$(OUT_FILE)
	rm -f /usr/bin/$(OUT_FILE)

run:
	./bin/$(OUT_FILE)

clean veryclean:
	rm -f bin/$(OUT_FILE)
