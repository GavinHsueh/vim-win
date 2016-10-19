"************************** ��ݼ����� **************************
"F1 : ��ʾ����
"F2 : �����˵�������
"F3 : ����nerdtree�ĵ�Ŀ¼
"F4 : ����tagbar���
"F5 : ��easygrep��ѯ����
"F6 : ����SrcExpl ���
"F7 : ����MiniBufExplorer����
"F8 : ��ctages�����򱻸Ķ�ʱ��������һ�Σ�ctages����ſ���Ч)
"F9 :
"F10 : ����/ȡ�� pasteģʽ
"F11 : windows��gvimȫ���л�
"F12 : ��ǰ���ڱ��沢�˳�
"Ctrl+N : �½���ǩ
"ctrl+]: ������ת�������Ķ��崦
"ctrl+t: ��귵�غ������ô�
"<C-Tab>: �л�������ǩ
"W+M : ��/�ر�WinManager������ĵ�Ŀ¼��taglist��ϴ��ڣ�
"t+b : ����tagbar���
"t+l : ����taglist���
"n+t : ����nerdtree���
"Ctrl+p : һ��ȫ·��ģ���ļ�����������������ʹ�ã�... �������(ctrlp.vim ���)
"ol : ��������鿴�Ѵ򿪵��ļ��б�
"ul : ���º���鿴�Ѵ򿪵��ļ��б�
"Ctrl+e : emmet���������дHTML����
"line : ����/�رն�����
",r : mark�������Ǽ�����ͬ��ǩ
" -  : �����۵�
"<c-w+o> : �ര��ʱ����ǰ�������
"m+��ĸ : ����һ�����(a-z)
"`+��ĸ : ��ת��ָ����Ǵ�
"**************************** end ********************************

" =============================================================================
"        << �жϲ���ϵͳ�� Windows ���� Linux ���ж����ն˻��� Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < �жϲ���ϵͳ�Ƿ��� Windows ���� Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < �ж����ն˻��� Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


" =============================================================================
"                          << ����Ϊ���Ĭ������ >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Windows Gvim Ĭ������> ����һ���޸�
" -----------------------------------------------------------------------------
if (g:iswindows && g:isGUI)
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set diffexpr=MyDiff()

    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif


" =============================================================================
"                          << ����Ϊ�û��Զ������� >>
" =============================================================================


" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
" ע��ʹ��utf-8��ʽ����������Դ�롢�ļ�·�����������ģ����򱨴�
set encoding=utf-8                                    " ����gvim�ڲ����룬Ĭ�ϲ�����
set fileencoding=utf-8                                " ���õ�ǰ�ļ����룬���Ը��ģ��磺gbk��ͬcp936��
set fileencodings=utf-8                               " ����֧�ִ򿪵��ļ��ı���


" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
set guifont=Consolas:h12
"set guifont=YaHei_Consolas_Hybrid\ 10                " ��������:�ֺţ��������ƿո����»��ߴ��棩


" -----------------------------------------------------------------------------
"  < �ļ���ʽ��Ĭ�� ffs=dos,unix >
" -----------------------------------------------------------------------------
set fileformats=dos,mac,unix                          " �����ļ���<EOL>��ʽ����

