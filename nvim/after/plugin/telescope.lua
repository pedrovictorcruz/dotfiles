local icons = require("config.icons")
local telescope = require("telescope")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

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
	"vendors/",
	"%.zig-cache/",
    "%.venv/",
}

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-n>"] = "move_selection_next",
				["<C-p>"] = "move_selection_previous",
			},
		},
		path_display = {
			"filename_first",
		},
		prompt_prefix = " " .. icons.ui.Telescope .. " ",
		selection_caret = icons.ui.BoldArrowRight .. " ",
		initial_mode = "insert",
		select_strategy = "reset",
		sorting_strategy = "ascending",
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		layout_config = {
			prompt_position = "top",
			preview_cutoff = 120,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
	},

	pickers = {
		find_files = themes.get_dropdown({
			file_ignore_patterns = file_ignore_patterns,
			previewer = false,
			hidden = true,
			respect_gitignore = true,
			layout_config = {
                width = 0.8,
				height = 0.6,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		}),
		git_files = themes.get_dropdown({
			file_ignore_patterns = file_ignore_patterns,
			previewer = false,
			hidden = true,
			respect_gitignore = true,
			layout_config = {
				height = 0.4,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		}),
		buffers = themes.get_dropdown({
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer,
				},
				n = {
					["<c-d>"] = actions.delete_buffer,
				},
			},
			previewer = false,
			initial_mode = "normal",
			layout_config = {
				height = 0.8,
				width = 0.6,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		}),
		current_buffer_fuzzy_find = themes.get_dropdown({
			previewer = true,
			layout_config = {
				prompt_position = "top",
				preview_cutoff = 120,
			},
		}),
		live_grep = themes.get_dropdown({
			file_ignore_patterns = file_ignore_patterns,
			only_sort_text = true,
			previewer = true,
			hidden = true,
			respect_gitignore = true,
		}),
		grep_string = themes.get_dropdown({
			file_ignore_patterns = file_ignore_patterns,
			only_sort_text = true,
			previewer = true,
			hidden = true,
			respect_gitignore = true,
		}),
		lsp_references = themes.get_dropdown({
			show_line = false,
			previewer = true,
		}),
		treesitter = themes.get_dropdown({
			show_line = false,
			previewer = true,
		}),
		colorscheme = themes.get_dropdown({
			enable_preview = true,
		}),
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "ignore_case", -- or "smart_case" or "respect_case"
		},
		["ui-select"] = {
			themes.get_dropdown({
				previewer = false,
				initial_mode = "normal",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						width = 0.8,
						height = 0.6,
						preview_width = 0.6,
					},
				},
			}),
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

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
