local deus = {
  base0      = '#1B2229';
  base1      = '#1c1f24';
  base2      = '#202328';
  base3      = '#23272e';
  base4      = '#3f444a';
  base5      = '#5B6268';
  base6      = '#73797e';
  base7      = '#9ca0a4';
  base8      = '#b1b1b1';

  bg = '#282a36';
  bg1 = '#504945';
  bg_popup = '#3E4556';
  bg_highlight  = '#2E323C';
  bg_visual = '#b3deef';

  fg = '#bbc2cf';
  fg_alt  = '#5B6268';

  black       = '#282a36';
  gray_dark   = '#3c3836';
  gray_darker = '#242a32';
  gray        = '#928374';
  gray_light  = '#c0c0c0';
  white       = '#ffffff';

  dsdark0       = '#2C323B';
  dsdark1       = '#3c3836';
  dsdark2       = '#242a32';
  dsdark3       = '#665c54';
  dsdark4       = '#7c6f64';
  dsdark4_256   = '#7c6f64';

  dsColumn       = '#35312f';

  dslight0      = '#d2d2d2';
  dslight1      = '#ebdbb2';
  dslight2      = '#d5c4a1';
  dslight3      = '#bdae93';
  dslight4      = '#a89984';
  dslight4_256  = '#a89984';

  tan = '#f4c069';

  red       = '#fb4934';
  red_dark  = '#a80000';
  red_light = '#ff4090';

  orange       = '#fe8019';
  orange_light = '#f0af00';

  yellow = '#fabd2f';

  green_dark  = '#50de60';
  green       = '#98C379';
  green_light = '#a0ff70';

  blue     = '#83a598';
  cyan     = '#8ec07c';
  ice      = '#49a0f0';
  teal     = '#00d0c0';
  turqoise = '#2bff99';

  magenta      = '#d5508f';
  magenta_dark = '#bb0099';
  pink         = '#ffa6ff';
  pink_light   = '#ffb7b7';
  purple       = '#C678DD';
  purple_light = '#A8D5E2';
  magenta_light1 = '#BD93BD';
  magenta_light2 = '#A7A2A9';
  --navyblue = '#6699CC';
  navyblue = '#9fa8da';

  bracket = '#80A0C2';
  currsor_bg = '#4f5b66';
  none = 'NONE';
}

function deus.terminal_color()
  vim.g.terminal_color_0 = deus.black
  vim.g.terminal_color_1 = deus.red_dark
  vim.g.terminal_color_2 = deus.green_dark
  vim.g.terminal_color_3 = deus.orange
  vim.g.terminal_color_4 = deus.blue
  vim.g.terminal_color_5 = deus.magenta_dark
  vim.g.terminal_color_6 = deus.teal
  vim.g.terminal_color_7 = deus.gray
  vim.g.terminal_color_8 = deus.gray_dark
  vim.g.terminal_color_9 = deus.red
  vim.g.terminal_color_10 = deus.green
  vim.g.terminal_color_11 = deus.yellow
  vim.g.terminal_color_12 = deus.turqoise
  vim.g.terminal_color_13 = deus.purple
  vim.g.terminal_color_14 = deus.cyan
  vim.g.terminal_color_15 = deus.gray_light
end

function deus.highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..
                             ' ' .. bg..' '..sp)
end


