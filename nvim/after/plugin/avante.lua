local avante = require("avante")

avante.setup({
	provider = "claude",
	auto_suggestions_provider = "claude",
	cursor_applying_provider = nil,
	behaviour = {
		auto_suggestions = false, -- Experimental stage
		auto_set_highlight_group = true,
		auto_set_keymaps = true,
		auto_apply_diff_after_generation = false,
		support_paste_from_clipboard = false,
		minimize_diff = false, -- Whether to remove unchanged lines when applying a code block
		enable_token_counting = false, -- Whether to enable token counting. Default to true.
		enable_cursor_planning_mode = true, -- Whether to enable Cursor Planning Mode. Default to false.
	},
})
