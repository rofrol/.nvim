" https://github.com/thaerkh/vim-workspace
if empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/AppData/Local/nvim/autoload')
" Plugins directory https://vimawesome.com
Plug 'elmcast/elm-vim'
Plug 'airblade/vim-rooter'
call plug#end()

" https://github.com/kristijanhusak/neovim-config/blob/52e9e886dd256c5c267c70d2afa72796f3390a92/init.vim#L48 
" https://stackoverflow.com/questions/10389205/show-current-leader-key-setting
let mapleader = ','

" global clipboard
" https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
" https://github.com/neovim/neovim/issues/4706#issuecomment-325284385
set clipboard+=unnamedplus


" Paste with middle mouse click
vmap <LeftRelease> "*ygv

" Paste with <Shift> + <Insert>
"https://github.com/equalsraf/neovim-qt/issues/327#issuecomment-325660764
imap <S-Insert> <C-R>*
cmap <S-Insert> <C-R>*

" Quickly edit/reload this configuration file
" https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim/1120318#1120318
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

nmap <Leader>s :%s//g<Left><Left>

" Somehow keybindings are not set, even with `let g:elm_setup_keybindings = 1`
nmap <Leader>m :ElmMake<CR>
nmap <Leader>b :ElmMakeMain<CR>

set splitbelow
set splitright

nmap <Backspace> :noh<CR>

" https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu#comment58670078_9528037
" http://www.reddit.com/r/vim/comments/19izuz/whats_your_wildmode/
" Wildmenu
set wildmenu " Show list instead of just completing
"set wildmode=longest,list
"set wildmode=longest:list,full
"set wildmode=longest:full,full
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all

set noswapfile
set nu

" https://www.reddit.com/r/vim/comments/5c9dxg/using_jk_as_escaping_to_normal_mode/
inoremap jk <Esc>

" set Frame title
" https://github.com/equalsraf/neovim-qt/issues/95#issuecomment-304661632
set title

" select with mouse
set mouse=a

" http://vim.wikia.com/wiki/Alternative_tab_navigation
nmap <C-1> 1gt
nmap <C-2> 2gt
nmap <C-3> 3gt
nmap <C-4> 4gt
nmap <C-5> 5gt
nmap <C-6> 6gt
nmap <C-7> 7gt
nmap <C-8> 8gt
nmap <C-9> 9gt
nmap <C-0> 10gt
imap <C-1> <Esc> 1gt
imap <C-2> <Esc> 2gt
imap <C-3> <Esc> 3gt
imap <C-4> <Esc> 4gt
imap <C-5> <Esc> 5gt
imap <C-6> <Esc> 6gt
imap <C-7> <Esc> 7gt
imap <C-8> <Esc> 8gt
imap <C-9> <Esc> 9gt
imap <C-0> <Esc> 10g
