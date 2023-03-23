" Anna Kallagard's vimrc


" PLUGINS (Plug)---------------------------------------------------------------

" Needed for stuff
filetype plugin indent on

" Install plugins
call plug#begin('~/.config/nvim')
        
    " Ultisnips + Default snippets for UltiSnips/SnipMate
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    
    " Vimtex - make vim latexyy
    Plug 'lervag/vimtex'

    " VimWiki
    Plug 'vimwiki/vimwiki'
    Plug 'tbabej/taskwiki'
    Plug 'blindFS/vim-taskwarrior'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    " For faster tag search
    Plug 'jremmen/vim-ripgrep'

    " Calendar
    Plug 'mattn/calendar-vim'

    " Color from Wal
    Plug 'dylanaraps/wal.vim'

    " All plugins must be added before the following line
call plug#end()
"------------------------------------------------------------------------------

" Status line
set statusline=anapana
set statusline+=\ %M
"set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F
set statusline+=%=
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
set statusline+=\ [%n]


" UltiSnips 
set rtp+=/home/anapana/current_course
set rtp+=/home/anapana/Documents/notes

" Trigger, forward + backward jump
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-b>"


" VimTex 
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdg'

" Include figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>


" vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1



" Setup vimwiki ---------------------
set nocompatible
filetype plugin on
syntax on

let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_key_mappings = { 'table_mappings': 0, }

" Wiki settings
let wiki_default = {}
let wiki_default.auto_tags = 1
let wiki_default.auto_generate_tags = 1
let wiki_default.auto_generate_links = 1
let wiki_default.auto_diary_index = 1
let wiki_default.auto_toc = 1

let home_wiki = copy(wiki_default)
let home_wiki.path = '~/Documents/notes/personal/'
let home_wiki.diary_rel_path = 'diary/'
let home_wiki.syntax = 'markdown'
let home_wiki.ext = '.md'

let obsidian_wiki = copy(wiki_default)
let obsidian_wiki.path = '~/Documents/notes/obsidian/'
let obsidian_wiki.diary_rel_path = 'diary/'
let obsidian_wiki.syntax = 'markdown'
let obsidian_wiki.ext = '.md'

let family_wiki = copy(wiki_default)
let family_wiki.path = '~/Documents/notes/family/'
let family_wiki.diary_rel_path = 'logbook/'
let family_wiki.path_html = '~/Documents/notes/family/html'
let family_wiki.template_path = '~/Documents/notes/family'
"let family_wiki.template_default = 'template'
"let family_wiki.template_ext = '.html'

let exjobb_wiki= copy(wiki_default)
let exjobb_wiki.path = '~/Documents/wiki_exjobb'
let exjobb_wiki.diary_rel_path = 'diary/'
let exjobb_wiki.path_html = '~/Documents/wiki_exjobb/html/'
let exjobb_wiki.syntax = 'markdown'
let exjobb_wiki.ext = '.md'


let g:vimwiki_list = [obsidian_wiki, exjobb_wiki, home_wiki, family_wiki]

" End - vimwiki

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd             " Show command in bottom bar
set laststatus=2        " Display last status line always
set wildmenu            " To switch between files

" Set relative  and absolute line numbering at current line
set relativenumber
set number

" Search options
set ignorecase
set smartcase
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

" Unsets last search pattern
nnoremap <CR> :noh<CR><CR> 

" Enable UTF-8 encoding
set encoding=utf-8

" Keep a backup file
set backup

" Always show cursor position
set ruler

" Number of command lines kept in history
set history=50

" Display incomplete commands
set showcmd

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable mouse support if available
if has('mouse')
    set mouse=a
endif

" Using tabs in nvim
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>

" To save with ctrl+s in nvim 
:nmap <c-s> :w<CR>
:imap <c-s> <ESC>:w<CR>a

" Spell check
"setlocal spell
set spell spelllang=en_gb
nnoremap <silent> <F3> :set spell!<CR>
inoremap <silent> <F3> <C-O>:set spell!<CR>

"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Copy visual to clipboard with \y
vmap <C-c> "+y

" Undodir
if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.config/nvim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Go to Normal Mode with jj
inoremap jj <Esc>

" Color settings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlightng
syntax enable
set showmatch           " Highlight matching ({[]})
set cursorline          " Highlight current line
set colorcolumn=80      " Always highlight the 80th column

" Color scheme
set background=dark
"colorscheme badwolf   "color scheme, want koehler on black, badwolf
colorscheme wal

" Set tabs
set tabstop=8           " Number of visual spaces per TAB
"set softtabstop=4       " Number of spaces in TAB when editing
set shiftwidth=8       " Number of spaces per TAB using '>'
"set expandtab           " Convert tabs to spaces
set noexpandtab


