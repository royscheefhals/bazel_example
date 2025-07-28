load("//:cpf.bzl", "cpf")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_skylib//lib:modules.bzl", "modules")

def _cpf_extension_impl(module_ctx):

    http_archive(
        name = "main_generator_archive",
        urls = ["file:///home/roy/tarball.tar.gz"],  # Replace with actual URL
        sha256 = "9042e4b0fc513c347681e1acffa3ad994ffc139193df0a98dad0174e1288e92a",
        build_file_content = """
py_binary(
    name = "main",
    srcs = ["main_generator.py"],
    main = "main_generator.py",
    deps = ["@pypicpf//tenjin"],
    visibility = ["//visibility:public"],
)""",
        strip_prefix = "tarball",
    )
    return modules.use_all_repos(module_ctx)
    
cpf_extension = module_extension(_cpf_extension_impl)
