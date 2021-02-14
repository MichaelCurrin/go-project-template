package greetings

import (
	"errors"
	"fmt"
)

// Hello returns a greeting for the named person.
func Hello(name string) (string, error) {
	if name == "" {
		return "", errors.New("Empty name")
	}
	message := fmt.Sprintf("Hello, %v!", name)

	return message, nil
}
