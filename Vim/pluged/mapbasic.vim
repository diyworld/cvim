
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多行, 多字符移动
nnoremap <S-k> 4k
nnoremap <S-j> 8j
nnoremap <S-h> 6h
nnoremap <S-l> 12l
vnoremap <S-k> 4k
vnoremap <S-j> 8j
vnoremap <S-h> 6h
vnoremap <S-l> 12l
"当前页最上，最下，最左，最右
nnoremap sk <S-h>
nnoremap sj <S-l>
nnoremap sh ^
nnoremap sl $
vnoremap sk <S-h>
vnoremap sj <S-l>
vnoremap sh ^
vnoremap sl $
"插入模式下的简单移动
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"窗口间移动
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本编辑
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插入模式下快速退出到Normal模式
"inoremap <TAB> <Esc>
"nnoremap <TAB> <Esc>
"cnoremap <TAB> <Esc>
"vnoremap <TAB> <Esc>

"取消撤销操作
nnoremap U <C-r>
"y/yy时多复制一份到系统寄存器
vnoremap y "+y
nnoremap yy V"+y
"粘贴
vnoremap <C-p> "+p
vnoremap <C-P> "+P
nnoremap <C-p> "+P
nnoremap <C-P> "+p
cnoremap <C-p> <C-R>+
cnoremap <C-P> <C-R>+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件和窗口操作
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"打开历史文件列表
nnoremap fb :BufExplorer<CR>
"新建一个文件
nnoremap ff :new<CR>
"跳到上一个/下一个历史文件
nnoremap fn :bn<CR>
nnoremap fp :bp<CR>
"分割窗口, 退出窗口
nnoremap fs :sp<CR>
nnoremap fv :vsp<CR>
nnoremap fq :q<CR>
"目录列表和函数标签
nnoremap fl :NERDTreeToggle %<CR>
nnoremap fh :Tlist %<CR>
"标签
nnoremap tt :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap tv :tab vsplit<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 跳转
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"回跳，与 <Ctrl-o>对应
nnoremap <C-i> <TAB>

