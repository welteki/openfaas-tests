package main

import (
	k6cmd "go.k6.io/k6/cmd"
	// plug in k6 modules here
	// TODO: Create /modules/standard dir structure?
	_ "github.com/grafana/xk6-output-prometheus-remote"
)

func main() {
	k6cmd.Execute()
}
