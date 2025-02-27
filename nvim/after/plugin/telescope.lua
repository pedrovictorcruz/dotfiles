local file_ignore_patterns = {
	".gradle/",
	"yarn%.lock",
	"node_modules/",
	"raycast/",
	"dist/",
	"%.next",
	"%.git/",
	"%.gitlab/",
	"build/",
	"target/",
	"package%-lock%.json",
	"vendor/",
	"%.zig-cache/",
}

require("telescope").setup({
	pickers = {
		-- find_files = {
		-- 	theme = "ivy",
		-- },
		-- live_grep = {
		-- 	theme = "ivy",
		-- },
		-- diagnostics = {
		-- 	theme = "ivy",
		-- },
	},
	defaults = {
		layout_strategy = "center", -- Define o layout para ficar na parte inferior
		layout_config = {
			height = 15, -- Define uma altura mínima (ajuste conforme necessário)
			prompt_position = "bottom", -- Deixa o campo de busca no topo
		},
		sorting_strategy = "descending", -- Mostra os itens de cima para baixo
		border = true, -- Remove bordas para um visual mais clean
		selection_caret = "> ", -- Ícone de seleção simples
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-n>"] = "move_selection_next",
				["<C-p>"] = "move_selection_previous",
			},
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<space>fd", function()
	builtin.find_files({
		file_ignore_patterns = file_ignore_patterns,
		previewer = false,
		hidden = true,
		respect_gitignore = true,
	})
end, {})
vim.keymap.set("n", "<space>fs", function()
	builtin.live_grep({
		file_ignore_patterns = file_ignore_patterns,
		previewer = true,
		hidden = true,
		respect_gitignore = true,
	})
end, {})
vim.keymap.set("n", "<leader>ls", function()
	builtin.lsp_document_symbols()
end, {})
