" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗  ██╗   ██╗██╗███╗   ███╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝  ██║   ██║██║████╗ ████║
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗  ██║   ██║██║██╔████╔██║
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║██╗╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝

" Remap Leader Key: ----------------------  {{{
let mapleader="ş"
let maplocalleader="ç"
" }}}

" General Settings: {{{
nnoremap <silent> <leader>h :noh<Cr>
inoremap <silent> <leader>h <Esc>:noh<Cr>i
command! W execute 'w !sudo -A tee % > /dev/null' <bar> edit!
inoremap jk <Esc>
command! Q quitall!
nnoremap Y y$
"}}}

" Remap Change: {{{
nnoremap c "_c
nnoremap cc "_cc
nnoremap C "_C
vnoremap c "_c

nnoremap <leader>c c
nnoremap <leader>cc cc
vnoremap <leader>c c

" }}}

" Moving Between Tabs: ----------------------  {{{
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 :tablast<CR>
" }}}

" Moving Between Splits: ----------------------  {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" Indenting: ----------------------  {{{
vnoremap < <gv
vnoremap > >gv
" }}}

" Folding ----------------------  {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Delete Without Yank: ----------------------  {{{
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D
nnoremap <Leader>x "_x
nnoremap <Leader>X "_X
" }}}

" Autoclose: ----------------------  {{{
inoremap <Leader>( ()<Esc>ha
inoremap <Leader>{ {}<Esc>ha
inoremap <Leader>[ []<Esc>ha
inoremap <Leader>" ""<Esc>ha
inoremap <Leader>' ''<Esc>ha
inoremap <Leader>` ``<Esc>ha
inoremap <Leader>< <><Esc>ha
inoremap <Leader>$ $$<Esc>ha
" }}}

" Change ----------------------  {{{
"
" Change Next: ----------------------  {{{
onoremap in( :<C-U>normal! f(vi(<CR>
onoremap in{ :<C-U>normal! f{vi{<CR>
onoremap in[ :<C-U>normal! f[vi[<CR>
onoremap in" :<C-U>normal! f"vi"<CR>
onoremap in' :<C-U>normal! f'vi'<CR>
onoremap in` :<C-U>normal! f`vi`<CR>
onoremap in< :<C-U>normal! f<vi<<CR>
" }}}
"
" Change Last: ----------------------  {{{
onoremap il( :<C-U>normal! F(vi(<CR>
onoremap il{ :<C-U>normal! F{vi{<CR>
onoremap il[ :<C-U>normal! F[vi[<CR>
onoremap il" :<C-U>normal! F"vi"<CR>
onoremap il' :<C-U>normal! F'vi'<CR>
onoremap il` :<C-U>normal! F`vi`<CR>
onoremap il< :<C-U>normal! F<vi<<CR>
" }}}
"
"}}}

" Remap Arrow Keys: ----------------------  {{{
" Disable Arrow Keys:
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap<Right> <C-o>:echo "No right for you!"<CR>
"
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
"
nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>
"
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down  for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>
"
" Add New Keys Instead Of Arrow Keys:
inoremap <c-l> <Right>
inoremap <c-h> <Left>
inoremap <c-k> <Up>
inoremap <c-j> <Down>
" }}}

" j k l m: ----------------------  {{{
" make J, K, L, and H move the cursor MORE.
nnoremap J }
nnoremap K {
nnoremap L g_
nnoremap H ^

vnoremap J }
vnoremap K {
vnoremap L g_
vnoremap H ^
"
" make <c-j>, <c-k>, <c-l>, and <c-h> change the window
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
"
" make <a-j>, <a-k>, <a-l>, and <a-h> move to window.
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
nnoremap <a-h> <c-w>h
"
" make <a-J>, <a-K>, <a-L>, and <a-H> create windows.
nnoremap <a-J> <c-w>s<c-w>k
nnoremap <a-K> <c-w>s
nnoremap <a-H> <c-w>v
nnoremap <a-L> <c-w>v<c-w>
"
" }}}

" Place Holders: ----------------------  {{{
nnoremap <Space><Space> 0/<++><CR>:noh<Esc>"_cf>
nnoremap <Tab><Tab> 0?<++><CR>:noh<Esc>"_cf>
inoremap <Leader><Space><Space> <Esc>0/<++><CR>:noh<CR>"_cf>
inoremap <Leader><Tab><Tab> <Esc>0?<++><CR>:noh<CR>"_cf>
"
nnoremap <Leader>+ i<++>
inoremap <Leader>+ <++>
" }}}

" Adding New Line: ----------------------  {{{
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
" }}}

if has('nvim')

    "Terminal: ----------------------  {{{
    "Escaping:
    tnoremap jk <C-\><C-n>
    "
    " Navigate Between Terminal And Window: ----------------------  {{{
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    "}}}
    "
    "Toggle Terminal: ----------------------  {{{j
    nnoremap <Leader><space> :vertical botright Ttoggle<cr><C-w>l
    nnoremap <Leader>t :vertical rightbelow Ttoggle<CR><C-w>l
    nnoremap <Leader>T :botright Ttoggle<CR><C-w>jA
    " }}}
    "
    " }}}

endif



