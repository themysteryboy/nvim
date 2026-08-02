-- ============================================================================
-- 状态栏：lualine.nvim
-- 原 galaxyline.nvim 已停更且不兼容新版本 nvim，2026-08 迁移到 lualine
-- 布局尽量复刻原版：
--   左侧  [模式图标 | 当前目录 | 文件名 | LSP诊断 | Git diff]
--   右侧  [Git 分支 | 行列位置 | 模式]
-- ============================================================================

local function mode_alias(m)
  local alias = {
    n = 'NORMAL',
    i = 'INSERT',
    c = 'COMMAND',
    R = 'REPLACE',
    t = 'TERMINAL',
    ['\22'] = 'V-BLOCK',
    V = 'V-LINE',
    v = 'VISUAL',
  }

  return alias[m] or ''
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
        fmt = function(cwd)
          return "󰉋  " .. vim.fn.fnamemodify(cwd, ":t") .. " "
        end,
      },
    },
    lualine_c = {
      { "filename", file_status = false },
      {
        "diagnostics",
        sources = { "nvim_lsp" },
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
