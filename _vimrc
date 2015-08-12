"************************** ��ݼ����� **************************
"F1 : ��ʾ����
"F2 : �����˵�������
"F3 : ����taglist
"F4 : ����nerdtree�ĵ�Ŀ¼
"F5 : ��easygrep��ѯ����
"F6 : ����SrcExpl ���
"F7 : ����MiniBufExplorer����
"F8 : ��ctages�����򱻸Ķ�ʱ��������һ�Σ�ctages����ſ���Ч)
"F9 :
"F10 :
"F11 : windows��gvimȫ���л�
"F12: ��ǰ���ڱ��沢�˳�
"<C-k,j,h,l> : ����ģʽ�¹�����������ƶ�
"<C-h,j,k,l>: �л����������ҵĴ�����
"<C-��ͷ��>: �л����������Ҵ�����
"Ctrl+N : �½���ǩ
"ctrl+]: ������ת�������Ķ��崦
"ctrl+t: ��귵�غ������ô�
"<C-Tab>: �л�������ǩ
"W+M : ��/�ر�WinManager������ĵ�Ŀ¼��taglist��ϴ��ڣ�
"t+b : ����tagbar���
"ALT+q : ���ҷ�ʽ�鿴�Ѿ��򿪵��ļ���BufExplorer�����
"Ctrl+p : һ��ȫ·��ģ���ļ�����������������ʹ�ã�... �������(ctrlp.vim ���)
"<leader>il : ����/�رն�����(indentlines)
"<leader>ig : ����/�رն�����(indentguides)

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
set fileencodings=utf-8				      " ����֧�ִ򿪵��ļ��ı���


" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
set guifont=Consolas:h11
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
set smartindent                                       " �������ܶ��뷽ʽ
set expandtab                                         " ��Tab��ת��Ϊ�ո�
set tabstop=4                                         " ����Tab���Ŀ�ȣ����Ը��ģ��磺���Ϊ2
set shiftwidth=4                                      " ����ʱ�Զ�������ȣ��ɸ��ģ����ͬtabstop��
set smarttab                                          " ָ����һ��backspace��ɾ��shiftwidth���
set backspace=indent,eol,start 				" ���趨�ڲ���״̬�޷����˸���� Delete ��ɾ���س���
set showmatch               					" ������ʵƥ������� 
set autoindent              					" �Զ�����
set autochdir              					" �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set backupcopy=yes         					" ���ñ���ʱ����ΪΪ����
set nowrapscan              					" ��ֹ���������ļ�����ʱ��������
set noerrorbells            					" �رմ�����Ϣ����
set novisualbell            					" �ر�ʹ�ÿ�������������
set hidden                  					" ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�
let javascript_enable_domhtmlcss=1				" ��javascript��dom��html��css��֧��
set autoread							" ���ļ����ⲿ���޸ģ��Զ����¸��ļ�
set ignorecase                                        " ����ģʽ����Դ�Сд
set smartcase                                         " �������ģʽ������д�ַ�����ʹ�� 'ignorecase' ѡ�ֻ������������ģʽ���Ҵ� 'ignorecase' ѡ��ʱ�Ż�ʹ��
set hlsearch                					" ����ʱ������ʾ���ҵ����ı�
set incsearch               					" ������������ʱ����ʾ�������
" set noincsearch                                     " ������Ҫ����������ʱ��ȡ��ʵʱƥ��
set writebackup                             		" �����ļ�ǰ�������ݣ�����ɹ���ɾ���ñ���
set nobackup                                		" �����ޱ����ļ�
" set noswapfile                              		" ��������ʱ�ļ�
set vb t_vb=                                		" �ر���ʾ��

" -----------------------------------------------------------------------------
"  < �۵����� >
" -----------------------------------------------------------------------------
set foldenable                                        " �����۵�
"set foldmethod=indent                                 " indent �۵���ʽ
set foldmethod=marker                               " marker �۵���ʽ
set foldcolumn=1            					" �����۵�����Ŀ��
setlocal foldlevel=1        					" �����۵�����Ϊ
":set foldopen=all
":set foldclose=all          					" ����Ϊ�Զ��ر��۵�
:highlight FoldColumn guibg=grey guifg=red   		" �����۵���ɫ
" ����ģʽ���ÿո�������ع���������۵���ע��zR չ�������۵���zM �ر������۵���
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
let b:javascript_fold=1						" ��javascript�۵�


" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
syntax enable
syntax on                   					" �Զ��﷨����
:colo torte                 					" ��ɫ����
set number                                            " ��ʾ�к�
set laststatus=2                                      " ����״̬����Ϣ
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            						" ������״̬����ʾ����Ϣ
set cmdheight=1                                       " ���������еĸ߶ȣ�Ĭ��Ϊ1
set cursorline                                        " ͻ����ʾ��ǰ��
set nowrap                                            " ���ò��Զ�����
set shortmess=atI                                     " ȥ����ӭ����
set helplang=cn                                       " ���İ���
set ruler                  					" ��״̬�����
set magic                   					" ����ħ��
set completeopt=longest,menu  				" �ص����ܲ�ȫʱ��Ԥ������

