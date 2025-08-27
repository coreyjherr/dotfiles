vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.g.mapleader = "<Space>"

require("config.lazy")

vim.opt.termguicolors = true
vim.cmd[[colorscheme dracula]]

vim.opt.hlsearch = false

vim.keymap.set({'x', 'o'}, "il", ':<C-u>silent! normal!  $v^<cr>')
vim.keymap.set({'x', 'o'}, "al", ':<c-u>silent! normal! $v0<cr>')

vim.keymap.set({'n'}, '<Leader>]', '/#%%<cr><cmd>nohl<cr>zz')
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "s", "<nop>")
vim.keymap.set("n", "S", "<nop>")

-- set keymaps for saving and quitting
vim.keymap.set("n", "<Leader>q", ":q<cr>")
vim.keymap.set("n", "<Leader>Q", ":q!<cr>")
vim.keymap.set("n", "<Leader>ww", ":w<cr>")
vim.keymap.set("n", "<Leader>wq", ":wq<cr>")

-- set keymaps for navigating splits
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- set the tabstop in c++ and c and cuda files to 2
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "cuda" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
--------------------------------------------------------------------------------
-- Custom Cell Folding Logic (Lua)
--------------------------------------------------------------------------------

-- Lua function to determine fold level
_G.NeovimCellFoldExpr = function()
  local current_line_nr = vim.v.lnum -- v:lnum is the line number being evaluated
  local line_content = vim.api.nvim_buf_get_lines(0, current_line_nr - 1, current_line_nr, false)[1]

  if line_content == nil then
    return '0'
  end

  if string.match(line_content, '#%%') then
    return '>1'
  end

  if current_line_nr > 1 then
    local prev_fold_level = vim.fn.foldlevel(current_line_nr - 1)
    if prev_fold_level > 0 then
      return '='
    end
  end

  return '0'
end

-- Lua function to display custom text for a closed fold
_G.NeovimCellFoldText = function()
  local fold_start_line_nr = vim.v.foldstart
  local fold_end_line_nr = vim.v.foldend

  local fold_start_line_text = vim.api.nvim_buf_get_lines(0, fold_start_line_nr - 1, fold_start_line_nr, false)[1]
  if fold_start_line_text == nil then
    fold_start_line_text = "#%% Unknown Cell"
  end

  local num_lines = fold_end_line_nr - fold_start_line_nr + 1
  local cell_title = string.match(fold_start_line_text, '^%s*#%%%%%s*(.*)')

  if cell_title and cell_title ~= "" then
    return string.format('+-- %d lines: %s ---', num_lines, cell_title)
  else
    return string.format('+-- %d lines: Cell ---', num_lines)
  end
end

--------------------------------------------------------------------------------
-- Keymappings to activate cell folding and perform fold actions
--------------------------------------------------------------------------------

local function activate_cell_folding_and_execute(normal_command)
  -- Set WINDOW-LOCAL options
  vim.wo.foldmethod = 'expr'                        -- Corrected: vim.wo
  vim.wo.foldexpr = 'v:lua.NeovimCellFoldExpr()'    -- Corrected: vim.wo
  vim.wo.foldtext = 'v:lua.NeovimCellFoldText()'    -- Corrected: vim.wo

  -- Optional: Set foldlevelstart (this is a window-local option too)
  -- vim.wo.foldlevelstart = 0

  -- Optional: Set foldcolumn (window-local)
  -- vim.wo.foldcolumn = '1'

  -- Execute the passed normal mode command
  vim.cmd('normal! ' .. normal_command)
end

-- Keymapping for <leader>zc
vim.keymap.set('n', '<leader>zc', function()
  activate_cell_folding_and_execute('zc')
end, { noremap = true, silent = true, desc = "Activate Cell Folding & Close Fold" })

-- Optional: A similar mapping for 'za' (toggle fold)
vim.keymap.set('n', '<leader>za', function()
  activate_cell_folding_and_execute('za')
end, { noremap = true, silent = true, desc = "Activate Cell Folding & Toggle Fold" })

-- Optional: A similar mapping for 'zo' (open fold)
vim.keymap.set('n', '<leader>zo', function()
  activate_cell_folding_and_execute('zo')
end, { noremap = true, silent = true, desc = "Activate Cell Folding & Open Fold" })

