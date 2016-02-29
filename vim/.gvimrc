"COLOR SCHEME
syntax enable
set background=dark
colorscheme solarized
"colorscheme github
set synmaxcol=0

"FONT - DEFAULT IS MENLO REGULAR 11 ON MAC OSX
set guifont=Menlo\ Regular:h16

"TAB SPACING
"http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set expandtab		" insert space characters whenever the tab key is pressed
set tabstop=4		" number of space characters that will be inserted when the tab key is pressed
set shiftwidth=4	" number of space characters inserted for indentation
set softtabstop=4	" makes the backspace key treat the four spaces like a tab

"FILE SPECIFIC
" disable for now
" autocmd BufEnter *.html,*.js,*.html set tabstop=2 shiftwidth=2 softtabstop=2


"AUTO INDENT/FORMAT
"http://vim.wikia.com/wiki/Indenting_source_code
set smartindent

"RESTORE `#` INDENTS
"http://stackoverflow.com/questions/2063175/
"http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
inoremap # X<c-h>#

"ENABLE FILETYPE MENU
let do_syntax_sel_menu = 1|runtime! synmenu.vim|aunmenu &Syntax.&Show\ filetypes\ in\ menu

"SYNTAX COLOR - MacVim.app/Contents/Resources/vim/runtime/syntax/
autocmd BufRead,BufNewFile  *.as set filetype=actionscript	    " ActionScript
autocmd BufRead,BufNewFile  *.ctp set filetype=php			    " Cake Template
autocmd BufRead,BufNewFile  *.pyt set filetype=htmldjango	    " Python Template
autocmd BufRead,BufNewFile  *.pytxt set filetype=htmldjango	    " Python Template
autocmd BufRead,BufNewFile  *.pss set filetype=pss	            " PHP CSS
autocmd BufRead,BufNewFile  *.conf set filetype=nginx	        " Nginx -> http://www.vim.org/scripts/script.php?script_id=1886
autocmd BufRead,BufNewFile  *.jade set filetype=jade	        " Jade -> https://github.com/digitaltoad/vim-jade
autocmd BufRead,BufNewFile  .gitignore set filetype=gitconfig	" gitignore

"SHOW LINE NUMBERS
set number

"ALWAYS SHOW TAB BAR
set showtabline=2

"ENABLE HORIZONTAL SCROLLBAR
set nowrap
set go+=b

"CODE FOLDING
"set foldmethod=indent
"set foldnestmax=10
"set foldlevel=1

"BEHAVE LIKE WINDOWS
source $VIMRUNTIME/mswin.vim
behave mswin

"SELECT NEXT/PREVIOUS TAB
"NOTE - to auto insert mode after tab switch, add i at end of every <CR>, e.g., noremap <C-Tab> :tabnext<CR>i
noremap <C-Tab> :tabnext<CR>i
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>i
noremap <C-S-Tab> :tabprev<CR>i
inoremap <C-S-Tab> <C-\><C-N>:tabprev<CR>i

"SELECT SPECIFIC TAB
noremap <D-1> :tabn 1<CR>
inoremap <D-1> <C-\><C-N>:tabn 1<CR>
noremap <D-2> :tabn 2<CR>
inoremap <D-2> <C-\><C-N>:tabn 2<CR>
noremap <D-3> :tabn 3<CR>
inoremap <D-3> <C-\><C-N>:tabn 3<CR>
noremap <D-4> :tabn 4<CR>
inoremap <D-4> <C-\><C-N>:tabn 4<CR>
noremap <D-5> :tabn 5<CR>
inoremap <D-5> <C-\><C-N>:tabn 5<CR>
noremap <D-6> :tabn 6<CR>
inoremap <D-6> <C-\><C-N>:tabn 6<CR>
noremap <D-7> :tabn 7<CR>
inoremap <D-7> <C-\><C-N>:tabn 7<CR>
noremap <D-8> :tabn 8<CR>
inoremap <D-8> <C-\><C-N>:tabn 8<CR>
noremap <D-9> :tabn 9<CR>
inoremap <D-9> <C-\><C-N>:tabn 9<CR>
noremap <D-0> :tablast<CR>
inoremap <D-0> <C-\><C-N>:tablast<CR>

"SWP/BACKUP FILES
set dir=/private/tmp
set backupdir=/private/tmp

"DISABLE RECORD/PLAY
nnoremap q <Nop>
