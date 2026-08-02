-- ============================================================================
-- 启动页：dashboard-nvim（nvimdev 维护的新版）
-- 旧版 glepnir/dashboard-nvim 的 db.preview_command / custom_center 已废弃
-- 新版使用 setup({ theme = "doom", config = { header, center, footer } })
-- ============================================================================

local present, dashboard = pcall(require, "dashboard")
if not present then
	return
end

dashboard.setup({
	theme = "doom",
	config = {
		header = {
			"███╗   ██╗██╗   ██╗██╗███╗   ███╗",
			"████╗  ██║██║   ██║██║████╗ ████║",
			"██╔██╗ ██║██║   ██║██║██╔████╔██║",
			"██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			"██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
			"╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
			"",
			"Welcome back!",
			"",
		},
		center = {
			{
				icon = "  ",
				desc = "Find  File",
				key = "f",
				keymap = "SPC f f",
				action = "Telescope find_files",
			},
			{
				icon = "  ",
				desc = "Recently opened files",
				key = "o",
				keymap = "SPC f o",
				action = "Telescope oldfiles",
			},
			{
				icon = "  ",
				desc = "Find  Word",
				key = "w",
				keymap = "SPC f w",
				action = "Telescope live_grep",
			},
		},
		footer = {},
	},
})
