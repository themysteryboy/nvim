local present, ibl = pcall(require, "ibl")
if not present then
	return
end

ibl.setup({
	indent = {
		char = "│",
		-- tab 字符也要画线：listchars 里不能定义 tab（见 settings.lua），
		-- 否则 ibl 会放弃在 Tab 上画线；定义 tab_char 后 tab 按 2 列粒度画线
		tab_char = "│",
		-- char = "▏"
		-- char = "▎"
	},
	-- 用 treesitter 高亮当前缩进上下文（对应旧版 use_treesitter + context_patterns）
	scope = {
		enabled = true,
	},
	exclude = {
		buftypes = { "terminal", "nofile" },
		filetypes = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		},
	},
})
