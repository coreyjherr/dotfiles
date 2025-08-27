return {
{
    "hadronized/hop.nvim",
    config = function()
        require("hop").setup()
        vim.keymap.set({ "n", "o", "v" }, "<Leader><Leader>j",
            function() require 'hop'.hint_lines_skip_whitespace({ direction = require 'hop.hint'.HintDirection
                .AFTER_CURSOR }) end)

        vim.keymap.set({ "n", "o", "v" }, "<Leader><Leader>k",
            function() require 'hop'.hint_lines_skip_whitespace({ direction = require 'hop.hint'.HintDirection
                .BEFORE_CURSOR }) end)

        vim.keymap.set({ "n", "o", "v" }, "<Leader><Leader>l",
            function() require 'hop'.hint_words({ direction = require 'hop.hint'.HintDirection.AFTER_CURSOR }) end)

        vim.keymap.set({ "n", "o", "v" }, "<Leader><Leader>h",
            function() require 'hop'.hint_words({ direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR }) end)

        vim.keymap.set({ "n", "o", "v" }, "<Leader><Leader>w",
            function() require 'hop'.hint_words({ direction = require 'hop.hint'.HintDirection.AFTER_CURSOR }) end)

        vim.keymap.set({ "n", "o", "v" }, "<Leader><Leader>b",
            function() require 'hop'.hint_words({ direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR }) end)
    end,
},
{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
{
    'sgur/vim-textobj-parameter',
    dependencies = {
        "kana/vim-textobj-user"
    }
}
}
