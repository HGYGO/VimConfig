
let mapleader=","

"Vundle #################### {{{
"Special Setting

set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')
" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/ListToggle'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'rdnetto/YCM-Generator'
"Plugin '907th/vim-auto-save'
"Plugin 'Raimondi/delimitMate'

"colorscheme
Plugin 'https://github.com/flazz/vim-colorschemes.git'

"colorscheme 'desert-warm-256'

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
filetype plugin on
"}}}

"General Settings ##################### {{{
set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start "allow backspace over everything in insert mode
set   nobackup
set   cindent
set   cinoptions=:0
set   cursorline  "show cursor line
set   completeopt=longest,menuone
set   noexpandtab
set   fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,utf-8,prc
set   fileformat=unix
set   foldenable
set   foldmethod=marker
set   guioptions-=T
set   guioptions-=m
set   guioptions-=r
set   guioptions-=l
set   helpheight=10
set   helplang=cn
set   hidden
set   history=100
set   hlsearch

set   ignorecase
set   incsearch "do incremental search
set   laststatus=2
set   mouse=a "enable mouse
set   number  "show line number
set   pumheight=10
set   ruler  "show the cursor position all the time
set   scrolloff=5
set   shiftwidth=4
set   showcmd
set   smartindent
set   smartcase
set   tabstop=4
set   termencoding=utf-8
"set   textwidth=80
set   whichwrap=h,l
"set   wildignore=*.bak,*.o,*.e,*~
"set   wildmenu
"set   wildmode=list:longest,full
"set   nowrap
"set   autochdir
"set   hid
"
set   smarttab
"set   wildmode=list:longest
"set   backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set   directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
""set   guitablabel=%t

syntax on

"}}}
"TabLine ##################### {{{
set showtabline=2
set tabline=%!MyTabLine()

function! MyTabLine()
	let s = ''
	let a = 0
	for i in range(tabpagenr('$'))
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			if a == 0
				let s .= '%#TabLineFill1#'
				let a = 1
			else
				let s .= '%#TabLineFill2#'
				let a = 0
			endif
		endif
		let s .= '%' . (i + 1) . 'T'
		let s .= ' %{MyShortTabLabel(' . (i + 1) . ')} '
	endfor

	let s .= '%#TabLineOther#%T'
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999Xclose'
	endif
	return s
endfunction

function! MyShortTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  "let label = '<'
  let label = bufname (buflist[tabpagewinnr (a:n) -1])
  "let label .= '>'
  if getbufvar(buflist[tabpagewinnr (a:n) -1], '&modified')
	let label .= '[+]'
  endif
  let filename = fnamemodify (label, ':t')
  return filename
endfunction

"function! MyTabLabel(n)
  "let buflist = tabpagebuflist(a:n)
  "let winnr = tabpagewinnr(a:n)
  "return bufname(buflist[winnr - 1])
"endfunction


"  TabLineFill  tab pages line, where there are no labels
hi TabLineFill1 term=bold
hi TabLineFill1 ctermfg=white ctermbg=DarkMagenta
hi TabLineFill1 guifg=#777777

hi TabLineFill2 term=none
hi TabLineFill2 ctermfg=white ctermbg=DarkCyan
hi TabLineFill2 guifg=#777777
"  TabLineSel   tab pages line, active tab page label
hi TabLineSel term=inverse
"hi TabLineSel term=none
hi TabLineSel cterm=none ctermfg=yellow "ctermbg=White
"hi TabLineSel ctermfg=yellow
hi TabLineSel gui=none guifg=yellow guibg=Black

hi TabLineOther term=none
hi TabLineOther ctermfg=black ctermbg=black
hi TabLineOther guifg=#777777


"}}}
"Pugin NERDTree ##################### {{{
"========= NERDTree.vim =========
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=20
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0			"0:remain opening, 1:close
let g:NERDChristmasTree=1
let g:NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', 'tags']

let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden=1
"let NERDTreeKeepTreeInNewTab=1
nmap  <leader>f :NERDTreeFind<cr>
"*************NERD_tree****************
map  <F3>   :NERDTreeToggle<cr>
"map <F3> <plug>NERDTreeMirrorToggle<CR>
"autocmd vimenter * NERDTree
"autocmd vimenter * NERDTreeTabsToggle
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif

