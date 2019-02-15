"************************** 快捷键设置 **************************
"F1 : 显示帮助
"F2 : 显隐菜单工具栏
"F3 : 显隐nerdtree文档目录
"F4 : 
"F5 : 打开easygrep查询工具
"F6 : 
"F7 : 
"F8 : 打开ctages,生成更新tags文件（程序被改动时，须运行一次，ctages插件才可有效)
"F9 :
"F10 : 
"F11 : 
"F12 : 当前窗口保存并退出
"Ctrl+N : 新建标签
"ctrl+]: 光标便跳转到函数的定义处
"ctrl+t: 光标返回函数调用处
"<C-Tab>: 切换VIM各个标签 
",W+M : 打开/关闭WinManager插件（文档目录和taglist组合窗口）
",t+b : 显隐tagbar插件
",t+l : 显隐taglist插件
",n+t : 显隐nerdtree插件
"Ctrl+p : 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件(ctrlp.vim 插件)
",ol : 左右纵向查看已打开的文件列表
",ul : 上下横向查看已打开的文件列表
"Ctrl+e : emmet插件，快速写HTML代码
",Line : 开启/关闭对齐线
",r : mark插件，标记加亮不同标签
" -  : 开关折叠
",Vip : 多窗口时将当前窗口最大化
"m+字母 : 设置一个标记(a-z)
"`+字母 : 跳转到指定标记处
"**************************** end ********************************

" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


" =============================================================================
"                          << 以下为用户自定义配置 >>
" =============================================================================


" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    " 设置gvim内部编码，默认不更改
set fileencoding=utf-8                                " 设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=utf-8                               " 设置支持打开的文件的编码


" -----------------------------------------------------------------------------
"  < 设置字体 >
" -----------------------------------------------------------------------------
set guifont=Consolas:h12
"set guifont=YaHei_Consolas_Hybrid\ 10                " 设置字体:字号（字体名称空格用下划线代替）

" -----------------------------------------------------------------------------
"  < 文件格式，默认 ffs=dos,unix >
" -----------------------------------------------------------------------------
set fileformats=dos,mac,unix                          " 给出文件的<EOL>格式类型

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
filetype on                                           " 启用文件类型侦测
filetype plugin on                                    " 针对不同的文件类型加载对应的插件
filetype plugin indent on                             " 启用缩进
autocmd! bufwritepost _vimrc source %                 " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source %                 " vimrc文件修改之后自动加载。 linux。
set history=400                                       " history存储长度。
set smartindent                                       " 启用智能对齐方式
set expandtab                                         " 将Tab键转换为空格
set tabstop=2                                         " 设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=2                                      " 换行时自动缩进宽度，可更改（宽度同tabstop）
autocmd FileType java,php setl shiftwidth=4
autocmd FileType java,php setl tabstop=4
autocmd FileType html,python,vim,javascript setlocal shiftwidth=2
autocmd FileType html,python,vim,javascript setlocal tabstop=2
set smarttab                                          " 指定按一次backspace就删除shiftwidth宽度
set backspace=indent,eol,start                                  " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set showmatch                                                     " 高亮现实匹配的括号 
set autoindent                                                    " 自动对齐
set autochdir                                                     " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes                                                " 设置备份时的行为为覆盖
set nowrapscan                                                    " 禁止在搜索到文件两端时重新搜索
set noerrorbells                                                  " 关闭错误信息响铃
set novisualbell                                                  " 关闭使用可视响铃代替呼叫
set hidden                                                        " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
let javascript_enable_domhtmlcss=1                            " 打开javascript对dom、html和css的支持
set autoread                                                              " 当文件在外部被修改，自动更新该文件
set ignorecase                                        " 搜索模式里忽略大小写
set smartcase                                         " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
set hlsearch                                                      " 搜索时高亮显示被找到的文本
set incsearch                                                     " 输入搜索内容时就显示搜索结果
" set noincsearch                                     " 在输入要搜索的文字时，取消实时匹配
set writebackup                                           " 保存文件前建立备份，保存成功后删除该备份
set nobackup                                              " 设置无备份文件
set noswapfile                                            " 设置无临时文件
set nowb
set vb t_vb=                                              " 关闭提示音
"set mouse=a                                          " 在所有的模式下面打开鼠标。

