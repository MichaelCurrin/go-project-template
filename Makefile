help:
	@grep '^[a-z]' Makefile


run:
	go run cmd/myapp/main.go

build:
	go build -o myapp cmd/myapp/main.go
