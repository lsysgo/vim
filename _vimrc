" ===================================================================
"     FileName: _vimrc
"       Author: LsYsGo
"        Email: lsysgo@gmail.com
"   CreateTime: 2013-12-21 16:45
" ===================================================================

" ---------- Meta系按键 ----------
"
" Alt  + H                   --光标左移一格           [插入模式]
" Alt  + J                   --光标下移一格           [插入模式]
" Alt  + K                   --光标上移一格           [插入模式]
" Alt  + L                   --光标右移一格           [插入模式]

" ---------- Leader系按键 ----------
"
" \R[大写]                   --源码一键编译运行       [全模式可用]
"
" \crb                        --一键去除所有尾部空白   [全模式可用]
" \crt                        --一键替换全部Tab为空格  [全模式可用]
" \ig                        --显示/关闭对齐线
" \bb                        --按=号对齐代码
" \bn                        --自定义对齐
" \html                        --一键生成与当前编辑文件同名的HTML文件 [不输出行号]
" \cnf                        --编辑当前所使用的Vim配置文件
" \mt                        --在当前目录下递归生成tags文件
"
" \cc                        --添加注释               [NERD_commenter]
" \cu                        --取消注释               [NERD_commenter]
" \cm                        --添加块注释             [NERD_commenter]
" \cs                        --添加SexStyle块注释     [NERD_commenter]
"
" \16                        --以十六进制格式查看
" \r16                       --返回普通格式

" ---------- 补全命令 ----------
"
" Tab键                      --语法结构补全   [插入模式][snipMate插件]
" Ctrl+Y+,                   --HTML标签补全  [插入模式][zencoding插件]

" ---------- 便捷操作 ----------
"
" m字符       and '字符      --标记位置 and 跳转到标记位置
" q字符 xxx q and @字符      --录制宏   and 执行宏
"
" ---------- 其他常用内建命令 ------------------------------
"
" :se ff=unix                --更改文件格式，可选 unix、dos、mac
" :se ft=cpp                 --更改文件语法着色模式


" 判断操作系统类型
if(has("win32") || has("win64"))
    let g:isWIN = 1
else
    let g:isWIN = 0
endif

" 判断是否处于GUI界面
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


" 设置通用缩进策略
set shiftwidth=4
set tabstop=4

" 对部分语言设置单独的缩进
au FileType ruby,eruby,slim,coffee,jade,sh set shiftwidth=2
au FileType ruby,eruby,slim,coffee,jade,sh set tabstop=2

" 根据后缀名指定文件类型
au BufRead,BufNewFile *.h   setlocal ft=c
au BufRead,BufNewFile *.sql setlocal ft=mysql
au BufRead,BufNewFile *.tpl setlocal ft=smarty
au BufRead,BufNewFile *.txt setlocal ft=txt
au BufRead,BufNewFile *.go setlocal ft=go
au BufRead,BufNewFile *.wk setlocal ft=work
au BufRead,BufNewFile *.lyg setlocal ft=lsysgo


" surround key mappings
let g:surround_no_mappings=1

" 加载pathogen插件管理器
execute pathogen#infect()

" 变更<Leader>符号
let mapleader = ","

set background=dark
colorscheme solarized
set guifont=Monaco:h11

set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set relativenumber           " 开启相对行号
set nu!                      " 显示行号
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set writebackup              " 设置无备份文件
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set list                     " 显示特殊字符，其中Tab使用高亮竖线代替，尾部空白使用高亮点号代替
set listchars=tab:\|\ ,trail:.
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
"set showmatch               " 显示括号配对情况
"set nowrap                  " 设置不自动换行

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全


" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif


" 使用GUI界面时的设置
if g:isGUI
    " 启动时自动最大化窗口
    if g:isWIN
        au GUIEnter * simalt ~x
    endif
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    set guioptions+=c        " 使用字符提示框
    set guioptions-=m        " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    set guioptions-=L        " 隐藏左侧滚动条
    set guioptions-=r        " 隐藏右侧滚动条
    set guioptions-=b        " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
    set cursorline           " 突出显示当前行