" -----------------------------------------------------------------------------
"  < 折叠设置 >
" -----------------------------------------------------------------------------
set foldenable                                        " 启用折叠
"set foldmethod=indent                                " indent 折叠方式
set foldmethod=marker                                 " marker 折叠方式
set foldcolumn=1                                                  " 设置折叠区域的宽度
setlocal foldlevel=1                                              " 设置折叠层数为
":set foldopen=all
":set foldclose=all                                               " 设置为自动关闭折叠
:highlight FoldColumn guibg=grey guifg=red                " 设置折叠颜色
" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
nnoremap - @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
let b:javascript_fold=1                                             " 打开javascript折叠
let php_folding=0                                     " 打开自动折叠的功能。

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
syntax enable
syntax on                                                         " 自动语法高亮
:colo molokai                                                       " 配色方案
set number                                            " 显示行号
set laststatus=2                                      " 启用状态栏信息
set statusline=\ %F%m%r%h%w%=\ [%{&ff}]\ [%Y]\ [%{&fileencoding}]\ [%04l,%04v][%p%%]\ [LEN=%L]
set cmdheight=1                                       " 设置命令行的高度，默认为1
set cursorline                                        " 突出显示当前行
set nowrap                                            " 设置不自动换行
autocmd BufNewFile,BufRead *.txt set filetype=txt
autocmd BufNewFile,BufRead *.doc set filetype=doc
autocmd FileType txt    set wrap
autocmd FileType doc   set wrap
set shortmess=atI                                     " 去掉欢迎界面
set helplang=cn                                       " 中文帮助
set ruler                                                         " 打开状态栏标尺
set magic                                                         " 设置魔术
set completeopt=longest,menu                                    " 关掉智能补全时的预览窗口


" 使状态行根据状态的不同，显示不同的颜色。
function! InsertStatuslineColor(mode)
if a:mode == 'i'
  hi statusline guibg=white
elseif a:mode == 'r'
  hi statusline guibg=white
else
  hi statusline guibg=white
endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=white guifg=blue
hi statusline guibg=white


" 设置 gVim 窗口初始位置及大小
if g:isGUI
     au GUIEnter * simalt ~x                          " 窗口启动时自动最大化
     winpos 300 10                                    " 指定窗口出现的位置，坐标原点在屏幕左上角
     set lines=50 columns=150                         " 指定窗口大小，lines为高度，columns为宽度
endif

" 显示/隐藏菜单栏、工具栏、滚动条，可用 F2 切换
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions+=r
    set guioptions-=L
    nmap <silent> <F2> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif

if (g:iswindows && g:isGUI)
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "解决consle输出乱码
    language messages zh_CN.utf-8
endif
" 自动保留屏幕上的内容。
set t_ti=
set t_te=

" 自动完成。
"autocmd FileType php          setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType html         setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript   setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd BufNewFile,BufRead *.conf set filetype=apache
"autocmd BufNewFile,BufRead *.vol  set filetype=vo_base
"autocmd BufNewFile,BufRead *todo* set filetype=vo_base
"autocmd BufNewFile,BufRead *.lst  set filetype=vo_base
"autocmd BufNewFile,BufRead *.tree set filetype=vo_base
"autocmd BufNewFile,BufRead *.book set filetype=vo_base
"imap <c-f>  <c-x><c-o>

" 重命名文件名
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))

" -----------------------------------------------------------------------------
"  < 快捷键设置 >
" -----------------------------------------------------------------------------
nmap <C-N> :tabnew<CR>                                            " 新建标签
nmap <F5> :Grep 
nmap <F12> :exit<CR>                                              " 当前窗口保存并退出
nmap cS :%s/\s\+$//g<CR>:noh<CR>                                " 常规模式下输入 cS 清除行尾空格
nmap cM :%s/\r$//g<CR>:noh<CR>                                  " 常规模式下输入 cM 清除行尾 ^M 符号
map <C-Tab> :bnext<CR>
map <S-Tab> :bp<CR>
map <C-S>   :w!<CR>

imap <M-h> <left>
imap <M-l> <Right>
imap <M-k> <Up>
imap <M-j> <Down>
" =============================================================================
"                          << 以下为常用插件配置 >>
" =============================================================================
" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
" -----------------------------------------------------------------------------
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" Vundle工具安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 如果想在 windows 安装就必需先安装 "git for window"，可查阅网上资料
":BundleList     //会显示你vimrc里面填写的所有插件名称
":BundleInstall  //会自动下载安装或更新你的插件。

set nocompatible                                      " 禁用 Vi 兼容模式
filetype off                                          " 禁用文件类型侦测

if g:islinux
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

" 使用Vundle来管理插件，这个必须要有。
Bundle 'gmarik/vundle'

" 以下为要安装或更新的插件，不同仓库都有（具体书写规范请参考帮助）
Bundle 'bufexplorer.zip'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'Yggdroot/indentLine'
Bundle 'Mark--Karkat'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'repeat.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'taglist.vim'
Bundle 'ZoomWin'
Bundle 'EasyGrep'


