require("rose-pine").setup({
    disable_background = true,
    highlight_groups = {
        Normal = { bg = "none" },
        NormalNC = { bg = "none" },
    },
})

function ColorMyPencils(color)
    color = color or "kanagawa-dragon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- vim.cmd('hi! link SignColumn Normal')
end

ColorMyPencils()