endif


" 编译并运行
func! Compile_Run_Code()
    exec "w"
    if &filetype == "c"
        if g:isWIN
            exec "!gcc -Wall -o %:r %:t && %:r.exe"
        else
            exec "!clang -Wall -o %:r %:t && ./%:r"
        endif
    elseif &filetype == "cpp"
        if g:isWIN
            exec "!g++ -Wall -o %:r %:t && %:r.exe"
        else
            exec "!clang++ -Wall -o %:r %:t && ./%:r"
        endif
    elseif &filetype == "php"
        exec "!php %:t"
    elseif &filetype == "go"
        exec "!go run %:t"
    elseif &filetype == "python"
        exec "!python %:t"
    elseif &filetype == "ruby"
        exec "!ruby %:t"
    elseif &filetype == "coffee"
        exec "!coffee -c %:t && coffee %:t"
    elseif &filetype == "javascript"
        exec "!node %:t"
    elseif &filetype == "sh"
        exec "!bash %:t"
    endif
endfunc


" ======= 自动替换Tab为空格 ======= "

" 空格替换Tab
func! RemoveTabs()
    if &shiftwidth == 2
        exec "%s/	/  /g"
    elseif &shiftwidth == 4
        exec "%s/	/    /g"
    elseif &shiftwidth == 6
        exec "%s/	/      /g"
    elseif &shiftwidth == 8
        exec "%s/	/        /g"
    else
        exec "%s/	/ /g"
    end
endfunc

" 괄호 괄호 칼러칼러
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



" MiniBufExplorer     多文件切换，也可使用鼠标双击相应文件名进行切换
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1

" :Tlist              调用TagList
let Tlist_Show_One_File        = 1             " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow      = 1             " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window     = 1             " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close = 1             " 自动折叠

" :LoadTemplate       根据文件后缀自动加载模板
if g:isWIN
    let g:template_path = $VIM.'/vimfiles/template/'
else
    let g:template_path = '~/.vim/template/'
endif

" snipMate            Tab智能补全
let g:snips_author = 'lsysgo'
if g:isWIN
    let g:snippets_dir = $VIM.'/snippets/'
else
    let g:snippets_dir = '~/.vim/snippets/'
endif
let g:snipMate                             = {}
" 设置补全项之间的继承关系，比如 PHP补全继承HTML的补全
let g:snipMate.scope_aliases               = {}
let g:snipMate.scope_aliases['c']          = 'cpp'
let g:snipMate.scope_aliases['php']        = 'php,html,codeigniter'
let g:snipMate.scope_aliases['smarty']     = 'smarty,html'
let g:snipMate.scope_aliases['blade']      = 'blade,html'
let g:snipMate.scope_aliases['twig']       = 'twig,html'
let g:snipMate.scope_aliases['htmldjango'] = 'htmldjango,html'
let g:snipMate.scope_aliases['eruby']      = 'eruby,html'
let g:snipMate.scope_aliases['jst']        = 'jst,html'
let g:snipMate.scope_aliases['scss']       = 'scss,css'
let g:snipMate.scope_aliases['less']       = 'less,css'
let g:snipMate.scope_aliases['xhtml']      = 'html'
let g:snipMate.scope_aliases['html']       = 'html,angular'


" NERD_commenter      注释处理插件
let NERDSpaceDelims = 1                        " 自动添加前置空格

" AuthorInfoDetect    自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author   = 'LsYsGo'                " 昵称
let g:vimrc_email    = 'lsysgo@gmail.com'         " 邮箱

" Indent_guides       显示对齐线
let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸

" AirLine             彩色状态栏
let g:airline_theme = 'badwolf'                " 设置主题

