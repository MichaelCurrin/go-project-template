OUT_DIR = build
OUT_BIN_NAME = myapp
OUT_BIN_PATH := $(OUT_DIR)/$(OUT_BIN_NAME)

.PHONY: $(OUT_DIR)


default: install

all: hooks install fmt-check lint test build


h help:
	@grep '^[a-z]' Makefile


.PHONY: hooks
hooks:
	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push

install:
	go get ./...
	go install honnef.co/go/tools/cmd/staticcheck@latest

upgrade:
	go get -u ./...

tidy:
	go mod tidy


fmt-check:
	@if [ -n "$(gofmt -l .)" ]; then \
		echo "Format fixes are needed";\
		exit 1; \
	fi

fmt-fix:
	go fmt ./...

lint:
	go vet ./...
	staticcheck ./...

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
