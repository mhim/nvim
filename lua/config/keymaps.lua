-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap -- for conciseness
-- shortcuts
keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
keymap.set('n', "<C-a>", 'ggVG', { noremap = true, silent = true, desc = "set block all" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
-- tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
-- buffer
keymap.set("n", "<S-TAB>", "<cmd>bp<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<TAB>", "<cmd>bn<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>ba", "<Cmd>ba<CR>", { desc = "Show all Buffers" })
keymap.set("n", "<leader>bx", "<Cmd>bd<CR>", { desc = "Delete current Buffers" })
-- resize
keymap.set("n", "<C-S-h>", "<C-W><", { desc = "Reduce width of window" })
keymap.set("n", "<C-S-l>", "<C-W>>", { desc = "Expand width of window" })
keymap.set("n", "<C-S-k>", "<C-W>-", { desc = "Reduce height of window" })
keymap.set("n", "<C-S-j>", "<C-W>+", { desc = "Expand height of window" })

-- Center screen when jumping
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- increment/decrement numbers e.g.) S + V(G) :select block then <g><C-a> Increase gradually
keymap.set("n", "<S-=>", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<S-->", "<C-x>", { desc = "Decrement number" })

-- indent
keymap.set("v", ">", ">gv", { desc = "Increase indent with certain block" })
keymap.set("v", "<", "<gv", { desc = "Decrease indent with certain block" })

-- termnial
keymap.set("n", "<leader>xv", "<cmd>vert 80sp | term<cr>", { desc = "Split terminal vertically" })
keymap.set("n", "<leader>xh", "<cmd>bo 15sp | term<cr>", { desc = "Split terminal horizontally" })
keymap.set('n', '<leader>xt', [[:Flterm<cr>]], { noremap = true, silent = true, desc = "Floatting terminal" })
keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit from terminal mode" })
