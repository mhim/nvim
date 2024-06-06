vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- visual settings
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.softtabstop = 2 -- 2 spaces for tab key
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true -- auto indentation defend on file format
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- turon off line feed with long statement

-- search settings
opt.incsearch = true -- find matching word of step when input string
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- etc
-- opt.encoding = "UTF-8"
opt.showcmd = true
opt.cmdheight = 1
opt.scrolloff = 10
-- opt.mouse:append("a")
