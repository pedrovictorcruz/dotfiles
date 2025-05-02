require("rose-pine").setup({
	styles = {
		bold = true,
		italic = false,
		transparency = true,
	},
})
-- vim.cmd("colorscheme rose-pine")
local hl = vim.api.nvim_set_hl

local literal_color = "#cccccc"
local comment = "#6f7b68"
local bg = "#222222"

hl(0, "Float", { fg = literal_color })
hl(0, "Number", { fg = literal_color })
hl(0, "Boolean", { fg = literal_color })

hl(0, "TSComment", { fg = comment, gui = nil })
hl(0, "Comment", { fg = comment, gui = nil })
hl(0, "Search", { bg = "#9b8d7f", fg = "#1e1e1e" })
hl(0, "PmenuSel", { bg = "#9b8d7f", fg = "#1e1e1e" })
hl(0, "WinSeparator", { bg = "#111111", fg = "#888888" })
hl(0, "Normal", { bg = "#202020" })

hl(0, "LineNrAbove", { fg = "#888888", bg = "#222222" })
hl(0, "LineNrBelow", { fg = "#888888", bg = "#222222" })
hl(0, "LineNr", { fg = "#d6d2c8" })

hl(0, "Question", { bg = "#9b8d7f" })
hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })

vim.cmd("colorscheme cosec-twilight")
