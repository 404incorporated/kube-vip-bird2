package main

import (
	"fmt"
	"os"
	"strings"
	"text/template"
)

func main() {

	type Peer struct {
		IP string
		AS string
	}

	var Peers []Peer

	peersEnv := os.Getenv("PEERS")
	if peersEnv == "" {
		fmt.Println("PEERS environment variable not set")
		os.Exit(1)
	}

	args := os.Args[1:]

	if len(args) == 0 {
		fmt.Println("No Args set")
		os.Exit(1)
	}

	if len(args) == 1 {
		fmt.Println("Ouput file path not specified")
		os.Exit(1)
	}

	pairs := strings.Split(peersEnv, ",")

	for _, pair := range pairs {
		parts := strings.Split(pair, ":")
		Peers = append(Peers, Peer{
			IP: parts[0],
			AS: parts[1],
		})
	}

	tmpl, err := template.ParseFiles(os.Args[1])
	if err != nil {
		panic(err)
	}

	file, err := os.Create(os.Args[2])
	if err != nil {
		panic(err)
	}

	err = tmpl.Execute(file, Peers)
	if err != nil {
		panic(err)
	}

}
