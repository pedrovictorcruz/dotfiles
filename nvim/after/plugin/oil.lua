local oil = require("oil")

oil.setup({
	columns = { "icon" }, -- Mostra ícones de arquivos (requer nvim-web-devicons)
	keymaps = {
		["<CR>"] = "actions.select", -- Abrir arquivo/diretório
		["-"] = "actions.parent", -- Voltar para o diretório anterior
		["<C-r>"] = "actions.refresh", -- Recarregar diretório
		["<C-h>"] = "actions.toggle_hidden", -- Mostrar/ocultar arquivos ocultos
	},
	view_options = {
		show_hidden = true, -- Mostra arquivos ocultos por padrão
	},
	win_options = {
		number = true, -- Mostra número da linha
		relativenumber = true, -- Habilita número relativo
	},
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
})

vim.keymap.set("n", "<leader>pv", function()
	oil.open()
end, {})