" -----------------------------------------------------------------------------
"  < ��д�ļ�ʱ������ >
" -----------------------------------------------------------------------------
filetype on                                           " �����ļ��������
filetype plugin on                                    " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on                             " ��������
autocmd! bufwritepost _vimrc source %                 " vimrc�ļ��޸�֮���Զ����ء� windows��
autocmd! bufwritepost .vimrc source %                 " vimrc�ļ��޸�֮���Զ����ء� linux��
set history=400                                       " history�洢���ȡ�
set smartindent                                       " �������ܶ��뷽ʽ
set expandtab                                         " ��Tab��ת��Ϊ�ո�
set tabstop=2                                         " ����Tab���Ŀ�ȣ����Ը��ģ��磺���Ϊ2
set shiftwidth=2                                      " ����ʱ�Զ�������ȣ��ɸ��ģ����ͬtabstop��
autocmd FileType java,php setl shiftwidth=4
autocmd FileType java,php setl tabstop=4
autocmd FileType html,python,vim,javascript setlocal shiftwidth=2
autocmd FileType html,python,vim,javascript setlocal tabstop=2
set smarttab                                          " ָ����һ��backspace��ɾ��shiftwidth���
set backspace=indent,eol,start                                  " ���趨�ڲ���״̬�޷����˸���� Delete ��ɾ���س���
set showmatch                                                     " ������ʵƥ������� 
set autoindent                                                    " �Զ�����
set autochdir                                                     " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set backupcopy=yes                                                " ���ñ���ʱ����ΪΪ����
set nowrapscan                                                    " ��ֹ���������ļ�����ʱ��������
set noerrorbells                                                  " �رմ�����Ϣ����
set novisualbell                                                  " �ر�ʹ�ÿ�������������
set hidden                                                        " ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�
let javascript_enable_domhtmlcss=1                            " ��javascript��dom��html��css��֧��
set autoread                                                              " ���ļ����ⲿ���޸ģ��Զ����¸��ļ�
set ignorecase                                        " ����ģʽ����Դ�Сд
set smartcase                                         " �������ģʽ������д�ַ�����ʹ�� 'ignorecase' ѡ�ֻ������������ģʽ���Ҵ� 'ignorecase' ѡ��ʱ�Ż�ʹ��
set hlsearch                                                      " ����ʱ������ʾ���ҵ����ı�
set incsearch                                                     " ������������ʱ����ʾ�������
" set noincsearch                                     " ������Ҫ����������ʱ��ȡ��ʵʱƥ��
set writebackup                                           " �����ļ�ǰ�������ݣ�����ɹ���ɾ���ñ���
set nobackup                                              " �����ޱ����ļ�
set noswapfile                                            " ��������ʱ�ļ�
set nowb
set vb t_vb=                                              " �ر���ʾ��
"set mouse=a                                          " �����е�ģʽ�������ꡣ

" -----------------------------------------------------------------------------
"  < �۵����� >
" -----------------------------------------------------------------------------
set foldenable                                        " �����۵�
"set foldmethod=indent                                " indent �۵���ʽ
set foldmethod=marker                                 " marker �۵���ʽ
set foldcolumn=1                                                  " �����۵�����Ŀ��
setlocal foldlevel=1                                              " �����۵�����Ϊ
":set foldopen=all
":set foldclose=all                                               " ����Ϊ�Զ��ر��۵�
:highlight FoldColumn guibg=grey guifg=red                " �����۵���ɫ
" ����ģʽ���ÿո�������ع���������۵���ע��zR չ�������۵���zM �ر������۵���
nnoremap - @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
let b:javascript_fold=1                                             " ��javascript�۵�
let php_folding=0                                     " ���Զ��۵��Ĺ��ܡ�

" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
syntax enable
syntax on                                                         " �Զ��﷨����
:colo torte                                                       " ��ɫ����
set number                                            " ��ʾ�к�
set laststatus=2                                      " ����״̬����Ϣ
set statusline=\ %F%m%r%h%w%=\ [%{&ff}]\ [%Y]\ [%{&fileencoding}]\ [%04l,%04v][%p%%]\ [LEN=%L]
set cmdheight=1                                       " ���������еĸ߶ȣ�Ĭ��Ϊ1
set cursorline                                        " ͻ����ʾ��ǰ��
set nowrap                                            " ���ò��Զ�����
set shortmess=atI                                     " ȥ����ӭ����
set helplang=cn                                       " ���İ���
set ruler                                                         " ��״̬�����
set magic                                                         " ����ħ��
set completeopt=longest,menu                                    " �ص����ܲ�ȫʱ��Ԥ������

" ���� gVim ���ڳ�ʼλ�ü���С
if g:isGUI
     au GUIEnter * simalt ~x                          " ��������ʱ�Զ����
     winpos 300 10                                    " ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
     set lines=50 columns=150                         " ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���
endif

" ��ʾ/���ز˵������������������������� F2 �л�
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
    "����˵�����
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "���consle�������
    language messages zh_CN.utf-8
endif
" �Զ�������Ļ�ϵ����ݡ�
set t_ti=
set t_te=

" �Զ���ɡ�
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

" -----------------------------------------------------------------------------
"  < ��ݼ����� >
" -----------------------------------------------------------------------------
nmap <C-N> :tabnew<CR>                                            " �½���ǩ
nmap <F5> :Grep 
nmap <F12> :exit<CR>                                              " ��ǰ���ڱ��沢�˳�
nmap cS :%s/\s\+$//g<CR>:noh<CR>                                " ����ģʽ������ cS �����β�ո�
nmap cM :%s/\r$//g<CR>:noh<CR>                                  " ����ģʽ������ cM �����β ^M ����
map <C-Tab> :bnext<CR>
map <S-Tab> :bp<CR>
map <C-S>   :w!<CR>

