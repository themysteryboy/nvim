-- ============================================================================
-- 插件管理：lazy.nvim
-- 原 packer.nvim 已于 2024 年归档停更，2026-08 迁移到 lazy.nvim
--   安装/更新插件  :Lazy install / :Lazy update / :Lazy sync
--   查看插件状态   :Lazy
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
  -- ==================== 主题 ====================
  { "themysteryboy/nvim-mystery", lazy = false, priority = 900 },
  { "morhetz/gruvbox", lazy = false, priority = 900 },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000, -- 默认主题，最先加载
    config = function()
      vim.cmd.colorscheme("vscode")
    end,
  },
  { "tiagovla/tokyodark.nvim", lazy = false, priority = 900 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 900 },
  { "folke/tokyonight.nvim", lazy = false, priority = 900 },
  { "glepnir/zephyr-nvim", lazy = false, priority = 900 },

  -- ==================== 文件树 ====================
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("conf.nvim-tree")
    end,
  },

  -- ==================== LSP ====================
  -- 加载顺序：lspconfig(50) -> mason(51) -> mason-lspconfig(52)
  -- lsp/init.lua 在 mason-lspconfig 加载完成后才执行
  { "neovim/nvim-lspconfig", lazy = false },
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

  -- ==================== 补全 ====================
  { "hrsh7th/nvim-cmp", lazy = false },
  { "hrsh7th/cmp-buffer", lazy = false },
  { "hrsh7th/cmp-path", lazy = false },
  { "hrsh7th/cmp-cmdline", lazy = false },
  { "saadparwaiz1/cmp_luasnip", lazy = false },
  { "hrsh7th/cmp-nvim-lsp", lazy = false },
  { "hrsh7th/cmp-nvim-lua", lazy = false },
  { "onsails/lspkind-nvim", lazy = false },
  { "hrsh7th/cmp-calc", lazy = false },
  -- TabNine AI 补全（原配置，需要联网下载 TabNine 二进制，默认关闭）
  -- { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = { "hrsh7th/nvim-cmp" } },

  -- ==================== Snippets ====================
  { "L3MON4D3/LuaSnip", lazy = false },
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

  -- ==================== 状态栏（原 galaxyline 已停更，换 lualine） ====================
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("conf.statusline")
    end,
  },

  -- ==================== 自动配对 ====================
  {
    "windwp/nvim-autopairs",
    lazy = false,
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- ==================== 平滑滚动 ====================
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- ==================== TODO 注释 ====================
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

  -- ==================== Undo 树 ====================
  {
    "mbbill/undotree",
    lazy = false,
    config = function()
      require("conf.undotree")
    end,
  },

  -- ==================== 终端 ====================
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
      require("conf.toggleterm")
    end,
  },

  -- ==================== 启动页 ====================
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    config = function()
      require("conf.dashboard")
    end,
  },

  -- ==================== 记住上次位置 ====================
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require("conf.nvim-lastplace")
    end,
  },

  -- ==================== 颜色值高亮（HEX 色块） ====================
  -- vim-hexokinase 新版需要 Go 工具链编译（make hexokinase 依赖 go）
  -- 需要时：brew install go 后取消下面注释并执行 :Lazy build vim-hexokinase
  -- { "RRethy/vim-hexokinase", lazy = false, build = "make hexokinase" },

  -- ==================== 缩进线 ====================
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("conf.indent")
    end,
  },

  -- ==================== 搜索计数 ====================
  {
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    config = function()
      require("conf.nvim-hlslens")
    end,
  },

  -- ==================== Treesitter ====================
  -- 注意：nvim 0.12 中高亮/缩进由 Neovim 内置 vim.treesitter 负责
  -- 本插件只负责 parser 的安装与更新（:TSInstall / :TSUpdate）
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("conf.treesitter")
    end,
  },

  -- ==================== Zen Mode ====================
  {
    "folke/zen-mode.nvim",
    lazy = false,
    config = function()
      require("conf.zen")
    end,
  },
}

require("lazy").setup(plugins)
