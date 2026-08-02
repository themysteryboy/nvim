-- 注意加载顺序：
-- 1. keybinds/config 必须先于 plugins —— lazy.nvim 同步加载插件时会立即执行
--    各插件的 config 回调（require("conf.xxx")），这些文件依赖 vim.keybinds
--    和 vim.g.undotree_dir（原 packer 异步加载掩盖了这个问题）
-- 2. settings 里的 colorscheme 已移到 plugins.lua 的 vscode.nvim config 中
require("basic.keybinds")
require("basic.config")
-- 内置 treesitter：自动高亮 + 兼容旧自定义指令（不依赖任何插件，需最先加载）
require("conf.treesitter")
require("basic.plugins")
require("basic.settings")
require("lsp")

-- set cmdheight = 0
