OUT_DIR = build
OUT_BIN_NAME = myapp
OUT_BIN_PATH := $(OUT_DIR)/$(OUT_BIN_NAME)

.PHONY: $(OUT_DIR) hooks


default: install

all: hooks install fmt-check lint test build


h help:
	@grep '^[a-z]' Makefile


hooks:
	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push

install-packages:
	go get ./...
	
install-staticcheck:
	go install honnef.co/go/tools/cmd/staticcheck@latest
	
install: install-packages install-staticcheck

upgrade:
	go get -u ./...

tidy:
	go mod tidy


fmt-check:
	@if [ -n "$(gofmt -l .)" ]; then \
		echo 'Error - formatting fixes needed. Run this:' ; \
		echo '  make fmt-fix' ; \
		exit 1; \
	fi

fmt-fix:
	go fmt ./...

lint:
	go vet ./...
	staticcheck ./...

test:
	go test -v ./...


usage:
	go run main.go -h
	
run:
	go run main.go
	go run main.go --name Gopher


build:
	go build -v \
		-o $(OUT_BIN_PATH) \
		main.go

global:
	go install
