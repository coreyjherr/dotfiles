return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                ensure_installed = {'c', 'bash', 'cpp', 'python', 'lua', 'vimdoc', 'luadoc', 'vim', 'markdown', 'cuda'},
                highlight = {
                    -- only enable for languages that have treesitter support
                    enable = true,
                },
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['al'] = '@class.outer',
                            ['il'] = '@class.inner',
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['ac'] = '@call.outer',
                            ['ic'] = '@call.inner',
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            [']m'] = '@function.outer',
                            [']c'] = '@class.outer',
                        },
                        goto_next_end = {
                            [']M'] = '@function.outer',
                            [']C'] = '@class.outer',
                        },
                        goto_previous_start = {
                            ['[m'] = '@function.outer',
                            ['[c'] = '@class.outer',
                        },
                        goto_previous_end = {
                            ['[M'] = '@function.outer',
                            ['[C'] = '@class.outer',
                        },
                    },
                },
            })
            local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
            vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
            vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
        end,
    }
}
