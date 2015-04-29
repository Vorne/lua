REPO_ROOT ?= ./..

include $(REPO_ROOT)/build-internal/makefile.d/base.mk

LUA_FILES = $(shell find src -type f)

$(OUTPUT_DIR): $(LUA_FILES)
	mkdir -p $(OUTPUT_DIR)
	cp -R src/* $(OUTPUT_DIR)
	cd $(OUTPUT_DIR) && make posix

all: $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)