" ���� gVim ���ڳ�ʼλ�ü���С
if g:isGUI
    " au GUIEnter * simalt ~x                         " ��������ʱ�Զ����
     winpos 100 10                                    " ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
     set lines=35 columns=120                         " ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���
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


" -----------------------------------------------------------------------------
"  < ��ݼ����� >
" -----------------------------------------------------------------------------
nmap <C-N> :tabnew<CR>      					" �½���ǩ
nmap <F5> :Grep 
"nmap <F9> :cw<CR>						" ��cscope�������
nmap <F12> :exit<CR>        					" ��ǰ���ڱ��沢�˳�
"nmap <F10> :cs add D:\WAMP5\wamp\www\cscope.out<CR>  " ����cscope���ݿ�
nmap cS :%s/\s\+$//g<CR>:noh<CR>				" ����ģʽ������ cS �����β�ո�
nmap cM :%s/\r$//g<CR>:noh<CR>				" ����ģʽ������ cM �����β ^M ����
imap <c-k> <Up>							" Ctrl + K ����ģʽ�¹�������ƶ�
imap <c-j> <Down>							" Ctrl + J ����ģʽ�¹�������ƶ�
imap <c-h> <Left>							" Ctrl + H ����ģʽ�¹�������ƶ�
imap <c-l> <Right>						" Ctrl + L ����ģʽ�¹�������ƶ�


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
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'wesleyche/SrcExpl'
Bundle 'tpope/vim-surround'
Bundle 'repeat.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'taglist.vim'
Bundle 'ZoomWin'
Bundle 'minibufexpl.vim'
Bundle 'derekmcloughlin/gvimfullscreen_win32'
Bundle 'rking/ag.vim'
Bundle 'ggreer/the_silver_searcher'
Bundle 'EasyGrep'
Bundle 'Indent-Guides'


" -----------------------------------------------------------------------------
"  < BufExplorer ������� >
" -----------------------------------------------------------------------------
" �������ɵ��ڻ������л����൱����һ�ֶ���ļ�����л���ʽ��
" {{{ bufexplorer.vim Buffers�л�
" \be ȫ����ʽ�鿴ȫ���򿪵��ļ��б�
noremap <silent> <s-q> :BufExplorer<CR>
" \bs ���·�ʽ�鿴
noremap <silent> <c-q> :BufExplorerHorizontalSplit<CR>
" \bv ���ҷ�ʽ�鿴
noremap <silent> <m-q> :BufExplorerVerticalSplit<CR>   "m��ALT��

let g:bufExplorerDefaultHelp      = 0     " ����ʾĬ�ϰ�����Ϣ
let g:bufExplorerShowRelativePath = 1     " ��ʾ���·��
let g:bufExplorerSortBy           = 'mru' " ʹ�����ʹ�õ����з�ʽ
let g:bufExplorerSplitRight       = 0     " ����ָ�
let g:bufExplorerSplitVertical    = 1     " ��ֱ�ָ�
let g:bufExplorerSplitVertSize    = 30    " Split width
let g:bufExplorerUseCurrentWindow = 1     " ���´����д�
autocmd BufWinEnter \[Buf\ List\] setl nonumber
" }}}


" -----------------------------------------------------------------------------
"  < ctrlp.vim ������� >
" -----------------------------------------------------------------------------
" һ��ȫ·��ģ���ļ�����������������ʹ�ã�... �����������ϸ������ :h ctrlp
" ����ģʽ�����룺Ctrl + p ���ò��

" -----------------------------------------------------------------------------
"  < emmet-vim��ǰ��ΪZen coding�� ������� >
" -----------------------------------------------------------------------------
" HTML/CSS������ٱ�д��������ϸ������ :h emmet.txt

" -----------------------------------------------------------------------------
"  < indentLine ������� >
" -----------------------------------------------------------------------------
" ������ʾ�����ߣ��� indent_guides ����ʾ��ʽ�ϲ�ͬ�������Լ�ϲ��ѡ����
" ���ն��ϻ�����Ļˢ�µ����⣬��������ܽ���и�����,��֧��VIM7.3���ϰ汾
" ����/�رն�����
nmap <leader>il :IndentLinesToggle<CR>

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
"  < Indent-Guides ������� >
" -----------------------------------------------------------------------------
nmap <leader>ig :IndentGuidesToggle<CR>
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4


" -----------------------------------------------------------------------------
"  < Mark--Karkat��Ҳ���� Mark�� ������� >
" -----------------------------------------------------------------------------
" ����ͬ�ĵ��ʱ�Ǹ�����������ͬ�ı���ʱ�����ã���ϸ������ :h mark.txt

" " -----------------------------------------------------------------------------
" "  < MiniBufExplorer ������� >
" " -----------------------------------------------------------------------------
" " ��������Ͳ���Buffer
" " ��Ҫ����ͬʱ�򿪶���ļ��������л�

