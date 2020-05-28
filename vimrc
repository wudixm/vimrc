set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS—Mark-and-Highlight-Full-Lines' invalid name
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'luochen1990/rainbow'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'morhetz/gruvbox'

"snip mate
Plugin 'MarcWeber/vim-addon-mw-utils'

Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'ervandew/supertab'

" Optional:
Plugin 'honza/vim-snippets'

" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'


" git git gutter
Plugin 'airblade/vim-gitgutter'

" formatting
Plugin 'Chiel92/vim-autoformat'

" color scheme
Plugin 'dracula/vim'
Plugin 'haishanh/night-owl.vim'

" change  输入法
Plugin 'myshov/xkbswitch-macosx'
Plugin 'myshov/libxkbswitch-macosx'
Plugin 'lyokha/vim-xkbswitch'

" 0403 自己加 gutentags
Plugin 'ludovicchabant/vim-gutentags'

" 2019-04-24 从vim awesome 上看到的syntastic
Plugin 'scrooloose/syntastic'

" 2019-05-01 hardtime不用arrow key hjkl 等在vim 中
" Plugin 'takac/vim-hardtime'


" 2019-05-24 整合fugitive 和 nerdtree
Plugin 'low-ghost/nerdtree-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

Plugin 'scrooloose/nerdtree'

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme Zenburn
endif


"""""""""""""""""""""""""""""""
"original
set nocompatible
set number
set relativenumber
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256
set autoindent
set cursorline
set laststatus=2
set ruler
set hlsearch
set incsearch
set ignorecase
set spell spelllang=en_us
set wildmenu
set wildmode=longest:list,full
set tags=tags

"How can I open a NERDTree automatically when vim starts up?
"autocmd vimenter * NERDTree


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"execute pathogen#infect()

nmap <F5> :NERDTreeToggle<cr>

syntax on
filetype plugin indent on

filetype indent on

filetype plugin on

"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" minibuffer explorer
" let g:miniBufExplMapCTabSwitchBufs = 1
map <F3> :bnext<CR>
map <F2> :bprev<CR>

" move curser among windows
"
"nnoremap <F3> :ls
"nnoremap ,s :grep <C-R><C-W> *<CR>


" 自己mapping something
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>w
map <C-K> <C-W>W
map j gj
map k gk
vnoremap g/ y/<C-R>"<CR>
vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
vnoremap q9 <Esc>`>a)<Esc>`<i(<Esc>
vnoremap q' <Esc>`>a"<Esc>`<i"<Esc>





" only window left with nerttree untouched
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()

    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction

command! Only call OnlyAndNerdtree()


let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
            \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \ 'operators': '_,_',
            \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \ 'separately': {
            \   '*': {},
            \   'tex': {
            \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \   },
            \   'lisp': {
            \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \   },
            \   'vim': {
            \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \   },
            \   'html': {
            \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \   },
            \   'css': 0,
            \ }
            \}



"
" 配色方案
"set background=dark
"colorscheme desert
"colorscheme solarized
"colorscheme molokai
"colorscheme phd
"colorscheme dracula
"colorscheme night-owl

set bg=dark                     "设置背景为黑色
colorscheme gruvbox             "设置主题为 gruvbox
set guioptions=                 "去掉两边的scrollbar
set guifont=Monaco:h17          "设置字体和字的大小

" snip mate
"`autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"`autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"`autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"`:imap <S-tab> <c-x><c-o>
"
" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"
"" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" vim folding
let g:vim_markdown_folding_disabled = 1



" indent

syntax enable
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab



" formatting
noremap <F4> :Autoformat<CR>


" nerd commenter
let mapleader=","
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
let g:ycm_key_select_completion = '<Enter>'
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

let g:Powerline_cache_enabled = 0
let g:Powerline_symbols = 'fancy'

" set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly
let g:airline_powerline_fonts=1

let g:Powerline_symbols = 'unicode'
tnoremap <Esc> <C-W>N

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't use <tab> to cycle thru PUM, use ^n and ^p as we're used to doing.
" This also solves problems with using UltiSnips simultaneously, which uses
" <tab> as its default trigger.
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" read tags file
let g:ycm_collect_identifiers_from_tags_files = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" disable scratch preview
set completeopt-=preview

" set tags=./tags,tags;$HOME
" set tags+=tags;/
" set tags=/Users/wuxiaoming/local/codes/work/cv/tags
set autochdir
set tags=./tags,tags;$HOME

" Alt-right/left to navigate forward/backward in the tags stack
" Alt 键在vim 中好像用不了，有可能跟manico 冲突
" map <M-3> <C-o>
" map <C-4> <C-]>
" nmap <A-3> <C-o>
" nmap <A-4> <C-]>

" gutentags 配置 0403
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" hardtime
" let g:hardtime_default_on = 1
" let g:hardtime_showmsg = 1
" let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
" let g:hardtime_ignore_quickfix = 1


" 基础设置 basic settings ------------------------------------------------------------------
" 基础设置 basic settings ------------------------------------------------------------------
" 基础设置 basic settings ------------------------------------------------------------------
" 基础设置 basic settings ------------------------------------------------------------------
" 基础设置 basic settings ------------------------------------------------------------------
" 基础设置 basic settings ------------------------------------------------------------------
"
" set transparency=0    "透明背景 0 是全黑，本来是给macvim 用的，直接配置到~/.gvimrc 文件里就可以

" 文件有改动的时候，总弹窗提示需要重新载入，autoread 不再弹窗，详情 :help W11
set autoread












" 文件类型相关设置 FileType-Specific settings ----------------------------------------------
" 文件类型相关设置 FileType-Specific settings ----------------------------------------------
" 文件类型相关设置 FileType-Specific settings ----------------------------------------------
" 文件类型相关设置 FileType-Specific settings ----------------------------------------------
" 文件类型相关设置 FileType-Specific settings ----------------------------------------------

autocmd BufNewFile,BufRead *.html setlocal nowrap
" 使得无论你在什么时候编辑HTML文件自动换行都会被关闭。

"  映射 mappings ----------------------------------------------------------------------------
"  映射 mappings ----------------------------------------------------------------------------
"  映射 mappings ----------------------------------------------------------------------------
"  映射 mappings ----------------------------------------------------------------------------
"  映射 mappings ----------------------------------------------------------------------------
"
"
" 上面map 过leader key 为,
nnoremap L Lzz<CR>
nnoremap H Hzz<CR>
inoremap jk <esc>
" inoremap <esc> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fugivive  自己改了下
nnoremap :Gpush :Gpush<CR> :q<CR> <C-W>W


" 去掉搜索的highlight 20190418
nnoremap <Leader><space> :noh<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>hbi`<esc>lel
vnoremap <leader>' `><esc>a'<esc>`<i'<esc>`>

" 状态条 status line -----------------------------------------------------------------------
" 状态条 status line -----------------------------------------------------------------------
" 状态条 status line -----------------------------------------------------------------------
" 状态条 status line -----------------------------------------------------------------------
" 状态条 status line -----------------------------------------------------------------------

" vim syntastic  20190424
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
