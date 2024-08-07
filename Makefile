# use @<command> to supress make echoing command
CC = gcc
CFLAGS = -g
OUT_FILE = test_prog

default: all

all: build install

build: src/main.c
	@$(CC) $(CFLAGS) -o bin/$(OUT_FILE) src/main.c
	@echo -e "\x1b[92mBuilt\x1b[m $(OUT_FILE)"

install: bin/$(OUT_FILE)
	@sudo cp bin/$(OUT_FILE) /usr/bin
	@echo -e "\x1b[92mInstalled $(OUT_FILE)\x1b[m"

uninstall: bin/$(OUT_FILE)
	@sudo rm -f /usr/bin/$(OUT_FILE)
	@echo -e "\x1b[91mUninstalled\x1b[m $(OUT_FILE)"

clean veryclean:
	@rm -f bin/$(OUT_FILE)
	@echo -e "\x1b[91mRemoved bin/$(OUT_FILE)\x1b[m"
