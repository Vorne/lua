REPO_ROOT ?= ./..

include $(REPO_ROOT)/xl/makefile.d/base.mk

LUA_FILES = $(shell find src -type f)

CFLAGS="-Wno-array-bounds"

$(OUTPUT_DIR): $(LUA_FILES)
	mkdir -p $(OUTPUT_DIR)
	cp -R src/* $(OUTPUT_DIR)
	cd $(OUTPUT_DIR) && $(MAKE) MYCFLAGS=$(CFLAGS) posix

all: $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)
