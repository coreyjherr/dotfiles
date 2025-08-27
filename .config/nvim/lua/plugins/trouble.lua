return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>ux",
      "<cmd>Trouble diagnostics toggle focus=true <cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>uX",
      "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>us",
      "<cmd>Trouble symbols toggle focus=true<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>ul",
      "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>uL",
      "<cmd>Trouble loclist toggle focus=true<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>uq",
      "<cmd>Trouble qflist toggle focus=true<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
