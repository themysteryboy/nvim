local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠗",
    Interface = "󰕘",
    Module = "󰆩",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "󰒻",
    Keyword = "󰌋",
    Snippet = "󰃐",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "󰅨",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "󰆍",
    Operator = "󰆕",
    TypeParameter = "󰊄",
}

-- luasnip setup
local luasnip = require 'luasnip'

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 20
-- local MIN_LABEL_WIDTH = 5

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- view = {
    --  entries = "custom"
    -- },
    formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "LSP",
                nvim_lua = "NVIM_LUA",
                luasnip = "Snip",
                buffer = "Buf",
                path = "Path",
                spell = "Spell",
                calc = "Calc",
            })[entry.source.name]

            local label = vim_item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
            if truncated_label ~= label then
                vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                -- elseif string.len(label) < MIN_LABEL_WIDTH then
                --   local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
                --   vim_item.abbr = label .. padding
            end
            return vim_item
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),

    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "calc" },
        { name = "spell" },
    },
}
