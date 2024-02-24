load("@//go:def.bzl", "go_library")

go_library(
    name = "lib",
    srcs = ["lib.go"],
    importpath = "examplelib",
    visibility = [
        "//:__subpackages__",
    ],
)

go_library(
    name = "examplelib",
    srcs = ["lib.go"],
    importpath = "sage/examplelib",
    visibility = ["//visibility:public"],
)
