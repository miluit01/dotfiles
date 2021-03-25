set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" CtrlP
Plugin 'kien/ctrlp.vim'
" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
" YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'
" YCM generator
Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" iceberg
Plugin 'cocopon/iceberg.vim'
" git integration
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
" powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"---- General settings --------------------------------------
set nu
set ruler
set encoding=utf-8
syntax enable
syntax on

set showcmd
set showmatch

set autoindent
set cindent

set hlsearch
set ignorecase

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set matchtime=2

set switchbuf=usetab,newtab
set noexpandtab
nnoremap <F2> :sbnext<CR>
let notabs=1
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

set splitbelow
set splitright

colorscheme iceberg

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"move line
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"inoremap <C-j> <ESC>:m .+1<CR>==gi
"inoremap <C-k> <ESC>:m .-2<CR>==gi
"vnoremap <C-j> :m '>+1<CR>gv=gv'
"vnoremap <C-k> :m '<-2<CR>gv=gv'

"---- Programming language settings -------------------------
"---- Plugin settings ---------------------------------------
" ctrlp
let g:ctrlp_uer_command='find %s -type f'

" nerdtree
silent! nmap <C-n> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let g:NERDTreeShowHidden=1
" close if only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '↳'  
let g:NERDTreeDirArrowCollapsible = '↴'

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_goto_buffer_command = 'vertical-split'
" turn on completion in comments
let g:ycm_complete_in_comments=1
" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
" only show completion as a list instead of a sub-window
"set completeopt-=preview
" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
" don't cache completion items
let g:ycm_cache_omnifunc=0
" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
" c++ config
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
" ycm shortcuts for goto
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" The color settings must be at the end of file
hi! Normal ctermbg=NONE guibg=NONE
hi LineNr ctermfg=blue ctermbg=black
hi Visual cterm=bold ctermbg=blue ctermfg=Black
hi Search cterm=bold ctermbg=lightyellow ctermfg=Black
hi DiffAdd cterm=bold ctermbg=Red ctermfg=White
hi DiffDelete cterm=bold ctermbg=White ctermfg=Black
hi DiffText cterm=bold ctermbg=Yellow ctermfg=Black
hi DiffChange cterm=bold ctermbg=darkblue ctermfg=Black
hi MatchParen cterm=underline ctermbg=Black ctermfg=lightyellow
hi StatusLine ctermbg=White ctermfg=DarkGrey
hi Pmenu ctermbg=DarkGrey ctermfg=Yellow
set cursorline
hi CursorLine cterm=bold ctermbg=black
