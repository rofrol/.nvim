" https://github.com/thaerkh/vim-workspace
if empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/AppData/Local/nvim/autoload')
" Plugins directory https://vimawesome.com
Plug 'elmcast/elm-vim'
Plug 'airblade/vim-rooter'
Plug 'Shougo/denite.nvim'
Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}

" https://github.com/justinmk/config/blob/9b5e06bf5a85865dcbf793178342cfc4201cb752/.config/nvim/init.vim#L123
Plug 'tpope/vim-obsession'
let g:obsession_no_bufenter = 1  " https://github.com/tpope/vim-obsession/issues/40

" gc to comment lines selected
Plug 'tpope/vim-commentary'
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

" Preparation for manual session saving
set sessionoptions-=options
set sessionoptions-=empty
" tabs are not opened correctly vim vim-rooter, file paths saved
" as relative, probably bc of session option sesdir
" https://www.reddit.com/r/neovim/comments/9lkz9v/nvimqtexe_what_you_do_to_automatically_restore/
set sessionoptions-=curdir

" https://www.reddit.com/r/neovim/comments/9lkz9v/nvimqtexe_what_you_do_to_automatically_restore/e77hafy/
command! Session if filereadable(stdpath('config').'/session.vim') | exe 'source '.stdpath('config').'/session.vim'
      \ | else | exe 'Obsession '.stdpath('config').'/session.vim' | endif

" Problme with elm format from elm-vim
" https://github.com/ElmCast/elm-vim/issues/80#issuecomment-427222915
let g:elm_format_autosave = 0
" https://stackoverflow.com/questions/51272435/vim-autocommand-on-write-pass-full-file-path
" https://vi.stackexchange.com/questions/3060/suppress-output-from-a-vim-autocomand
autocmd BufWritePost *.elm silent! !elm-format --yes %:p


" https://www.reddit.com/r/neovim/comments/9jc0yl/fruzzy_a_freaky_fast_fuzzy_finder_for_neovim/
" optional - but recommended - see below
let g:fruzzy#usenative = 1

" tell denite to use this matcher by default for all sources
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])

" autocmd bc of this https://www.reddit.com/r/neovim/comments/9lkz9v/nvimqtexe_what_you_do_to_automatically_restore/e77jc25/
" Autocommands http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
" https://stackoverflow.com/questions/9281438/syntax-highlighting-doesnt-work-after-restore-a-previous-vim-session
autocmd VimEnter * nested silent! :Session
"autocmd VimEnter * silent! :Session

" <silent> does not work here, need to add silent in command: `silent exe` 
"nmap <Leader>s :Session<CR>

" ignore elm-stuff for tabfind etc.
" https://stackoverflow.com/questions/4296201/vim-ignore-special-path-in-search
set wildignore+=**/elm-stuff/**
