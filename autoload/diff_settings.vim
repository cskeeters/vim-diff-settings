" ==============================================================================
" Author: Chad Skeeters/Terry Ma
" Description: Scroll the screen smoothly to retain better context. Useful for
" replacing Vim's default scrolling behavior with CTRL-D, CTRL-U, CTRL-B, and
" CTRL-F, zz, zt, zb
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! diff_settings#enable()
    augroup diffupdate
        autocmd!
        " issues :diffupdate anytime cursor is moved
        autocmd CursorMoved,CursorMovedI * diffupdate
    augroup END


    tabdo windo diffthis

    " Disable Folding
    tabdo windo set nofoldenable foldcolumn=0

    " Disable text hiding
    tabdo windo set conceallevel=0

    " Reset the cursor the first change in the left window of each tab
    wincmd t

    norm! gg]c
endfunction

function! diff_settings#disable()
    augroup diffupdate
        autocmd!
    augroup END

    tabdo windo diffoff
    wincmd t
endfunction

function! diff_settings#toggle()
    if &diff == 1
        call diff_settings#disable()
    else
        call diff_settings#enable()
    endif
endfunction

let &cpo = s:save_cpo
