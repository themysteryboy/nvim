local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

local options = {
   filters = {
      dotfiles = false,
   },
   disable_netrw = true,
   hijack_netrw = true,
   -- open_on_setup 已从新版 nvim-tree 移除（默认不自动打开）
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = false,
   update_focused_file = {
      enable = true,
      -- 旧版 update_cwd 选项已移除，tree 根目录跟随 nvim cwd 用 sync_root_with_cwd
      update_root = {
         enable = false,
      },
   },
   view = {
      -- adaptive_size 已从 setup 选项中移除（默认 false）
      side = "left",
      width = 22,
      -- hide_root_folder 已移除，隐藏根目录用 renderer.root_folder_label = false
      -- renderer.root_folder_label = false,
   },
   git = {
      enable = false,
      -- 旧版 ignore 选项已移除
   },
   filesystem_watchers = {
      enable = true,
    },
   actions = {
      open_file = {
         resize_window = true,
      },
   },
   renderer = {
      -- 旧版 highlight_git = false 改为 "none" / "icon" / "name"
      highlight_git = "none",
      highlight_opened_files = "none",

      indent_markers = {
         enable = false,
      },

      icons = {
         show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
         },

         glyphs = {
            default = "",
            symlink = "",
            folder = {
               default = "",
               empty = "",
               empty_open = "",
               open = "",
               symlink = "",
               symlink_open = "",
               arrow_open = "",
               arrow_closed = "",
            },
            git = {
               unstaged = "✗",
               staged = "✓",
               unmerged = "",
               renamed = "➜",
               untracked = "★",
               deleted = "",
               ignored = "◌",
            },
         },
      },
   },
}

nvimtree.setup(options)


-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：将文件添加到缓冲区，但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索