map <F7> <ESC>:TMiniBufExplorer<CR>
let g:miniBufExplMapWindowNavVim = 1     "��<C-h,j,k,l>�л����������ҵĴ�����
let g:miniBufExplMapWindowNavArrows = 1  "��<C-��ͷ��>�л����������Ҵ�����
let g:miniBufExplMapCTabSwitchBufs = 1   "��<C-Tab>�л�������ǩ
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne=50      "�򿪴���0���ļ�ʱ���ֱ�ǩ

" �ڲ�ʹ�� MiniBufExplorer ���ʱҲ����<C-k,j,h,l>�л����������ҵĴ�����ȥ
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" -----------------------------------------------------------------------------
"  < neocomplcache ������� >
" -----------------------------------------------------------------------------
" �ؼ��ֲ�ȫ���ļ�·����ȫ��tag��ȫ�ȵȣ����֣��ǳ����ã��ٶȳ��졣
let g:neocomplcache_enable_at_startup = 1     "vim ����ʱ���ò��
" let g:neocomplcache_disable_auto_complete = 1 "���Զ�������ȫ�б�
" �ڵ�����ȫ�б���� <c-p> �� <c-n> ��������ѡ��Ч���ȽϺ�

" -----------------------------------------------------------------------------
"  < nerdcommenter ������� >
" -----------------------------------------------------------------------------
" ����Ҫ����C/C++����ע��(������Ҳ��)
" ����Ϊ���Ĭ�Ͽ�ݼ������е�˵������C/C++Ϊ���ģ�������������
" <Leader>ci ��ÿ��һ�� /* */ ע��ѡ����(ѡ������������)����������ȡ��ע��
" <Leader>cm ��һ�� /* */ ע��ѡ����(ѡ������������)������������ظ�ע��
" <Leader>cc ��ÿ��һ�� /* */ ע��ѡ���л���������������ظ�ע��
" <Leader>cu ȡ��ѡ������(��)��ע�ͣ�ѡ������(��)��������һ�� /* */
" <Leader>ca ��/*...*/��//������ע�ͷ�ʽ���л����������Կ��ܲ�һ���ˣ�
" <Leader>cA ��βע��
let NERDSpaceDelims = 1                     "����ע�ͷ�֮����ע�ͷ�֮ǰ���пո�

" -----------------------------------------------------------------------------
"  < nerdtree ������� >
" -----------------------------------------------------------------------------
" ��Ŀ¼��ṹ���ļ�������
nnoremap <silent> <F4> :NERDTreeToggle<CR>  "��/�ر�NERDTree
let NERDTreeChDirMode=2 
let NERDTreeMouseMode=2
let NERDTreeWinPos="right"                  "���Ҳ���ʾNERDTree����
let NERDTreeWinSize=23                      "����NERDTree���ڵĿ��



" -----------------------------------------------------------------------------
"  < powerline ������� >
" -----------------------------------------------------------------------------
" ״̬����������õ�״̬��Ч��



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


" -----------------------------------------------------------------------------
"  < Tagbar ������� >
" -----------------------------------------------------------------------------
" ��� TagList �ܸ��õ�֧���������
" ����ģʽ������ tb ���ò��������д� TagList �������Ƚ���ر�
nmap tb :TlistClose<CR>:TagbarToggle<CR>
let g:tagbar_width=30                       "���ô��ڿ��
" let g:tagbar_left=1                       "����ര������ʾ


" -----------------------------------------------------------------------------
"  < TagList ������� >
" -----------------------------------------------------------------------------
" ��Ч�����Դ��, �书�ܾ���vc�е�workpace
" �������г��˵�ǰ�ļ��е����к�,ȫ�ֱ���, ��������
" ����ģʽ������ tl ���ò��,���������ó���F3������д� Tagbar �������Ƚ���ر�
nmap <F3> :TagbarClose<CR>:Tlist<CR>
"let Tlist_Auto_Open=1       "����vimʱ�Զ�����taglist���
let Tlist_Show_One_File=1    "ֻ��ʾ��ǰ�ļ���tag
let Tlist_Exit_OnlyWindow=1  "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Left_Window=1  "�������ʾtaglist����
let Tlist_WinWidth=23        "����taglist���ڵĿ��
let Tlist_File_Fold_Auto_Close=1            "�Զ��۵�


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


" -----------------------------------------------------------------------------
"  < gvimfullscreen �������� > ��ȷ���Ѱ�װ�˹���
" -----------------------------------------------------------------------------
" ���� Windows Gvim ȫ�����ڣ����� F11 �л�
" ȫ���������ز˵�������������������Ч������
if (g:iswindows && g:isGUI)
    nmap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif



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
	call setline(5,'<title>�ޱ����ĵ�</title>')
	call setline(6,'<meta name="keywords" content="��վ�ؼ���" />')
	call setline(7,'<meta name="description" content="��վ����" />')
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

