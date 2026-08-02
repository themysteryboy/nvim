-- ============================================================================
-- Treesitter（nvim 0.12 内置方案）
--
-- 背景：nvim-treesitter 插件已于 2025 年归档停更，且与 nvim 0.12 不兼容
-- （injection 查询报错 "attempt to call method 'range' (a nil value)"）。
-- 本配置改用 Neovim 内置的 treesitter 运行时：
--   - 高亮：vim.treesitter.start()（下方自动启用）
--   - parser：已提取到 ~/.local/share/nvim/site/parser/（c/cpp/rust/python/
--     go/javascript/vue/css/html）
--   - queries：已提取到 ~/.local/share/nvim/site/queries/（321 种语言）
--
-- 需要新语言高亮时，手动安装 parser（以 bash 为例）：
--   brew install tree-sitter   # 需要 tree-sitter CLI 生成/编译
--   cd /tmp && git clone --depth 1 https://github.com/tree-sitter/tree-sitter-bash
--   cd tree-sitter-bash && tree-sitter generate && cc -shared -o parser.so -I src src/parser.c -O2
--   cp parser.so ~/.local/share/nvim/site/parser/bash.so
-- 查看已装 parser：:lua print(vim.inspect(vim.treesitter.language.get_parsers()))
-- ============================================================================

-- 兼容 nvim-treesitter 时代的自定义 query 指令（插件已移除，注册空实现
-- 避免内置引擎报 "No handler for xxx!"。副作用：markdown 代码块的注入语言
-- 识别、downcase 文本转换等高级功能不再生效，基础高亮不受影响）
local query = vim.treesitter.query
local function noop() end
query.add_directive("set-lang-from-mimetype!", noop)
query.add_directive("set-lang-from-info-string!", noop)
query.add_directive("make-range!", noop)
query.add_directive("downcase!", noop)

-- 打开文件时自动启用 treesitter 高亮（已安装 parser 的语言生效，其余自动跳过）
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