" -----------------------------------------------------------------------------
"  < BufExplorer 插件配置 >
" -----------------------------------------------------------------------------
" 快速轻松的在缓存中切换（相当于另一种多个文件间的切换方式）
"  bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
noremap <silent> <s-q> :BufExplorer<CR>
" \bs 上下方式查看
"noremap <silent> ul :BufExplorerHorizontalSplit<CR>
" \bv 左右方式查看
"noremap <silent> ol :BufExplorerVerticalSplit<CR>   "m是ALT键

let g:bufExplorerDefaultHelp      = 0     " 不显示默认帮助信息
let g:bufExplorerShowRelativePath = 1     " 显示相对路径
let g:bufExplorerSortBy           = 'mru' " 使用最近使用的排列方式
let g:bufExplorerSplitRight       = 0     " 居左分割
let g:bufExplorerSplitVertical    = 1     " 垂直分割
let g:bufExplorerSplitVertSize    = 30    " Split width
let g:bufExplorerUseCurrentWindow = 1     " 在新窗口中打开
autocmd BufWinEnter \[Buf\ List\] setl nonumber
" 


" -----------------------------------------------------------------------------
"  < ctrlp.vim 插件配置 >
" -----------------------------------------------------------------------------
" 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
" 常规模式下输入：Ctrl + p 调用插件

" -----------------------------------------------------------------------------
"  < emmet-vim（前身为Zen coding） 插件配置 >
" -----------------------------------------------------------------------------
" HTML/CSS代码快速编写神器，详细帮助见 :h emmet.txt
let g:user_emmet_expandabbr_key = '<c-e>'

" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了,仅支持VIM7.3以上版本
" 开启/关闭对齐线
"nmap line :IndentLinesToggle<CR>
":command Line :IndentLinesToggle

" 设置Gvim的对齐线样式
if g:isGUI
    let g:indentLine_char = "┊"
    let g:indentLine_first_char = "┊"
endif

" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'

let g:indentLine_enabled=0

" -----------------------------------------------------------------------------
"  < Mark--Karkat（也就是 Mark） 插件配置 >
" -----------------------------------------------------------------------------
" 给不同的单词标记高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt
" m+字母来添加一个标记，`+字母跳转到指定标记处（a-z26个字母）


" -----------------------------------------------------------------------------
"  < neocomplcache 插件配置 >
" -----------------------------------------------------------------------------
" 关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。
let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件
"let g:neocomplcache_enable_quick_match = 1
"let g:neocomplcache_disable_auto_complete = 1 "不自动弹出补全列表
" 在弹出补全列表后用 <c-p> 或 <c-n> 进行上下选择效果比较好


" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
" -----------------------------------------------------------------------------
" 有目录村结构的文件浏览插件
nnoremap <silent> <F3> :NERDTreeToggle<CR>  "打开/关闭NERDTree

let NERDTreeChDirMode=2 
let NERDTreeMouseMode=2
let NERDTreeWinPos="left"                   "在左侧显示NERDTree窗口
let NERDTreeWinSize=23                      "设置NERDTree窗口的宽度
let NERDTreeDirArrows=0                     "nerdtree插件目录箭头 1 显示箭头  0传统+-|号


" -----------------------------------------------------------------------------
"  < snipMate 插件配置 >
" -----------------------------------------------------------------------------
" 用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全，详细用法可以参
" 考使用说明或网络教程等。不过有时候也会与 supertab 插件在补全时产生冲突，如果大
" 侠有什么其它解决方法希望不要保留呀
filetype plugin on
"let snippets_dir = $VIMRUNTIME.'\..\vimfiles\snippets\'


" -----------------------------------------------------------------------------
"  < surround 插件配置 >
" -----------------------------------------------------------------------------
" 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt


" -----------------------------------------------------------------------------
"  < Syntastic 插件配置 >
" -----------------------------------------------------------------------------
" 用于保存文件时查检语法
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
"nnoremap <Leader>s :call ToggleErrors()<cr>
" nnoremap <Leader>sn :lnext<cr>
" nnoremap <Leader>sp :lprevious<cr>


" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------
" 相对 TagList 能更好的支持面向对象
" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭

let g:tagbar_width=23                       "设置窗口宽度
let g:tagbar_right=1                        "在右侧窗口中显示


" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等
" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭

"let Tlist_Auto_Open=1       "当打开vim时自动启用taglist插件
let Tlist_Show_One_File=1    "只显示当前文件的tag
let Tlist_Exit_OnlyWindow=1  "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1  "在右侧显示taglist窗口
let Tlist_WinWidth=23        "设置taglist窗口的宽度
let Tlist_File_Fold_Auto_Close=0            "自动折叠
let Tlist_Sort_Type = "order"
let Tlist_Enable_Fold_Column = 0
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Use_Horiz_Window = 0


"************************* WinManager插件设置 ****************************
"W+M : 打开/关闭WinManager插件（文档目录和taglist组合窗口）

