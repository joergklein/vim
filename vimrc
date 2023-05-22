" Vimrc Version 0.1.0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/AutoComplPop'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
call plug#end()

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax')
  syntax enable
endif

colorscheme default                                                 " use this colorscheme
set encoding=utf-8                                                  " set utf-8
set nocompatible                                                    " use vim defaults
set viminfo=                                                        " turn off logging while using vim
set ls=2                                                            " allways show status line
set ruler                                                           " show the cursor position all the time
set nobackup                                                        " do not keep a backup file
set t_vb=                                                           " no visual bell & flash
set number                                                          " show line numbers
set title                                                           " show title in console title bar
set ttyfast                                                         " smoother changes
set showcmd                                                         " display incomplete comands
set showmatch                                                       " show matching bracket
set wrapscan                                                        " wrap the scan around the document
set list                                                            " show the end of the line as $
set listchars=eol:$,tab:>.,trail:~,extends:>,precedes:<,space:·     " set tabs and stops
set autoindent                                                      " set autoindent on
set cindent                                                         " indenting source code
set smartindent                                                     " set smartindent on
set tabstop=4                                                       " show existing tab with 4 spaces width
set shiftwidth=4                                                    " when indenting with '>', use 4 spaces width
set nofoldenable                                                    " no folding
set path +=**                                                       " search down into subfolder. tab completion
set wildmenu                                                        " display all matching files when we tab complete
set wildignore +=**/node_modules/**                                 " ignore node_modules
set hlsearch                                                        " highlight the search
set ignorecase                                                      " search ignoring case
set incsearch                                                       " incremental search
set diffopt=filler,iwhite                                           " ignore all whitespace and sync
set magic                                                           " set magic on, for regular expressions
set completeopt=menuone,longest                                     " complete opt
set textwidth=80                                                    " set text width to 80
call matchadd('ColorColumn', '\%80v.', 100)                         " make the 80st column stand out

" set leader key to thespace key
let mapleader = "\<Space>"

" Change between number, nonumber and relativenumber
nmap <silent> <leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Assignment of the F - keys
" F2 Start NERDTree
map <F2> :NERDTree <CR>

" F5 html-encode
function! HtmlEscape()
  silent s/ö/\&ouml;/eg
  silent s/ä/\&auml;/eg
  silent s/ü/\&uuml;/eg
  silent s/Ö/\&Ouml;/eg
  silent s/Ä/\&Auml;/eg
  silent s/Ü/\&Uuml;/eg
  silent s/ß/\&szlig;/eg
endfunction
map <silent> <F5> :call HtmlEscape()<CR>

" F6 Spell checker
" Install in the directory /usr/share/vim/vim/79/spell
let g:myLang = 0
let g:myLangList = ["OFF", "German", "English"]
function! ChangeSpellLang()
    if g:myLang == 0 | set nospell | endif
    if g:myLang == 1 | set spell spelllang=de_de | endif
    if g:myLang == 2 | set spell spelllang=en_us | endif
    echo "language:" g:myLangList[g:myLang]
    let g:myLang = g:myLang + 1
    if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
map <silent> <F6> :call ChangeSpellLang()<CR>
