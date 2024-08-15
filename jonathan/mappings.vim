nnoremap <leader>nt :Ex<CR>

" move lines in visual
vnoremap <leader>k :m '<-2<CR>gv=gv
vnoremap <leader>j :m '>+1<CR>gv=gv

" so we stay in visual mode when indent
vnoremap < <gv
vnoremap > >gv

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>y "+y
vnoremap <leader>y "+y
