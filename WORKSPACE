# buildifier: disable=same-origin-load
# Do not fuck with this file.
# Order of imports matters for dependency version selection.
# With love,
#   - Steve

###########################################################################
# HTTP Archives + Files
# Without HTTP resources, we can't do anything at all.
# Luckily, its loader is a built-in rule for Bazel.
###########################################################################
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

###########################################################################
# Rules pkg
###########################################################################

http_archive(
    name = "rules_pkg",
    sha256 = "8a298e832762eda1830597d64fe7db58178aa84cd5926d76d5b744d6558941c2",
    urls = [
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.7.0/rules_pkg-0.7.0.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.7.0/rules_pkg-0.7.0.tar.gz",
    ],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

###########################################################################
# Protobuf & Protobuf Bazel Rules
# Gives us protobuf support + core Bazel building blocks for protos.
###########################################################################
http_archive(
    name = "com_google_protobuf",
    sha256 = "d0f5f605d0d656007ce6c8b5a82df3037e1d8fe8b121ed42e536f569dec16113",
    strip_prefix = "protobuf-3.14.0",
    urls = [
        "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# Fundamental protocol buffers rules
http_archive(
    name = "rules_proto",
    sha256 = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
    strip_prefix = "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
        "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

###########################################################################
# END FRAMEWORK
# BEGIN LANG RULES
###########################################################################

###########################################################################
# Language: Go
###########################################################################

# Core building blocks of Go code in the Bazel framework.
http_archive(
    name = "io_bazel_rules_go",
    integrity = "sha256-fHbWI2so/2laoozzX5XeMXqUcv0fsUrHl8m/aE8Js3w=",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.44.2/rules_go-v0.44.2.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.44.2/rules_go-v0.44.2.zip",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.20.7")

###########################################################################
# Language: JavaScript
###########################################################################

http_archive(
    name = "com_github_benchsci_rules_nodejs_gazelle",
    sha256 = "c3734c1d4f18f58c74e1efb1ab83dd2bed84d0de2e0b26c8c0fcb649bdbb75a1",
    strip_prefix = "rules_nodejs_gazelle-0.5.0",
    urls = [
        "https://github.com/benchsci/rules_nodejs_gazelle/archive/refs/tags/v0.5.0.tar.gz",
    ],
)

http_archive(
    name = "bazel_features",
    sha256 = "e9158e3b6e2cb2b75739078bf4f4d30f6931b931af5f374206c973d766c676ad",
    strip_prefix = "bazel_features-1.5.0",
    url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.5.0/bazel_features-v1.5.0.tar.gz",
)

load("@bazel_features//:deps.bzl", "bazel_features_deps")

bazel_features_deps()

http_archive(
    name = "aspect_rules_js",
    sha256 = "edc7b0255114fafdbbd593ea5d5fdfd54b2a603f33b3a49518910ac618e1bf2b",
    strip_prefix = "rules_js-1.38.0",
    url = "https://github.com/aspect-build/rules_js/releases/download/v1.38.0/rules_js-v1.38.0.tar.gz",
)

http_archive(
    name = "aspect_rules_ts",
    sha256 = "ace5b609603d9b5b875d56c9c07182357c4ee495030f40dcefb10d443ba8c208",
    strip_prefix = "rules_ts-1.4.0",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v1.4.0/rules_ts-v1.4.0.tar.gz",
)

http_archive(
    name = "aspect_rules_jest",
    sha256 = "098186ffc450f2a604843d8ba14217088a0e259ea6a03294af5360a7f1bcd3e8",
    strip_prefix = "rules_jest-0.19.5",
    url = "https://github.com/aspect-build/rules_jest/releases/download/v0.19.5/rules_jest-v0.19.5.tar.gz",
)

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")

rules_js_dependencies()

load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")

rules_ts_dependencies(ts_version_from = "//:package.json")

load("@aspect_rules_jest//jest:dependencies.bzl", "rules_jest_dependencies")

rules_jest_dependencies()

load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "nodejs",
    node_version = DEFAULT_NODE_VERSION,
)

http_archive(
    name = "rules_proto_grpc",
    sha256 = "928e4205f701b7798ce32f3d2171c1918b363e9a600390a25c876f075f1efc0a",
    strip_prefix = "rules_proto_grpc-4.4.0",
    urls = ["https://github.com/rules-proto-grpc/rules_proto_grpc/releases/download/4.4.0/rules_proto_grpc-4.4.0.tar.gz"],
)

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_repos", "rules_proto_grpc_toolchains")

rules_proto_grpc_toolchains()

rules_proto_grpc_repos()

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")
load("@rules_proto_grpc//js:repositories.bzl", rules_proto_grpc_js_repos = "js_repos")

rules_proto_grpc_js_repos()

npm_translate_lock(
    name = "npm",
    bins = {
        # derived from "bin" attribute in node_modules/next/package.json
        "next": {
            "next": "./dist/bin/next",
        },
    },
    npmrc = "//:.npmrc",
    pnpm_lock = "//:pnpm-lock.yaml",
    verify_node_modules_ignored = "//:.bazelignore",
)

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "e79c08a488cc5ac40981987d862c7320cee8741122a2649e9b08e850b6f20442",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/3.8.0/rules_nodejs-3.8.0.tar.gz"],
)

load("@build_bazel_rules_nodejs//:index.bzl", "node_repositories")

# M1 Macs require Node 16+
node_repositories(
    node_version = "16.6.2",
    package_json = ["//:package.json"],
)

# Typescript Protobuffer Support
# Unlike other languages, TS does not have great support in the Google ecosystem.
# This is evinced by the fragmented package imports throughout this Typescript
# portion of the WORKSPACE file, and protobuffers are no exception to this rule.

# I had problems loading @bazel/labs without including hte Closure rules first.
# This seems like a bug, but it's easy enough to work around.
http_archive(
    name = "io_bazel_rules_closure",
    sha256 = "7d206c2383811f378a5ef03f4aacbcf5f47fd8650f6abbc3fa89f3a27dd8b176",
    strip_prefix = "rules_closure-0.10.0",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_closure/archive/0.10.0.tar.gz",
        "https://github.com/bazelbuild/rules_closure/archive/0.10.0.tar.gz",
    ],
)

load(
    "@io_bazel_rules_closure//closure:repositories.bzl",
    "rules_closure_dependencies",
    "rules_closure_toolchains",
)

rules_closure_dependencies(omit_com_google_protobuf = True)

rules_closure_toolchains()

# Hack: We can't use grpc-tools' node wrappers properly, they don't like being
# used as a --plugin by the ts_grpc_proto_library rules.
# So we depend directly on the underlying, binary plugin without their Node
# wrappers.
http_archive(
    name = "grpc_node_plugin",
    build_file = "//:grpc_node_plugin.BUILD.bazel",
    sha256 = "ddfc9081c2993d574216870760775703fd974282dfd1cf417f89f58bdc08f1ed",
    urls = [" https://node-precompiled-binaries.grpc.io/grpc-tools/v1.8.1/linux-x64.tar.gz"],
)

http_file(
    name = "grpc_web_plugin",
    downloaded_file_path = "protoc-gen-grpc-web",
    executable = True,
    sha256 = "0b9a0a62f6e8d486e3afcfa172ced25bd584b56ad218e90ecf64f65e4f9457bd",
    urls = [" https://github.com/grpc/grpc-web/releases/download/1.0.7/protoc-gen-grpc-web-1.0.7-linux-x86_64"],
)

###########################################################################
# Gazelle
# (open-source glaze) - Autogenerates BUILD files. Critical.
###########################################################################

http_archive(
    name = "bazel_skylib",
    sha256 = "cd55a062e763b9349921f0f5db8c3933288dc8ba4f76dd9416aac68acee3cb94",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

http_archive(
    name = "bazel_gazelle",
    integrity = "sha256-MpOL2hbmcABjA1R5Bj2dJMYO2o15/Uc5Vj9Q0zHLMgk=",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.35.0/bazel-gazelle-v0.35.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.35.0/bazel-gazelle-v0.35.0.tar.gz",
    ],
)

# go_repository must currently be used before gazelle_dependencies is loaded:
# https://github.com/bazelbuild/bazel-gazelle/issues/1058
load("@bazel_gazelle//:deps.bzl", "go_repository")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

# Golang GRPC support.
go_repository(
    name = "org_golang_google_grpc",
    build_file_proto_mode = "disable",
    importpath = "google.golang.org/grpc",
    sum = "h1:f+PlOh7QV4iIJkPrx5NQ7qaNGFQ3OTse67yaDHfju4E=",
    version = "v1.41.0",
)

gazelle_dependencies(go_sdk = "go_sdk")

###########################################################################
# END LANG RULES
# BEGIN CONTAINERS + DEPLOYMENT
###########################################################################

# Go gRPC-web Proxy server, as a prebuilt binary for Linux x86_64
# This is needed because gRPC-web does not directly expose gRPC API servers to
# HTTP traffic. This is a prebuilt, flag-configured proxy that brokers between
# gRPC-web HTTP requests and gRPC backend TCP.
http_archive(
    name = "grpcwebproxy",
    build_file = "//:grpcwebproxy.BUILD.bazel",
    sha256 = "8c6383d4f299c202a2626bc480d3f4493bda34198e585c4939f1d9f61b6a6d5b",
    urls = ["https://github.com/improbable-eng/grpc-web/releases/download/v0.12.0/grpcwebproxy-v0.12.0-linux-x86_64.zip"],
)

http_archive(
    name = "rules_oci",
    sha256 = "cf6b8be82cde30daef18a09519d75269650317e40d917c8633cf8e3ab5645ea5",
    strip_prefix = "rules_oci-1.7.2",
    url = "https://github.com/bazel-contrib/rules_oci/releases/download/v1.7.2/rules_oci-v1.7.2.tar.gz",
)

load("@rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")

rules_oci_dependencies()

load("@rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "oci_register_toolchains")

oci_register_toolchains(
    name = "oci",
    crane_version = LATEST_CRANE_VERSION,
    # Uncommenting the zot toolchain will cause it to be used instead of crane for some tasks.
    # Note that it does not support docker-format images.
    # zot_version = LATEST_ZOT_VERSION,
)

###########################################################################
# Image Bases
###########################################################################

# You can pull your base images using oci_pull like this:
load("@rules_oci//oci:pull.bzl", "oci_pull")

oci_pull(
    name = "go_base",
    digest = "sha256:690e4135bf2a4571a572bfd5ddfa806b1cb9c3dea0446ebadaf32bc2ea09d4f9",
    image = "index.docker.io/library/golang",
    platforms = [
        "linux/amd64",
        "linux/arm64/v8",
    ],
)

oci_pull(
    name = "distroless_base",
    digest = "sha256:ccaef5ee2f1850270d453fdf700a5392534f8d1a8ca2acda391fbb6a06b81c86",
    image = "gcr.io/distroless/base",
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ],
)
