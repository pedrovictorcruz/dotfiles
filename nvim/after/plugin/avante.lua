require("avante").setup({
	provider = "claude", -- The provider used in Aider mode or in the planning phase of Cursor Planning Mode
	-- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
	-- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
	-- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
	auto_suggestions_provider = "claude",
	cursor_applying_provider = nil, -- The provider used in the applying phase of Cursor Planning Mode, defaults to nil, when nil uses Config.provider as the provider for the applying phase
	claude = {
		endpoint = "https://api.anthropic.com",
		model = "claude-3-5-sonnet-20241022",
		temperature = 0,
		max_tokens = 4096,
	},
	behaviour = {
		auto_suggestions = false, -- Experimental stage
		auto_set_highlight_group = true,
		auto_set_keymaps = true,
		auto_apply_diff_after_generation = false,
		support_paste_from_clipboard = false,
		minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
		enable_token_counting = false, -- Whether to enable token counting. Default to true.
		enable_cursor_planning_mode = true, -- Whether to enable Cursor Planning Mode. Default to false.
	},
	hints = { enabled = true },
	windows = {
		---@type "right" | "left" | "top" | "bottom"
		position = "right", -- the position of the sidebar
		wrap = true, -- similar to vim.o.wrap
		width = 30, -- default % based on available width
		sidebar_header = {
			enabled = true, -- true, false to enable/disable the header
			align = "left", -- left, center, right for title
			rounded = false,
		},
		input = {
			prefix = ">",
			height = 1, -- Height of the input window in vertical layout
		},
		edit = {
			border = "rounded",
			start_insert = true, -- Start insert mode when opening the edit window
		},
		ask = {
			floating = false, -- Open the 'AvanteAsk' prompt in a floating window
			start_insert = false, -- Start insert mode when opening the ask window
			---@type "ours" | "theirs"
			focus_on_apply = "theirs", -- which diff to focus after applying
		},
	},
	highlights = {
		---@type AvanteConflictHighlights
		diff = {
			current = "DiffText",
			incoming = "DiffAdd",
		},
	},
	--- @class AvanteConflictUserConfig
	diff = {
		autojump = true,
		---@type string | fun(): any
		list_opener = "copen",
		--- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
		--- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
		--- Disable by setting to -1.
		override_timeoutlen = 500,
	},
	suggestion = {
		debounce = 600,
		throttle = 600,
	},
})
