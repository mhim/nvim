vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<S-TAB>", "<cmd>bp<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<TAB>", "<cmd>bn<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>ba", "<Cmd>ba<CR>", { desc = "Show all Buffers" })
keymap.set("n", "<leader>bx", "<Cmd>bd<CR>", { desc = "Delete current Buffers" })

  -- resize windows
keymap.set("n", "<C-S-h>", "<C-W><", { desc = "Reduce width of window" })
keymap.set("n", "<C-S-l>", "<C-W>>", { desc = "Expand width of window" })
keymap.set("n", "<C-S-k>", "<C-W>-", { desc = "Reduce height of window" })
keymap.set("n", "<C-S-j>", "<C-W>+", { desc = "Expand height of window" })

-- indent
keymap.set("v", ">", ">gv", { desc = "Increase indent with certain block" })
keymap.set("v", "<", "<gv", { desc = "Decrease indent with certain block" })
