def _cpf_impl(ctx):
    out = ctx.actions.declare_file(ctx.attr.out)
    ctx.actions.run(
        inputs = [ctx.file.template],
        outputs = [out],
        arguments = [
            ctx.file.template.path,
            out.path,
        ],
        executable = ctx.executable.generator,
        use_default_shell_env = True,
    )
    return DefaultInfo(files = depset([out]))

cpf = rule(
    implementation = _cpf_impl,
    attrs = {
        "template": attr.label(allow_single_file=True, default = "@cpf//:template_files"),
        "out": attr.string(mandatory=True),
        "generator": attr.label(
            executable=True,
            cfg="exec",
            default = "@main_generator_archive//:main",  # Default to the main generator. # this can also be @cpf//:main if you want to use the main binary directly
        ),
    },
)