BIN_DIR := $(GOPATH)/bin# Directory for cli binaries
BINARY ?= $(shell basename "$(PWD)")# binary name
RELEASE_PLATFORMS := $(linux darwin)# release platforms to build for
os = $(word 1, $@)
CMD := $(wildcard cmd/*.go)

# Clean the build directory (before commiting code, for example)
.PHONY: clean
clean: 
	rm -rv bin

PLATFORMS := linux/amd64 windows/amd64 darwin/amd64 darwin/arm64

temp = $(subst /, ,$@)
os = $(word 1, $(temp))
arch = $(word 2, $(temp))

release: $(PLATFORMS)

$(PLATFORMS):
	GOOS=$(os) GOARCH=$(arch) go build -o 'bin/$(BINARY)-$(os)-$(arch)' $(CMD)

.PHONY: release $(PLATFORMS)

