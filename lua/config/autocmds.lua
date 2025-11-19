local fn = vim.fn
local api = vim.api
local lsp = vim.lsp
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

-- -- completion for LSP
-- api.nvim_create_autocmd("LspAttach", {
-- 	-- group = vim.api.nvim_create_augroup("neovim-starter", { clear = true }),
-- 	callback = function(event)
-- 		-- vim.notify("LSP attached to buffer: " .. args.buf)
--     local client = assert(lsp.get_client_by_id(event.data.client_id))
-- 		if client:supports_method("textDocument/completion") then
-- 			lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
--       cmd("set completeopt+=noselect")
-- 		end
-- 	end,
-- })
--
-- -- auto formatting when saving
-- api.nvim_create_autocmd("LspAttach", {
--   group = api.nvim_create_augroup("my.lsp", {}),
--   callback = function(args)
--     local client = assert(lsp.get_client_by_id(args.data.client_id))
--     local buf = args.buf
--     local excluded_filetypes = { php = true, lua = true }
--     -- Auto-format on save (only if server can't do WillSaveWaitUntil)
--     if
--         not client:supports_method("textDocument/willSaveWaitUntil")
--         and client:supports_method("textDocument/formatting")
--         and not excluded_filetypes[vim.bo[buf].filetype]
--     then
--       api.nvim_create_autocmd("BufWritePre", {
--         group = api.nvim_create_augroup("my.lsp.format", { clear = false }),
--         buffer = buf,
--         callback = function()
--           lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
--         end,
--       })
--     end
--   end,
-- })
--
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

-- python formatting
-- api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.py",
--   callback = function()
--     opt.textwidth = 79
--     opt.colorcolumn = "79"
--   end,
-- })


-- api.nvim_create_autocmd("LspRequest", {
--   callback = function(ctx)
--     local method = ctx.data.request.method
--     if method == "textDocument/definition" or method == "textDocument/hover" then
--       print("LSP request:", method)
--     end
--   end,
-- })
