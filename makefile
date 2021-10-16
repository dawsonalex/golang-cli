BIN_DIR := $(GOPATH)/bin# Directory for cli binaries
BINARY ?= $(shell basename "$(PWD)")# binary name
RELEASE_PLATFORMS := $(linux darwin)# release platforms to build for
os = $(word 1, $@)
CMD := $(wildcard cmd/*.go)

# Fetch golangci-lint tool.
$(GOLINTER):
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.27.0

# Run build for each release candidate
.PHONY: $(RELEASE_PLATFORMS)
$(RELEASE_PLATFORMS):
	mkdir -p build
	GOOS=$(os) GOARCH=amd64 go build -o build/$(BINARY)-$(os)-amd64 $(CMD)

# build the linux release
.PHONY: build
build: linux darwin

# Clean the build directory (before commiting code, for example)
.PHONY: clean
clean: 
	rm -rv build