return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    {
        'nvim-telescope/telescope.nvim', tag='0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' , 'nvim-telescope/telescope-fzf-native.nvim'},
        config = function()
            require('plugins.telescope')
            local builtin = require('telescope.builtin')
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<C-p>', builtin.find_files)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep)
            vim.keymap.set('n', '<leader>fb', builtin.buffers)
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags)
            vim.keymap.set('n', '<leader>fj', builtin.git_files)
            vim.keymap.set('n', '<leader>fp', builtin.commands)
            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                        mappings = {
                        i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        },
                    },
                },
            })
            require('telescope').load_extension('fzf')
        end,
    }
}
