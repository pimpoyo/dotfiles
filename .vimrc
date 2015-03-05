set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tpope/vim-fugitive'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'elzr/vim-json.git'
Plugin 'scrooloose/syntastic'
" If using Vim 7.3+ with lua support, use this:
"Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/bufkill.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Autoreload self
autocmd! bufwritepost ~/.vimrc source %

" Completion stuff
let g:neocomplcache_enable_at_startup=1
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" Automagically indent templates
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.html.tmpl set filetype=html
au BufNewFile,BufRead *.psql.tmpl set filetype=sql

" Set to auto read when a file is changed from the outside
set autoread

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Keep all backups in one place, needs to be aligned with the system (VIM does
" not create directories)
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" Switch syntax highlighting on, when the terminal has colors
syntax on
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 1 tab == 4 spaces
set ts=4
set sts=4
set sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2

" Linebreak on 160 characters
set lbr
set tw=160

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

map <C-n> :bnext<CR>
map <C-p> :bp<CR>

" I DONT WANT DIR TO CHANGE!! XXX But I'd love to have the 'gf' shortcut
"set autochdir
"autocmd BufEnter * silent! lcd %:p:h

" testing: never show status line on last window
set laststatus=0
set wildmenu

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" So it doesn't ask to save evertytime you move out of buffers
set hidden

if &diff
	colorscheme blue
else
	colorscheme delek
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Open new splits to right and bottom, feels more natural
set splitbelow
set splitright

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1
