" ██╗      █████╗ ████████╗███████╗██╗  ██╗  ██╗   ██╗██╗███╗   ███╗
" ██║     ██╔══██╗╚══██╔══╝██╔════╝╚██╗██╔╝  ██║   ██║██║████╗ ████║
" ██║     ███████║   ██║   █████╗   ╚███╔╝   ██║   ██║██║██╔████╔██║
" ██║     ██╔══██║   ██║   ██╔══╝   ██╔██╗   ╚██╗ ██╔╝██║██║╚██╔╝██║
" ███████╗██║  ██║   ██║   ███████╗██╔╝ ██╗██╗╚████╔╝ ██║██║ ╚═╝ ██║
" ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝

function! Is_beamer()
    if search("documentclass{beamer}")
        return 1
    endif
    return 0
endfunction

function! Compile_pdf(should_stop_at_error)
    write
    normal mi
    if a:should_stop_at_error
        execute "silent !pdflatex -interaction=nonstopmode %"
    else
        execute "silent !pdflatex %"
    endif

    let l:is_beamer = Is_beamer()
    if l:is_beamer | let l:pdf_viewer = "mupdf" | else | let l:pdf_viewer = "zathura" | endif
    let l:is_open = system("ps ax | grep \" " . l:pdf_viewer . " " . expand('%:r') . "\" | grep -vc grep")

    if l:is_open
        if l:is_beamer
            execute "silent !pkill -HUP mupdf"
        endif
    else
        execute "silent ! " . l:pdf_viewer . " " . expand("%:r") . ".pdf &"
    endif
    redraw!
    normal `i
endfunction

augroup Latex
    autocmd!

    autocmd filetype tex let b:should_auto_compile = 1
    autocmd InsertLeave *.tex :call Compile_pdf(0)
augroup end
