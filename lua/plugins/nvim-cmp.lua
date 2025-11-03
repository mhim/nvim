return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			preselect = cmp.PreselectMode.Item, -- <— preselect first item
			completion = { completeopt = "menu,menuone,noinsert" },
			window = { documentation = cmp.config.window.bordered() },
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<C-Tab>"] = cmp.mapping.complete(), -- manual trigger if you want it
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					end
				end, { "i", "s" }),
			}),
			-- sources for autocompletion
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
			},
		})
	end,
}
