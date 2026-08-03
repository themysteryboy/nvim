local result = vim.cmd(
[[
set relativenumber
set list
set number
set listchars=trail:·
set exrc
set secure
set number
set laststatus=2
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set scrolloff=5
set mouse=a
set splitright
set splitbelow
set showcmd
set wildmenu
set ignorecase
set smartcase
set noswapfile
set clipboard=unnamedplus
set nowrap
set encoding=UTF-8
set background=light
syntax enable
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
]],
true)
vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"c", "r", "o"}
vim.o.signcolumn = "yes"

-- ================================================
-- ================Go 缩进覆盖=====================
-- ================================================
-- nvim 内置 ftplugin/go.vim 强制 noexpandtab（Go 官方推荐风格：
-- gofmt 用 Tab 缩进）。这里关掉该推荐风格并强制全局一致的
-- 2 空格缩进，保证所有语言输入/自动缩进都是空格。
-- 注意：gopls 格式化（<space>f）仍按 gofmt 规则输出 Tab，
-- 这是 Go 语言标准，内容里的 Tab 会显示为纯缩进线（见下）。
vim.g.go_recommended_style = false
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.tabstop = 2
		-- go 文件里已存在的 Tab 字符（gofmt 格式化产物）不显示
		-- ibl 的 "I" 填充标记：关闭 list 后 ibl 对 Tab 使用
		-- indent.tab_char 渲染（纯 │ 线），与其他文件视觉统一
		vim.opt_local.list = false
	end,
})

-- ================================================
-- ================Color Scheme====================
-- ================================================
-- 默认主题 vscode 在 plugins.lua 中设置（vscode.nvim 的 config 回调）
-- 切换主题：:colorscheme tokyonight / kanagawa / gruvbox / tokyodark / mystery ...
vim.o.background = "dark"

-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme mystery]])
-- vim.cmd([[colorscheme vscode]])
-- vim.cmd([[colorscheme tokyodark]])
