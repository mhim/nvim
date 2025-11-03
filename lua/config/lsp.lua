-- set preview window early
local orig = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	opts.max_width = opts.max_width or 80
	opts.max_height = opts.max_height or 24
	opts.wrap = opts.wrap ~= false
	return orig(contents, syntax, opts, ...)
end
-- Per-buffer behavior on LSP attach (keymaps, auto-format, completion)
-- See :help LspAttach for the recommended pattern
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local keymap = vim.keymap.set
		local lspbuf = vim.lsp.buf
    local diag = vim.diagnostic
    local function addopt(desc)
      local opts = { buffer = ev.buf, silent = true }
      return vim.tbl_extend("force", opts, { desc = desc })
    end
		-- Keymaps (use builtin LSP buffer functions)
    keymap("n", "<leader>rs", ":LspRestart<CR>", addopt("Restart LSP"))
    keymap("n", "<leader>rn", lspbuf.rename, addopt("Smart rename"))
		keymap("n", "<leader>d", diag.open_float, addopt("Show line diagnostics"))
    keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", addopt("Show buffer diagnostics"))
		keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", addopt("Show LSP references"))
		keymap("n", "gI", "<cmd>Telescope lsp_implementations<CR>", addopt("Show LSP implementations"))
		keymap("n", "gT", "<cmd>Telescope lsp_type_definitions<CR>", addopt("Show LSP type definitions"))
		keymap("n", "K", lspbuf.hover, addopt("Display hover information"))
		-- keymap("n", "gr", lspbuf.references, addopt("Show references"))
		keymap("n", "gd", lspbuf.definition, addopt("Go to definition"))
		keymap("n", "gD", lspbuf.declaration, addopt("Go to declaration"))
		keymap("n", "gi", lspbuf.implementation, addopt("Show implementations"))
		keymap("n", "gt", lspbuf.type_definition, addopt("Go to definition of type"))
		keymap("n", "gs", lspbuf.signature_help, addopt("Display signature_help"))
		keymap({ "n", "v" }, "<leader>ca", lspbuf.code_action, addopt("Show available code action"))
		keymap("n", "[d", function() diag.jump({ count = -1, float = true }) end, addopt("Jump to previous diagnostic"))
		keymap("n", "]d", function() diag.jump({ count = 1, float = true }) end, addopt("Jump to next diagnostic"))
		-- keymap({ 'n', 'x' }, '<leader>mp', function() lspbuf.format({ async = true }) end, addopt("formatting"))
	end,
})
-- See :help lsp-new-config and :help vim.lsp.config()
-- Configuration for neovim built in LSP
local severity = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = false, -- { current_line = true },
	virtual_line = true,
	severity_sort = true,
	float = { style = "minimal", border = "rounded", source = "if_many", header = "", prefix = "" },
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
