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
inoremap /** /**<S-Enter>* <S-Enter>*/<Esc>kli
inoremap // //

inoremap <C-D> <Esc>Vypi<end>
