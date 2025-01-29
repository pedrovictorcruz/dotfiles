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
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		diagnostics = {
			theme = "ivy",
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
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
end, { })

