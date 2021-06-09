
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置 leader 键
let mapleader = "\\"
"移除 ^M
nnoremap <leader>fc :%s/<C-V><CR>//ge<CR>
"文档转换为 unix格式
nnoremap <leader>fu :set fileformat=unix<CR>
nnoremap <leader>ff :%s/<C-V><CR>//ge<CR>:set fileformat=unix<CR>
"回车键用于输入指令
"代码块展开和关闭使用 Ctrl+CR
"noremap <CR> :
"tab字符替换为4个空格
noremap ts :%s/\t/    /g<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多行, 多字符移动
noremap <S-k> 5k
noremap <S-j> 5j
noremap <S-h> 8h
noremap <S-l> 8l
"当前页最上，最下，最左，最右
noremap <space>k <S-h>
noremap <space>j <S-l>
noremap <space>h ^
noremap <space>l $
noremap <space>m gM
"插入模式和命令行模式下的简单移动
noremap! <C-k> <Up>
noremap! <C-j> <Down>
noremap! <C-h> <Left>
noremap! <C-l> <Right>
"窗口间移动
noremap <C-k> <C-W>k
noremap <C-j> <C-W>j
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
"括号之间的移动
"nnoremap <space>[ %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本编辑
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"全选
vnoremap a <Esc>ggVG
"取消撤销操作
noremap U <C-r>
"复制粘贴
noremap  y  "+y
nnoremap yy "+Y
noremap  p  "+p
noremap  P  "+P
vnoremap x  "+x
"模式删除单词
noremap! <C-BS> <C-w>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 文件和窗口操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""打开历史文件列表
nnoremap fb :BufExplorer<CR>
""新建一个文件
nnoremap ff :call <sid>cvim_create_new_file()<CR>
""跳到上一个/下一个历史文件
nnoremap fn :bn<CR>
nnoremap fp :bp<CR>
""分割窗口, 退出窗口
"nnoremap fs :sp<CR>
"nnoremap fv :vsp<CR>
"nnoremap fq :bdel<CR>
"目录列表和函数标签
nnoremap fl :NERDTreeToggle %<CR>
nnoremap fh :Tlist<CR>
""标签页管理
"nnoremap tw :tabnew<CR>
"nnoremap tc :tabclose<CR>
"nnoremap tt :tab vsplit<CR>
"nnoremap tn :tabnext<CR>
"nnoremap <C-t> :tabnext<CR>
"nnoremap tp :tabprev<CR>
"nnoremap T :tabprev<CR>
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
" 函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"创建空白文件
function! s:cvim_create_new_file()
    let tmpdir = g:cvimroot . '/tmp'
    let new_file = tmpdir . '/new' . strftime('%Y%m%d%H%M%S') . '.ctx'
    exe "badd" new_file
    exe "b" new_file
endfunction
function! s:copy_from_insight()
    let tmpdir = g:cvimroot . '/tmp'
    let new_file = tmpdir . '/new' . strftime('%Y%m%d%H%M%S') . '.ctx'
    exe "badd" new_file
    exe "b" new_file
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

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

