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
set wildmenu
"set wildmode=longest,list
"set wildmode=longest:list,full
set wildmode=longest:full,full

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
nnoremap <C-1> 1gt
nnoremap <C-2> 2gt
nnoremap <C-3> 3gt
nnoremap <C-4> 4gt
nnoremap <C-5> 5gt
nnoremap <C-6> 6gt
nnoremap <C-7> 7gt
nnoremap <C-8> 8gt
nnoremap <C-9> 9gt
nnoremap <C-0> 10gt
