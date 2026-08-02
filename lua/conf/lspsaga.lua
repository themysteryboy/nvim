-- ============================================================================
-- lspsaga.nvim（nvimdev 维护的新版，API 与旧版完全不同）
-- 旧版 init_lsp_saga / lspsaga.hover 等点号调用方式已废弃
-- 新版统一使用 :Lspsaga <子命令> 或 require("lspsaga.xxx"):method()
-- ============================================================================

local present, saga = pcall(require, "lspsaga")
if not present then
	return
end

saga.setup({
	ui = {
		border = "single",
	},
	-- 关闭代码操作灯泡（原配置 code_action_lightbulb.enable = false）
	lightbulb = {
		enable = false,
	},
	code_action = {
		num_shortcut = true,
	},
	-- 保持原按键习惯：<C-x> 向下滚动 hover 文档，<C-z> 向上滚动
	scroll_preview = {
		scroll_down = "<C-x>",
		scroll_up = "<C-z>",
	},
})

-- Show hover doc
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, noremap = true })

-- Preview definition
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true, noremap = true })

-- Check out diagnostic
vim.keymap.set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
-- jump diagnostic
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })

-- Rename
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
-- close rename win use <C-c> in insert mode or `q` in normal mode or `:q`

-- Code Action
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga code_action<CR>", { silent = true, noremap = true })
