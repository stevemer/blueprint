load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("//macros:go_image.bzl", "go_image")

go_library(
    name = "server_lib",
    srcs = ["greeterserver.go"],
    importpath = "sage/grpcex/server",
    visibility = ["//visibility:private"],
    deps = [
        "//grpcex/proto:helloworld",
        "@org_golang_google_grpc//:go_default_library",
        "@org_golang_google_grpc//reflection",
    ],
)

go_image(
    name = "server",
    lib = ":server_lib",
)
