-- ============================================================================
-- LSP Installer：mason.nvim + mason-lspconfig.nvim
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
    ensure_installed = {
        "clangd", -- C/C++
        "pyright", -- Python
        "ts_ls", -- JavaScript/TS
        "cssls", -- CSS
        "html", -- HTML
        "lua_ls", -- Lua
        "gopls", -- Go
    },
    automatic_enable = false,
})

-- Manully laungh the installed server，giving in completion and mapping
local installed = mason_lspconfig.get_installed_servers()
for _, server_name in ipairs(installed) do
    vim.lsp.config(server_name, {
        capabilities = capabilities,
        on_attach = on_attach,
    })
    vim.lsp.enable(server_name)
end
