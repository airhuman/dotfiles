set nocompatible

" plugins {{{
call plug#begin('~/.config/nvim/plugged')

" deoplete framework {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim' " vimscripts for deoplete complete
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'} "go for deoplete
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim' "gS gJ
Plug 'deoplete-plugins/deoplete-jedi' " py for deoplete
Plug 'davidhalter/jedi-vim'
Plug 'jeetsukumaran/vim-pythonsense'

Plug 'ncm2/float-preview.nvim'
" deoplete framework }}}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" auto format plugin
Plug 'sbdchd/neoformat'

" code syntax check
Plug 'dense-analysis/ale'

" tag
Plug 'majutsushi/tagbar'

" snippet framework
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/tComment'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rbgrouleff/bclose.vim'
Plug 'moll/vim-bbye'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" 变更的跳转
" ]c   Jump to next hunk.
" [c   Jump to previous hunk.
" ]C   Jump to last hunk.
" [C   Jump to first hunk.
Plug 'mhinz/vim-signify'
Plug 'jamessan/vim-gnupg'
Plug 'jiangmiao/auto-pairs'
Plug 'cespare/vim-toml'
Plug 'hotoo/pangu.vim' " 中文排版
Plug 'avakhov/vim-yaml'

" for markdown
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'

" easymotion
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

call plug#end() " }}}

" general {{{
syntax enable

let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute 'normal! g`"zvzz' |
    \ endif
augroup END
" general }}}


" setting {{{
set list listchars=tab:› ,eol:¬,trail:•
set backspace=indent,eol,start
set laststatus=2
set maxmempattern=5000
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set hidden
set wildmenu
set wildmode=longest:full,full
if has('mac')
  let g:clipboard = {
    \   'name': 'macOS-clipboard',
    \   'copy': {
    \      '+': 'pbcopy',
    \      '*': 'pbcopy',
    \    },
    \   'paste': {
    \      '+': 'pbpaste',
    \      '*': 'pbpaste',
    \   },
    \   'cache_enabled': 0,
    \ }
endif

if has('clipboard')
  set clipboard& clipboard+=unnamedplus
endif
""
set nofoldenable
set relativenumber
set magic
set hlsearch
set pastetoggle=<F6>
set grepprg=rg
set t_Co=256
set background=dark
colorscheme PaperColor

set dictionary+=/usr/share/dict/words
set lazyredraw
set showcmd
set gfn=Monaco:h18
set history=1000

set noexpandtab     " Don't expand tabs to spaces.
set tabstop=4       " The number of spaces a tab is
set softtabstop=4   " While performing editing operations
set shiftwidth=4    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set updatetime=400  " Idle time to write swap and trigger CursorHold
set ttimeoutlen=10  " Time out on key codes

set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set showfulltag     " Show tag and tidy search in completion
" setting }}}

" mappings {{{
nnoremap <F3> :let @/ = ""<CR>
" Q: Closes the window
nnoremap Q :q<cr>
" close all windows
nnoremap <leader>Q :qa!<cr>
" Act like D and C
nnoremap Y y$
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" easy move around windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
" ctrl_e ctrl_y 3 lines
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>
vnoremap <c-e> 3<c-e>
vnoremap <c-y> 3<c-y>

