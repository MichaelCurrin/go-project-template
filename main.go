package main

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/urfave/cli/v2"
)

func main() {
	app := &cli.App{
		Name:        "My App",
		HelpName:    "myapp",
		Usage:       "Display a friendly greeting",
		Version:     "v0.2.0",
		Description: "A Hello World greeting app to get you started with a new Go project",

		Commands: []*cli.Command{},
		Flags:    []cli.Flag{},

		Action: func(c *cli.Context) error {
			name := "World"
			if c.NArg() > 0 {
				name = c.Args().Get(0)
			}
			fmt.Printf("Hello, %v!\n", name)

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
