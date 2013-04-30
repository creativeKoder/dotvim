 
set noautochdir

set nocompatible  
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" =============================================================================
" Bundles Go Here:
" =============================================================================
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/vim-scripts/grep.vim.git'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-unimpaired'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'

Bundle 'https://github.com/mklabs/vim-backbone.git'
Bundle 'https://github.com/kchmck/vim-coffee-script.git'
Bundle 'https://github.com/pangloss/vim-javascript.git'
Bundle 'https://github.com/hallison/vim-ruby-sinatra.git'
Bundle 'https://github.com/xaviershay/tslime.vim.git'
Bundle 'https://github.com/vim-scripts/TagmaTips.git'
Bundle 'https://github.com/vim-scripts/project.tar.gz.git'
Bundle 'https://github.com/vim-scripts/netrw.vim.git'

Bundle 'jslint.vim'
Bundle 'L9'
Bundle 'jQuery'
Bundle 'greplace.vim'
Bundle 'taglist.vim'
Bundle 'cocoa.vim'
Bundle 'rails.vim'
Bundle 'tComment'

Bundle 'http://github.com/gmarik/snipmate.vim.git'
Bundle 'https://github.com/sickill/vim-monokai.git'
Bundle 'https://github.com/rking/ag.vim.git'
Bundle 'https://github.com/motemen/git-vim.git'
Bundle 'https://github.com/tpope/vim-surround.git'
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'https://github.com/vim-scripts/Rename.git'
Bundle 'git://github.com/juvenn/mustache.vim.git'
Bundle 'https://github.com/tpope/vim-repeat.git'
Bundle 'git://github.com/godlygeek/tabular.git'
Bundle 'https://github.com/mattn/gist-vim.git'

"////////////////////////////////////////////////////////////////////////////


if exists(":Tabularize")
  nmap <Leader>=== :Tabularize /=<CR>
  vmap <Leader>=== :Tabularize /=<CR>
  nmap <Leader>::: :Tabularize /:\zs<CR>
  vmap <Leader>::: :Tabularize /:\zs<CR>
endif

let g:cssColorVimDoNotMessMyUpdatetime = 1

nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" NERDTree ********************************************************************
noremap <Leader>[[ :NERDTreeToggle<CR>


set clipboard=unnamed

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
  setl foldmethod=indent
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen


" =============================================================================

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ee :e $MYVIMRC<CR>
nmap <silent> <leader>so :so $MYVIMRC<CR>

" Use Node.js for JavaScript interpretation
let $JS_CMD='/usr/local/bin/node'

set hidden
let mapleader = "\\"
imap jj <Esc> " Professor VIM says '97% of users prefer jj over esc'

" CtrlP Fuzzy Find
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

nmap <Leader>]] :CtrlP<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links' }

" =============================================================================

"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set noexpandtab
  autocmd User Rails set softtabstop=2
  autocmd User Rails set shiftwidth=2
  autocmd User Rails set tabstop=2
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()

nmap <F4> :w<CR>:make<CR>:cw<CR>


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)

" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=2

" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map - <C-W>-
map = <C-W>+
map ; <C-W><
map ' <C-W>>>

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>vs :vsp^M^W^W<cr>
:noremap <Leader>hs :split^M^W^W<cr>

  " Code Folding ****************************************************************
set foldenable        " Turn on folding
set foldmethod=manual " Fold on the marker
set foldlevel=2      " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds


" Cursor highlights ***********************************************************
set cursorline
set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

:highlight Search cterm=underline gui=underline ctermbg=none guibg=none ctermfg=none guifg=none


" Colors **********************************************************************
set t_Co=256
set background=dark 
syntax on
colorscheme creativeKoder "Monokai calmar256-dark desert256 wombat256 summerfruit256 xoria256

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Visuals *********************************************************************
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler

" Line Wrapping ***************************************************************
set wrap
set linebreak  " Wrap at word

if !empty($MY_RUBY_HOME)
 let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif

" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
set directory=~/Library/Application\ Support/macvim/swap
set nobackup
set noswapfile

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h
"
au Bufread,BufNewFile *.hamstache set filetype=haml

" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype
set clipboard+=unnamed  " Yanks go on clipboard instead.
" autocmd FileType html :set filetype=xhtml

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>ii :set list!<CR> " Toggle invisible chars

" Misc settings ***************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
set foldmethod=manual " Turn off folding 

" Navigation ******************************************************************

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" Ruby stuff ******************************************************************

" Omni Completion *************************************************************
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css  set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml  set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php  set omnifunc=phpcomplete#CompletePHP
autocmd FileType c    set omnifunc=ccomplete#Complete
autocmd FileType sass set omnifunc=csscomplete#CompleteCSS


" May require ruby compiled in

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit
au BufRead,BufNewFile {jquery.*.js}                                   set ft=javascript syntax=jquery
au BufRead,BufNewFile {*.css,*.scss,*.sass}                           set ft=css 


au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
" " }}}


" Hard to type *****************************************************************
imap uuu _
imap hhh =>
imap aaa @
imap ffee ->
imap ppp ()

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

map <Leader>bc :Bclose<CR>

" autocomplpop *******************************************************
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

" Better code completion
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>


" railsvim ***************************************************************
map <Leader>ra :AS<CR>
map <Leader>rs :RS<CR>

" Leader shortcuts for Rails commands
map <Leader>rm :Rmodel 
map <Leader>rc :Rcontroller 
map <Leader>rv :Rview 
map <Leader>rh :Rhelper
map <Leader>rg :Rgenerate
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 
map <Leader>si :RSintegrationtest 

" Cucumber Leader Shortcuts
map <Leader>cf :call Send_to_Screen("cucumber -r features " . expand("%") . "\n")<CR>|
map <Leader>CF :call Send_to_Screen("cucumber" . "\n")<CR>|
map <Leader>wi :call Send_to_Screen("cucumber -r features --profile wip " . expand("%") . "\n")<CR>|

" Buffer Closing
nmap <C-W>! <Plug>Kwbd

" -----------------------------------------------------------------------------  
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"place in vimrc - tested on gvim 6.3
set magic
