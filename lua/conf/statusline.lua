-- ============================================================================
-- Status line: lualine.nvim
-- ============================================================================

local function mode_alias(m)
  local alias = {
    normal = "NORMAL",
    insert = "INSERT",
    command = "COMMAND",
    replace = "REPLACE",
    terminal = "TERMINAL",
    visual = "VISUAL",
    ["v-line"] = "V-LINE",
    ["v-block"] = "V-BLOCK",

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
    theme = "dracula",
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
          return "  RUI  "
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
