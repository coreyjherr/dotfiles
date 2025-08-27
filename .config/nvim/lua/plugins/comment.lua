return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup(
        {
            toggler = { line = "<Leader>c", block = "<Leader>bb"},
        }
        )
    end,
}
