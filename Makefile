default: install

all: install fmt test build

h help:
	@grep '^[a-z]' Makefile


install:
	go get ./...

upgrade:
	go get -u ./...


fmt:
	go fmt ./...


test:
	@echo "TODO Add tests"
	go test -v ./...

run:
	go run main.go
	go run main.go --name Gopher

usage:
	go run main.go -h


.PHONY: build
build:
	go build -v -o build/myapp main.go


global:
	go install