" Syntastic           语法检查
let g:syntastic_check_on_open = 1              " 默认开启
let g:syntastic_mode_map      = {'mode': 'active',
            \'active_filetypes':  [],
            \'passive_filetypes': ['html', 'css', 'xhtml', 'eruby', 'slim', 'scss', 'jade', 'less', 'go']
            \}                                 " 指定不需要检查的语言 [主要是因为开启这些语言的语法检查会妨碍到正常的工作]



" ======= 自定义快捷键 ======= "

" Alt  + H            光标左移一格
imap <c-h> <Left>

" Alt  + J            光标下移一格
imap <c-j> <Down>

" Alt  + K            光标上移一格
imap <c-k> <Up>

" Alt  + L            光标右移一格
imap <c-l> <Right>

" \16                 十六进制格式查看
nmap <leader>16 <ESC>:%!xxd<ESC>

" \r16                返回普通格式
nmap <leader>r16 <ESC>:%!xxd -r<ESC>

" \cf                编辑当前所使用的Vim配置文件
nmap <leader>cf <ESC>:e $MYVIMRC<CR>

" \mt                 在当前目录下递归生成tags文件
nmap <leader>mt <ESC>:!ctags -R --languages=

" \R                 一键保存、编译、运行
nmap <leader>R :call Compile_Run_Code()<CR>
imap <leader>R <ESC>:call Compile_Run_Code()<CR>
vmap <leader>R <ESC>:call Compile_Run_Code()<CR>

" \T         一键加载语法模板
nmap <leader>T :LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
imap <leader>T <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
vmap <leader>T <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi

nmap <leader>tf :set ft=
imap <leader>tf <ESC>:set ft=

imap <leader>tu <ESC>u

" t: txt
nmap <leader>ty "+y
imap <leader>ty <ESC>"+y
vmap <leader>ty <ESC>"+y

nmap <leader>tp "+p
imap <leader>tp <ESC>"+p
vmap <leader>tp <ESC>"+p

" \tb                 按=号对齐代码 [Tabular插件]
nmap <leader>tt :Tab /=<CR>
imap <leader>tt <ESC>:Tab /=<CR>

" \tc                自定义对齐    [Tabular插件]
nmap <leader>tc :Tab /
imap <leader>tc <ESC>:Tab /
" \R                  一键替换全部Tab为空格
imap <leader>tr <ESC>:call RemoveTabs()<CR>
nmap <leader>tr :call RemoveTabs()<CR>
vmap <leader>tr <ESC>:call RemoveTabs()<CR>

" \rb                 一键去除所有尾部空白
imap <leader>tb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>tb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <leader>tb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" \th                 一键生成与当前编辑文件同名的HTML文件 [不输出行号]
imap <leader>th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
nmap <leader>th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
vmap <leader>th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>


" ======= lsysgo ======= "

" 命令快捷键
nmap <leader>ee <c-c>
imap <leader>ee <c-c>
vmap <leader>ee <c-c>

imap <leader>ev <c-c>V
nmap <leader>ev <c-c>V

nmap <leader>er <c-c>:
imap <leader>er <c-c>:
vmap <leader>er <c-c>:

" \q        关闭 & 强制关闭
nmap <leader>eq <c-c>:q<CR>
imap <leader>eq <c-c>:q<CR>
nmap <leader>fq <c-c>:q!<CR>
imap <leader>fq <c-c>:q!<CR>

" \w        保存 & 保存并强制关闭 (单个)
nmap <leader>ew <c-c>:w<CR>
imap <leader>ew <c-c>:w<CR>
nmap <leader>fw <c-c>:wq!<CR>
imap <leader>fw <c-c>:wq!<CR>

" \a        保存 & 强制关闭 (全部)
nmap <leader>ea <c-c>:wa<CR>
imap <leader>ea <c-c>:wa<CR>
nmap <leader>fa <c-c>:wqa!<CR>
imap <leader>fa <c-c>:wqa!<CR>

" 输入模式下快捷键
imap <leader>ed <ESC>d
imap <leader>ey <ESC>y
imap <leader>ep <ESC>p
imap <leader>eu <ESC>u


