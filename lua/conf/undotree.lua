-- https://github.com/mbbill/undotree
-- （原 vimscript 版缺少外层 endif，且依赖 expand(undotree_dir) 隐式变量，已改为 Lua）

local undodir = vim.fn.expand(vim.g.undotree_dir or vim.fn.stdpath("cache") .. "/undodir")
-- Lua has no octal literals: a bare 0700 is decimal 700, which yields a
-- broken directory mode (0o254 with umask 022). tonumber("700", 8) = 0o700.
vim.fn.mkdir(undodir, "p", tonumber("700", 8))
vim.o.undodir = undodir
vim.o.undofile = true

-- Key to check undotree
vim.keybinds.gmap("n", "<leader>u", ":UndotreeToggle<CR>", vim.keybinds.opts)
