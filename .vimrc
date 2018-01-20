" **************************************
" * VARIABLES
" **************************************
set nocompatible                    " get rid of strict vi compatibility!
set nu				                      " line numbering on
set si				                      " smartindent on
set noerrorbells		                " bye bye bells :)
set modeline			                  " show what I'm doing
set showmode			                  " show the mode on the dedicated line (see above)
set nowrap			                    " no wrapping!
set ignorecase			                " search without regards to case
set backspace=indent,eol,start	    " backspace over everything
set fileformats=unix,dos,mac	      " open files from mac/dos
set exrc			                      " open local config files
set nojoinspaces		                " don't add white space when I don't tell you to
set ruler			                      " which line am I on?
set showmatch			                  " ensure Dyck language
set incsearch			                  " incremental searching
set nohlsearch			                " meh
set bs=2			                      " fix backspacing in insert mode
set bg=light
set mouse=a			                    " allow mouse clicks
set tabpagemax=100		              " allow up to 100 tabs opened when using -p flag
set formatoptions+=r		            " auto asterisk in C style block comments

syntax on

" change tabstop width for python files
autocmd BufRead,BufNewFile *.py set tabstop=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4

" Expand tabs in C files to spaces
au BufRead,BufNewFile *.{c,h,java} set expandtab
au BufRead,BufNewFile *.{c,h,java} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java} set tabstop=2

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>

" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

" Colorschemes
set background=dark
colorscheme onedark

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
let g:syntastic_check_on_wq = 1
let g:syntastic_java_javac_config_file_enabled = 1

" Enable c++11 standards
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1

" Auto Completion ************** TOO LAGY
" Plugin 'Valloric/YouCompleteMe'
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" YCM gives you popups and splits by default that some people might not like,
" so these should tidy it up a bit for you.
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"set completeopt-=preview

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" This wraps lines at 80 characters 
set textwidth=80
set colorcolumn=80

" set cursor for lines
set cursorline

" Line numbers
set number

" Enables mouse
"set mouse=a

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
let g:airline_theme='term'


" Insert a file header (UC San Diego CSE 11 version) via F9
function FileHeading()
	let s:line=line(".")
	call setline (s:line,   "/*")
	call append  (s:line,   " * Filename: " .expand("%"))
	call append  (s:line+1, " * Author: TODO")
	call append  (s:line+2, " * Userid: cs11fxxx")
	call append  (s:line+3, " * Description: TODO")
	call append  (s:line+4, " * Date: " .strftime("%b %d %Y"))
	call append  (s:line+5, " * Sources of Help: TODO")
	call append  (s:line+6, " */")
	unlet s:line
endfunction

imap <F9> <ESC>mz:execute FileHeading()<CR>

" Method Header
function MethodHeading()
  let s:line=line('.')
  call setline(s:line, "/**")
  call append(s:line, "* Function Name: ")
  call append(s:line+1, "* Method Signature: ")
  call append(s:line+2, "* Description: ")
  call append(s:line+3, "* Parameters: ")
  call append(s:line+4, "* Return Value: ")
  call append(s:line+5, "*/")
  unlet s:line
endfunction

