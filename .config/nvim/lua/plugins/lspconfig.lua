return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        local lspconfig = vim.lsp.config()

        -- set keybinds
        vim.keymap.set("n", "gR", require'telescope.builtin'.lsp_references)

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)

        vim.keymap.set("n", "gd", require'telescope.builtin'.lsp_definitions)

        vim.keymap.set("n", "gi", require'telescope.builtin'.lsp_implementations)
        vim.keymap.set("n", "<Leader>ua", vim.lsp.buf.code_action)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>fs", require'telescope.builtin'.lsp_workspace_symbols)

        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help)

        vim.keymap.set('v', '<Leader>1f', vim.lsp.buf.format, {buffer = true})

        lspconfig.clangd.setup{
            clangd_config = {init_options = {compilationDatabasePath="build"}},
            filetype = {"c", "cpp", "cuh", "cu"},
            cmd = {"clangd", "--offset-encoding=utf-16"}
        }
        vim.keymap.set("n", "gh", ":ClangdSwitchSourceHeader<CR>")
        lspconfig.pyright.setup{}
        lspconfig.lua_ls.setup{settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },}}}}
    end,
}
