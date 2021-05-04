-- Helpers
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Setup paq
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true} -- paq-nvim manages itself

-- Add plugins
paq {'itchyny/lightline.vim'} -- Statusline
paq {'junegunn/fzf', run = fn['fzf#install']} -- Fuzzy finder
paq {'junegunn/fzf.vim'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'} -- File explorer
paq {'mengelbrecht/lightline-bufferline'} -- Bufferline
paq {'neomake/neomake'} -- LSP configurations
paq {'neovim/nvim-lspconfig'} -- LSP configurations
paq {'nvim-lua/completion-nvim'} -- Autocomplete
paq {'nvim-treesitter/nvim-treesitter'} -- Treesitter
paq {'ray-x/lsp_signature.nvim'} -- Show function signatures
paq {'rakr/vim-one'} -- One colorscheme

-- Set options
cmd 'colorscheme one'
cmd 'filetype plugin indent on'
opt('b', 'autoindent', true) -- Automatic indent
opt('b', 'shiftwidth', 2) -- Size of an indent
opt('b', 'tabstop', 2) -- How many spaces a tab is
opt('o', 'background', 'light') -- Use light version
opt('o', 'completeopt', 'menuone,noinsert,noselect') -- Better completion experience
opt('o', 'hidden', true) -- Enable switching without saving
opt('o', 'ignorecase', true) -- Ignore uppercase in searches
opt('o', 'linebreak', true) -- Wrap lines at convenient spots
opt('o', 'mouse', '') -- Disable mouse
opt('o', 'smartcase', true) -- Search for uppercase if specified
opt('o', 'showcmd', true) -- Show commands at bottom
opt('o', 'showmatch', true) -- Highlight matching closures
opt('o', 'showtabline', 2) -- Show tab/bufferline
opt('o', 'splitbelow', true) -- Open new splits on bottom
opt('o', 'splitright', true) -- Open new splits to right
opt('o', 'termguicolors', true) -- Use true colors
opt('o', 'undodir', os.getenv("HOME") .. '/.local/share/nvim/undo') -- Undo directory
opt('o', 'undofile', true) -- Undo file
opt('o', 'wrap', true) -- Wrap lines
opt('w', 'cursorline', true) -- Highlight current line
opt('w', 'list', true) -- Show invisible characters
opt('w', 'listchars', 'lead:.,tab:->,trail:~,extends:>,precedes:<') -- Invisible characters
opt('w', 'number', true) -- Show line numbers
opt('w', 'relativenumber', true) -- Show relative line numbers

-- Set variables
g['airline_theme'] = 'one' -- Use one colorscheme with airline
g['deoplete#enable_at_startup'] = 1 -- Enable deoplete at startup
g['lightline'] = {
	colorscheme = 'one',
	component_expand = {
		buffers = 'lightline#bufferline#buffers',
	},
	component_type = {
		buffers = 'tabsel',
	},
	tabline = {
		left = { { 'buffers'} },
	},
} -- Lightline colorscheme
g['mapleader'] = ' ' -- Have space be leader
g['nvim_tree_auto_open'] = 1 -- Open nvim tree by default
g['nvim_tree_auto_close'] = 1 -- Close nvim tree if nothing else is open
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
g['nvim_tree_bindings'] = {
	['<Bar>'] = tree_cb('vsplit'),
	['u'] = tree_cb('dir_up')
} -- Custom nvim tree bindings
g['term_buf'] = 0
g['term_win'] = 0

-- Setup LSP
local lspconfig = require 'lspconfig'
lspconfig.gopls.setup {}
lspconfig.tsserver.setup {}
fn.sign_define('LspDiagnosticsSignError', {text = '🔴', lineh1 = DiffText})
fn.sign_define('LspDiagnosticsSignWarning', {text = '🟠'})
fn.sign_define('LspDiagnosticsSignInformation', {text = '🔵'})
fn.sign_define('LspDiagnosticsSignHint', {text = '🟢'})


-- Set mappings
map('', '<Bar>', '<C-W>v<C-W><Right>') -- | open a split to the right
map('', '<C-F>', ':FZF<CR>') -- CTRL + F opens fuzzy find
map('', '<C-H>', '<C-W><C-H>') -- CTRL + H left split
map('', '<C-J>', '<C-W><C-J>') -- CTRL + H bottom split
map('', '<C-K>', '<C-W><C-K>') -- CTRL + H top split
map('', '<C-L>', '<C-W><C-L>') -- CTRL + L right split
map('', '<CR>', ':noh<CR>') -- Return unsets search
map('', '<Leader>c', '"+y') -- Copy to clipboard
map('', '<Leader>e', ':q!<CR>') -- Space e closes window
map('', '<Leader>n', ':NvimTreeToggle<CR>') -- Open nvim-tree
map('', '<Leader>o', ':10sp term://$SHELL<cr>i') -- Space o opens 10 line terminal below buffer
map('', '<Leader>q', ':bp|sp|bn|bd!<CR>') -- Space q closes window
map('', '<Leader>w', ':w|bd<CR>') -- Space w saves and closes window
map('', '<S-Tab>', ':bp<CR>') -- Shift + Tab move to previous buffer
map('', '<Tab>', ':bn<CR>') -- Tab move to next buffer
map('', 'j', 'gj') -- j is really down
map('', 'k', 'gk') -- k is really up
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', 'jk', '<Esc>') -- Use jk as escape
map('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<Leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<Leader>j', ':cn<CR>')
map('n', '<Leader>k', ':cp<CR>')
map('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('t', '<C-D>', '<C-\\><C-n>:q!<CR>') -- CTRL + D Close terminal
map('t', '<C-K>', '<C-\\><C-n><C-W><C-K>') -- CTRL + K Change to top split
map('t', '<C-X>', '<C-\\><C-n>') -- CTRL + X Escape from terminal

-- Autocmds
cmd 'autocmd BufEnter * lua require"completion".on_attach()' -- Enable completion for all buffers
cmd 'autocmd TermOpen * set nobuflisted' -- Hide terminal from buffer list

-- Filetypes
cmd 'autocmd FileType go set noexpandtab sts=2 sw=2 ts=2'
cmd 'autocmd FileType javascript set noexpandtab sts=2 sw=2 ts=2'
cmd 'autocmd FileType json set expandtab sts=2 sw=2 ts=2'
cmd 'autocmd FileType typescript set noexpandtab sts=2 sw=2 ts=2'
cmd 'autocmd FileType typescriptreact set noexpandtab sts=2 sw=2 ts=2'
