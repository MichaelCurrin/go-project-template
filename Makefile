OUT_DIR = build
OUT_BIN_NAME = myapp
OUT_BIN_PATH := $(OUT_DIR)/$(OUT_BIN_NAME)

.PHONY: $(OUT_DIR)


default: install

all: install fmt test build


h help:
	@grep '^[a-z]' Makefile


install:
	go get ./...

upgrade:
	go get -u ./...

tidy:
	go mod tidy


fmt:
	go fmt ./...

test:
	@echo "TODO: Add tests"
	go test -v ./...


run:
	go run main.go
	go run main.go --name Gopher

usage:
	go run main.go -h

build:
	go build -v \
		-o $(OUT_BIN_PATH) \
		main.go

global:
	go install
