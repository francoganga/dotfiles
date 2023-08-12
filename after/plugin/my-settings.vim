autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END


autocmd BufReadPre,FileReadPre *.c setlocal shiftwidth=2 tabstop=2 colorcolumn=120

" autocmd BufReadPre,FileReadPre *.php setlocal colorcolumn=120

autocmd BufReadPre,FileReadPre *.vue setlocal tabstop=2 shiftwidth=2

autocmd BufReadPre *.py setlocal tabstop=2 shiftwidth=2

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
hi CursorColumn cterm=NONE ctermbg=242 guibg=#393f4a

" augroup vimrc-incsearch-highlight
"     autocmd!
"     autocmd CmdlineEnter /,\? :set hlsearch
"     autocmd CmdlineLeave /,\? :set nohlsearch
" augroup END
