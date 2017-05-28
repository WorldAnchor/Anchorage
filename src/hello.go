package main

import(
    "fmt"
)

// Build Versioning Variables
var (
    Version string
    Build string
)

func main() {
    fmt.Println("Version : ", Version)
    fmt.Println("Git commit hash : ", Build)
}