" =============================================================================
"                          << ����Ϊ���ò������ >>
" =============================================================================
" -----------------------------------------------------------------------------
"  < Vundle ������������� >
" -----------------------------------------------------------------------------
" ���ڸ�����Ĺ���vim����������÷��ο� :h vundle ����
" Vundle���߰�װ����Ϊ���ն�������������
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" ������� windows ��װ�ͱ����Ȱ�װ "git for window"���ɲ�����������
":BundleList     //����ʾ��vimrc������д�����в������
":BundleInstall  //���Զ����ذ�װ�������Ĳ����

set nocompatible                                      " ���� Vi ����ģʽ
filetype off                                          " �����ļ��������

if g:islinux
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

" ʹ��Vundle�����������������Ҫ�С�
Bundle 'gmarik/vundle'

" ����ΪҪ��װ����µĲ������ͬ�ֿⶼ�У�������д�淶��ο�������
Bundle 'bufexplorer.zip'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'Yggdroot/indentLine'
Bundle 'Mark--Karkat'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'wesleyche/SrcExpl'
Bundle 'tpope/vim-surround'
Bundle 'repeat.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'taglist.vim'
Bundle 'ZoomWin'
Bundle 'rking/ag.vim'
Bundle 'ggreer/the_silver_searcher'
Bundle 'EasyGrep'


" -----------------------------------------------------------------------------
"  < BufExplorer ������� >
" -----------------------------------------------------------------------------
" �������ɵ��ڻ������л����൱����һ�ֶ���ļ�����л���ʽ��
"  bufexplorer.vim Buffers�л�
" \be ȫ����ʽ�鿴ȫ���򿪵��ļ��б�
noremap <silent> <s-q> :BufExplorer<CR>
" \bs ���·�ʽ�鿴
noremap <silent> ul :BufExplorerHorizontalSplit<CR>
" \bv ���ҷ�ʽ�鿴
noremap <silent> ol :BufExplorerVerticalSplit<CR>   "m��ALT��

let g:bufExplorerDefaultHelp      = 0     " ����ʾĬ�ϰ�����Ϣ
let g:bufExplorerShowRelativePath = 1     " ��ʾ���·��
let g:bufExplorerSortBy           = 'mru' " ʹ�����ʹ�õ����з�ʽ
let g:bufExplorerSplitRight       = 0     " ����ָ�
let g:bufExplorerSplitVertical    = 1     " ��ֱ�ָ�
let g:bufExplorerSplitVertSize    = 30    " Split width
let g:bufExplorerUseCurrentWindow = 1     " ���´����д�
autocmd BufWinEnter \[Buf\ List\] setl nonumber
" 


" -----------------------------------------------------------------------------
"  < ctrlp.vim ������� >
" -----------------------------------------------------------------------------
" һ��ȫ·��ģ���ļ�����������������ʹ�ã�... �����������ϸ������ :h ctrlp
" ����ģʽ�����룺Ctrl + p ���ò��

" -----------------------------------------------------------------------------
"  < emmet-vim��ǰ��ΪZen coding�� ������� >
" -----------------------------------------------------------------------------
" HTML/CSS������ٱ�д��������ϸ������ :h emmet.txt
let g:user_emmet_expandabbr_key = '<c-e>'

" -----------------------------------------------------------------------------
"  < indentLine ������� >
" -----------------------------------------------------------------------------
" ������ʾ�����ߣ��� indent_guides ����ʾ��ʽ�ϲ�ͬ�������Լ�ϲ��ѡ����
" ���ն��ϻ�����Ļˢ�µ����⣬��������ܽ���и�����,��֧��VIM7.3���ϰ汾
" ����/�رն�����
nmap line :IndentLinesToggle<CR>

" ����Gvim�Ķ�������ʽ
if g:isGUI
    let g:indentLine_char = "��"
    let g:indentLine_first_char = "��"
endif

" �����ն˶�������ɫ�������ϲ�����Խ���ע�͵�����Ĭ����ɫ
let g:indentLine_color_term = 239

" ���� GUI ��������ɫ�������ϲ�����Խ���ע�͵�����Ĭ����ɫ
" let g:indentLine_color_gui = '#A4E57E'


