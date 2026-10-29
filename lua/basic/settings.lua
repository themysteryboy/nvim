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
vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }
vim.o.signcolumn = "yes"

-- ================================================
-- ================Go Indent Display=====================
-- ================================================
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
vim.o.background = "dark"

-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme mystery]])
-- vim.cmd([[colorscheme vscode]])
-- vim.cmd([[colorscheme tokyodark]])
