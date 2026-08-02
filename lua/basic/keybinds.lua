-- set leader to space
vim.g.mapleader = " "

vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = true}
}

-- Make change half page to 10 lines
vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)

vim.keybinds.gmap("n", "Q", ":q<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "S", ":w<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<TAB>l", ":BufferLineCycleNext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<TAB>h", ":BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>h", "<C-w>h", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>l", "<C-w>l", vim.keybinds.opts)
vim.keybinds.gmap("n", "<TAB>n", ":tab split ", vim.keybinds.opts)

-- Use tt to toggle nvimtree
vim.keybinds.gmap("n", "tt", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)

-- Moving in insert mode
vim.keybinds.gmap("i", "<A-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-l>", "<right>", vim.keybinds.opts)

-- change size of screencast
vim.keybinds.gmap("n", "<C-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)

-- Use ESC to set nohlsearch
vim.keybinds.gmap("n", "<ESC>", ":nohlsearch<CR>", vim.keybinds.opts)

-- Test code
-- vim.keybinds.gmap("n", "<leader>a", ":CompetiTestAdd<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<leader>r", ":CompetiTestRun<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<leader>d", ":CompetiTestDelete<CR>", vim.keybinds.opts)
