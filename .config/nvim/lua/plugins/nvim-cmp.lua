return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lsp", -- source for LSP completions
    "hrsh7th/cmp-nvim-lsp-signature-help", -- show LSP signature help
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp_signature_help"},
        { name = "nvim_lsp", max_item_count = 5},
        -- { name = "buffer" , max_item_count = 1}, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

    })
  end,
}
