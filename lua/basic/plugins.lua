-- ============================================================================
-- Using lazy.nvim to manage plugins
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- ==================== Colorscheme ====================
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000, -- default theme, load first
        config = function()
            require("vscode").setup({
                disable_nvimtree_bg = true,
                color_overrides = {
                    vscBack       = "#15191F",
                    vscTabCurrent = "#15191F",
                    vscPopupBack  = "#1A1F26",
                },
                group_overrides = {
                    NvimTreeCursorLine       = { bg = "#1A1F26" },
                    NvimTreeOpenedFolderName = { bg = "#1A1F26" },
                    NvimTreeEndOfBuffer      = { fg = "#1A1F26" },
                },
            })
            -- vim.cmd.colorscheme("tokyonight")
            vim.cmd.colorscheme("vscode")
            -- vim.cmd.colorscheme("kanagawa")
        end,
    },
    { "rebelot/kanagawa.nvim", lazy = false, priority = 900 },
    { "folke/tokyonight.nvim", lazy = false, priority = 900 },

    -- ==================== Files Tree ====================
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("conf.nvim-tree")
        end,
    },

    -- ==================== LSP ====================
    -- Loading sequence：lspconfig(50) -> mason(51) -> mason-lspconfig(52)
    -- lsp/init.lua will load after mason-lspconfig loaded
    { "neovim/nvim-lspconfig",   lazy = false },
    { "williamboman/mason.nvim", lazy = false, priority = 51 },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        priority = 52,
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("lsp")
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        lazy = false,
        config = function()
            require("conf.lspsaga")
        end,
    },

    -- ==================== Completion ====================
    { "hrsh7th/nvim-cmp",             lazy = false },
    { "hrsh7th/cmp-buffer",           lazy = false },
    { "hrsh7th/cmp-path",             lazy = false },
    { "hrsh7th/cmp-cmdline",          lazy = false },
    { "saadparwaiz1/cmp_luasnip",     lazy = false },
    { "hrsh7th/cmp-nvim-lsp",         lazy = false },
    { "hrsh7th/cmp-nvim-lua",         lazy = false },
    { "onsails/lspkind-nvim",         lazy = false },
    { "hrsh7th/cmp-calc",             lazy = false },

    -- ==================== Snippets ====================
    { "L3MON4D3/LuaSnip",             lazy = false },
    { "rafamadriz/friendly-snippets", lazy = false },

    -- ==================== Bufferline ====================
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        dependencies = { "famiu/bufdelete.nvim", "nvim-tree/nvim-web-devicons" },
        config = function()
            require("conf.bufferline")
        end,
    },

    -- ==================== Statusline ====================
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("conf.statusline")
        end,
    },

    -- ==================== Autopairs ====================
    {
        "windwp/nvim-autopairs",
        lazy = false,
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- ==================== TODO Comment ====================
    {
        "folke/todo-comments.nvim",
        lazy = false,
        config = function()
            require("conf.todo-comments")
        end,
    },

    -- ==================== Telescope ====================
    -- 依赖 rg / fd：macOS 上用 brew 安装（brew install ripgrep fd），不再作为插件
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("conf.telescope")
        end,
    },

    -- ==================== Undo Tree ====================
    {
        "mbbill/undotree",
        lazy = false,
        config = function()
            require("conf.undotree")
        end,
    },

    -- ==================== Terminal ====================
    {
        "akinsho/toggleterm.nvim",
        lazy = false,
        config = function()
            require("conf.toggleterm")
        end,
    },

    -- ==================== Remember Last Open Location ====================
    {
        "ethanholz/nvim-lastplace",
        lazy = false,
        config = function()
            require("conf.nvim-lastplace")
        end,
    },

    -- ==================== Color Highlighting（HEX Color blocks） ====================
    { "RRethy/vim-hexokinase", lazy = false, build = "make hexokinase" },

    -- ==================== Indent line ====================
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        config = function()
            require("conf.indent")
        end,
    },

    -- ==================== Search counting ====================
    {
        "kevinhwang91/nvim-hlslens",
        lazy = false,
        config = function()
            require("conf.nvim-hlslens")
        end,
    },

    -- ==================== Markdown Preview ====================
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

    -- =================== Git Preview Line ======================
    {
        "lewis6991/gitsigns.nvim",
    }
}

require("lazy").setup(plugins)
