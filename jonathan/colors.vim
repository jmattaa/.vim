set background=dark
colorscheme gruvbox

function! Toggle_transparent()
    hi Normal guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
endfunction

call Toggle_transparent()
