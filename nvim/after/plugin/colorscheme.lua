require("rose-pine").setup({
    styles = {
        bold = true,
        italic = false,
        transparency = true,
    },
})
require('evergarden').setup({
  theme = {
    variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
    accent = 'green',
  },
  editor = {
    transparent_background = true,
    sign = { color = 'none' },
    float = {
      color = 'mantle',
      solid_border = false,
    },
    completion = {
      color = 'surface0',
    },
  },
})

-- vim.cmd.colorscheme("rose-pine")
vim.cmd.colorscheme("evergarden")
