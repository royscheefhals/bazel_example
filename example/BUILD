load("@cpf//:cpf.bzl", "cpf")
load("@rules_cc//cc:defs.bzl", "cc_binary")

cpf(
    name = "generated_cpp",
    out = "test.cpp",
)

cc_binary(
    name = "main_cpp",
    srcs = [":generated_cpp"],
    visibility = ["//visibility:public"],
)