let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_settings = {
    \ 'clangd': {
    \   'cmd': ['clangd'],
    \ }
\ }

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    let g:lsp_diagnostics_virtual_text_enabled = 0
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>lrn <plug>(lsp-rename)
    nmap <buffer> <leader>F :LspDocumentFormat<CR>
    nmap <buffer> <leader>la :LspCodeAction<CR>
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server
    " registered 
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
