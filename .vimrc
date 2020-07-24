set colorcolumn=81
set number
set wrap
set linebreak
set breakindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=1000 ttimeoutlen=0
set hlsearch
set background=dark
filetype plugin on
highlight LineNr ctermfg=grey
syntax on

map <Leader>1 :tabn 1<CR>
map <Leader>2 :tabn 2<CR>
map <Leader>3 :tabn 3<CR>
map <Leader>4 :tabn 4<CR>
map <Leader>5 :tabn 5<CR>
map <Leader>6 :tabn 6<CR>
map <Leader>7 :tabn 7<CR>
map <Leader>8 :tabn 8<CR>
map <Leader>9 :tabn 9<CR>
map <Leader>0 :tabn 10<CR>

" VIM-PLUG -------------------------------------------------------------------

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
let g:plug_timeout=912
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git',
            \ { 'do':'python3 install.py --clangd-completer --all' }
Plug 'https://github.com/preservim/nerdcommenter.git'
Plug 'itchyny/lightline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdtree'
Plug 'haya14busa/incsearch.vim'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'tpope/vim-surround'
call plug#end()

" YCM ------------------------------------------------------------------------

set completeopt=longest,menu

let g:ycm_global_ycm_extra_conf =
            \ '/home/sterdam/.vim/plugged/YouCompleteMe
            \ /third_party/ycmd/.ycm_extra_conf.py'

map <F6> :YcmCompleter FixIt<CR>

map <F7> :YcmCompleter GoTo<CR>
map <C-F7> :YcmCompleter GoToDefinition<CR>
map <S-F7> :YcmCompleter GoToDeclaration<CR>
map <M-S-F7> :YcmCompleter GoToReferences<CR>

map <F8> :YcmCompleter GetType<CR>
map <C-F8> :YcmCompleter GetDoc<CR>

" NERD-COMMENTER -------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDCustomDelimiters = {
            \ 'c': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '//' },
            \ 'cpp': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '//' },
            \ 'sh': { 'left': '#' }, '': {'left': '"'} }
map <F12> <plug>NERDCommenterToggle
map <M-F12> <plug>NERDCommenterAltDelims
map <S-F12> <plug>NERDCommenterSexy

" VIM-AUTOFORMAT -------------------------------------------------------------

let g:python3_host_prog = '/usr/bin/python3'
map <F5> :Autoformat<CR>

" NERDTREE -------------------------------------------------------------------

map <F2> :NERDTreeToggle<CR>

" INCSEARCH ------------------------------------------------------------------

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" SYNTASTIC ------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

map <F3> :call SyntasticToggle()<CR>

function! SyntasticToggle()
  let g:wi = getloclist(2, {'winid' : 1})
  if g:wi != {}
    lclose
  else
    Errors
  endif
endfunction

" POWERLINE ------------------------------------------------------------------

set laststatus=2
set noshowmode

" VIM-LATEX-LIVE-PREVIEW -----------------------------------------------------

map <F4> :LLPStartPreview<CR>
