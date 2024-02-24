# There is an obvious gap here.
# What's needed to fill the gap, is a stable, extensible way of defining
# build, run, clean and deploy rules for Bazel-based multi-service setups.
# This is tolerable for now and solvable medium term. Unless I find
# something existent with sufficient adoption, I will likely build a
# stabler version of 
# https://github.com/CaperAi/bazel_compose/tree/master
# for us to use.
#
# For now, to run this example service, you'll need to rebuild yourself:
#   > make build
#   > make run
#
# To smoketest the service, use:
#   > grpcurl  -plaintext localhost:8080 helloworld.Greeter.SayHello

MAKEFLAGS += -j2

.PHONY: build
build:
	bazel run //grpcex/server:server_arm_image_tar

.PHONY: run
run:
	docker run --platform=linux/arm64  -p 8080:50051 sage:latest


