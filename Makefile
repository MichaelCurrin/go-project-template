default: install

h help:
	@grep '^[a-z]' Makefile


install:
	go get ./...


run:
	go run cmd/myapp/main.go

build:
	go build -o myapp cmd/myapp/main.go
