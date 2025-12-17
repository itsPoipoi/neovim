" Auto suda when needed
let g:suda_smart_edit = 1

" --- Undo tree settings ---
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif

" e.g. using 'd' instead of 'days' to save some space.
if !exists('g:undotree_ShortIndicators')
    let g:undotree_ShortIndicators = 1
endif

" undotree window width
if !exists('g:undotree_SplitWidth')
    if g:undotree_ShortIndicators == 1
        let g:undotree_SplitWidth = 25
    else
        let g:undotree_SplitWidth = 30
    endif
endif

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

function g:Undotree_CustomMap()
    map <buffer> + J
    map <buffer> - K
endfunction
