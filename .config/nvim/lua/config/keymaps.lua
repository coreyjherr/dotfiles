local map = vim.keymap.set

map({'x', 'o'}, "il", ':<C-u>silent! normal!  $v^<cr>')
map({'x', 'o'}, "al", ':<c-u>silent! normal! $v0<cr>')

map({'n'}, '<Leader>]', '/#%%<cr><cmd>nohl<cr>zz')
map("i", "jk", "<Esc>")
map("n", "s", "<nop>")
map("n", "S", "<nop>")

-- set keymaps for saving and quitting
map("n", "<Leader>q", ":q<cr>")
map("n", "<Leader>Q", ":q!<cr>")
map("n", "<Leader>ww", ":w<cr>")
map("n", "<Leader>wq", ":wq<cr>")

-- set keymaps for navigating splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = {buffer = event.buf}
        map("n", "gR", require'telescope.builtin'.lsp_references)

        map("n", "gD", vim.lsp.buf.declaration)

        map("n", "gd", require'telescope.builtin'.lsp_definitions)

        map("n", "gi", require'telescope.builtin'.lsp_implementations)
        map("n", "<Leader>ua", vim.lsp.buf.code_action)

        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>fs", require'telescope.builtin'.lsp_workspace_symbols)

        map("n", "]d", vim.diagnostic.get_next)
        map("n", "[d", vim.diagnostic.get_prev)

        map("n", "K", require("pretty_hover").hover)
        map({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help)

        map('v', '<Leader>1f', vim.lsp.buf.format, {buffer = true})

        map("n", "gh", ":ClangdSwitchSourceHeader<CR>")
    end,

})
