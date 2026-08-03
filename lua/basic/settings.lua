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
-- ================Go 缩进显示=====================
-- ================================================
-- Go 遵循官方推荐（nvim 内置 ftplugin/go.vim）：noexpandtab + Tab 缩进，
-- gofmt 标准。这里不覆盖缩进方式，只处理两点：
-- ① tabstop=2：Tab 显示宽度与全局 2 空格缩进一致（缩进线每 2 列一条）
-- ② 关闭 list：ibl 对 Tab 使用 indent.tab_char 渲染纯线，
--    不显示 "I" 填充标记（与空格缩进视觉统一）
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.tabstop = 2
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
