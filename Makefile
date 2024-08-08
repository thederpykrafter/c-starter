# use @<command> to supress make echoing command
CC = gcc
CFLAGS = -g
OUT_FILE = test_prog

default: all

all: build install

test: build run

build: src/main.c
	@if [ ! -d bin ]; then mkdir bin; fi
	@$(CC) $(CFLAGS) -o bin/$(OUT_FILE) src/main.c
	@echo -e "\x1b[92mCompiled\x1b[m bin/$(OUT_FILE)"

install: bin/$(OUT_FILE)
	@echo -e "\x1b[94mInstalling\x1b[m bin/$(OUT_FILE)"
	@sudo cp bin/$(OUT_FILE) /usr/bin
	@echo -e "\x1b[92mInstalled\x1b[m $(OUT_FILE)"

uninstall: bin/$(OUT_FILE)
	@sudo rm -f /usr/bin/$(OUT_FILE)
	@echo -e "\x1b[91mUninstalled \x1b[m$(OUT_FILE)"

run:
	@./bin/test_prog

clean veryclean:
	@rm -f bin/$(OUT_FILE)
	@echo -e "\x1b[91mRemoved \x1b[mbin/$(OUT_FILE)"