"}}}
"Plugin NERD_commenter.vim ##################### {{{
let g:NERDShutUp=1
let w:location=0
"}}}
"Plubin MRU.vim ##################### {{{
"let MRU_Include_Files = '\.c$\|\.h$|\.cpp'
let MRU_Window_Height = 15
let MRU_Use_Current_Window = 0
let MRU_Auto_Close = 1
let MRU_Max_Menu_Entries = 20
nmap <leader>m :MRU<cr>
"}}}
"Plubin YouCompleteMe #####################{{{
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <tab>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <CR>     pumvisible() ? "\<C-n>\<C-y> " : "\<CR>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"inoremap <expr> <CR>		pumvisible() ? "\<C-Space>" : "\<CR>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
"let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:clang_user_options='|| exit 0'
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:ycm_auto_trigger = 1
"let g:ycm_key_invoke_completion = '<C-q>'
"}}}
"Plubin listToggle ##################### {{{
"let g:lt_location_list_toggle_map = '<leader>l'
"let g:lt_quickfix_list_toggle_map = '<leader>q'
"let g:lt_height = 10
"}}}
"CopyAndPaste ##################### {{{
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>yy "+yy
nmap <leader>yw "+yw
nmap <leader>dd "+dd
nmap <leader>p "+p
nmap yw yiw
nmap <S-P> viwpyw
"nmap <C-S-P> pkdd
nmap <leader>q/ :Grep <C-R>=expand("<cword>")<cr> % <cr>
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"}}}
"Plubin TagBar ##################### {{{
" \tb 打开tagbar窗口
nmap <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
let g:tagbar_width = 20
"autocmd VimEnter * nested :TagbarOpen
"}}}
"Plubin pvim-powerline ##################### {{{
let g:Powerline_symbols = 'unicode'
"}}}
"Plubin vim-indent-guides ##################### {{{
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"}}}
"Plubin ultisnips ##################### {{{
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"定义存放代码片段的文件夹.vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]
"}}}
"Plubin vim-trailing-whitespace ##################### {{{
map <leader><space> :FixWhitespace<cr>
"}}}
"rdnetto/YCM-Generator ##################### {{{
":YcmGenerateConfig or :CCGenerateConfig
"}}}
"auto pair ######################## {{{

" 按退格键时判断当前光标前一个字符，如果是左括号，则删除对应的右括号以及括号中间的内容
function! RemovePairs()
    let l:line = getline(".")
    let l:previous_char = l:line[col(".")-1] " 取得当前光标前一个字符
    if index(["(", "[", "{"], l:previous_char) != -1
        let l:original_pos = getpos(".")
        execute "normal %"
        let l:new_pos = getpos(".")
        " 如果没有匹配的右括号
        if l:original_pos == l:new_pos
            execute "normal! xi"
            return
        end
        let l:line2 = getline(".")
        if len(l:line2) == col(".")
            " 如果右括号是当前行最后一个字符
            execute "normal! v%xa"
        else
            " 如果右括号不是当前行最后一个字符
            execute "normal! v%xi"
        end
    else
		let l:line = getline(".")
		if len(l:line) == col(".")
			execute 'normal! xa'
		else
			execute 'normal! xi'
		end
    end
	"gggg5
endfunction

inoremap <backspace> <ESC>:call RemovePairs()<CR>a

" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
function! RemoveNextDoubleChar(char)
	let l:line = getline(".")
	let l:next_char = l:line[col(".")] " 取得当前光标后一个字符

	"if l:next_char ==""
		"return
	"end

	if a:char == l:next_char
		execute "normal! l"
	else
		execute "normal! a" . a:char . ""
	end
endfunction
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left><CR><ESC>ko
inoremap < <><left>
inoremap << <<
"}}}
vnoremap <space> :
nnoremap <space> :

nnoremap <leader>ss :source ~/.vimrc<CR>
nnoremap <leader>ee :tabnew ~/.vimrc<CR>

" Switching between buffers.
nmap <S-h> <C-W>h
imap <S-h> <Esc><C-W>h
nmap <S-l> <C-W>l
imap <S-l> <Esc><C-W>l
"nnoremap <C-k> <C-W>k
"nnoremap <C-j> <C-W>j
"inoremap <C-j> <Esc><C-W>j
"inoremap <C-k> <Esc><C-W>k

nmap <C-h> :tabp<cr>
imap <C-h> <ESC>:tabp<cr>
"imap <C-left> <ESC>:tabp<cr>
nmap <C-l> :tabn<cr>
imap <C-l> <ESC>:tabn<cr>
"imap <C-right> <ESC>:tabn<cr>

"Remember the last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd! bufwritepost .vimrc source ~/.vimrc
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"automatically quit Tagbar and NERD_tree
"autocmd WinEnter :call NoExcitingBuffersLeft()<CR>
"autocmd BufLeave * :w<CR>
autocmd BufLeave,InsertLeave * silent! wall

