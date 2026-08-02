-- ============================================================================
-- Treesitter（nvim 0.12）
-- 注意：nvim 0.10+ 起，高亮/缩进已由 Neovim 内置 vim.treesitter 负责，
-- nvim-treesitter 插件仅负责 parser 的安装与更新（:TSInstall / :TSUpdate）。
-- 旧版 require("nvim-treesitter.configs").setup 已从插件中移除。
--
-- 需要新语言高亮时：:TSInstall <language>
-- 更新全部 parser：:TSUpdate
-- ============================================================================

-- 打开文件时自动启用 treesitter 高亮（已安装 parser 的语言生效，其余自动跳过）
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
