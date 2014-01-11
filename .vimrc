set nocompatible
" Better copy & paste
" set pastetoggle=<F2>
" Mouse and backspace
set mouse=a     " on OSX press ALT and click
set bs=2        " make backspace behave like normal again
" Rebind <leader> key
let mapleader = ","
let g:mapleader = ","
" Bind nohl
" Remove highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" Quick save command
" noremap <C-Z> :update<CR>
" noremap <C-Z> <C-C>:update<CR>
" noremap <C-Z> <C-O>:update<CR>
" Quick quit command
noremap <Leader>e :quit<CR>     " Quit current window
noremap <Leader>E :qa!<CR>      " Quit all windows
noremap <Leader>q :bd!<CR>      " Quit buffer
" Quick saveing
noremap <Leader>w :w!<CR>
" Easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
" bind Ctrl<movment> keys to move around the windowds, instead of using Ctrl+w
" + <movment>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" Map sort function to a key
vnoremap <Leader>s :sort<CR>
" Show whitespace
" MUST be inserted BEFORE the colorscheme comm
" Color schmeme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    if has("gui_gtk2")
        set guifont=Monaco
    elseif has("gui_win32")
        set guifont=Monaco:h12
        " set guifont=Consolas:h11:cANSI
    endif
endif
" Automatically indent when adding a curly bracket, etc.
set smartindent
" Real programmers don't use TABs but spaces
" Tabs should be converted to a group of 4 spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
" Show line numbers and length
set number
set tw=79   " width of doucment (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
highlight ColorColumn ctermbg=233
" Easier formatting of paragraphs
vmap Q qq
nmap Q gqap
" Usefull settings
set history=700
set undolevels=700
" Enable syntax highlightling
filetype off
filetype plugin indent on
syntax on
" Disable sutpid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,cp936
set termencoding=utf-8
"set fileformats=unix
" set encoding=prc
set encoding=utf-8
" Return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim.bundle
" curl -so ~/.vim/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags()
" =====================
" Python IDE Setup
" Settings for vim-powerlin
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" Always show the status line
set laststatus=2
" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_hegiht = 30
set wildignore+=*.pyc
set wildignore+=build/*
set wildignore+=*/lib/*
set wildignore+=_build/*
set wildignore+=*/coverage/*
" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
" Settings for zen code
" cd ~/.vim/bundle
" git clone https://github.com/mattn/zencoding-vim.git
" Settings for snipmate
" cd ~/.vim/bundle
" git clone git://github.com/msanders/snipmate.vim.git
" cd ~/.vim/bundle/snipmate.vim/snippets
" download snipmate_for_django from https://github.com/robhudson/snipmate_for_django/downloads
" autocmd FileType python set ft=python.django " For SnipMate
" autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType htmldjango set ft=htmldjango.html " For SnipMate
" Setings for phpcomplete
" cd ~/.vim/bundle
" git clone https://github.com/shawncplus/phpcomplete.vim.git
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" NERDTree settings {{{
" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
" nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
" nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
" nnoremap <leader>N :NERDTreeClose<CR>
nnoremap <F2> : NERDTreeToggle<CR>
" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

" }}}
" TagList settings {{{
" nnoremap <leader>l :TlistClose<CR>:TlistToggle<CR>
" nnoremap <leader>L :TlistClose<CR>
nnoremap <silent> <F3> :TlistToggle<CR>
" quit Vim when the TagList window is the last open window
let Tlist_Exit_OnlyWindow=1         " quit when TagList is the last open window
let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the TagList window when it opens
"let Tlist_Process_File_Always=1     " process files in the background, even when the TagList window isn't open
let Tlist_Show_One_File=1           " only show tags from the current buffer, not all open buffers
let Tlist_WinWidth=30               " set the width
let Tlist_Inc_Winwidth=1            " increase window by 1 when growing
" shorten the time it takes to highlight the current tag (default is 4 secs)
" note that this setting influences Vim's behaviour when saving swap files,
" but we have already turned off swap files (earlier)
"set updatetime=1000
" the default ctags in /usr/bin on the Mac is GNU ctags, so change it to the
" exuberant ctags version in /usr/local/bin
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" show function/method prototypes in the list
let Tlist_Display_Prototype=0
" don't show scope info
let Tlist_Display_Tag_Scope=0
" show TagList window on the right
let Tlist_Use_Right_Window=1
" sort tag names by name not by the order
" let Tlist_Sort_Type = "name"
" }}}
imap <C-b> <Esc><Leader>lb
map <C-b> <Esc><Leader>lb
map <M-g> <Esc><Leader>lr
imap <M-g> <Esc><Leader>lr
map <C-g> <Esc><Leader>lg
imap <C-g> <Esc><Leader>lg
set nocompatible               " be iMproved
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
"  " required!
"   Bundle 'gmarik/vundle'
"
"    " My Bundles here:
let ropevim_vim_completion=1
source $VIMRUNTIME/mswin.vim
behave mswin
let g:pydiction_location = '/home/esam/.vim/bundle/pydiction/complete-dict'
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set omnifunc=syntaxcomplete#Complete
"inoremap <TAB> <C-X><C-O>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
nnoremap j gj
nnoremap k gk
colorscheme obsidian2
autocmd BufWritePre * :%s/\s\+$//e
nnoremap <CR> :noh<CR><CR>
set list listchars=tab:→\ ,trail:·
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"inoremap <TAB> <c-x><c-o>
nnoremap <C-J> <C-W>j<C-W><C-_>
se ff=unix
nnoremap <C-K> <C-W>k<C-W><C-_>
set undofile                " Save undo's after file closes
set undodir=~/.vimundo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
set showcmd
set scrolloff=3
set updatecount=50
set showmatch matchtime=3
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
  if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
    \	if &omnifunc == "" |
    \	 setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
    endif
set relativenumber
"autocmd BufReadPost * tab ball

" end of Esam config
" from desktop office

highlight Cursor guibg=orange
highlight Cursor guifg=black


set switchbuf=usetab
inoremap jj <Esc>j
inoremap lll <Esc>l
inoremap hh <Esc>h
inoremap ww <Esc>w
inoremap dw <Esc>diwi
inoremap kk <Esc>k
inoremap bb <Esc>:bd!<CR>
set hidden
set autoindent    " always set autoindenting on
set incsearch     " show search matches as you type
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR> " clear seach
cmap w!! w !sudo tee % >/dev/null " sudo

let g:EasyMotion_mapping_f = '<M-f>'
let g:EasyMotion_leader_key = '<Leader>'
imap æ <ESC><M-f>


" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
noremap <c-l> <c-w>l
"move between buffers
nnoremap <leader><leader> <c-^>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion. tw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-x>\<C-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<cr>
" Vimux
map <silent> <LocalLeader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <LocalLeader>vi :wa<CR> :VimuxInspectRunner<CR>
map <silent> <LocalLeader>vk :wa<CR> :VimuxInterruptRunner<CR>
map <silent> <LocalLeader>vx :wa<CR> :VimuxClosePanes<CR>
map <silent> <LocalLeader>vp :VimuxPromptCommand<CR>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['red',         'firebrick3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
nnoremap <leader>y :YRShow<CR>
au FocusLost * :wa ""auto save on lossing foucs
cmap qq qa!<CR>
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
set list
set listchars=tab:▸\
" Forward/back one file...
nmap <DOWN> :next<CR>0
nmap <UP>   :prev<CR>0
nmap <silent> <RIGHT>         :cnext<CR>
nmap <silent> <RIGHT><RIGHT>  :cnf<CR><C-G>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <LEFT><LEFT>    :cpf<CR><C-G>
set switchbuf=useopen
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
inoremap <M-o> :LustyFilesystemExplorerFromHere

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()
"remove white space
autocmd BufWritePre * :%s/\s\+$//e
"indentline
let g:indentLine_color_gui = '#CC9900'
let g:indentLine_char = '┆'
"this is my new file<c-o>
" enter current dir of file
set autochdir
au BufNewFile,BufRead,BufReadPost *.twig set syntax=HTML
au BufNewFile,BufRead,BufReadPost *.py set makeprg=python\ %
autocmd BufRead *.py nmap <F5> :!python %<CR>
" File opening {{{2
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
xnoremap . :normal .<CR>
"set clipboard as default
set clipboard=unnamed,unnamedplus
" Fast saving
nmap <leader>w :w!<cr>
"ignore compiled files
set wildignore=*.o,*~,*.pyc
set encoding=utf8
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
"close all opened buffers
map <leader>ba :1,1000 bd!<cr>
"remap 0 to first non blocking characters
map 0 ^
map e $

let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python', 'php'],
                           \ 'passive_filetypes': ['puppet'] }
let g:syntastic_python_checkers=['flake8']


""" Powerline
"
hi Search guibg=LightBlue
highlight ErrorMsg guibg=White guifg=Red
let g:vim_debug_disable_mappings = 1
imap AA <Esc>A
imap oo <Esc>o
imap OO <Esc>O
imap aa <Esc>A

map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR
