<<<<<<< Updated upstream
=======
filetype plugin indent on

>>>>>>> Stashed changes
" Load plugins
call plug#begin('~/.nvim/plugins')

" Lint/LSP
Plug 'dense-analysis/ale'

<<<<<<< Updated upstream
=======
" Closing pairs
Plug 'Raimondi/delimitMate'

>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
" Testing
Plug 'vim-test/vim-test'

" Solarized theme
Plug 'lifepillar/vim-solarized8'

=======
" One colorscheme
Plug 'rakr/vim-one'

" Testing
Plug 'vim-test/vim-test'

>>>>>>> Stashed changes
" Easy closures
Plug 'tpope/vim-surround'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
call plug#end()

" Plugin configs
<<<<<<< Updated upstream
source ~/.config/nvim/vim-solarized8.vim "Needs to be first to set colorscheme
source ~/.config/nvim/ale.vim
source ~/.config/nvim/vim-airline.vim
source ~/.config/nvim/vim-airline-themes.vim
=======
set termguicolors
syntax on
source ~/.config/nvim/vim-one.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/vim-airline.vim
>>>>>>> Stashed changes
source ~/.config/nvim/vim-indent-guides.vim
source ~/.config/nvim/vim-polygot.vim

" Other configs
<<<<<<< Updated upstream
=======
source ~/.config/nvim/filetypes.vim
>>>>>>> Stashed changes
source ~/.config/nvim/general.vim
source ~/.config/nvim/highlight.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/set.vim
