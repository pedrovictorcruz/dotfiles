require('copilot').setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        keymap = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            dismiss = "<C-e>",
        },
    },
})

vim.g.copilot_cmp_enabled = false
