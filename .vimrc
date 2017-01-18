syntax on

set background=dark
colorscheme Monokai
colorscheme vimbrant

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERD tree
Plugin 'scrooloose/nerdtree'

" NERD tree tabs
Plugin 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }

" Indentation guides
Plugin 'Yggdroot/indentLine'

" useful bottom bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntastic
Plugin 'vim-syntastic/syntastic'

" Beginner settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1

" Auto Completion
Plugin 'Valloric/YouCompleteMe'
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" YCM gives you popups and splits by default that some people might not like,
" so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Automatic Python Jedi completion
let g:jedi#auto_initialization = 0
let g:jedi#use_tabs_not_buffers = 1 

" Better JS support
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" This wraps lines at 80 characters 
set textwidth=80 

" Line numbers
set number

" Enables mouse
set mouse=a

" Sets tabs to be 2 characters instead of the default which is 8. 
set tabstop=2 

" Number of spaces to use for each step of (auto)indent. 
set shiftwidth=2 

" Tells vim to use spaces instead of tabs 
set expandtab 

" Tells vim to use c-style indenting 
set cindent
set smarttab
set smartindent

" Highlights characters exceeding 80
match Error /\%81v.\+/

" Type in jk while in insert mode to escape insert mode
inoremap jk <ESC>

" NERDtree config
nmap <leader>d :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" Airline theme
" let g:airline_theme='term'
