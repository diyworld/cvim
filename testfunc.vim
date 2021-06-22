
"行列精确定位
noremap f{char} :call <sid>cvim_ranks_pos()<CR>
"括号之间的移动
nnoremap <space>[ %
""重定义F为竖直方向快速定位行
nnoremap ; :call <sid>cvim_next_pos("up")<CR>
nnoremap , :call <sid>cvim_next_pos("down")<CR>
nnoremap F1 :call <sid>cvim_get_line_pos("1")<CR>
nnoremap F2 :call <sid>cvim_get_line_pos("2")<CR>
nnoremap F3 :call <sid>cvim_get_line_pos("3")<CR>
nnoremap F4 :call <sid>cvim_get_line_pos("4")<CR>
nnoremap F5 :call <sid>cvim_get_line_pos("5")<CR>
nnoremap F6 :call <sid>cvim_get_line_pos("6")<CR>
nnoremap F7 :call <sid>cvim_get_line_pos("7")<CR>
nnoremap F8 :call <sid>cvim_get_line_pos("8")<CR>
nnoremap F9 :call <sid>cvim_get_line_pos("9")<CR>
nnoremap F0 :call <sid>cvim_get_line_pos("0")<CR>

let s:cvim_lineflag = '0'
"记录要跳转的行号的尾数
function! s:cvim_get_line_pos(c)
    let s:cvim_lineflag = a:c
endfunction

function! s:cvim_next_pos(str)
    let pos = getpos('.')
    "echo l:pos
    let l:difflines = l:pos[1] % 10 - s:cvim_lineflag
    if a:str == 'up'
        if l:pos[1] % 10 == s:cvim_lineflag
            let l:pos[1] += 10
        elseif l:difflines > 0
            let l:pos[1] += (10 - abs(l:difflines))
        else
            let l:pos[1] += abs(l:difflines)
        endif
    elseif a:str == 'down'
        if l:pos[1] % 10 == s:cvim_lineflag
            let l:pos[1] -= 10
        elseif l:difflines > 0
            let l:pos[1] -= abs(l:difflines)
        else
            let l:pos[1] -= (10 - abs(l:difflines))
        endif
    endif
    "echo l:pos
    call setpos('.', l:pos)
endfunction
