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

    set diffopt=internal,filler,context:1000000

    windo diffthis

    " Disable Folding
    " windo set nofoldenable foldcolumn=0

    " Disable text hiding
    windo set conceallevel=0

    " Reset the cursor the first change in the left window
    wincmd t

    norm! gg]c
endfunction

function! diff_settings#disable()
    augroup diffupdate
        autocmd!
    augroup END

    windo diffoff
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
