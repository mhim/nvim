local api = vim.api
local cmd = vim.cmd
local opt = vim.opt
local fn = vim.fn

api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
      cmd("normal! g'\"")
    end
  end,
}) -- return to last edit position when opening files

api.nvim_create_autocmd({ "BufWrite", "VimLeave" }, {
  pattern = "*",
  callback = function()
    cmd("mkview")
  end,
}) -- save fold status when saved

api.nvim_create_autocmd({ "BufRead", "VimEnter" }, {
  pattern = "*",
  callback = function()
    cmd("silent! loadview")
  end,
}) -- load fold status when read

api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css", "*.lua" },
  callback = function()
    opt.tabstop = 2
    opt.softtabstop = 2
    opt.shiftwidth = 2
  end,
}) -- javascript formatting

-- api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.py",
--   callback = function()
--     opt.textwidth = 79
--     opt.colorcolumn = "79"
--   end,
-- }) -- python formatting

