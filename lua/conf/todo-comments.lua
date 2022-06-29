-- https://github.com/folke/todo-comments.nvim

require("todo-comments").setup(
    {
        keywords = {
            -- alt ： 别名
            FIX = {
                icon = " ",
                color = "#DC2626",
                alt = {"FIXME", "BUG", "FIXIT", "ISSUE", "!"}
            },
            TODO = {icon = " ", color = "#dbcd30"},
            HACK = {icon = " ", color = "#7C3AED"},
            WARN = {icon = " ", color = "#FBBF24", alt = {"WARNING", "XXX"}},
            PERF = {icon = " ", color = "#FC9868", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
            NOTE = {icon = " ", color = "#2563EB", alt = {"INFO"}}
        }
    }
)

-- find TODO
vim.keybinds.gmap("n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<CR>", vim.keybinds.opts)