call plug#begin('~/AppData/Local/nvim/autoload')
Plug 'elmcast/elm-vim'
call plug#end()

" https://github.com/kristijanhusak/neovim-config/blob/52e9e886dd256c5c267c70d2afa72796f3390a92/init.vim#L48 
" https://stackoverflow.com/questions/10389205/show-current-leader-key-setting
let mapleader = ','

" global clipboard just works without below or similar:
" https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
" https://github.com/neovim/neovim/issues/4706#issuecomment-325284385
"set clipboard+=unnamedplus


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

"let g:elm_format_autosave = 1
"let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" Somehow keybindings are not set, even with `let g:elm_setup_keybindings = 1`
nmap <Leader>m :ElmMake<CR>
nmap <Leader>b :ElmMakeMain<CR>

set splitbelow
set splitright

nmap <Backspace> :noh<CR>
