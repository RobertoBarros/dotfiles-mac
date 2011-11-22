"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

call pathogen#infect()

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on
syntax enable

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" Use the first available 'tags' file in the directory tree
set tags=tags;/

"hide buffers when not displayed
set hidden

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"Gist-vim configuration https://github.com/mattn/gist-vim
let g:gist_clip_command = 'pbcopy'


"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Envia mais caracteres ao terminal, melhorando o redraw de janelas.
set ttyfast


"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist


" ==============================  Auto Commands  ===========================

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

"==========================================================================================


" """"""""""""""""""""""""""""""
" " => Visual mode related
" """"""""""""""""""""""""""""""
" " Really useful!
" "  In visual mode when you press * or # to search for the current selection
" vnoremap <silent> * :call VisualSearch('f')<CR>
" vnoremap <silent> # :call VisualSearch('b')<CR>

" " From an idea by Michael Naumann
" function! VisualSearch(direction) range
"     let l:saved_reg = @"
"     execute "normal! vgvy"

"     let l:pattern = escape(@", '\\/.*$^~[]')
"     let l:pattern = substitute(l:pattern, "\n$", "", "")

"     if a:direction == 'b'
"         execute "normal ?" . l:pattern . "^M"
"     elseif a:direction == 'f'
"         execute "normal /" . l:pattern . "^M"
"     endif

"     let @/ = l:pattern
"     let @" = l:saved_reg
" endfunction

cmap <C-R>/ <C-R>=substitute(substitute(@/, '^\\<', '', ''), '\\>$', '', '') <CR>
"Global search under cursor
nmap <leader>s :Ack <cword> <CR>

nmap z <C-w>o

"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l


"Mapeamento para o NERDTree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :call FindInNERDTree()<CR>

" Salva todos os buffers quando vim perde o foco
:au FocusLost * :wa

"TAB Repete o último comando de : (dois pontos)
nmap <TAB> :<UP><CR>

" Alterna entre os buffers usando command+alt+seta esquerda/direita
let macvim_skip_cmd_opt_movement = 1
map <D-M-Right> :bn!<CR>
map <D-M-Left> :bp!<CR>

"Navega entre as TABs usando command+alt+set up/down
map <D-M-Down> :tabn<CR>
map <D-M-Up> :tabp<CR>

"Use ALT+arrow to move between windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" SHIFT-CTRL-Tab is Previous window
noremap <S-C-Tab> <C-W>p
inoremap <S-C-Tab> <C-O><C-W>p
cnoremap <S-C-Tab> <C-C><C-W>p
onoremap <S-C-Tab> <C-C><C-W>p


" Maps Ctrl-Alt-Arrows to resizing a window split
map <silent> <C-A-Left> <C-w><
map <silent> <C-A-Up> <C-W>-
map <silent> <C-A-Down> <C-W>+
map <silent> <C-A-Right> <C-w>>


set ignorecase                         " Ignore case when searching
set smartcase                          " But be smart about it
set fileencodings=utf-8                " Default to using UTF-8
set confirm                            " Make vim ask you to yes/no confirm commands
"Have <esc> remove search highlighting
nnoremap <silent> <esc> :noh<return><esc>

let g:netrw_scp_cmd = "pscp.exe -pw <put pass here>" "For windows SSH


" Salva e dá refresh no browser ativo usando <leader>r
" Requer plugin https://github.com/mkitt/browser-refresh.vim
map <silent><leader>r :wa<CR>:RRB<CR>


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

iab NuM 12345678901234567890123456789012345678901234567890123456789012345678901234567890
iab RuL ----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8----+----9----+----0

" set filetype stuff to on
set nobackup
set noswapfile

"copy
vmap <F7> "+ygv"zy`>
"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`]
cmap <F7> <C-r><C-o>z
"copy register
autocmd FocusGained * let @z=@+


" Usando ENTER para sair do modo de inserção
" *** Não funciona aqui pois alguns plugins redefinem o <CR>
" *** Adicionar a linha abaixo no arquivo ~/.vim/after/plugin/after.vim
" inoremap <CR> <Esc>

"If you've opened a read-only file then :w!! lets you save it.
cmap w!! %!sudo tee > /dev/null %


"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
"Mostra a identação ( requer plugin https://github.com/nathanaelkane/vim-indent-guides)
nmap <Leader>id :IndentGuidesToggle<CR>


"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"bindings for taglist
nnoremap <silent> <leader>l :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

"turn off needless toolbar on gvim/mvim
set guioptions-=T

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set background=dark
    colorscheme railscasts2
    set guitablabel=%M%t

    if has("gui_gnome")
        set term=gnome-256color
        colorscheme railscasts2
        set guifont=Monospace\ Bold\ 12
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h14
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme railscasts2
    else
        colorscheme default
    endif
endif

" -------- StatusLine Setup --------
set laststatus=2

hi User1 gui=reverse guibg=#005F00
hi User2 gui=reverse guibg=#800000
hi User3 gui=reverse guibg=#870000
hi User4 gui=reverse guibg=#5F0000

set statusline=%f       "tail of the filename

"Git
set statusline+=%1*
set statusline+=%{fugitive#statusline()}
set statusline+=%*

"RVM
set statusline+=%2*
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%*

"Erros de Sintaxe
set statusline+=%3*
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=      "left/right separator

set statusline+=%c,     "cursor column

set statusline+=%l/%L   "cursor line/total lines

set statusline+=%4*
set statusline+=\ %P    "percent through file
set statusline+=%*
