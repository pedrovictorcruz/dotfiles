local M = {}

-- Paleta extraída do seu scheme.json
local palette = {
	fg = "#c2edca", -- texto padrão / funções / classes
	fg_dim = "#82ab8a", -- variáveis / tags
	green = "#92c37e", -- keywords / controle / ênfases verdes
	yellow = "#ffe88f", -- números / constantes / attrs
	bright_green = "#00b400", -- strings
	beige = "#e8e2b7", -- operadores / escapes
	gray = "#808080", -- comentários
	white = "#ffffff", -- pontuação / `Normal` claro quando quiser
	red = "#f44747", -- erros
}

local function hl(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

local function with_style(fg, style)
	local t = { fg = fg }
	if style then
		t[style] = true
	end
	return t
end

local function apply_core(opts)
	local bg = opts.bg -- pode ser "none" (transparente) ou uma cor como "#101513"

	-- Básico
	hl("Normal", { fg = palette.fg, bg = bg })
	hl("NormalNC", { fg = palette.fg, bg = bg })
	hl("NormalFloat", { fg = palette.fg, bg = bg })
	hl("FloatBorder", { fg = palette.green, bg = bg })
	hl("CursorLine", { bg = opts.cursorline_bg or "none" })
	hl("CursorColumn", { bg = opts.cursorline_bg or "none" })
	hl("CursorLineNr", { fg = palette.yellow, bold = true })
	hl("LineNr", { fg = palette.gray })
	hl("WinSeparator", { fg = palette.green })
	hl("Visual", { bg = opts.visual_bg or "none", reverse = opts.visual_bg == nil }) -- destaque sem pintar forte
	hl("Search", { fg = palette.white, bg = palette.green })
	hl("IncSearch", { fg = palette.white, bg = palette.green, bold = true })
	hl("MatchParen", { fg = palette.yellow, bold = true })
    hl("StatusLine", { fg = palette.gray, bg = bg, bold = true })
    hl("StatusLineNC", { fg = palette.gray, bg = bg })

	-- Sintaxe clássica
	hl("Comment", with_style(palette.gray, opts.italic_comments and "italic" or nil))
	hl("String", { fg = palette.bright_green })
	hl("Character", { fg = palette.bright_green })
	hl("Number", { fg = palette.yellow })
	hl("Boolean", { fg = palette.yellow })
	hl("Float", { fg = palette.yellow })
	hl("Constant", { fg = palette.yellow })
	hl("Identifier", { fg = palette.fg_dim })
	hl("Function", { fg = palette.fg })
	hl("Statement", { fg = palette.green })
	hl("Conditional", { fg = palette.green })
	hl("Repeat", { fg = palette.green })
	hl("Label", { fg = palette.green })
	hl("Operator", { fg = palette.beige })
	hl("Keyword", with_style(palette.green, opts.italic_keywords and "italic" or nil))
	hl("Exception", { fg = palette.green })
	hl("PreProc", { fg = palette.yellow })
	hl("Include", { fg = palette.green })
	hl("Define", { fg = palette.green })
	hl("Macro", { fg = palette.green })
	hl("Type", { fg = palette.fg })
	hl("StorageClass", { fg = palette.green })
	hl("Structure", { fg = palette.fg })
	hl("Typedef", { fg = palette.fg })
	hl("Special", { fg = palette.beige })
	hl("SpecialChar", { fg = palette.beige })
	hl("Tag", { fg = palette.fg_dim })
	hl("Delimiter", { fg = palette.white })
	hl("SpecialComment", { fg = palette.gray, italic = true })
	hl("Todo", { fg = palette.yellow, bold = true })

	-- Diagnósticos LSP
	hl("DiagnosticError", { fg = palette.red })
	hl("DiagnosticWarn", { fg = palette.yellow })
	hl("DiagnosticInfo", { fg = palette.fg })
	hl("DiagnosticHint", { fg = palette.green })

	hl("DiagnosticVirtualTextError", { fg = palette.red })
	hl("DiagnosticVirtualTextWarn", { fg = palette.yellow })
	hl("DiagnosticVirtualTextInfo", { fg = palette.fg })
	hl("DiagnosticVirtualTextHint", { fg = palette.green })

	hl("DiagnosticUnderlineError", { sp = palette.red, undercurl = true })
	hl("DiagnosticUnderlineWarn", { sp = palette.yellow, undercurl = true })
	hl("DiagnosticUnderlineInfo", { sp = palette.fg, undercurl = true })
	hl("DiagnosticUnderlineHint", { sp = palette.green, undercurl = true })

	-- Árvores (Tree-sitter) - grupos modernos @
	hl("@comment", with_style(palette.gray, opts.italic_comments and "italic" or nil))
	hl("@string", { fg = palette.bright_green })
	hl("@character", { fg = palette.bright_green })
	hl("@number", { fg = palette.yellow })
	hl("@boolean", { fg = palette.yellow })
	hl("@float", { fg = palette.yellow })

	hl("@constant", { fg = palette.yellow })
	hl("@constant.builtin", { fg = palette.yellow })
	hl("@constant.macro", { fg = palette.yellow })

	hl("@variable", { fg = palette.fg_dim })
	hl("@variable.builtin", { fg = palette.green })
	hl("@variable.parameter", with_style(palette.white, opts.italic_parameters and "italic" or nil))
	hl("@variable.member", { fg = palette.fg_dim })

	hl("@function", { fg = palette.fg })
	hl("@function.builtin", { fg = palette.fg })
	hl("@function.macro", { fg = palette.fg })
	hl("@method", { fg = palette.fg })
	hl("@constructor", { fg = palette.fg })

	hl("@keyword", with_style(palette.green, opts.italic_keywords and "italic" or nil))
	hl("@keyword.operator", { fg = palette.beige })
	hl("@keyword.function", with_style(palette.green, opts.italic_keywords and "italic" or nil))
	hl("@keyword.return", with_style(palette.green, opts.italic_keywords and "italic" or nil))

	hl("@type", { fg = palette.fg })
	hl("@type.builtin", { fg = palette.fg })
	hl("@type.qualifier", { fg = palette.green })
	hl("@type.definition", { fg = palette.fg })

	hl("@property", { fg = palette.fg_dim })
	hl("@field", { fg = palette.fg_dim })
	hl("@operator", { fg = palette.beige })
	hl("@punctuation", { fg = palette.white })
	hl("@punctuation.delimiter", { fg = palette.white })
	hl("@punctuation.bracket", { fg = palette.white })
	hl("@punctuation.special", { fg = palette.white })

	hl("@tag", { fg = palette.fg_dim })
	hl("@tag.attribute", { fg = palette.yellow })
	hl("@tag.delimiter", { fg = palette.white })

	-- Telescope
	hl("TelescopeNormal", { fg = palette.fg, bg = bg })
	hl("TelescopeBorder", { fg = palette.green, bg = bg })
	hl("TelescopeSelection", { fg = palette.white, bold = true })
	hl("TelescopeSelectionCaret", { fg = palette.yellow })
	hl("TelescopeMatching", { fg = palette.yellow, bold = true })

	-- nvim-cmp
	hl("Pmenu", { fg = palette.fg, bg = bg })
	hl("PmenuSel", { fg = palette.white, bg = bg, reverse = true })
	hl("PmenuSbar", { bg = bg })
	hl("PmenuThumb", { bg = bg })

	hl("CmpItemAbbr", { fg = palette.fg })
	hl("CmpItemAbbrDeprecated", { fg = palette.gray, strikethrough = true })
	hl("CmpItemAbbrMatch", { fg = palette.yellow })
	hl("CmpItemAbbrMatchFuzzy", { fg = palette.yellow })

	hl("CmpItemKind", { fg = palette.beige })
	hl("CmpItemMenu", { fg = palette.gray })

	hl("CmpItemKindFunction", { fg = palette.fg })
	hl("CmpItemKindMethod", { fg = palette.fg })
	hl("CmpItemKindConstructor", { fg = palette.fg })
	hl("CmpItemKindVariable", { fg = palette.fg_dim })
	hl("CmpItemKindField", { fg = palette.fg_dim })
	hl("CmpItemKindProperty", { fg = palette.fg_dim })
	hl("CmpItemKindClass", { fg = palette.fg })
	hl("CmpItemKindInterface", { fg = palette.fg })
	hl("CmpItemKindModule", { fg = palette.fg })
	hl("CmpItemKindKeyword", { fg = palette.green })
	hl("CmpItemKindValue", { fg = palette.yellow })
	hl("CmpItemKindEnum", { fg = palette.yellow })
	hl("CmpItemKindConstant", { fg = palette.yellow })
	hl("CmpItemKindText", { fg = palette.fg_dim })
	hl("CmpItemKindSnippet", { fg = palette.beige })

	-- Copilot
	hl("CopilotSuggestion", { fg = palette.gray, italic = true })

	-- GitSigns (se usar)
	hl("GitSignsAdd", { fg = palette.bright_green })
	hl("GitSignsChange", { fg = palette.yellow })
	hl("GitSignsDelete", { fg = palette.red })

	-- Markdown (algumas úteis)
	hl("markdownHeadingDelimiter", { fg = palette.fg_dim })
	hl("markdownHeading", { fg = palette.fg })
	hl("markdownLinkText", { fg = palette.fg })
	hl("markdownUrl", { fg = palette.green, underline = true })

	-- Terminal cores básicas (opcional)
	if opts.set_terminal then
		vim.g.terminal_color_0 = "#111311"
		vim.g.terminal_color_1 = palette.red
		vim.g.terminal_color_2 = palette.bright_green
		vim.g.terminal_color_3 = palette.yellow
		vim.g.terminal_color_4 = "#7fb4ca"
		vim.g.terminal_color_5 = "#b48ead"
		vim.g.terminal_color_6 = "#89b482"
		vim.g.terminal_color_7 = palette.white
		vim.g.terminal_color_8 = "#2a2f2a"
		vim.g.terminal_color_9 = palette.red
		vim.g.terminal_color_10 = palette.green
		vim.g.terminal_color_11 = palette.yellow
		vim.g.terminal_color_12 = "#8cc7dd"
		vim.g.terminal_color_13 = "#c79dd7"
		vim.g.terminal_color_14 = "#9ec39c"
		vim.g.terminal_color_15 = palette.white
	end
end

function M.setup(opts)
	opts = vim.tbl_extend("force", {
		bg = "none", -- defina "#101513" (ou outra) se quiser bg sólido
		italic_comments = true,
		italic_keywords = false,
		italic_parameters = false,
		set_terminal = true,
		visual_bg = nil, -- se quiser cor sólida para Visual, passe um hex; nil usa reverse
		cursorline_bg = nil, -- ex: "#141a16"
	}, opts or {})

	vim.opt.termguicolors = true
	vim.o.background = "dark"

	apply_core(opts)
end

return M
