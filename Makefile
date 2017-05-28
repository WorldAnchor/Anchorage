# Makefile
# 28/5/2017
#
# Build a binary from Golang source.

# Declare the target binary to be compiled.
BINARY=hello

# Detect if the system is a Win32 System, and append '.exe.' if it is.
ifeq ($(OS),Windows_NT)
	BINARY := $(BINARY).exe
endif

# Directory location of the program source files.
SRC_DIR = src
# Output directory for binaries and compilation.
BUILD_DIR = bin

# Track and include some build information in the binary.
#
# Set the version.
VERSION = 0.0.1
# A date here will result in a checkum error between builds.
BUILD = `date +%FT%T%z`

# Set the link flags in order to interpolate the build variables set above.
LDFLAGS = -ldflags "-X main.Version=${VERSION} -X main.Build=$(BUILD)"

# Default target.
.DEFAULT_GOAL: $(BINARY)

# Build target; compile the target binary.
$(BINARY):
	go build ${LDFLAGS} -o ${BUILD_DIR}/${BINARY} ${SRC_DIR}/hello.go

# Installs the project and copies the binaries.
install:
	go install ${LDFLAGS} -o ${BUILD_DIR}/${BINARY} ${SRC_DIR}/hello.go

# Dump the global variables to STDOUT for inspection.
dump-vars:
	$(info ${.VARIABLES})

# Cleans the project and deletes any binaries.
clean:
	@(if [ -f ${BUILD_DIR}/${BINARY} ] ; then rm ${BUILD_DIR}/${BINARY} ; fi)
	@echo "Project binaries removed."

.PHONY: dump-vars clean install
