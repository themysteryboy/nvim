-- ============================================================================
-- 状态栏：lualine.nvim
-- 原 galaxyline.nvim 已停更且不兼容新版本 nvim，2026-08 迁移到 lualine
-- 布局尽量复刻原版：
--   左侧  [模式图标 | 当前目录 | 文件名 | LSP诊断 | Git diff]
--   右侧  [Git 分支 | 行列位置 | 模式]
-- ============================================================================

local function mode_alias(m)
  local alias = {
    -- lualine 传入的全名
    normal = "NORMAL",
    insert = "INSERT",
    command = "COMMAND",
    replace = "REPLACE",
    terminal = "TERMINAL",
    visual = "VISUAL",
    ["v-line"] = "V-LINE",
    ["v-block"] = "V-BLOCK",
    -- 兼容 vim.fn.mode() 的单字符
    n = "NORMAL",
    i = "INSERT",
    c = "COMMAND",
    R = "REPLACE",
    t = "TERMINAL",
    ['\22'] = "V-BLOCK",
    V = "V-LINE",
    v = "VISUAL",
  }

  return alias[m] or m:upper()
end

require("lualine").setup({
  options = {
    theme = "dracula", -- 原版配色即 dracula 系（bg #282a36）
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { "NvimTree", "dashboard", "packer", "alpha" },
    },
    globalstatus = false,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function()
          return "       "
        end,
      },
    },
    lualine_b = {
      {
        "cwd",
        fmt = function()
          -- 直接用 getcwd() 取目录名，避免组件参数在某些环境下为空
          local base = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          if base == "" then
            base = "~"
          end
          return "󰉋  " .. base .. " "
        end,
      },
    },
    lualine_c = {
      { "filename", file_status = false },
      {
        "diagnostics",
        -- 注意：不用 nvim_lsp 数据源——nvim 0.12 的 LSP 诊断 namespace 已改为
        -- "nvim.lsp.*"，lualine 的 nvim_lsp 过滤旧前缀 "vim.lsp" 永远匹配不到
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", hint = "  ", info = " " },
      },
      {
        "diff",
        symbols = { added = "  ", modified = "  ", removed = "  " },
      },
    },
    lualine_x = {
      { "branch", icon = "     " },
    },
    lualine_y = {
      { "location" },
    },
    lualine_z = {
      {
        "mode",
        fmt = function(m)
          return " " .. mode_alias(m) .. " "
        end,
      },
    },
  },
})
