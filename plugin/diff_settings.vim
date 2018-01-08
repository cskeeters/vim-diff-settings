if get(g:,'loaded_diff_settings', 0) == 1
    finish
endif
let g:loaded_diff_settings = 1

command! -nargs=0 EnableDiff call diff_settings#enable()
command! -nargs=0 DisableDiff call diff_settings#disable()
command! -nargs=0 ToggleDiff call diff_settings#toggle()
