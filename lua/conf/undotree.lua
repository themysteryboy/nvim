-- https://github.com/mbbill/undotree
-- （原 vimscript 版缺少外层 endif，且依赖 expand(undotree_dir) 隐式变量，已改为 Lua）

local undodir = vim.fn.expand(vim.g.undotree_dir or vim.fn.stdpath("cache") .. "/undodir")
vim.fn.mkdir(undodir, "p", 0700)
vim.o.undodir = undodir
vim.o.undofile = true

-- Key to check undotree
vim.keybinds.gmap("n", "<leader>u", ":UndotreeToggle<CR>", vim.keybinds.opts)
