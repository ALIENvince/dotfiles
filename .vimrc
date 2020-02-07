" ------------------------------------------------------------------
"			Vince's vimrc
" ------------------------------------------------------------------
" Don't try to be vi compatible
set nocompatible
" -----------------------------------------
" Plugins Parameters
" -----------------------------------------

" Helps force plugins to load correctly when it is turned back on below
filetype off

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')
" plug vim-plug itself to get access to the help page
" :help plug-options
Plug 'junegunn/vim-plug'

" Snippets plugins (not configured yet)
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'

" Quickfix plugin
Plug 'https://github.com/romainl/vim-qf'

" confort plugins
Plug 'https://github.com/tpope/vim-surround'

Plug 'https://github.com/tpope/vim-unimpaired'

Plug 'https://github.com/tpope/vim-vinegar'

Plug 'https://github.com/tpope/vim-fugitive'

" Plug 'https://github.com/ludovicchabant/vim-gutentags'

" Plug 'https://github.com/powerline/powerline'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

call plug#end()


"UltiSnips Mapping
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" -----------------------------------------
" General parameters
" -----------------------------------------

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable swapfiles
set noswapfile

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=8
set shiftwidth=4
set softtabstop=4
set smarttab
set noexpandtab
set noshiftround

" Cursor motion
set scrolloff=16
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Yank to end of line
nnoremap Y y$
" set mouse=a

" Disable preview window on completion
set completeopt=longest,menuone
"
" " Highlight current line
set cursorline

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

fu! Autoclose()
    inoremap " ""<left>
    inoremap ' ''<left>
    inoremap ( ()<left>
    inoremap [ []<left>
    inoremap { {}<left>
    inoremap {<CR> {<CR>}<ESC>O
    inoremap {;<CR> {<CR>};<ESC>O
endfunction

" call Autoclose()


" Enhance command line completion
" set wildmenu
"
" " Set completion behavior, see :help wildmode for details
" set wildmode=longest:full,list:full

" Searching
" nnoremap / /\v
" vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" No highlight for matched strings
set nohlsearch

map <leader><space> :let @/=''<cr> " clear search
" Clear last search highlighting with escape
" commented, seems to produce inserting character issues
" nnoremap <esc> :noh<return><esc>
" Trying another solution


" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL



" Color scheme (terminal)
if empty(glob('~/.vim/colors/atom-dark.vim'))
    silent !curl -fLo ~/.vim/colors/atom-dark.vim --create-dirs
        \ https://raw.githubusercontent.com/ALIENvince/dotfiles/master/atom-dark.vim
endif  

set t_Co=256
set background=dark
"colorscheme sublimemonokai
"colorscheme monokai
colorscheme atom-dark
if version >800
    set termguicolors
endif

" Open the quickfix window if there are errors, or close it if there are no
" errors left
noremap <leader>cw :botright :cw<cr>

" Run make silently, then skip the 'Press ENTER to continue'
noremap <leader>m :silent! :make! \| :redraw!<cr>

" Persistent undo
if version >=703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif



" -----------------------------------------
" Plugins mappings and options
" -----------------------------------------

" Override unimpaired quickfix and loc-list mappings to use vim-qf wrapparound
let g:nremap = {"[q": "", "]q": "", "[l": "", "]l": ""}
nmap [q <Plug>(qf_qf_previous)
nmap ]q <Plug>(qf_qf_next)
nmap [l <Plug>(qf_loc_previous)
nmap ]l <Plug>(qf_loc_next)

" Vim airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
     let g:airline_left_sep = '»'
     let g:airline_left_sep = '▶'
     let g:airline_right_sep = '«'
     let g:airline_right_sep = '◀'
     let g:airline_symbols.linenr = '␊'
     let g:airline_symbols.linenr = '␤'
     let g:airline_symbols.linenr = '¶'
     let g:airline_symbols.branch = '⎇'
     let g:airline_symbols.paste = 'ρ'
     let g:airline_symbols.paste = 'Þ'
     let g:airline_symbols.paste = '∥'
     let g:airline_symbols.whitespace = 'Ξ'
    
     " airline symbols
     let g:airline_left_sep = ''
     let g:airline_left_alt_sep = ''
     let g:airline_right_sep = ''
     let g:airline_right_alt_sep = ''
     let g:airline_symbols.branch = ''
     let g:airline_symbols.readonly = ''
     let g:airline_symbols.linenr = ''
