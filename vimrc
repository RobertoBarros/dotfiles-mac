if has('win32')
  source ~/vimfiles/vimrc   "Source: https://github.com/akitaonrails/vimfiles
endif

if has('mac')
  source ~/.vim/vimrc
  colorscheme railscasts2
  "set guifont=Inconsolata:h16
endif


" Envia mais caracteres ao terminal, melhorando o redraw de janelas.
set ttyfast

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

noremap <Leader>s :update<CR>

set ignorecase                         " Ignore case when searching
set smartcase                          " But be smart about it
set fileencodings=utf-8                " Default to using UTF-8
set confirm                            " Make vim ask you to yes/no confirm commands

let g:netrw_scp_cmd = "pscp.exe -pw <put pass here>" "For windows SSH


" Salva e dá refresh no browser ativo usando <leader>r
" Requer plugin https://github.com/mkitt/browser-refresh.vim
map <silent><leader>r :wa<CR>:RRB<CR>


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


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

"Use ALT+arrow to move between windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


" Usando ENTER para sair do modo de inserção
" *** Não funciona aqui pois alguns plugins redefinem o <CR>
" *** Adicionar a linha abaixo no arquivo ~/.vim/after/plugin/after.vim
" inoremap <CR> <Esc>

"If you've opened a read-only file then :w!! lets you save it.
cmap w!! %!sudo tee > /dev/null %

"Have <esc> remove search highlighting
nnoremap <silent> <esc> :noh<return><esc>

