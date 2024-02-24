load("@aspect_bazel_lib//lib:testing.bzl", "assert_json_matches")
load("@bazel_skylib//rules:write_file.bzl", "write_file")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "oci_push", "oci_tarball")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

def go_image(name, lib, **kwargs):
    """Creates a multiarch containerized binary from Go sources.

    Args:
        name:  name of the image
        lib: lib target to build from (ex, :server_lib)
        **kwargs: arguments passed to the go_binary target
    """
    repo_tags = [
        "sage:latest",  # TODO: This must be name-based
        # TODO: We must add an oci_push rule.
    ]
    pkg_dir = "usr/local/bin"
    archs = [
        {
            "name": "arm",
            "goos": "linux",
            "goarch": "arm64",
            "baseimage": "@distroless_base",
        },
        {
            "name": "x86",
            "goos": "linux",
            "goarch": "amd64",
            "baseimage": "@distroless_base",
        },
    ]

    image_registry = []
    for arch in archs:
        base_name = "{}_{}".format(name, arch["name"])
        bin_name = base_name + "_bin"
        bin_tar_name = bin_name + "_tar"
        image_name = base_name + "_image"
        image_tar_name = image_name + "_tar"

        go_binary(
            name = bin_name,
            embed = [lib],
            goarch = arch["goarch"],
            goos = arch["goos"],
            **kwargs
        )

        pkg_tar(
            name = bin_tar_name,
            srcs = [":" + bin_name],
            package_dir = pkg_dir,
        )

        oci_image(
            name = image_name,
            tars = [
                bin_tar_name,
            ],
            entrypoint = ["{}/{}".format(pkg_dir, bin_name)],
            base = arch["baseimage"],
        )

        image_registry.append(":" + image_name)

        oci_tarball(
            name = image_tar_name,
            image = ":" + image_name,
            repo_tags = repo_tags,
        )

    oci_image_index(
        name = "image-multiarch",
        images = image_registry,
    )

    oci_tarball(
        name = "image-multiarch-tar",
        format = "oci",
        image = ":image-multiarch",
        repo_tags = repo_tags,
    )

    write_file(
        name = "expected_RepoTags",
        out = "expected_RepoTags.json",
        content = [str(repo_tags)],
    )

    native.genrule(
        name = "tar_multiarch_index",
        srcs = [":image-multiarch-tar"],
        outs = ["multiarch_index.json"],
        cmd = "tar -xOf ./$(location :image-multiarch-tar) index.json > $@",
    )

    assert_json_matches(
        name = "check_multiarch_tags",
        file1 = ":tar_multiarch_index",
        file2 = ":expected_RepoTags",
        filter1 = ".manifests[].annotations[\"org.opencontainers.image.ref.name\"]",
        filter2 = ".[]",
    )

    native.genrule(
        name = "tar_x86_64_index",
        srcs = [":image-x86_64-tar"],
        outs = ["x86_64_index.json"],
        cmd = "tar -xOf ./$(location :image-x86_64-tar) manifest.json > $@",
    )

    assert_json_matches(
        name = "check_x86_64_tags",
        file1 = ":tar_x86_64_index",
        file2 = ":expected_RepoTags",
        filter1 = ".[0].RepoTags",
    )