" -----------------------------------------------------------------------------
"  < Mark--Karkat��Ҳ���� Mark�� ������� >
" -----------------------------------------------------------------------------
" ����ͬ�ĵ��ʱ�Ǹ�����������ͬ�ı���ʱ�����ã���ϸ������ :h mark.txt
" m+��ĸ�����һ����ǣ�`+��ĸ��ת��ָ����Ǵ���a-z26����ĸ��


" -----------------------------------------------------------------------------
"  < neocomplcache ������� >
" -----------------------------------------------------------------------------
" �ؼ��ֲ�ȫ���ļ�·����ȫ��tag��ȫ�ȵȣ����֣��ǳ����ã��ٶȳ��졣
let g:neocomplcache_enable_at_startup = 1     "vim ����ʱ���ò��
"let g:neocomplcache_enable_quick_match = 1
"let g:neocomplcache_disable_auto_complete = 1 "���Զ�������ȫ�б�
" �ڵ�����ȫ�б���� <c-p> �� <c-n> ��������ѡ��Ч���ȽϺ�


" -----------------------------------------------------------------------------
"  < nerdtree ������� >
" -----------------------------------------------------------------------------
" ��Ŀ¼��ṹ���ļ�������
nnoremap <silent> <F3> :NERDTreeToggle<CR>  "��/�ر�NERDTree
nnoremap <silent> nt :NERDTreeToggle<CR>
let NERDTreeChDirMode=2 
let NERDTreeMouseMode=2
let NERDTreeWinPos="left"                   "�������ʾNERDTree����
let NERDTreeWinSize=23                      "����NERDTree���ڵĿ��
let NERDTreeDirArrows=0                     "nerdtree���Ŀ¼��ͷ 1 ��ʾ��ͷ  0��ͳ+-|��


" -----------------------------------------------------------------------------
"  < snipMate ������� >
" -----------------------------------------------------------------------------
" ���ڸ��ִ��벹ȫ�����ֲ�ȫ��һ�ֶԴ����еĴ����������д��ȫ����ϸ�÷����Բ�
" ��ʹ��˵��������̵̳ȡ�������ʱ��Ҳ���� supertab ����ڲ�ȫʱ������ͻ�������
" ����ʲô�����������ϣ����Ҫ����ѽ
filetype plugin on
"let snippets_dir = $VIMRUNTIME.'\..\vimfiles\snippets\'


" -----------------------------------------------------------------------------
"  < SrcExpl ������� >
" -----------------------------------------------------------------------------
" ��ǿԴ����������书�ܾ���Windows�е�"Source Insight"
nmap <F6> :SrcExplToggle<CR>                "��/���������



" -----------------------------------------------------------------------------
"  < surround ������� >
" -----------------------------------------------------------------------------
" ���ٸ�����/�����������ӷ��ţ�����html��ǩ����ȱ���ǲ�����"."���ظ�����
" ���� repeat ������Խ��������⣬��ϸ������ :h surround.txt


" -----------------------------------------------------------------------------
"  < Syntastic ������� >
" -----------------------------------------------------------------------------
" ���ڱ����ļ�ʱ����﷨
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " ʹ��pyflakes,�ٶȱ�pylint��
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" �޸ĸ����ı���ɫ, ��Ӧ����
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
"  < Tagbar ������� >
" -----------------------------------------------------------------------------
" ��� TagList �ܸ��õ�֧���������
" ����ģʽ������ tb ���ò��������д� TagList �������Ƚ���ر�
nmap tb :TlistClose<CR>:TagbarToggle<CR>
let g:tagbar_width=23                       "���ô��ڿ��
let g:tagbar_right=1                        "���Ҳര������ʾ


" -----------------------------------------------------------------------------
"  < TagList ������� >
" -----------------------------------------------------------------------------
" ��Ч�����Դ��, �书�ܾ���vc�е�workpace
" �������г��˵�ǰ�ļ��е����к�,ȫ�ֱ���, ��������
" ����ģʽ������ tl ���ò��������д� Tagbar �������Ƚ���ر�
nmap tl :TagbarClose<CR>:Tlist<CR>
nmap <F4> :TagbarClose<CR>:Tlist<CR>
"let Tlist_Auto_Open=1       "����vimʱ�Զ�����taglist���
let Tlist_Show_One_File=1    "ֻ��ʾ��ǰ�ļ���tag
let Tlist_Exit_OnlyWindow=1  "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window=1  "���Ҳ���ʾtaglist����
let Tlist_WinWidth=23        "����taglist���ڵĿ��
let Tlist_File_Fold_Auto_Close=0            "�Զ��۵�
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


