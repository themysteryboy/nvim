-- ============================================================================
-- LSP 安装器：mason.nvim + mason-lspconfig.nvim
-- 原 nvim-lsp-installer 已改名归档（→ mason.nvim），API 完全不同
-- 新增语言服务器：:MasonInstall <server>
-- 查看已安装：:Mason
-- ============================================================================

local present, mason = pcall(require, "mason")
if not present then
	return
end

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local on_attach = require("lsp.handlers").on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()

mason_lspconfig.setup({
	-- 自动安装的服务器（注意：这里必须是 lspconfig server 名称，
	-- 不是 mason 包名。mason-lspconfig 内部会映射到 mason 包）
	ensure_installed = {
		"clangd", -- C/C++            (mason 包: clangd)
		"pyright", -- Python          (mason 包: pyright)
		"ts_ls", -- JavaScript/TS     (mason 包: typescript-language-server)
		"cssls", -- CSS               (mason 包: css-lsp)
		"html", -- HTML               (mason 包: html-lsp)
		"lua_ls", -- Lua              (mason 包: lua-language-server)
		"gopls", -- Go                (mason 包: gopls)
	},
	automatic_enable = true,
	-- 为每个服务器统一配置 capabilities（补全）和 on_attach（按键映射）
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
})
