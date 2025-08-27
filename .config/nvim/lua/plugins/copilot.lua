return {
    {'github/copilot.vim', name='copilot'},
    {
        'Exafunction/codeium.vim',
        enabled=false,
        event='BufEnter',
        config = function()
            -- Change the accept word keybind to C+'
            vim.keymap.set('i', '<C-\'>', function()
                return vim.fn['codeium#AcceptNextWord']()
            end, { expr = true })
        end
    },
}
