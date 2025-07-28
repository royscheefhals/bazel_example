load("//:cpf.bzl", "cpf")

def _cpf_extension_impl(module_ctx):
    # Register the rule in the main repo
    module_ctx.add_rule(
        name = "cpf",
        implementation = cpf,
    )

cpf_extension = module_extension(
    implementation = _cpf_extension_impl,
)