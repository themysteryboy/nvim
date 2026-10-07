-- ============================================================================
-- LSP 安装器：mason.nvim + mason-lspconfig.nvim
-- 原 nvim-lsp-installer 已改名归档（→ mason.nvim），API 完全不同
-- 新增语言服务器：:MasonInstall <server>（装完重启 nvim 生效）
-- 查看已安装：:Mason
--
-- 注意（2026-08 排查发现）：mason-lspconfig v2 已移除 handlers 机制，
-- 且 automatic_enable 走新 API vim.lsp.enable()，会绕过自定义
-- on_attach（LSP 快捷键）和 capabilities（补全能力）。
-- 因此这里显式关闭 automatic_enable，改用 nvim 0.11+ 推荐方式：
-- vim.lsp.config() 注入自定义配置 + vim.lsp.enable() 启用。
-- ============================================================================

local present, mason = pcall(require, "mason")
if not present then
    return
end

local mason_lspconfig = require("mason-lspconfig")
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
    -- 关闭 automatic_enable：它用 vim.lsp.enable 绕过自定义 on_attach/capabilities
    automatic_enable = false,
})

-- 手动启用所有已安装的 server，统一注入补全能力和按键映射
local installed = mason_lspconfig.get_installed_servers()
for _, server_name in ipairs(installed) do
    vim.lsp.config(server_name, {
        capabilities = capabilities,
        on_attach = on_attach,
    })
    vim.lsp.enable(server_name)
end
