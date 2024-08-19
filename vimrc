let mapleader = ' '

call plug#begin()

" dis is importante
Plug 'jiangmiao/auto-pairs'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'SirVer/ultisnips'

" for some reason we need both fzf and fzf vim
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'

Plug 'lervag/vimtex'

" My plugins
Plug 'jmattaa/regedit.vim'

call plug#end()

source $HOME/.vim/jonathan/mappings.vim
source $HOME/.vim/jonathan/set.vim
source $HOME/.vim/jonathan/colors.vim
