local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local opt = vim.opt
-- cmd("set completeopt+=noselect")

-- return to last edit position when opening files
api.nvim_create_autocmd("BufReadPost", {
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
  pattern = "*",
  callback = function()
    local filename = vim.fn.expand("%:p")
    if filename ~= "" and filename ~= nil and vim.fn.buflisted(0) == 1 then
      -- pcall(cmd, "mkview")
      cmd("mkview")
    end
  end,
})

-- load fold status when read
api.nvim_create_autocmd({ "BufRead", "VimEnter" }, {
  pattern = "*",
  callback = function()
    cmd("silent! loadview")
  end,
})

-- javascript formatting
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css", "*.lua" },
  callback = function()
    opt.tabstop = 2
    opt.softtabstop = 2
    opt.shiftwidth = 2
  end,
})
