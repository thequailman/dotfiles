filetype plugin indent on

" Load plugins
call plug#begin('~/.nvim/plugins')

" Lint/LSP
Plug 'dense-analysis/ale'

" Fuzzy
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git status - tagbar and symbols
Plug 'airblade/vim-gitgutter'

" Git commands
Plug 'tpope/vim-fugitive'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" One colorscheme
Plug 'rakr/vim-one'

" Testing
Plug 'vim-test/vim-test'

" Easy closures
Plug 'tpope/vim-surround'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
call plug#end()

" Plugin configs
set termguicolors
syntax on
source ~/.config/nvim/vim-one.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/vim-airline.vim
source ~/.config/nvim/vim-indent-guides.vim
source ~/.config/nvim/vim-polygot.vim

" Other configs
source ~/.config/nvim/filetypes.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/highlight.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/set.vim
