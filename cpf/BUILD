load("@rules_python//python:py_binary.bzl", "py_binary")
load("@rules_python//python:pip.bzl", "compile_pip_requirements")

compile_pip_requirements(
    name = "requirements",
    src = "requirements.in",
    requirements_txt = "requirements_lock.txt",
)

filegroup(
    name = "template_files",
    srcs = ["example.pycpp"],
    visibility = ["//visibility:public"],
)

py_binary(
  name = "main",
  srcs = ["main_generator.py"],
  main = "main_generator.py",
  deps = [
      "@pypicpf//tenjin",
  ],
  visibility = ["//visibility:public"],
)