let g:winManagerWindowLayout='FileExplorer|TagList'
"在进入vim时自动打开winmanager 
let g:AutoOpenWinManager = 0
"设置winmanager窗口宽度，默认为25
let g:winManagerWidth = 25
"设置taglistbuffer的最高限制：
let g:bufExplorerMaxHeight=30                            
"**************************** end ***************************************

" -----------------------------------------------------------------------------
"  < ZoomWin 插件配置 >
" -----------------------------------------------------------------------------
" 用于分割窗口的最大化与还原
" 常规模式下按快捷键 vip 在最大化与还原间切换
":command Vip :ZoomWin



" =============================================================================
"                          << 以下为常用工具配置 >>
" =============================================================================


" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
nmap <F8> :! ctags -R<CR>  " 打开ctages
"当光标在某个函数调用处时，按ctrl+]，光标便跳转到函数的定义处,再按ctrl+t，光标返回函数调用处


" =============================================================================
"                          << 以下为常用自动命令配置 >>
" =============================================================================

" 自动切换目录为当前编辑文件所在目录
au BufRead,BufNewFile,BufEnter * cd %:p:h
" =============================================================================
"                     << windows 下解决 Quickfix 乱码问题 >>
" =============================================================================
" windows 默认编码为 cp936，而 Gvim(Vim) 内部编码为 utf-8，所以常常输出为乱码
" 以下代码可以将编码为 cp936 的输出信息转换为 utf-8 编码，以解决输出乱码问题
" 但好像只对输出信息全部为中文才有满意的效果，如果输出信息是中英混合的，那可能
" 不成功，会造成其中一种语言乱码，输出信息全部为英文的好像不会乱码
" 如果输出信息为乱码的可以试一下下面的代码，如果不行就还是给它注释掉

" if g:iswindows
"     function QfMakeConv()
"         let qflist = getqflist()
"         for i in qflist
"            let i.text = iconv(i.text, "cp936", "utf-8")
"         endfor
"         call setqflist(qflist)
"      endfunction
"      au QuickfixCmdPost make call QfMakeConv()
" endif

" =============================================================================
"                          << 其它 >>
" =============================================================================
" 注：上面配置中的"<Leader>"在本软件中设置为"\"键（引号里的反斜杠），如<Leader>t
" 指在常规模式下按"\"键加"t"键，这里不是同时按，而是先按"\"键后按"t"键，间隔在一
" 秒内，而<Leader>cs是先按"\"键再按"c"又再按"s"键；如要修改"<leader>"键，可以把
" 下面的设置取消注释，并修改双引号中的键为你想要的，如修改为逗号键。
let mapleader = ","

"*****************************解决PHP/html/CSS/JS混编缩进问题**************************
nnoremap <leader>html :set filetype=html<CR>
nnoremap <leader>php :set filetype=php<CR>
nnoremap <leader>css :set filetype=css<CR>
nnoremap <leader>js :set filetype=javascript<CR>
"**************************************************************************************

"**********************************自定义字母组合快捷键设置**********************************
nnoremap <leader>vip :ZoomWin<CR>
nnoremap <leader>line :IndentLinesToggle<CR>
nnoremap <leader>ul :BufExplorerHorizontalSplit<CR>
nnoremap <leader>ol :BufExplorerVerticalSplit<CR>
nnoremap <leader>wm :WMToggle<CR>
nnoremap <leader>tl :TagbarClose<CR>:Tlist<CR>
nnoremap <leader>tb :TlistClose<CR>:TagbarToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

"******************************* 括号自动补全 *************************************
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf
function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf
function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf 
"*********************************** end ********************************************************

"*********************************** html 初始化模版 ********************************************

  function AddTitlehtml()
    call setline(1,'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">')
    call setline(2,'<html xmlns="http://www.w3.org/1999/xhtml">')
    call setline(3,'<head>')
    call setline(4,'<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />')
    call setline(5,'<title></title>')
    call setline(6,'<meta name="keywords" content="" />')
    call setline(7,'<meta name="description" content="" />')
    call setline(8,'</head>')
    call setline(9,'<body>')
    call setline(10,'')
    call setline(11,'</body>')
    call setline(12,'</html>')

  endf
:command Html :call AddTitlehtml()
"*********************************** end *******************************************************



" 模板。
autocmd BufNewFile  model.php    0r ~/.vim/template/model.php
autocmd BufNewFile  control.php  0r ~/.vim/template/control.php
autocmd BufNewFile  *.html.php   0r ~/.vim/template/html.php

"source ~/.vim/plugin/php-doc.vim 
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
"nnoremap <C-P> :call PhpDocSingle()<CR> 
"vnoremap <C-P> :call PhpDocRange()<CR> 
