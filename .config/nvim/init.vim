let mapleader = ","

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'mboughaba/i3config.vim'
Plug 'junegunn/goyo.vim' "Call :Goyo
Plug 'jreybert/vimagit' "Call :M
" Plug 'vifm/vifm.vim' "Call :Vifm
Plug 'LukeSmithxyz/vimling' "For deadkeys
Plug 'dylanaraps/wal.vim' " For airline colors
Plug 'vim-airline/vim-airline' "For a statusline
Plug 'vim-airline/vim-airline-themes' "For themes (airline)
Plug 'jeffkreeftmeijer/vim-numbertoggle' "For Numbers that make sense

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi' "Python completion

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

let g:markdown_composer_autostart=0


" Simple definitions

" redirects change to black hole register _
nnoremap c "_c

" tab fuckery: I think this makes tabs 4 spaces wide
set expandtab
set shiftwidth=4
set softtabstop=4

" Hybrid line numbers
set number relativenumber

" enables mouse support
set mouse=a

" Set Scroll padding
set scrolloff=2
set sidescrolloff=2

" Clipboard stuff
set clipboard=unnamedplus
vnoremap <C-c> "+y

" Trailing Whitespace
autocmd BufWritePre * %s/\s\+$//e


" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"map <C-H> <C-w>H
"map <C-J> <C-w>J
"map <C-K> <C-w>K
"map <C-L> <C-w>L


" Splits non-retardedly
set splitbelow splitright

" netrw replacing
" let g:vifm_replace_netrw=1

" Theming
let g:airline_theme='wal'


" deoplete fuckery
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " Close window on autocomplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Navigate with tab


" Please replace in future

" voidrice legacy
" When shortcut files are updated, renew bash and vifm configs with new material:
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -merge %


" vimling:
nm <leader>d :call ToggleDeadKeys()<CR>
imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
