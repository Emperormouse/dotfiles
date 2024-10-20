set expandtab           " converts tabs to white space
set number                  " add line numbers
set shiftwidth=4 
set tabstop=4
set softtabstop=4
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
set smarttab
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse cli
set clipboard+=unnamedplus
"set cursorline
set ttyfast                 " Speed up scrolling in Vim

set noswapfile            " disable creating swap filecall plug#begin()

call plug#begin()

Plug 'scottmckendry/cyberdream.nvim'
Plug 'rebelot/kanagawa.nvim' 
Plug 'folke/tokyonight.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'ellisonleao/gruvbox.nvim'

Plug 'neoclide/coc.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'preservim/nerdtree'

call plug#end()

nnoremap    <C
nnoremap    <C-c>   0i#<esc>j
nnoremap    <C-x>   0xj
nnoremap    C       J
nnoremap    D       "1dd
nnoremap    dd      "0dd
nnoremap    p       "0p
nmap        L       o<esc>
nmap    <C-J>       0i<CR><esc>
nmap    <C-K>       0i<BS><esc>
nmap    <C-t>   :NERDTreeToggle<CR> 
nmap    <A-q>   :q!<CR>
nmap    <S-w>   :w<CR>
nmap    <S-q>   :wq!<CR>
nmap    <S-J>   <PageDown>
nmap    <S-K>   <PageUp>
    
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

colorscheme kanagawa
highlight Normal guibg=none
