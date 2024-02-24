load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto_grpc//js:defs.bzl", "js_grpc_web_library")

proto_library(
    name = "helloworld_proto",
    srcs = ["helloworld.proto"],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "helloworld_go_proto",
    compilers = [
        "@io_bazel_rules_go//proto:go_proto",
        "@io_bazel_rules_go//proto:go_grpc_v2",
    ],
    importpath = "grpcex/helloworld",
    proto = ":helloworld_proto",
    visibility = ["//visibility:public"],
)

go_library(
    name = "helloworld",
    embed = [":helloworld_go_proto"],
    importpath = "grpcex/helloworld",
    visibility = ["//visibility:public"],
)

js_grpc_web_library(
    name = "greeter_js_grpc",
    protos = [":helloworld_proto"],
)
