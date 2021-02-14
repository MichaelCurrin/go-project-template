default: install

h help:
	@grep '^[a-z]' Makefile


install:
	go get # ./...

upgrade:
	go get -u # ./...


fmt:
	go fmt # ./...


test:
	go test

run:
	go run main.go --name Gopher

usage:
	go run main.go -h


.PHONY: build
build:
	go build -o build/myapp main.go


global:
	go install
