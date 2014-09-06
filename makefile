
all:
	@echo "Option not supported. Run 'make install-missing' to install all missing packages"

build:
	@echo "Option not supported. Run 'make install-missing' to install all missing packages"

install:
	@echo "Option not supported. Run 'make install-missing' to install all missing packages"

clean:
	@echo "Option not supported. Run 'make install-missing' to install all missing packages"

install-missing: .install_missing
	sudo ./.install_missing
