" ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗  ██╗   ██╗██╗███╗   ███╗
" ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝  ██║   ██║██║████╗ ████║
" ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗  ██║   ██║██║██╔████╔██║
" ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║██╗╚████╔╝ ██║██║ ╚═╝ ██║
" ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝


" General settings {{{
filetype plugin indent on "load file rules
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "Jump the last position when reopening a file
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set title "Show file name on title
set backspace=indent,eol,start "Fix backspace key
set encoding=UTF-8
set termguicolors
set lazyredraw
if !has('nvim')
    " Better cryption
    set cryptmethod=blowfish
endif
set hidden
" }}}

" System Clipboard Support: ----------------------  {{{
set pastetoggle=<F2>
set clipboard=unnamedplus
" }}}

" Status Line:----------------------  {{{
" Thanks https://gist.github.com/ericbn/f2956cd9ec7d6bff8940c2087247b132----
" set laststatus=2
" set statusline=
" set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
" set statusline+=%< " Truncate line here
" set statusline+=%f\  " File path, as typed or relative to current directory
" set statusline+=%{&modified?'+\ ':''}
" set statusline+=%{&readonly?'\ ':''}
" set statusline+=%1*\  " Set highlight group to User1
" set statusline+=%= " Separation point between left and right aligned items
" set statusline+=\ %{&filetype!=#''?&filetype:'none'}
" set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
"   \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
" set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
" set statusline+=\ %* " Restore normal highlight
" set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
" set statusline+=%-2v " Virtual column number
" set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|
" " Coloring
" hi StatusLine cterm=reverse ctermfg=14 ctermbg=0
" hi StatusLineNC cterm=reverse ctermfg=11 ctermbg=0
" hi User1 ctermfg=14 ctermbg=0
" }}}

" Line Numbers: ----------------------  {{{
set number
set relativenumber
"set tw=79
set nowrap
set fo -=t
set colorcolumn=80
highlight ColorColumn ctermbg=1
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"}}}

" Fuzzy Search: ----------------------  {{{
set path+=**
set wildmenu
" }}}

" Tabs: ----------------------  {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" }}}

" Search: ----------------------  {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}

"Split: ----------------------  {{{
set fillchars=vert:│
hi! VertSplit ctermfg=0 ctermbg=9
" }}}

" Highlight WhiteSpaces: ----------------------  {{{
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" }}}

" Split: ----------------------  {{{
set splitright
set splitbelow
" }}}

" History and Undo: ----------------------  {{{
set history=1000
set undolevels=1000
set undofile
set undodir=/tmp
" }}}

" Autowrite When Left Insert Mode: ----------------------  {{{
augroup autowrite
    autocmd!
    autocmd InsertLeave *.tex write
    " autocmd InsertLeave *.md if expand('%') !~ "note-" | write | endif 
augroup END
" }}}

" Markdown Syntax Highlight For Calcurse: ----------------------  {{{
augroup calcurse
    autocmd!
    autocmd BufRead,BufNewFile /tmp/calcurse** set filetype=markdown
    autocmd BufRead,BufNewFile /home/tozkoparan/.calcurse/notes/** set filetype=markdown
augroup END
" }}}

" Netrw: ----------------------  {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
"let g:netrw_winsize = 20
"}}}

" Auto Compile Suckless Programs: ----------------------  {{{
augroup suckless
    autocmd!
    autocmd BufWritePost /home/tozkoparan/git-clones/suckless/*/config.h !make && sudo -A make install
augroup END
" }}}

set nofoldenable
set spelllang=tr,en

