local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		max_name_length = 30,
		-- max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		-- tab_size = 21,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
	},
})
