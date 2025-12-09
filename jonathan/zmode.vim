let g:zen_mode_active = 0
let g:saved_settings = {}

function! Togglezmode(width)
    if g:zen_mode_active
        if exists("t:zen_left")
            execute "silent! bwipeout " . t:zen_left
            unlet t:zen_left
        endif
        if exists("t:zen_right")
            execute "silent! bwipeout " . t:zen_right
            unlet t:zen_right
        endif
        if exists("g:saved_settings")
            let &laststatus = g:saved_settings["laststatus"]
            let &fillchars = g:saved_settings["fillchars"]
            let &signcolumn = g:saved_settings["signcolumn"]
            let &colorcolumn = g:saved_settings["colorcolumn"]
            hi NonText guifg=fg
            unlet g:saved_settings
        endif

        let g:zen_mode_active = 0
    else
        let g:saved_settings = {
                    \ "laststatus": &laststatus,
                    \ "fillchars": &fillchars,
                    \ "signcolumn": &signcolumn,
                    \ "colorcolumn": &colorcolumn,
                    \}

        set laststatus=0
        set fillchars=
        set signcolumn=no
        set colorcolumn=

        hi VertSplit guibg=NONE
        hi NonText guifg=bg

        let l:total = winwidth(0)
        let l:side = float2nr((l:total - a:width) / 2)
        if l:side < 0
            let l:side = 0
        endif

        leftabove vsplit
        enew
        setlocal buftype=nofile bufhidden=hide noswapfile
        execute "vertical resize " . l:side
        let t:zen_left = bufnr("%")

        wincmd l
        execute "vertical resize " . a:width

        rightbelow vsplit
        enew
        setlocal buftype=nofile bufhidden=hide noswapfile
        execute "vertical resize " . l:side
        let t:zen_right = bufnr("%")

        wincmd h

        let g:zen_mode_active = 1
    endif
endfunction

nnoremap <leader>z :call Togglezmode(80)<CR>
