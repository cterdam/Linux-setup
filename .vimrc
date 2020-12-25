set colorcolumn=81
set number
set relativenumber
set wrap
set linebreak
set breakindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=1000 ttimeoutlen=0
set scrolloff=5
set hlsearch
set background=dark
set clipboard=unnamedplus

syntax on
filetype plugin on
highlight LineNr ctermfg=grey

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
map <Leader>= :tabn<CR>
map <Leader>- :tabp<CR>
map <Leader>e :tabe<CR>

" VIM-PLUG -------------------------------------------------------------------

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

let g:plug_timeout=912
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe',
            \ { 'do':'python3 install.py --clangd-completer --all' }
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdtree'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-surround'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 't9md/vim-choosewin'
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-speeddating'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'sillybun/vim-repl'

call plug#end()

" YCM ------------------------------------------------------------------------

set completeopt=longest,menu

let g:ycm_global_ycm_extra_conf =
            \ '/home/sterdam/.vim/plugged/YouCompleteMe
            \ /third_party/ycmd/.ycm_extra_conf.py'

map <Leader>inc :YcmCompleter GoToInclude<CR>
map <Leader>dec :YcmCompleter GoToDeclaration<CR>
map <Leader>def :YcmCompleter GoToDefinition<CR>
map <Leader>ref :YcmCompleter GoToReferences<CR>
map <Leader>imp :YcmCompleter GoToImplementation<CR>
map <Leader>gtt :YcmCompleter GoToType<CR>

map <Leader>get :YcmCompleter GetType<CR>
map <Leader>par :YcmCompleter GetParent<CR>
map <Leader>doc :YcmCompleter GetDoc<CR>

map <Leader>fix :YcmCompleter FixIt<CR>
map <Leader>for :YcmCompleter Format<CR>
map <Leader>org :YcmCompleter OrganizeImports<CR>

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

" VIM-AUTOFORMAT -------------------------------------------------------------

let g:python3_host_prog = '/usr/bin/python3'
map <F4> :Autoformat<CR>

" NERDTREE -------------------------------------------------------------------

map <F3> :NERDTreeToggle<CR>

" INCSEARCH ------------------------------------------------------------------

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" SYNTASTIC ------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

map <F1> :SyntasticToggleMode<CR>
map <F2> :call SyntasticToggle()<CR>

function! SyntasticToggle()
    let g:wi = getloclist(2, {'winid' : 1})
    if g:wi != {}
        lclose
    else
        Errors
        lopen
    endif
endfunction

" POWERLINE ------------------------------------------------------------------

set laststatus=2
set noshowmode

" VIM-MARKDOWN-PREVIEW -------------------------------------------------------
" Use Ctrl+P to preview Github-flavored Markdown, but with some latency

let vim_markdown_preview_github=1

" VIM-CHOOSEWIN --------------------------------------------------------------

nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" VIM_REPL -------------------------------------------------------------------

let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <Leader>repl :REPLToggle<Cr>
let g:repl_position = 3
