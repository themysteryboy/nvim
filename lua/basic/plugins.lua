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
      -- 默认主题：自研 deus（conf/deus.lua）
      -- require("conf.deus")
      -- 想换回 vscode 主题时，把上面一行注释掉，取消下面一行注释：
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
  -- 已移除 nvim-treesitter 插件（2025 年归档停更，与 nvim 0.12 不兼容，
  -- 加载即注册损坏的 query handler，导致注入查询报错）
  -- 现用 nvim 内置 treesitter：
  --   - 高亮：内置 vim.treesitter.start()（conf/treesitter.lua，init.lua 已加载）
  --   - parser：~/.local/share/nvim/site/parser/（9 个已提取，:TSInstallMy 可装新语言）
  --   - queries：~/.local/share/nvim/site/queries/（321 种语言已提取）

  -- ==================== Zen Mode ====================
  {
    "folke/zen-mode.nvim",
    lazy = false,
    config = function()
      require("conf.zen")
    end,
  },

  -- ==================== Markdown 预览 ====================
  -- 浏览器实时渲染 markdown（高亮由内置 treesitter markdown parser 提供，
  -- 见 conf/treesitter.lua 注释：parser 编译自 tree-sitter-grammars/
  -- tree-sitter-markdown，置于 ~/.local/share/nvim/site/parser/）
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_filetypes = { "markdown" }
      vim.keybinds.gmap("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", vim.keybinds.opts)
    end,
  },
}

require("lazy").setup(plugins)
