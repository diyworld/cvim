" Vim with all enhancements

let g:islinux = 1
let g:iswindow = 0
let g:system = 'other'
if (has("win32") || has("win64") || has("win95") || has("win16"))
    let g:islinux = 0
    let g:iswindow = 1
    let g:system = 'window'
    source $VIMRUNTIME/../cvim/basic.vim
    source $VIMRUNTIME/../cvim/mapbasic.vim
    source $VIMRUNTIME/../cvim/plugin.vim
else
    let g:islinux = 1
    let g:iswindow = 0
    let g:system = 'linux'
    source ~/.vim/cvim/basic.vim 
    source ~/.vim/cvim/mapbasic.vim 
    source ~/.vim/cvim/plugin.vim 
endif

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
"if &diffopt !~# 'internal'
"  set diffexpr=MyDiff()
"endif
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg1 = substitute(arg1, '!', '\!', 'g')
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg2 = substitute(arg2, '!', '\!', 'g')
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let arg3 = substitute(arg3, '!', '\!', 'g')
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      if empty(&shellxquote)
"        let l:shxq_sav = ''
"        set shellxquote&
"      endif
"      let cmd = '"' . $VIMRUNTIME . '\diff"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  let cmd = substitute(cmd, '!', '\!', 'g')
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"  if exists('l:shxq_sav')
"    let &shellxquote=l:shxq_sav
"  endif
"endfunction