function deus.load_syntax()
  local syntax = {
    Normal = {fg = deus.fg,bg=deus.bg};
    Terminal = {fg = deus.fg,bg=deus.bg};
    SignColumn = {fg=deus.fg,bg=deus.bg};
    FoldColumn = {fg=deus.fg_alt,bg=deus.black};
    VertSplit = {fg=deus.black,bg=deus.bg};
    Folded = {fg=deus.gray,bg=deus.bg_highlight};
    EndOfBuffer = {fg=deus.bg,bg=deus.none};
    IncSearch = {fg=deus.bg1,bg=deus.orange,style=deus.none};
    Search = {fg=deus.bg,bg=deus.orange};
    ColorColumn = {fg=deus.none,bg=deus.bg_highlight};
    Conceal = {fg=deus.gray,bg=deus.none};
    Cursor = {fg=deus.none,bg=deus.none,style='reverse'};
    vCursor = {fg=deus.none,bg=deus.none,style='reverse'};
    iCursor = {fg=deus.none,bg=deus.none,style='reverse'};
    lCursor = {fg=deus.none,bg=deus.none,style='reverse'};
    CursorIM = {fg=deus.none,bg=deus.none,style='reverse'};
    CursorColumn = {fg=deus.none,bg=deus.bg_highlight};
    CursorLine = {fg=deus.none,bg=deus.bg_highlight};
    LineNr = {fg=deus.base4};
    qfLineNr = {fg=deus.cyan};
    CursorLineNr = {fg=deus.blue};
    DiffAdd = {fg=deus.black,bg=deus.green_dark};
    DiffChange = {fg=deus.black,bg=deus.yellow};
    DiffDelete = {fg=deus.black,bg=deus.red};
    DiffText = {fg=deus.black,bg=deus.fg};
    Directory = {fg=deus.blue,bg=deus.none};
    ErrorMsg = {fg=deus.red,bg=deus.none,style='bold'};
    WarningMsg = {fg=deus.yellow,bg=deus.none,style='bold'};
    ModeMsg = {fg=deus.fg,bg=deus.none,style='bold'};
    MatchParen = {fg=deus.orange,bg=deus.gray,style='bold'};
    NonText = {fg=deus.bg1};
    Whitespace = {fg=deus.base4};
    SpecialKey = {fg=deus.bg1};
    Pmenu = {fg=deus.fg,bg=deus.bg_popup};
    PmenuSel = {fg=deus.base0,bg=deus.blue};
    PmenuSelBold = {fg=deus.base0,g=deus.blue};
    PmenuSbar = {fg=deus.none,bg=deus.base4};
    PmenuThumb = {fg=deus.pink,bg=deus.green_light};
    WildMenu = {fg=deus.fg,bg=deus.green};
    Question = {fg=deus.yellow};
    NormalFloat = {fg=deus.base8,bg=deus.bg_highlight};
    Tabline = {fg=deus.base6,bg=deus.base2};
    TabLineFill = {style=deus.none};
    TabLineSel = {fg=deus.fg,bg=deus.blue};
    StatusLine = {fg=deus.base8,bg=deus.base2,style=deus.none};
    StatusLineNC = {fg=deus.gray,bg=deus.base2,style=deus.none};
    SpellBad = {fg=deus.red,bg=deus.none,style='undercurl'};
    SpellCap = {fg=deus.blue,bg=deus.none,style='undercurl'};
    SpellLocal = {fg=deus.cyan,bg=deus.none,style='undercurl'};
    SpellRare = {fg=deus.pink,bg=deus.none,style = 'undercurl'};
    Visual = {style='inverse'};
    VisualNOS = {bg=deus.gray_darker};
    QuickFixLine = {fg=deus.pink,style='bold'};
    Debug = {fg=deus.orange};
    debugBreakpoint = {fg=deus.bg,bg=deus.red};

    Boolean = {fg=deus.purple};
    Number = {fg=deus.purple};
    Float = {fg=deus.purple};
    PreProc = {fg=deus.pink};
    PreCondit = {fg=deus.tan};
    Include = {fg=deus.blue};
    Define = {fg=deus.blue};
    Conditional = {fg=deus.red};
    Repeat = {fg=deus.red};
    Keyword = {fg=deus.red};
    Typedef = {fg=deus.cyan};
    Exception = {fg=deus.red, style='bold'};
    Statement = {fg=deus.red};
    Error = {fg=deus.red};
    StorageClass = {fg=deus.orange};
    Tag = {fg=deus.orange};
    Label = {fg=deus.orange};
    Structure = {fg=deus.blue, style='bold'};
    Operator = {fg=deus.blue};
    Title = {fg=deus.orange,style='bold'};
    Special = {fg=deus.magenta};
    SpecialChar = {fg=deus.red_light};
    Type = {fg=deus.yellow};
    Function = {fg=deus.green};
    String = {fg=deus.green};
    Character = {fg=deus.purple};
    Constant = {fg=deus.orange_light};
    Macro = {fg=deus.blue};
    Identifier = {fg=deus.navyblue};

    Comment = {fg=deus.base6};
    SpecialComment = {fg=deus.gray};
    Todo = {fg=deus.yellow};
    Delimiter = {fg=deus.orange};
    Ignore = {fg=deus.gray};
    Underlined = {fg=deus.none,style='underline'};

    DashboardShortCut = {fg=deus.magenta};
    DashboardHeader = {fg=deus.orange};
    DashboardCenter = {fg=deus.cyan};
    DashboardFooter = {fg=deus.yellow,style='bold'};
  }
  return syntax
end

