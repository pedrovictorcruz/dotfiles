vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

--vim.keymap.set('n', '<C-f>', ':e ', { noremap = true })
vim.api.nvim_create_user_command('FindFile', function()
    vim.opt.path:append('**/*/**')
    vim.opt.wildignore:append('*/node_modules/*,*/vendor/*')
    local filename = vim.fn.input('Find file: ')
    vim.cmd('find ' .. filename)
end, {})

vim.api.nvim_create_user_command('FindFile', function()
    vim.opt.path:append('**/*/**')
    vim.opt.wildignore:append('*/node_modules/*,*/build/*')
    local filename = vim.fn.input('Find file: ')
    vim.cmd('find ' .. filename)
end, {})

vim.api.nvim_set_keymap('n', '<C-f>', ':FindFile<CR>', { noremap = true, silent = true })


vim.api.nvim_create_user_command('FindBuffer', function()
    local buffername = vim.fn.input('Find buffer: ')
    local buffers = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buffers) do
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match(buffername) then
            vim.api.nvim_buf_set_option(bufnr, 'buflisted', true)
            vim.api.nvim_command('buffer ' .. bufnr)
            return
        end
    end
    print('No buffer found')
end, {})

vim.api.nvim_set_keymap('n', '<C-e>', ':FindBuffer<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-x>', ':below Compile ', { noremap = true })
