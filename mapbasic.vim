
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other and try
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置 leader 键
let mapleader = "\\"

"移除 ^M
nnoremap <leader>fc :%s/<C-V><CR>//ge<CR>
"文档转换为 unix格式
nnoremap <leader>fu :set fileformat=unix<CR>
nnoremap <leader>ff :%s/<C-V><CR>//ge<CR>:set fileformat=unix<CR>

"tab字符替换为4个空格
noremap <space>ts :%s/\t/    /g<CR>
"删除每行末尾空格
noremap <space>ds :%s/\s\+$//

"I模式退出到N
noremap! <C-CR> <Esc>
"C模式退出到N
cnoremap <C-CR> <Esc>
"N模式新增空行
nnoremap <C-CR> <Esc>o<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多行多字符移动
noremap <S-k> 5k
noremap <S-j> 5j
noremap <S-h> 10h
noremap <S-l> 10l
"当前页最上，最下，最左，最右
noremap <Space>k <S-h>
noremap <Space>j <S-l>
noremap <Space>h 0
noremap <Space>l $
"插入模式和命令行模式下的简单移动
noremap! <C-k> <Up>
noremap! <C-j> <Down>
noremap! <C-h> <Left>
noremap! <C-l> <Right>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本编辑
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"全选 va
vnoremap a <Esc>ggVG
"取消撤销操作
noremap  U <C-r>
"复制粘贴
noremap  y  "+y
nnoremap yy "+Y
noremap  Y  "+Y
noremap  p  "+p
noremap  P  "+P
cnoremap <C-P> <C-r>+
vnoremap x  "+x
"命令模式删除单词
noremap! <C-Backspace> <C-w>
inoremap <C-Backspace> <C-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件操作
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"打开历史文件列表
nnoremap 2e :BufExplorer<CR>
"新建一个文件
nnoremap 2a :call <sid>cvim_create_new_file()<CR>
"跳到上一个/下一个历史文件
nnoremap 2n :bn<CR>
nnoremap 2p :bp<CR>
"分割窗口, 退出窗口
nnoremap 2s :sp<CR>
nnoremap 2v :vsp<CR>
nnoremap 2d :bdel<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 窗口操作
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"打开/关闭窗口
nnoremap 1l :NERDTreeToggle %<CR>
nnoremap 1h :Tlist<CR>
nnoremap 1j :copen<CR>
nnoremap 1k :call <sid>cvim_buffer_status_event("create")<CR>

"窗口间移动
noremap <C-k> <C-W>k
noremap <C-j> <C-W>j
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"窗口大小调整
nnoremap < <C-W>5<
nnoremap > <C-W>5>
nnoremap + <C-W>+
nnoremap _ <C-W>-

"窗口退出
nnoremap qk <C-w>k:q<CR>
nnoremap qj <C-w>j:q<CR>
nnoremap qh <C-w>h:q<CR>
nnoremap ql <C-w>l:q<CR>
nnoremap qq :q<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 跳转
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""回跳，与 <Ctrl-o>对应
"nnoremap <C-i> <TAB>

"高亮, 允许在给定反白处高亮
vnoremap <silent> gd :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

"取消高亮
nnoremap <Space><cr> <Esc>:noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 空白文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"创建空白文件
function! s:cvim_create_new_file()
    let tmpdir = g:cvimroot . '/tmp'
    let new_file = tmpdir . '/new' . strftime('%Y%m%d%H%M%S') . '.ctx'
    exe "badd" new_file
    exe "b" new_file
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" terminal 文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer 在窗口显示之后调用
autocmd BufEnter *.terminal call <sid>cvim_buffer_status_event("enter")
" buffer 离开一个窗口之前调用
autocmd BufLeave *.terminal call <sid>cvim_buffer_status_event("leave")
"删除 buffer 时自动调用事件
"autocmd BufDelete *.terminal call <sid>cvim_buffer_status_event("delete")

"激活的 terminal 文件列表
"let s:cvim_terminal_file_list = []
"当前、最后一个操作的 terminal 文件全路径名称
let s:cvim_terminal_file_last = ""
let s:cvim_terminal_file_cur  = ""
"当前是否处于 terminal 文件标志位
let s:cvim_isin_terminal_file = v:false

"buffer事件 type = ['create', 'enter', 'leave', 'delete']
function! s:cvim_buffer_status_event(type)
    let l:terminal_file = ""
    "创建文件
    if a:type == 'create'
        let l:tmpdir = g:cvimroot . '/tmp/terminal_buffer'
        let l:terminal_file = l:tmpdir . '/term' . strftime('%Y%m%d%H%M%S') . '.terminal'
        exe "badd" l:terminal_file
        exe "b" l:terminal_file
        "TODO
        "N模式重映射 <CR> 功能键
        "I模式重映射 <CR>/<Esc> 功能键
        "添加该文件到terminal文件列表中
        let s:cvim_isin_terminal_file = v:true
    elseif a:type == 'enter'
        let l:terminal_file = getreg('%')
        "TODO
        "N模式重映射 <CR> 功能键
        "I模式重映射 <CR>/<Esc> 功能键
        let s:cvim_isin_terminal_file = v:true
    elseif a:type == 'leave'
        let l:terminal_file = s:cvim_terminal_file_cur
        "TODO
        "N模式恢复 <CR> 功能键
        "I模式恢复 <CR>/<Esc> 功能键
        let s:cvim_isin_terminal_file = v:false
    elseif a:type == 'delete'
        "TODO
        "从terminal文件列表中删除该文件
    endif

    "记录当前编辑的 terminal 文件
    if l:terminal_file != ""
        let s:cvim_terminal_file_cur = l:terminal_file
    endif
    "call <sid>cvim_create_or_load_terminal_file(a:type)
    echo "cvim_buffer_status_event" . ' ' . a:type
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 选择高亮
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"模拟执行按键，如 gg/G/dd 等
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

"选择
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

