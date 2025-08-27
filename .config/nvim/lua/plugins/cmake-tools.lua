return {
    'Civitasv/cmake-tools.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'akinsho/toggleterm.nvim'
    },
    config = function ()
        require('cmake-tools').setup({
            cmake_runner = {
                name = 'toggleterm',
                default_opts = {
                    toggleterm = {
                        direction = 'horizontal'
                    }
                }
            }
        })
        vim.keymap.set('n', '<leader>ob', ':CMakeBuild<CR>')
        vim.keymap.set('n', '<leader>or', ':CMakeRun<CR>')
    end
}
