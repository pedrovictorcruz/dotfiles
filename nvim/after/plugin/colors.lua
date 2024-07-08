function ColorMyPencils(color)
    color = color or "gruber"
    vim.cmd.colorscheme(color)

    vim.cmd('hi! link SignColumn Normal')
end

ColorMyPencils()
