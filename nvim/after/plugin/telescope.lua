local file_ignore_patterns = {
  ".cache",
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
}

local builtin = require('telescope.builtin')

require('telescope').load_extension('file_browser')

require('telescope').setup {
  defaults = {
    layout_strategy = "bottom_pane", -- Popup na parte inferior
    layout_config = {
      height = 0.4,                  -- Define a altura do popup
    },
    file_ignore_patterns = file_ignore_patterns,
  },
}

vim.keymap.set('n', ';;', function()
  builtin.find_files({
    file_ignore_patterns = file_ignore_patterns,
    previewer = false,
    path = "%:p:h",
    hidden = true,
  })
end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', ';s', function()
  builtin.live_grep({
    file_ignore_patterns = file_ignore_patterns,
    respect_gitignore = true,
  })
end, {})
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

vim.keymap.set('n', ';f', function()
  require('telescope').extensions.file_browser.file_browser({
    initial_mode = "normal",
    path = "%:p:h",
    hidden = true,
    sorting_strategy = "ascending",
    respect_gitignore = true,
    file_ignore_patterns = file_ignore_patterns,
    previewer = false,
  })
end, {})
