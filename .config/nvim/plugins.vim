" ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗  ██╗   ██╗██╗███╗   ███╗
" ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝  ██║   ██║██║████╗ ████║
" ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗  ██║   ██║██║██╔████╔██║
" ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║██╗╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝

call plug#begin('~/.vim/plugged')

Plug 'kassio/neoterm'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Coc.nvim: ----------------------  {{{
" if hidden is not set, TextEdit might fail.
set hidden
"
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
"
" Better display for messages
set cmdheight=2
"
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
"
" don't give |ins-completion-menu| messages.
set shortmess+=c
"
" always show signcolumns
set signcolumn=yes
"
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
let g:coc_snippet_next = '<tab>'
"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
"
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
"
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
"
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
"
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
"
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

Plug 'skanehira/preview-markdown.vim'

Plug 'lervag/vimtex'

Plug 'junegunn/goyo.vim'

Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd ctermfg=Green
highlight GitGutterChange ctermfg=Blue
highlight GitGutterDelete ctermfg=Red

Plug 'preservim/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd l | endif
map <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


Plug 'dracula/vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'


"Plug 'mhinz/vim-startify'
"" Vim-Startify {{{
"let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
"let g:startify_custom_header = [
"            \ '████████╗ ██████╗ ███████╗██╗  ██╗ ██████╗ ██████╗  █████╗ ██████╗  █████╗ ███╗   ██╗',
"            \ '╚══██╔══╝██╔═══██╗╚══███╔╝██║ ██╔╝██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗  ██║',
"            \ '   ██║   ██║   ██║  ███╔╝ █████╔╝ ██║   ██║██████╔╝███████║██████╔╝███████║██╔██╗ ██║',
"            \ '   ██║   ██║   ██║ ███╔╝  ██╔═██╗ ██║   ██║██╔═══╝ ██╔══██║██╔══██╗██╔══██║██║╚██╗██║',
"            \ '   ██║   ╚██████╔╝███████╗██║  ██╗╚██████╔╝██║     ██║  ██║██║  ██║██║  ██║██║ ╚████║',
"            \ '   ╚═╝    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝'
"            \]
"highlight StartifyBracket guifg=Blue
"highlight StartifyHeader  guifg=Blue
"highlight StartifyNumber  guifg=Blue
"highlight StartifyNumber  guifg=Blue
"highlight StartifyPath    guifg=Blue
"highlight StartifySlash   guifg=Blue
"highlight StartifySpecial guifg=Blue
""
"if has('nvim')
"    autocmd TabNewEntered * Startify
"else
"    autocmd BufWinEnter *
"        \ if !exists('t:startify_new_tab')
"        \     && empty(expand('%'))
"        \     && empty(&l:buftype)
"        \     && &l:modifiable |
"        \   let t:startify_new_tab = 1 |
"        \   Startify |
"        \ endif
"endif

""}}}

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
noremap <C-f> :FZF<CR>

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown'}]

Plug 'tpope/vim-commentary'

" Plug 'fatih/vim-go'

" Plug 'tmhedberg/SimpylFold'

" Plug 'ap/vim-css-color'

" Plug 'ryanoasis/vim-devicons'

call plug#end()
