set nocompatible              " be iMproved, required
filetype off                  " required
set number
set tabstop=4
set shiftwidth=4
set expandtab

" NOTE: Make sure that you create the following directories
" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.
"
" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-n> :NERDTreeToggle<CR>

" If you open a directory, auto-show NERDTree so it's IDE-like
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close NERDTree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1

Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'

" To get eslint to run with airbnb's config, globally install the packages
" based on the dependencies - example at  https://www.npmjs.com/package/eslint-config-airbnb
" alternatively, you can add a script in here to detect local npms
Plugin 'vim-syntastic/syntastic'
let g:syntastic_javascript_checkers = []
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') !=# '' ? ['eslint'] : []

let g:syntastic_disabled_filetypes = ['scss']
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_debug = 3

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'

Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'

Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'dNitro/vim-pug-complete'

" All of your Plugins must be added before the following line
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
