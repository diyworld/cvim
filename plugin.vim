" 插件安装声明
if (g:system == 'window')
    call plug#begin('$VIMRUNTIME/../cvim/pluged')
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'vim-scripts/mark'
    Plug 'bling/vim-bufferline'
    Plug 'junegunn/fzf'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    "taglist 需要 ctags 支持
    "Plug 'vim-scripts/taglist.vim'
    call plug#end()
else
    call plug#begin('~/.vim/cvim/plugged/')
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'vim-scripts/mark'
    Plug 'bling/vim-bufferline'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/taglist.vim'
    call plug#end()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 目录树
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标设置在主窗口
"wincmd w
"autocmd VimEnter * wincmd w
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=30
let g:NERDTreeWinPos='right'
let NERDTreeShowBookmarks=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist 函数列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1        " 只显示当前文件的taglist
let Tlist_WinWidth = 30          " taglist窗口的宽度

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer 缓冲文件列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerSortBy='number'     " Sort by number.
let g:bufExplorerShowRelativePath=1  " Show relative paths.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bling/vim-bufferline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufferline_echo = 0
let g:bufferline_rotate = 0
let g:bufferline_fixed_index = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:lightline.colorscheme = 'default'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline/vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=0
let g:airline_theme='dark'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline/vim-airline-themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme='fruit_punch'
"let g:airline_minimalist_showmod = 1
"let g:airline_molokai_bright = 1
"let g:airline_statusline_ontop = 1     "强制状态行在最上面显示
"set stl=%!airline#check_mode(winnr())  "禁止tab标签功能, 否则域状态行冲突
"let g:airline#extensions#tabline#enabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gtags 搜索
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FindProjectPath()
    let curpath=expand('%')
    let dir = fnamemodify(curpath, ':p:h')
    let idx = 1
    while 1
        let tmp = dir . '/GTAGS'
        if filereadable(tmp)
            "echo 'cs add ' . tmp . ' ' . dir
            set nocscopeverbose
            silent! execute 'cs add ' . fnameescape(tmp)
            set cscopeverbose
            return tmp
        elseif dir == '/'
            return ''
        endif

        let dir = fnamemodify(dir, ":h")
        let idx += 1
        if idx > 32
            "echo "FindProjectPath(...) 'idx > 32'"
            return ''
        endif
    endwhile

    return ''
endfunc

function! UpdateGtags(f)
    let dir = fnamemodify(a:f, ':p:h')
    exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
endfunction

" 使用 cscope 作为 tags 命令
set cscopetag
" 使用 gtags-cscope 代替 cscope
set cscopeprg=gtags-cscope
" 匹配cscope的搜索项
set cscopequickfix=g-,s-,c-,d-,i-,t-,e-
" 写入操作时，自动更新 GTAGS
au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))

" 根据文件路径向上查找工程目录并添加GTAGS
call FindProjectPath()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 括号间的跳转
"nnoremap <Space>] <Esc>%
"nnoremap <Space>[ <Esc>%%
"
""查询映射
"nnoremap ss <Esc>:cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
"nnoremap sg <Esc>:cs find g <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
"nnoremap sc <Esc>:cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
"nnoremap st <Esc>:cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
"nnoremap sf <Esc>:cs find f <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
"
""高亮
""<leader>m - 高亮, 或取消当前高亮
""<leader>n - 跳转下一个高亮处
""<leader>p - 跳转上一个高亮处
""<leader>c - 取消所有高亮


