nnoremap <leader>pv :Ex<CR>
nnoremap <leader><leader> :source<CR>

nnoremap <leader>f gg=G

autocmd BufEnter * silent! lcd %:p:h
nnoremap <leader>fd :e <C-R>=expand('%:p:h') . '/'<CR>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <A-C> :bd<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
