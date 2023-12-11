-- Global function
function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	-- 0 is for the global space
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
