require("gruber-darker").setup({
    bold = true,
    italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = true,
    },
})

function ColorMyPencils(color)
    color = color or "gruber-darker"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
