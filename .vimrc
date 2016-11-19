syntax on
colorscheme desert
" This wraps lines at 80 characters 
set textwidth=80 

"line numbers
set number

" Sets tabs to be 2 characters instead of the default which is 8. 
set tabstop=2 

" Number of spaces to use for each step of (auto)indent. 
set shiftwidth=2 

" Tells vim to use spaces instead of tabs 
set expandtab 

" Tells vim to use c-style indenting 
set cindent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Highlights characters exceeding 80
match Error /\%81v.\+/

" / bracket autocompletions /
inoremap { {<CR>}<Esc>ko
inoremap ( ()<Esc>i
inoremap [ []<Esc>i

" / remap common keystrokes /
inoremap PFSD private final static double
inoremap PFSI private final static  int
inoremap PV private void
inoremap syso System.out.println();<esc>hi
inoremap PSVM private static void main(String[] args)
inoremap /** /**<S-Enter><BACKSPACE>* <S-Enter>*/<Esc>kli
inoremap // //

" To create a javadoc comment above the current line
nnoremap Zc O/**<CR><BS>*<CR>*/<UP><SPACE>

inoremap <C-D> <Esc>Vypi<end>

" Type in jk while in insert mode to escape insert mode
inoremap jk <ESC>

" Additional colorschemes
" colorscheme base16-default-dark

" Pathogen execution
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
