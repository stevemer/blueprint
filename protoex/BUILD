load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_typescript_proto//:index.bzl", "typescript_proto_library")

proto_library(
    name = "cat_proto",
    srcs = ["cat.proto"],
    visibility = ["//visibility:public"],
)

typescript_proto_library(
    name = "protoex_ts_proto",
    proto = ":cat_proto",
)

go_proto_library(
    name = "protoex_go_proto",
    importpath = "sage/protoex",
    proto = ":cat_proto",
    visibility = ["//visibility:public"],
)

go_library(
    name = "protoex",
    embed = [":protoex_go_proto"],
    importpath = "sage/protoex",
    visibility = ["//visibility:public"],
)