function deus.load_plugin_syntax()
  local plugin_syntax = {
    TSFunction = {fg=deus.green, style='bold'};
    TSMethod = {fg=deus.cyan};
    TSKeywordFunction = {fg=deus.red};
    TSProperty = {fg=deus.yellow};
    TSType = {fg='#ebb12d'};
    TSVariable = {fg=deus.navyblue};
    TSPunctBracket = {fg=deus.orange};

    vimCommentTitle = {fg=deus.gray,style='bold'};
    vimLet = {fg=deus.orange};
    vimVar = {fg=deus.cyan};
    vimFunction = {fg=deus.magenta};
    vimIsCommand = {fg=deus.fg};
    vimCommand = {fg=deus.blue};
    vimNotFunc = {fg=deus.pink,style='bold'};
    vimUserFunc = {fg=deus.yellow,style='bold'};
    vimFuncName= {fg=deus.yellow,style='bold'};

    diffAdded = {fg = deus.green_dark};
    diffRemoved = {fg =deus.red};
    diffChanged = {fg = deus.blue};
    diffOldFile = {fg = deus.yellow};
    diffNewFile = {fg = deus.orange};
    diffFile    = {fg = deus.aqua};
    diffLine    = {fg = deus.gray};
    diffIndexLine = {fg = deus.pink};

    gitcommitSummary = {fg = deus.red};
    gitcommitUntracked = {fg = deus.gray};
    gitcommitDiscarded = {fg = deus.gray};
    gitcommitSelected = { fg=deus.gray};
    gitcommitUnmerged = { fg=deus.gray};
    gitcommitOnBranch = { fg=deus.gray};
    gitcommitArrow  = {fg = deus.gray};
    gitcommitFile  = {fg = deus.green_dark};

    VistaBracket = {fg=deus.gray};
    VistaChildrenNr = {fg=deus.orange};
    VistaKind = {fg=deus.purpl};
    VistaScope = {fg=deus.red};
    VistaScopeKind = {fg=deus.blue};
    VistaTag = {fg=deus.magenta,style='bold'};
    VistaPrefix = {fg=deus.gray};
    VistaColon = {fg=deus.magenta};
    VistaIcon = {fg=deus.yellow};
    VistaLineNr = {fg=deus.fg};

    GitGutterAdd = {fg=deus.green_dark};
    GitGutterChange = {fg=deus.blue};
    GitGutterDelete = {fg=deus.red};
    GitGutterChangeDelete = {fg=deus.pink};

    GitSignsAdd = {fg=deus.green_dark};
    GitSignsChange = {fg=deus.blue};
    GitSignsDelete = {fg=deus.red};
    GitSignsAddNr = {fg=deus.green_dark};
    GitSignsChangeNr = {fg=deus.blue};
    GitSignsDeleteNr = {fg=deus.red};
    GitSignsAddLn = {bg=deus.bg_popup};
    GitSignsChangeLn = {bg=deus.bg_highlight};
    GitSignsDeleteLn = {bg=deus.bg1};

    SignifySignAdd = {fg=deus.green_dark};
    SignifySignChange = {fg=deus.blue};
    SignifySignDelete = {fg=deus.red};

    dbui_tables = {fg=deus.blue};

    LspDiagnosticsSignError = {fg=deus.red};
    LspDiagnosticsSignWarning = {fg=deus.yellow};
    LspDiagnosticsSignInformation = {fg=deus.blue};
    LspDiagnosticsSignHint = {fg=deus.cyan};

    LspDiagnosticsVirtualTextError = {fg=deus.red};
    LspDiagnosticsVirtualTextWarning= {fg=deus.yellow};
    LspDiagnosticsVirtualTextInformation = {fg=deus.blue};
    LspDiagnosticsVirtualTextHint = {fg=deus.cyan};

    LspDiagnosticsUnderlineError = {style="undercurl",sp=deus.red};
    LspDiagnosticsUnderlineWarning = {style="undercurl",sp=deus.yellow};
    LspDiagnosticsUnderlineInformation = {style="undercurl",sp=deus.blue};
    LspDiagnosticsUnderlineHint = {style="undercurl",sp=deus.cyan};

    CursorWord0 = {bg=deus.currsor_bg};
    CursorWord1 = {bg=deus.currsor_bg};

    NvimTreeFolderName = {fg=deus.blue};
    NvimTreeRootFolder = {fg=deus.red,style='bold'};
    NvimTreeSpecialFile = {fg=deus.fg,bg=deus.none,stryle='NONE'};

    TelescopeBorder = {fg=deus.teal};
    TelescopePromptBorder = {fg=deus.blue};
    TelescopeMatching = {fg=deus.teal};
    TelescopeSelection = {fg=deus.yellow,bg=deus.bg_highlight,style= 'bold'};
    TelescopeSelectionCaret = {fg=deus.yellow};
    TelescopeMultiSelection = {fg=deus.teal};
  }
  return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function ()
  deus.terminal_color()
  local syntax = deus.load_plugin_syntax()
  for group,colors in pairs(syntax) do
    deus.highlight(group,colors)
  end
  async_load_plugin:close()
end))

function deus.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'deus'
  local syntax = deus.load_syntax()
  for group,colors in pairs(syntax) do
    deus.highlight(group,colors)
  end
  async_load_plugin:send()
end

deus.colorscheme()

return deus
