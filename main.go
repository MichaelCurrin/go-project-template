package main

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/urfave/cli/v2"

	greetings "github.com/MichaelCurrin/go-project-template/internal"
)

const (
	// VERSION is the release number.
	VERSION = "v0.3.0"
)

func main() {
	var name string

	app := &cli.App{
		Name:        "My App",
		HelpName:    "myapp",
		Usage:       "Display a friendly greeting",
		Version:     VERSION,
		Description: "A Hello World greeting app to get you started with a new Go project",

		Commands: []*cli.Command{},
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "name",
				Value:       "World",
				Usage:       "Name of a person to greet",
				Destination: &name,
			},
		},

		Action: func(c *cli.Context) error {
			greeting, err := greetings.Hello(name)

			if err != nil {
				log.Fatal(err)
			}

			fmt.Println(greeting)

			return nil
		},

		Compiled: time.Time{},
		Authors: []*cli.Author{
			{
				Name:  "MichaelCurrin",
				Email: "",
			},
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
