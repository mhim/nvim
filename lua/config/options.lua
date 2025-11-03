vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

-- bsdic settings
opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers
opt.cursorline = true -- highlight current line
opt.scrolloff = 10 -- keep 10 lines above/below cursor
opt.sidescrolloff = 8 -- keep 8 columns left/right of cursor
opt.winborder = 'rounded' -- default border for all floatting window
opt.wrap = false -- don't wrap lines
opt.cmdheight = 1 -- command line height
-- opt.spelllang = { "en", "ko" } -- set language for spellchecking

-- tabs & indentation
opt.tabstop = 4 -- tab width
opt.shiftwidth = 4 -- indent width
opt.softtabstop = 4 -- soft tab stop
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true -- auto indentation defend on file format
opt.autoindent = true -- copy indent from current line when starting new one
opt.grepprg = "rg --vimgrep" -- Use ripgrep if available
opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content

-- search settings
opt.incsearch = true -- find matching word of step when input string
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- highlight search resukts

-- visual settings
opt.termguicolors = true -- enable true color support
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.colorcolumn = "0" -- Show column at 0 characters
opt.showmatch = true -- highlight matching brackets
-- opt.matchtime = 2 -- how long to show matching bracket
opt.completeopt = "menuone,noinsert,noselect" -- completion options
opt.showmode = false -- don't show mode in command line
-- opt.pumheight = 10 -- popup menu height
-- opt.pumblend = 10 -- popup menu transparency
-- opt.winblend = 0 -- floating window transparency
-- opt.conceallevel = 0 -- don't hide markup
-- opt.concealcursor = "" -- show markup even on cursor line
-- opt.lazyredraw = false -- redraw while executing macros (butter UX)
-- opt.redrawtime = 10000 -- timeout for syntax highlighting redraw
-- opt.maxmempattern = 20000 -- max memory for pattern matching
-- opt.synmaxcol = 300 -- syntax highlighting column limit

-- file handlings
opt.backup = false -- create backup files
opt.writebackup = false -- backup before overwriting
opt.swapfile = false --create swap files
opt.undofile = true -- persistent undo
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
-- opt.updatetime = 300 -- time in ms to trigger CursorHold
-- opt.timeoutlen = 500 -- time in ms to wait for mapped sequence
-- opt.ttimeoutlen = 0 -- no wait for key code sequences
-- opt.autoread = true -- auto-reload file if changed outside
-- opt.autowrite = false -- don't auto-save on some events
-- opt.diffopt:append("vertical") -- vertical diff splits
-- opt.diffopt:append("algorithm:patience") -- better diff algorithm
-- opt.diffopt:append("linematch:60") -- better diff highlighting (smart line matching)

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Behavior Settings
opt.errorbells = false -- disable error sounds
opt.backspace = "indent,eol,start" -- make backspace behave naturally
opt.autochdir = false -- don't change directory automatically
opt.iskeyword:append("-") -- treat dash as part of a word
opt.path:append("**") -- search into subfolders with `gf`
opt.selection = "inclusive" -- use inclusive selection
opt.mouse = "a" -- enable mouse support
opt.clipboard:append("unnamedplus") -- use system clipboard
opt.modifiable = true -- allow editing buffers
opt.encoding = "UTF-8" -- use UTF-8 encoding
opt.wildmenu = true -- enable command-line completion menu
opt.wildmode = "longest:full,full" -- completion mode for command-line
opt.wildignorecase = true -- case-insensitive tab completion in commands

-- etc
-- opt.showcmd = true
-- opt.cmdheight = 1
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
