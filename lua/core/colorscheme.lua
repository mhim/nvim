local colorscheme = "nightfly"
-- local colorscheme = "tokyonight"
-- local colorscheme = "darkplus"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	print("Colorscheme not found!")
	return
end
