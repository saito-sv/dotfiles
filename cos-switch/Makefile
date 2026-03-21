BIN := cos-switch
INSTALL_DIR := $(HOME)/.local/bin

.PHONY: build install uninstall

build:
	cargo build --release

install: build
	mkdir -p $(INSTALL_DIR)
	cp target/release/$(BIN) $(INSTALL_DIR)/$(BIN)

uninstall:
	rm -f $(INSTALL_DIR)/$(BIN)