"************************* WinManager������� ****************************
"W+M : ��/�ر�WinManager������ĵ�Ŀ¼��taglist��ϴ��ڣ�
nmap wm :WMToggle<cr>
let g:winManagerWindowLayout='FileExplorer|TagList'
"�ڽ���vimʱ�Զ���winmanager 
let g:AutoOpenWinManager = 0
"����winmanager���ڿ�ȣ�Ĭ��Ϊ25
let g:winManagerWidth = 25
"����taglistbuffer��������ƣ�
let g:bufExplorerMaxHeight=30                            
"**************************** end ***************************************

" -----------------------------------------------------------------------------
"  < ZoomWin ������� >
" -----------------------------------------------------------------------------
" ���ڷָ�ڵ�����뻹ԭ
" ����ģʽ�°���ݼ� <c-w>o ������뻹ԭ���л�



" =============================================================================
"                          << ����Ϊ���ù������� >>
" =============================================================================


" -----------------------------------------------------------------------------
"  < ctags �������� >
" -----------------------------------------------------------------------------
" ���������ǳ��ķ���,�����ں���,����֮����ת��
nmap <F8> :! ctags -R<CR>  " ��ctages
"�������ĳ���������ô�ʱ����ctrl+]��������ת�������Ķ��崦,�ٰ�ctrl+t����귵�غ������ô�


" =============================================================================
"                          << ����Ϊ�����Զ��������� >>
" =============================================================================

" �Զ��л�Ŀ¼Ϊ��ǰ�༭�ļ�����Ŀ¼
au BufRead,BufNewFile,BufEnter * cd %:p:h
" =============================================================================
"                     << windows �½�� Quickfix �������� >>
" =============================================================================
" windows Ĭ�ϱ���Ϊ cp936���� Gvim(Vim) �ڲ�����Ϊ utf-8�����Գ������Ϊ����
" ���´�����Խ�����Ϊ cp936 �������Ϣת��Ϊ utf-8 ���룬�Խ�������������
" ������ֻ�������Ϣȫ��Ϊ���Ĳ��������Ч������������Ϣ����Ӣ��ϵģ��ǿ���
" ���ɹ������������һ���������룬�����Ϣȫ��ΪӢ�ĵĺ��񲻻�����
" ��������ϢΪ����Ŀ�����һ������Ĵ��룬������оͻ��Ǹ���ע�͵�

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
"                          << ���� >>
" =============================================================================
" ע�����������е�"<Leader>"�ڱ����������Ϊ"\"����������ķ�б�ܣ�����<Leader>t
" ָ�ڳ���ģʽ�°�"\"����"t"�������ﲻ��ͬʱ���������Ȱ�"\"����"t"���������һ
" ���ڣ���<Leader>cs���Ȱ�"\"���ٰ�"c"���ٰ�"s"������Ҫ�޸�"<leader>"�������԰�
" ���������ȡ��ע�ͣ����޸�˫�����еļ�Ϊ����Ҫ�ģ����޸�Ϊ���ż���
let mapleader = ","


"******************************* �����Զ���ȫ *************************************
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
"autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
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

"*********************************** html ��ʼ��ģ�� ********************************************

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
  map html :call AddTitlehtml()<CR>

"*********************************** end *******************************************************


"*********************************** PHP ��ʼ��ģ�� ********************************************

function AddTitlephp()
    call setline(1,'<?php')
    call setline(2,'')
    call setline(3,'')
    call setline(4,'')
    call setline(5,'?>')

  endf
  map php :call AddTitlephp()<CR>

"*********************************** end ********************************************************

" ģ�塣
"autocmd BufNewFile  model.php    0r ~/.vim/template/model.php
"autocmd BufNewFile  control.php  0r ~/.vim/template/control.php
"autocmd BufNewFile  *.html.php   0r ~/.vim/template/html.php
"autocmd BufNewFile  *.html   0r ~/.vim/template/tpl.html

"source ~/.vim/plugin/php-doc.vim 
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
"nnoremap <C-P> :call PhpDocSingle()<CR> 
"vnoremap <C-P> :call PhpDocRange()<CR> 