" s: show 显示上右下左窗口
nmap <leader>sj :CtrlP<CR>
imap <leader>sj <ESC>:CtrlP<CR>
vmap <leader>sj <ESC>:CtrlP<CR>

nmap <leader>sb :CtrlPBuffer<CR>
imap <leader>sb <ESC>:CtrlPBuffer<CR>
vmap <leader>sb <ESC>:CtrlPBuffer<CR>

nmap <leader>sm :CtrlPMRU<CR>
nmap <leader>sm <ESC>:CtrlPMRU<CR>
nmap <leader>sm <ESC>:CtrlPMRU<CR>


nmap <leader>sh :NERDTree<CR>
imap <leader>sh <ESC>:NERDTree<CR>
vmap <leader>sh <ESC>:NERDTree<CR>

nmap <leader>sl :Tlist<CR><c-l><c-l><c-l>
imap <leader>sl <ESC>:Tlist<CR><c-l><c-l><c-l>
vmap <leader>sl <ESC>:Tlist<CR><c-l><c-l><c-l>

nmap <leader>st :FufFile<CR>
imap <leader>st <ESC>:FufFile<CR>
vmap <leader>st <ESC>:FufFile<CR>

" 光标快速移动
imap <leader>ll <End>
imap <leader>hh <Home>
imap <leader>jj <ESC>o
imap <leader>kk <ESC>O


" b: Buffer
imap <leader>bb <ESC>:ls<CR>
imap <leader>bd <ESC>:bd<CR>
imap <leader>bf <ESC>:bf<CR>
imap <leader>bl <ESC>:bl<CR>
imap <leader>bn <ESC>:bn<CR>
imap <leader>bp <ESC>:bp<CR>

" 注释命令
imap <leader>cc <ESC>,cc
imap <leader>cs <ESC>,cs
imap <leader>cy <ESC>,cy
imap <leader>cm <ESC>,cm
imap <leader>cu <ESC>,cu

" 更改窗口大小 & 使用 :windo命令
imap <leader>ws <ESC>:res 
imap <leader>wd <ESC>:windo 
imap <leader>wv <ESC>::vertical res 


" 窗口焦点变更
nmap <leader>wr :winc x<CR>
nmap <leader>wl :winc l<CR>
nmap <leader>wh :winc h<CR>
nmap <leader>wj :winc j<CR>
nmap <leader>wk :winc k<CR>
nmap <leader>wt :winc t<CR>
nmap <leader>wb :winc b<CR>
imap <leader>wr <ESC>:winc x<CR>
imap <leader>wl <ESC>:winc l<CR>
imap <leader>wh <ESC>:winc h<CR>
imap <leader>wj <ESC>:winc j<CR>
imap <leader>wk <ESC>:winc k<CR>
imap <leader>wt <ESC>:winc t<CR>
imap <leader>wb <ESC>:winc b<CR>

" 窗口位置移动
imap <leader>wK <ESC>:winc K<CR>
nmap <leader>wK <ESC>:winc K<CR>
imap <leader>wJ <ESC>:winc J<CR>
nmap <leader>wJ <ESC>:winc J<CR>
imap <leader>wL <ESC>:winc L<CR>
nmap <leader>wL <ESC>:winc L<CR>
imap <leader>wH <ESC>:winc H<CR>
nmap <leader>wH <ESC>:winc H<CR>

" surround 단축기 설정
nmap <leader>rd  <Plug>Dsurround
nmap <leader>rc  <Plug>Csurround
nmap <leader>rs  <Plug>Ysurround
nmap <leader>rss <Plug>Yssurround
xmap <leader>rv  <Plug>VSurround
xmap <leader>rvv <Plug>VgSurround

imap <leader>rd  <ESC><Plug>Dsurround
imap <leader>rc  <ESC><Plug>Csurround
imap <leader>rs  <ESC><Plug>Ysurround
imap <leader>rss <ESC><Plug>Yssurround
xmap <leader>rv  <ESC><Plug>VSurround
xmap <leader>rvv <ESC><Plug>VgSurround


