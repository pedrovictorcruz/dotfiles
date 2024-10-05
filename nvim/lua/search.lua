local M = {}

function M.search_string()
  -- Solicita ao usuário a string de busca
  local search_term = vim.fn.input("Buscar por: ")

  -- Verifica se a string de busca é válida
  if search_term == nil or search_term == "" then
    print("Busca cancelada.")
    return
  end

  -- Define o diretório onde o Neovim foi inicializado
  local current_dir = vim.fn.getcwd()

  -- Executa o comando de busca com `rg --vimgrep`
  local search_command = string.format("rg --vimgrep \"%s\" %s", search_term, current_dir)

  -- Popula o quickfix com o resultado do comando
  vim.cmd("cgetexpr system('" .. search_command .. "')")

  -- Abre a lista do quickfix automaticamente
  vim.cmd("copen")
end

-- Mapeia a função para ser acionada por <C-s>
vim.api.nvim_set_keymap('n', ';s', ':lua require("search").search_string()<CR>', { noremap = true, silent = true })

return M

