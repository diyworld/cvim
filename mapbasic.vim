
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置 leader 键
let mapleader = "\<space>"
"移除 ^M
"nnoremap <leader>tc  mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
nnoremap <leader>tc :%s/<C-V><cr>//ge<cr>'tzt'm
"文档转换为 unix格式
nnoremap <leader>tu :set fileformat=unix
"新增一行空白行
nnoremap <leader>o oi<BS><Esc>

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
nnoremap <leader>k <S-h>
nnoremap <leader>j <S-l>
nnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>k <S-h>
vnoremap <leader>j <S-l>
vnoremap <leader>h ^
vnoremap <leader>l $
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
"括号之间的移动
nnoremap <leader>[ %

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
inoremap <C-p> i<BS><Esc>"+pa

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件和窗口操作
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"打开历史文件列表
nnoremap fb :BufExplorer<CR>
"新建一个文件
nnoremap ff :badd<CR>
"跳到上一个/下一个历史文件
nnoremap fn :bn<CR>
nnoremap fp :bp<CR>
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
"分割窗口, 退出窗口
nnoremap fs :sp<CR>
nnoremap fv :vsp<CR>
nnoremap fq :bdel<CR>
"目录列表和函数标签
nnoremap fl :NERDTreeToggle %<CR>
nnoremap fh :Tlist<CR>
"标签页管理
nnoremap tw :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap tt :tab vsplit<CR>
nnoremap tn :tabnext<CR>
nnoremap <C-t> :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap T :tabprev<CR>
"窗口大小调整
nnoremap < <C-w>5>
nnoremap > <C-w>5<
"窗口退出
nnoremap qk <C-w>k:q<CR>
nnoremap qj <C-w>j:q<CR>
nnoremap qh <C-w>h:q<CR>
nnoremap ql <C-w>l:q<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 跳转
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"回跳，与 <Ctrl-o>对应
nnoremap <C-i> <TAB>

