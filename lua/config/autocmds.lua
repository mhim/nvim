local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

local augroup = api.nvim_create_augroup
local group = augroup("UserAutoCmds", { clear = true })

-- return to last edit position when opening files
api.nvim_create_autocmd("BufReadPost", {
  group = group,
  pattern = "*",
  callback = function()
    if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
      cmd("normal! g'\"")
    end
  end,
})

-- highlight the yanked text for 200ms
api.nvim_create_autocmd("TextYankPost", {
  group = api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.hl.on_yank() -- ({ higroup = "IncSearch", timeout = 200, })
  end,
})

-- save fold status when saved
api.nvim_create_autocmd({ "BufWrite", "VimLeave" }, {
  group = group,
  pattern = "*",
  callback = function()
    cmd("silent! mkview")
  end,
})

-- load fold status when read (BufRead covers both initial open and re-reads)
api.nvim_create_autocmd({ "BufRead", "VimEnter" }, {
  group = group,
  pattern = "*",
  callback = function()
    cmd("silent! loadview")
  end,
})

-- Use 2-space indentation for web-related filetypes.
api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css", "lua" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end,
})
