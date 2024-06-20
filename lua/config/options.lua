vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- visual settings
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.scrolloff = 8 -- minimum number of lines to keep above and below the cursor
opt.sidescrolloff = 8 -- minimum number of columns to keep above and below the cursor

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.softtabstop = 4 -- 4 spaces for tab key
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true -- auto indentation defend on file format
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false -- turon off line feed with long statement

-- search settings
opt.incsearch = true -- find matching word of step when input string
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true -- enable true color support
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

--persistent undo
opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")

-- etc
-- opt.encoding = "UTF-8"
-- opt.showcmd = true
-- opt.cmdheight = 1
-- opt.mouse:append("a")
