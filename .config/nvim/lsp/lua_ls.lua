return {
    command = {
        "lua-language-server",
    },
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = {
                disable = { "missing-parameters", "missing-fields" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}