" 单个word加双引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" visually selected加双引号
vnoremap <leader>" :normal! `<i"<esc>`>la"<esc>"

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>
" sort
vnoremap <leader>s :sort<cr>
" easy move code blocks
vnoremap < <gv
vnoremap > >gv

"inoremap maps a key combination for insert mode
"<C-e> is the keybinding I am creating.
"<C-o> is a command that switches vim to normal mode for one command.
"$ jumps to the end of the line and we are switched back to insert mode.
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" Navigating in Command Mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" When you forgot to open vim with sudo, use w!!
cmap w!! w !sudo tee > /dev/null %

"Insert Mode move word forward and backward
inoremap <c-b> <c-\><c-O>b
inoremap <c-f> <c-\><c-O>w

" Calculate from current line
nnoremap <leader>ca yypkA<Esc>jOscale=2<Esc>:.,+1!bc<CR>kdd

" delete current line
map <c-d> dd
" delete current line in Insert Mode
imap <c-d> <esc>ddi

map <c-u> viwU
" convert the current work to uppercase in Insert Mode
imap <c-u> <esc>viwUea

" exit insert mode
inoremap jk <esc>

" 更新括号里的内容，非常有用
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" 保存
nnoremap <c-s> :<c-u>update<cr>
inoremap <c-s> <c-o>:update<cr>
vnoremap <c-s> <esc>:update<cr>gv

" disable F1
noremap <F1> <nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" mappings }}}

" supertab {{{
" Why does <tab> navigate the completion menu from bottom to top?
let g:SuperTabDefaultCompletionType = "<c-n>"
" supertab}}}

" snippets {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets="<leader><enter>"
let g:UltiSnipsEditSplit="vertical"
" snippets }}}

" airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t' " only show buffer name
let g:airline_theme = "dark"
" airline }}}

" align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" align }}}

" autopairs {{{
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = '<F4>'
" autopairs }}}

" bufkill {{{
map <C-c> :Bclose<cr>
" bufkill }}}

" vim-go {{{
let g:go_test_prepend_name = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = "gopls"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1
let g:go_auto_sameids = 0
let g:go_doc_popup_window = 1
let g:go_null_module_warning = 0
let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 0
let g:go_highlight_function_calls = 0
let g:go_gocode_propose_source = 1
let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" vim-go }}}
" deoplete-jedi & jedi {{{
let g:jedi#completions_enabled = 0 " use deoplete-go to complete
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
" deoplete-jedi & jedi }}}

" float-preview {{{
let g:float_preview#docked = 0
"float-preview }}}

" neoformat {{{
let g:neoformat_enabled_python = ['autopep8']
" neoformat }}}

" ale {{{
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_linters = {
\ 'python':['pylint'],
\ 'javascript':['eslint'],
\ 'java':[],
\ 'go': ['gofmt', 'golint']
\ }
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['autopep8'],
\ 'go': ['gofmt']
\ }
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%code%] %s [%severity%]'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
nmap <silent> <space>j <Plug>(ale_next_wrap)
nmap <silent> <space>k <Plug>(ale_previous_wrap)

" ale }}}

" target {{{
nnoremap <silent> <leader>2 :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_autoshowtag = 1
let tags = "./tags"
" tagbar }}}
" markdown {{{
let g:vim_markdown_math = 1
nmap <leader>md :MarkdownPreview<CR>
" markdown }}}
" denite {{{
try
  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  " Custom options for ripgrep
  "   --vimgrep:  Show results with every match on it's own line
  "   --hidden:   Search hidden directories and files
  "   --heading:  Show the file name above clusters of matches from each file
  "   --S:        Search case insensitively if the pattern is all lowercase
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
  " Recommended defaults for ripgrep via Denite docs
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('buffer', 'date_format', '')
  let s:denite_options = {'default' : {
  \ 'split': 'floating',
  \ 'start_filter': 1,
  \ 'auto_resize': 0,
  \ 'prompt': '> ',
  \ 'statusline': 0,
  \ 'highlight_matched_char': 'Visual',
  \ 'highlight_matched_range': 'Visual',
  \ 'highlight_window_background': 'NormalFloat',
  \ 'highlight_filter_background': 'DiffAdd',
  \ 'winrow': 1,
  \ 'vertical_preview': 1
  \ }}
  " Loop through denite options and enable them
  function! s:profile(opts) abort
    for l:fname in keys(a:opts)
      for l:dopt in keys(a:opts[l:fname])
        call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
      endfor
    endfor
  endfunction
  call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry
" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" FIND and GREP COMMANDS
if executable('rg')
  " Ripgrep
  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
endif

" IMPORTANT Denite MAPPINGS

if has('nvim')
  nnoremap <space>o :<C-u>Denite -split=floating outline -winrow=10<cr>
else
  nnoremap <space>o :<C-u>Denite -split=no outline -winrow=10<cr>
endif

" denite }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" deoplete }}}

" vim-multiple-cursors {{{
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0

function! Multiple_cursors_before()
  if deoplete#is_enabled()
    call deoplete#disable()
    let g:deoplete_is_enable_before_multi_cursors = 1
  else
    let g:deoplete_is_enable_before_multi_cursors = 0
  endif
endfunction

function! Multiple_cursors_after()
  if g:deoplete_is_enable_before_multi_cursors
    call deoplete#enable()
  endif
endfunction
" vim-multiple-cursors }}}

" fzf {{{
" Reverse the layout to make the FZF list top-down

" Using the custom window creation function
if has('nvim')
  let $FZF_DEFAULT_OPTS='--layout=reverse'
  function! FloatingFZF()
    let width = float2nr(&columns * 0.7)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()'}
endif

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" IMPORTANT FZF MAPPINGS
nnoremap <silent> <expr> <space>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <space>b :<c-u>Buffers<cr>
nnoremap <silent> <space>r :<c-u>History<cr>
nnoremap <silent> <Leader>s :call fzf#run({'down': '40%', 'sink': 'botright split' })<CR>
nnoremap <silent> <Leader>v :call fzf#run({'right': winwidth('.') / 2, 'sink': 'vertical botright split' })<CR>

" fzf }}}

" easymotion {{{
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
nmap t <Plug>(easymotion-t2)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
" easymotion }}}


" MyAutoCmd {{{
augroup MyAutoCmd
  au!
  filetype on
  " autocmd FileType python setlocal ts=4 sts=4 sw=4 et omnifunc=jedi#completions
  autocmd FileType python noremap <buffer><Leader>cf :Neoformat<CR><CR>
  autocmd FileType python inoremap <buffer><Leader>cf <c-c>:Neoformat<CR><CR>gi
  autocmd FileType python
        \ setlocal foldmethod=indent expandtab smarttab nosmartindent
        \ | setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType python set completeopt-=preview


  autocmd FileType vim setlocal ts=2 sts=2 sw=2 et

  autocmd FileType cc,cpp noremap <buffer><Leader>cf <c-c>:Neoformat<CR><CR>gi
  autocmd FileType cc,cpp inoremap <buffer><Leader>cf <c-c>:Neoformat<CR><CR>gi
  autocmd FileType c setlocal ts=4 sts=4 sw=4 et
  autocmd FileType c nnoremap <buffer><Leader>cf <c-c>:Neoformat<CR><CR>gi
  autocmd FileType c inoremap <buffer><Leader>cf <c-c>:Neoformat<CR><CR>gi
  autocmd FileType cc,cpp setlocal ts=4 sts=4 sw=4 et

  autocmd FileType sh setlocal ts=4 sts=4 sw=4 et

  " java不做neomake
  " autocmd Filetype java NeomakeDisableBuffer

  " javascript
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et
  autocmd FileType javascript nnoremap <buffer><Leader>cf <c-c>:Neoformat<CR><CR>
  autocmd FileType javascript inoremap <buffer><Leader>cf <c-c>:Neoformat<CR><CR>gi

  autocmd FileType rst nnoremap <buffer><Leader>md <c-c>:InstantRst<CR>
  autocmd FileType rst inoremap <buffer><Leader>md <c-c>:InstantRst<CR>

  " 中文排版
  autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
augroup END
" MyAutoCmd }}}

" autogroup go {{{
augroup go
  autocmd!
  autocmd FileType go nmap <silent> <Leader>V <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>S <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>D <Plug>(go-def-tab)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>I <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>L <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>T  <Plug>(go-test)
  " autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  " autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>C <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <silent> <leader>B :<C-u>call <SID>build_go_files()<CR>
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  autocmd FileType go noremap <buffer><Leader>cf :GoFmt<CR><CR>
  autocmd FileType go inoremap <buffer><Leader>cf <c-c>:GoFmt<CR><CR>gi
  autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType go setlocal completeopt-=preview
augroup END

" autogroup go }}}
