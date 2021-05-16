
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 窗口基本风格
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"高亮光标所在的行/列
"set cursorline
"set cursorcolumn
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE

"去除vi一致性
set nocompatible

"默认打开语法高亮
syntax enable 
syntax on 

"在Gnome终端中启用256色调色板
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"主题
if (g:system == 'window')
    colorscheme morning
else
    colorscheme desert
endif
"背景色
"set background=dark

"编码格式
"set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
set guifont=Courier_new:h9

"使用 unix 为标准编码格式
set ffs=unix,dos,mac

"历史命令行最大值
set history=500
"显示行号
set nu

"打开对不同文件类型的专有设定 REF:filetype.txt
filetype plugin on
"打开自动缩进 REF:indent.txt
filetype indent on

"当文件被改动时自动载入
set autoread

"自动命令: au[tocmd] [group] {event} {pat} {cmd}, REF:autocmd.txt
"FocusGained 输入焦点事件
"BufEnter 进入缓冲区事件
" * 表示在任何模式下生效
"checktime 检查文件是否被改变
au FocusGained,BufEnter * checktime

"设置光标顶格空2行
set so=2

"中文视窗操作系统避免出现乱码
"let $LANG='en' 
"set langmenu=en
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"打开命令行补全菜单
set wildmenu

"忽略编译文件
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32") || has("win64")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"显示光标位置
set ruler

"命令行函数
set cmdheight=1

"退格有效
set backspace=indent,eol,start

"搜索忽略大小写
set ignorecase
"如果搜索字符包括大写字符则自动屏蔽 ignorecase
set smartcase

"高亮查找字符串
set hlsearch
"搜索时实时显示匹配项
set incsearch 

"执行宏、寄存器和其它不通过输入的命令时屏幕不会重画
set lazyredraw 

"默认打开, 否则可能出现莫名其妙问题
set magic

"在输入括号时光标自动返回到匹配处
set showmatch 
"在匹配括号时回跳的时间为 2/10 = 0.2 (s)
set mat=2

"关闭声音输出
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

"关闭备份
set nobackup
set nowb
set noswapfile


"缩进, 使用空格替换tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
"自动缩进
set autoindent

"500个字符自动回绕
set linebreak
set textwidth=500
"超过窗口的文本会进行回绕
set wrap

"最左边空一格
"set foldcolumn=1

"??
"set si
"
"高亮, 允许在给定反白处高亮
vnoremap <silent> gd :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

"当打开一个文件时, 从原来退出的地方打开
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"使能反白连续缩进
xnoremap <  <gv
xnoremap >  >gv

"总是显示状态行
set laststatus=2
"格式化状态行
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"隐藏buffer, 这样在文件已经有修改时也可以切换不同的 buffer文件
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 函数体
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

function! HasPaste()
    if &paste
        return 'PASTE '
    endif
    return ''
endfunction

