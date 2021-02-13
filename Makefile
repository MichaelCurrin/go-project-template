default: install

h help:
	@grep '^[a-z]' Makefile


install:
	go get ./...


run:
	go run cmd/myapp/main.go

.PHONY: build
build:
	go build -o build/myapp cmd/myapp/main.go
