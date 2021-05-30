" Welcome to Vim (http://go/vim).
"
" If you see this file, your homedir was just created on this workstation.
" That means either you are new to Google (in that case, welcome!) or you
" got yourself a faster machine.
" Either way, the main goal of this configuration is to help you be more
" productive; if you have ideas, praise or complaints, direct them to
" vi-users@google.com (http://g/vi-users). We'd especially like to hear from you
" if you can think of ways to make this configuration better for the next
" Noogler.
" If you want to learn more about Vim at Google, see http://go/vimintro.
 
" Enable modern Vim features not compatible with Vi spec.
set nocompatible
 
" Use the 'google' package by default (see http://go/vim/packages).
" source /usr/share/vim/google/google.vim
 
" Add custom source path
" Glug glug sources+=`$HOME . '/.vim/local'`
" Glug glint-ale
 
" Plugin configuration.
" See http://google3/devtools/editors/vim/examples/ for example configurations
" and http://go/vim/plugins for more information about vim plugins at Google.
 
" Plugin loading is commented out below - uncomment the plugins you'd like to
" load.
 
" Load google's formatting plugins (http://go/vim/plugins/codefmt-google).
" The default mapping is \= (or <leader>= if g:mapleader has a custom value),
" with
" - \== for matting the current line or selected lines in visual mode
"   (:FormatLines).
" - \=b formatting the full buffer (:FormatCode).
"
" To bind :FormatLines to the same key in insert and normal mode, add:
"   noremap <C-K> :FormatLines<CR>
"   inoremap <C-K> <C-O>:FormatLines<CR>
" Glug codefmt plugin[mappings] gofmt_executable="goimports"
" Glug codefmt-google
" Glug codefmt clang_format_style='file'
noremap _ :FormatCode<CR>
noremap _ :FormatLines<CR>
 
" Enable autoformatting on save for the languages at Google that enforce
" formatting, and for which all checked-in code is already conforming (thus,
" autoformatting will never change unrelated lines in a file).
" Note formatting changed lines only isn't supported yet
" (see https://github.com/google/vim-codefmt/issues/9).
augroup autoformat_settings
autocmd!
autocmd FileType borg,gcl,patchpanel AutoFormatBuffer gclfmt
autocmd FileType bzl AutoFormatBuffer buildifier
autocmd FileType c,cc,cpp,javascript AutoFormatBuffer clang-format
autocmd FileType dart AutoFormatBuffer dartfmt
autocmd FileType go AutoFormatBuffer gofmt
autocmd FileType java AutoFormatBuffer google-java-format
autocmd FileType jslayout AutoFormatBuffer jslfmt
autocmd FileType markdown AutoFormatBuffer mdformat
autocmd FileType ncl AutoFormatBuffer nclfmt
" autocmd FileType python AutoFormatBuffer pyformat
autocmd FileType python AutoFormatBuffer yapf
autocmd FileType textpb AutoFormatBuffer text-proto-format
autocmd FileType proto AutoFormatBuffer protofmt
"   autocmd FileType html,css,json AutoFormatBuffer js-beautify
augroup END
 
" Load YCM (http://go/ycm) for semantic auto-completion and quick syntax
" error checking. Pulls in a google3-enabled version of YCM itself and
" a google3-specific default configuration.
" Glug youcompleteme-google
 
" Load the automated blaze dependency integration for Go.
" Note: for Go, blazedeps uses the Go team's glaze tool, which is fully
" supported by the Go team. The plugin is currently unsupported for other
" languages.
"Glug blazedeps auto_filetypes=`['go']`
 
" Load piper integration (http://go/VimPerforce).
" Glug piper plugin[mappings]
" Glug g4
 
" Load Critique integration. Use :h critique for more details.
"Glug critique plugin[mappings]
 
" Load blaze integration (http://go/blazevim).
" Glug blaze
" noremap <leader>bt :Blaze<space>test<space>
" noremap <leader>bd :Blaze<space>build<space>-c<space>dbg<space>--dynamic_mode=off<space>
" noremap <leader>bb :Blaze<space>build<space>
 
" Load the syntastic plugin (http://go/vim/plugins/syntastic-google).
" Note: this requires installing the upstream syntastic plugin from
" https://github.com/vim-syntastic/syntastic.
" Glug syntastic-google
 
" Load the ultisnips plugin (http://go/ultisnips).
" Note: this requires installing the upstream ultisnips plugin from
" https://github.com/SirVer/ultisnips.
" Glug ultisnips-google
 
" outline-window
" Glug outline-window
" nnoremap \ol :GoogleOutlineWindow<CR>
 
" code search
" Glug csearch
" nnoremap <leader>se :Cs <C-R><C-W><CR><CR>
" Glug corpweb plugin[mappings]
" Glug corpweb plugin[commands]
" noremap <leader>cs :CorpWebCs<Space>
" noremap <leader>cf :CorpWebCsFile<CR>
 
" related files
" Glug relatedfiles plugin[mappings]
 
" All of your plugins must be added before the following line.
" See go/vim-plugin-manager if you need help picking a plugin manager and
" setting it up.
 
" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
syntax on
 
" vim-plug section
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-signify'
Plug 'danro/rename.vim'
Plug 'puremourning/vimspector'
Plug 'maksimr/vim-jsbeautify'
Plug 'microsoft/java-debug'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
"
" Plug 'Yilin-Yang/vim-markbar'
" Plug 'vim-scripts/ShowMarks'
" Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Plug 'vim-syntastic/syntastic'
" Plug 'vimoutliner/vimoutliner'
" Plug 'dense-analysis/ale'
call plug#end()

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
 
" settings for ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_match_window = 'min:1, max:999'
let g:ctrlp_prompt_mappings = {
      \ 'ToggleByFname()': [],
      \ 'PrtDeleteEnt()': ['<c-d>', '<F7>'],
      \ }
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrl_clear_cache_on_exit = 0
endif
augroup FuzzySearch
  au!
  au VimEnter * nnoremap <leader>w :Files<CR>
  au VimEnter * nnoremap <c-p> :Buffers<CR>
  au VimEnter * nnoremap <c-n> :BD<CR>
  au VimEnter * nnoremap <leader>a :History<CR>
  au VimEnter * nnoremap <leader>rg :Rg<CR>
  au VimEnter * nnoremap <leader>ls :Lines<CR>
  au VimEnter * nnoremap <a-m> :Marks<CR>
"   au VimEnter * nmap <a-m> <Plug>ToggleMarkbar
  au VimEnter * nnoremap <Esc>m :Marks<CR>
"   au VimEnter * nmap <Esc>m <Plug>ToggleMarkbar
augroup END
 
" fzf-vim settings
function! s:delete_buffers(lines)
  let blist = map(a:lines, 'matchstr(v:val, "\\[\\zs[0-9]*\\ze\\]")')
  if len(blist) == 0
    return
  endif
  execute 'bwipeout!' join(blist)
"   execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction
 
 
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(
      \ <q-args>, 
      \ s:p(<bang>0, {'options': '--multi --bind ctrl-f:page-down,ctrl-b:page-up,ctrl-z:toggle'}),
      \ <bang>0
      \)
 
function! s:history(arg, extra, bang)
  let bang = a:bang || a:arg[len(a:arg)-1] == '!'
  if a:arg[0] == ':'
    call fzf#vim#command_history(bang)
  elseif a:arg[0] == '/'
    call fzf#vim#search_history(bang)
  else
    call fzf#vim#history(a:extra, bang)
  endif
endfunction
 
function! s:p(bang, ...)
  let preview_window = get(g:, 'fzf_preview_window', a:bang && &columns >= 80 || &columns >= 120 ? 'right': '')
  if len(preview_window)
    return call('fzf#vim#with_preview', add(copy(a:000), preview_window))
  endif
  return {}
endfunction
 
let g:fzf_preview_window='up'
let g:fzf_height=1000
 
command! -bang -nargs=* History call s:history(
      \ <q-args>, 
      \ s:p(<bang>0, {'options': ['--multi', '--bind=ctrl-f:page-down,ctrl-b:page-up,ctrl-z:toggle']}),
      \ <bang>0
      \ )
 
command! -bar -bang -nargs=? -complete=buffer Buffers  call fzf#vim#buffers(
      \ <q-args>, 
      \ s:p(<bang>0, 
      \ { "placeholder": "{1}", "options": ["-d", "\t", "--bind=ctrl-f:page-down,ctrl-b:page-up"]}),
      \ <bang>0
      \ )
 
command! BD call fzf#run(fzf#wrap(extend({
      \ 'source': map(fzf#vim#_buflisted_sorted(), 'fzf#vim#_format_buffer(v:val)'),
      \ 'sink*': { lines -> s:delete_buffers(lines) }},
      \ s:p(<bang>0, {'options': ["--multi", "--bind=ctrl-f:page-down,ctrl-b:page-up,ctrl-z:toggle", '--ansi', '-d', '\t', '--with-nth', '2..', '-n', '2,1..2', '--prompt', 'BufDel> ']}),
      \)))
 
" Use the following function replace the one in autoload/fzf/vim.vim
" fzf#vim#marks(...)
"   redir => cout
"   silent marks
"   redir END
"   let list = split(cout, "\n")
"   call filter(list, 'matchstr(split(copy(v:val))[0], ''\h'') != ""')
"   call map(list, 'len(split(copy(v:val)))==4 && filereadable(expand(split(copy(v:val))[-1]))? join(add(split(copy(v:val))[0:2], expand(split(copy(v:val))[3]))): join(add(split(copy(v:val))[0:2], @%))')
"   return s:fzf('marks', {
"   \ 'source':  extend(list[0:0], map(list[1:], 's:format_mark(v:val)')),
"   \ 'sink*':   s:function('s:mark_sink'),
"   \ 'options': '+m -x --ansi --tiebreak=index --header-lines 1 --tiebreak=begin --prompt "Marks> "'}, a:000)
" endfunction
command! -bar -bang Marks call fzf#vim#marks({
      \'options': [
      \   '--bind=ctrl-f:page-down,ctrl-b:page-up,ctrl-z:toggle', 
      \   '--preview-window', 'up', 
      \   '--preview', 'original={4}; file_path="$(readlink -f ${original})"; lines=$((${LINES} / 2)) ; cat -n "${file_path}" |   egrep --color=always -C "${lines}" ^[[:space:]]*{2}[[:space:]]']
      \ })
"       \   '--preview', 'original={4}; file_path="$(readlink -f ${original})"; cat -n "${file_path}" | egrep --color=always -C 10 ^[[:space:]]*{2}[[:space:]]']
 
let g:fzf_action = {
      \ 'ctrl-o': 'badd',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
 
" color scheme
" put this before airline setting so that we set airline correctly.
" let g:gruvbox_contrast_dark="soft"
" let g:gruvbox_contrast_light="hard"
" colorscheme gruvbox
augroup CursorLine
au!
au VimEnter * set cursorline
au VimEnter * hi Search term=NONE cterm=NONE ctermfg=black ctermbg=grey
au VimEnter * hi IncSearch term=NONE cterm=NONE ctermfg=black ctermbg=grey
au VimEnter * hi htmlItalic term=NONE cterm=NONE ctermfg=black ctermbg=lightgreen
au VimEnter * hi Visual term=NONE cterm=NONE ctermfg=black ctermbg=grey
"  au VimEnter * hi CursorLine term=NONE cterm=NONE ctermbg=lightgrey
augroup End
 
" settings for airline
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_open_multiple_files = 'i'
let g:airline_powerline_fonts = 1
 
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""            TagBar Toggle              """""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
func! DetermineNumberForTagBarToggle()
  let b:nc = winwidth('$')
  let b:nchalf = b:nc / 2
  let b:nr = line('$')
  let b:numbercol = DetermineNumberOfColumnForLineNumber(b:nr)
  if (b:nc - b:nchalf - b:numbercol - 5) > 80
    " 2 for the gap between code area and the line number
    " 3 for the sign column
    return (b:nc - b:numbercol - 5) / 2
  else
    return b:nc - 80 - b:numbercol - 5
  endif
endfunc
 
" settings for tagbar
let g:tagbar_position='bottom'
augroup Tagbar
  au!
  au VimEnter * noremap <C-g> :TagbarToggle<CR>
"   au VimEnter * let g:tagbar_ctags_bin='/usr/local/bin/ctags'
  au BufEnter * if &ft != 'tagbar' && g:tagbar_position=='right' | let g:tagbar_width = DetermineNumberForTagBarToggle() | endif
  au BufEnter * if g:tagbar_position=='bottom' || g:tagbar_position=='rightbelow' | let g:tagbar_height=(winheight('$')-2)/2 | endif
augroup END
 
" normal settings
augroup Normal
  au!
  au VimEnter * inoremap jj <Esc>
  au VimEnter * nnoremap <leader>q :q<CR>
  au VimEnter * set hls is
  au VimEnter * set termwinscroll=100000000
  au VimEnter * nnoremap Y y$
  au VimEnter * nnoremap <leader>x :nohl<CR>
  au VimEnter * nnoremap <leader>v :vsplit<CR>
  au VimEnter * set scl=auto
  au VimEnter * nnoremap <SPACE> <Nop>
  au VimEnter * map <SPACE> <Leader>
  au QuickFixCmdPost * lwindow
  " settins for quick fix and location list
  au VimEnter * nnoremap <leader>lo :lwindow<CR>
  au VimEnter * nnoremap <leader>lc :lclose<CR>
  au VimEnter * nnoremap <leader>co :copen<CR>
  au VimEnter * nnoremap <leader>cc :cclose<CR>
  " settings for windows
  au VimEnter * nnoremap <c-j> <c-w>j
  au VimEnter * nnoremap <c-k> <c-w>k
  au VimEnter * nnoremap <c-h> <c-w>h
  au VimEnter * nnoremap <c-l> <c-w>l
  " working directory
  au BufEnter * silent! lcd %:p:h
  " resize window
  au VimEnter * nmap          <C-W>+     <C-W>+<SID>ws
  au VimEnter * nmap          <C-W>-     <C-W>-<SID>ws
  au VimEnter * nn <script>   <SID>ws+   <C-W>+<SID>ws
  au VimEnter * nn <script>   <SID>ws-   <C-W>-<SID>ws
  au VimEnter * nmap          <C-W>>     <C-W>><SID>ws
  au VimEnter * nmap          <C-W><     <C-W><<SID>ws
  au VimEnter * nn <script>   <SID>ws>   <C-W>><SID>ws
  au VimEnter * nn <script>   <SID>ws<   <C-W><<SID>ws
  au VimEnter * nmap          <SID>ws    <Nop>
  " redraw
  au VimEnter * noremap <leader>rd :redraw!<CR>
  " source .vimrc
  au VimEnter * nnoremap <leader>s :w<CR>
  au VimEnter * nnoremap <leader>v :source $MYVIMRC<CR>
  " RelatedFilesWindow
  au Vimenter * nnoremap <leader>rf :RelatedFilesWindow<CR>
  au Vimenter * set matchpairs+=<:>
  " hidden modified buffer
  au VimEnter * set hidden
  " tab = 4 spaces
  au VimEnter * set tabstop=4
  au Vimenter * set shiftwidth=4
  au VimEnter * set expandtab
  " limit 80 char
  au VimEnter * set cc=81
  au VimEnter * set tw=80
augroup END
 
"""""""""""""""""""""""""""""""""""""""""""
"""""#      switch buffer       #""""""""""
"""""""""""""""""""""""""""""""""""""""""""
func! FileType()
  if &buftype == 'terminal'
    return 'terminal'
  elseif &ft == 'nerdtree'
    return 'nerdtree'
  elseif &ft == 'qf'
    return 'qf'
  else
    return 'normal'
  endif
endfunc
 
func! IsNoResponse(ftype)
  if a:ftype == 'qf' || a:ftype == 'nerdtree'
    return 1
  endif
  return 0
endfunc
 
func! SingleSwitch(direction)
  if a:direction == 'next'
    bn!
  else
    bp!
  endif
endfunc
 
func! SwitchToSameFileType(ftype, direction)
  call SingleSwitch(a:direction)
  while FileType() != a:ftype
      call SingleSwitch(a:direction)
  endwhile
endfunc
 
func! SwitchBuffer(direction)
  let curft = FileType()
  if IsNoResponse(curft)
    return
  else
    call SwitchToSameFileType(curft, a:direction)
  endif
endfunc
 
" settings for vim buffer
augroup SwitchBuffer
  au!
  au VimEnter * nnoremap <M-k> :call SwitchBuffer("next")<CR>
  au VimEnter * nnoremap <M-j> :call SwitchBuffer("previous")<CR>
  au VimEnter * nnoremap <a-k> :call SwitchBuffer("next")<CR>
  au VimEnter * nnoremap <Esc>k :call SwitchBuffer("next")<CR>
  au VimEnter * nnoremap <a-j> :call SwitchBuffer("previous")<CR>
  au VimEnter * nnoremap <Esc>j :call SwitchBuffer("previous")<CR>
augroup END
 
" setting folding
set foldmethod=indent
set foldenable!
 
func! DetermineCommentSign()
if &ft == 'cc' || &ft == 'cpp' || &ft == 'proto' || &ft == 'gcl' || &ft == 'borg'
return '//'
elseif &ft == 'python' || &ft == 'bzl'
return '#'
elseif &ft == 'matlab'
return '%'
elseif expand('%:t') == '.vimrc'
return '"'
endif
endfunc
 
" comments
" A more efficient way would be save a local variable for each file. So only
" determine the sign once when we open the file
augroup comments_settings
  autocmd!
  autocmd BufEnter * if DetermineCommentSign() == '//' | nnoremap <leader>cm :s/^/\/\/<Space>/<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '//' | vnoremap <leader>cm :s/^/\/\/<Space>/<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '//' | nnoremap <leader>rc :s/^<space>*\/\/<Space>//<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '//' | vnoremap <leader>rc :s/^<space>*\/\/<Space>//<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '#' | nnoremap <leader>cm :s/^/#<Space>/<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '#' | vnoremap <leader>cm :s/^/#<Space>/<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '#' | nnoremap <leader>rc :s/^<space>*#*<Space>//<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '#' | vnoremap <leader>rc :s/^<space>*#*<Space>//<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '"' | noremap <leader>cm :s/^/"<space>/<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '"' | noremap <leader>rc :s/^"<space>//<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '%' | noremap <leader>cm :s/^/%<space>/<CR> :nohl<CR> | endif
  autocmd BufEnter * if DetermineCommentSign() == '%' | noremap <leader>rc :s/^%<space>//<CR> :nohl<CR> | endif
augroup END
 
" lsp settings
"
" Ciderlsp server settings
" for outside google, just disable the CiderLSP and manually add other lsp or
" use plugin like mattn/vim-lsp-settings for auto configuration.
" au User lsp_setup call lsp#register_server({
"     \ 'name': 'CiderLSP',
"     \ 'cmd': {server_info->[
"     \   '/google/bin/releases/editor-devtools/ciderlsp',
"     \   '--tooltag=vim-lsp',
"     \   '--noforward_sync_responses',
"     \ ]},
"     \ 'initialization_options' : {
"     \   'bundles' : [
"     \     '~/.vim/plugged/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.27.1.jar',
"     \   ],
"     \ },
"     \ 'whitelist': [ 'java', 'proto', 'textproto', 'go', 'python', 'gcl', 'borg', 'bzl'],
"     \})
" "     \ 'whitelist': ['c', 'cpp', 'java', 'proto', 'textproto', 'go', 'python', 'gcl', 'borg'],
" let g:lsp_settings = {
"  \  'eclipse-jdt-ls': {
"  \    'disabled': v:true,
"  \    'initialization_options': {
"      \   'bundles' : [
"      \     '/usr/local/google/home/ycyi/.vim/plugged/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.27.1.jar',
"      \   ],
"      \ }
"  \   },
"  \  'clangd': { 'disabled': v:true }
"  \}
" augroup VimLsp
"   au!
"   au VimEnter * nnoremap <leader>gd :<C-u>LspDefinition<CR>
"   au VimEnter * nnoremap <leader>gc :<C-u>LspDeclaration<CR>
"   au VimEnter * nnoremap <leader>gr :<C-u>LspReferences<CR>
"   au VimEnter * nnoremap <leader>f :<C-u>LspCodeAction<CR>
"   au VimEnter * nnoremap <leader>dd :<C-u>LspDocumentDiagnostics<CR>
"   au VimEnter * nnoremap <leader>dn :<C-u>LspNextDiagnostic<CR>
"   au VimEnter * nnoremap <leader>dp :<C-u>LspPreviousDiagnostic<CR>
"   au VimEnter * inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"   au VimEnter * inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"   au VimEnter * inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
"
" "   au VimEnter * nnoremap <a-p> :LspHover<CR>
" "   au VimEnter * nnoremap <Esc>p :LspHover<CR>
" augroup END
 
" let g:lsp_signs_priority = 11
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" let g:lsp_diagnostics_echo_delay = 0
" let g:lsp_diagnostics_float_cursor = 1
" :call lsp#send_request('CiderLSP', {'command':'vscode.java.startDebugSession'})
" :call lsp#send_request('eclipse-jdt-ls', {'method':'workspace/executeCommand', 'params':{'command':'vscode.java.startDebugSession'}, 'on_notification': {server_name, response->lsp#log(server_name, response)},})
" let g:lsp_log_file=expand('~/lsp_log')
" :debug call lsp#send_request('eclipse-jdt-ls', {'method':'workspace/executeCommand', 'params':{'command':'vscode.java.startDebugSession'}, 'on_notification': {server_name, response->lsp#log(server_name, response)},})
" :debug call lsp#send_request('CiderLSP', {'method':'workspace/executeCommand', 'params':{'command':'vscode.java.startDebugSession'}, 'on_notification': {server_name, response->lsp#log(server_name, response)},})
 
 
func! DetermineNumberOfColumnForLineNumber(n)
  let result = 0
  let n = a:n
  while n > 0
    let n = n / 10
    let result = result + 1
  endwhile
  if result < 3
    return 3
  else
    return result
  endif
endfunc
 
func! DetermineNumberOfEditableColumns()
  let b:nc = winwidth('$')
  let b:nc75 = 0.75 * b:nc
  let b:nc25 = b:nc / 4
  let b:nr = line('$')
  let b:nclinenumber = DetermineNumberOfColumnForLineNumber(b:nr)
  " Use 82 because there is a gap between the editable area and the number column
  if b:nc75 - b:nclinenumber >= 82 || b:nc <= 82
    return b:nc25
  else
    return (b:nc - (82 + b:nclinenumber)) * 100 / b:nc
  endif
endfunc
 
" NERDTree
func! OpenNerdTreeTop()
  silent
  NERDTreeFind
  wincmd K
  resize 10
endfunc
func! OpenNerdTreeLeft()
  let g:NERDTreeWinSize = DetermineNumberOfEditableColumns()
  NERDTree
endfunc
 
augroup NERDTree
  au! 
  au VimEnter * nnoremap <silent> <leader>nh :call OpenNerdTreeLeft()<CR>
  au VimEnter * nnoremap <leader>nk :call OpenNerdTreeTop()<CR>
  au VimEnter * nnoremap <leader>nc :NERDTreeClose<CR>
augroup END
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
 
" window size
set winminheight=0
set winminwidth=0
set wiw=1
set wh=1
 
""""""""""""""""""""""""""""""""""""""""
"""""""""#     terminal     #"""""""""""
""""""""""""""""""""""""""""""""""""""""
func! NewTerminal(direction)
  echom a:direction
  let g:terminal_open = 1
  for i in range(1, winnr('$'))
    if FileType() == 'terminal'
      terminal ++curwin
      return
    endif
    exe "normal \<c-w>\<c-w>"
  endfor
"   below terminal ++rows=60
  if a:direction == "below" || a:direction == "above"
    if !has('nvim')
      exe "normal" ":" a:direction "terminal\<CR>"
    else
      exe "normal" ":" a:direction "split |" "terminal\<CR>"
    endif
  else
    let l:colnumber = DetermineNumberForTagBarToggle()
    if !has('nvim')
      exe "normal" ":vert" a:direction "terminal\<CR>"
    else
      exe "normal" ":vert" a:direction "split | " "terminal\<CR>"
    endif
    exe "normal" ":vert" "resize" l:colnumber "\<CR>"
  endif
endfunc
 
func! CloseAllTerminal()
  let g:terminal_open = 0
  let tb = filter(range(1, bufnr('$')), "getbufvar(v:val, '&buftype')=='terminal'")
  for i in tb
    echom i
    exe ":bd!" i
  endfor
endfunc
 
func! HideCurTerminal()
  if FileType() != 'terminal'
    return
  else
    close!
    let g:terminal_open = 0
  endif
endfunc
 
func! HideAllTerminal()
  for i in range(1, winnr('$'))
    call HideCurTerminal()
    exe "normal \<c-w>\<c-w>"
  endfor
endfunc
 
func! OpenTerminal(direction)
  let g:terminal_open = 1
  let tb = filter(range(1, bufnr('$')), "getbufvar(v:val, '&buftype')=='terminal'")
  if len(tb) > 0
    if a:direction == "below" || a:direction == "above"
      exe "normal" ":" a:direction "sb" tb[0] "\<CR>"
    else
      let l:colnumber = DetermineNumberForTagBarToggle()
      exe "normal" ":vert" a:direction "sb" tb[0] "\<CR>"
      exe "normal" ":vert" "resize" l:colnumber "\<CR>"
    endif
    exe "normal \<c-w>\<c-p>"
  else
    call NewTerminal(a:direction)
    exe "normal \<c-w>\<c-p>"
  endif
endfunc
 
func! ToggleTerminal()
  if g:terminal_open
    call HideAllTerminal()
    let g:terminal_open = 0
  else
    call OpenTerminal("below")
    let g:terminal_open = 1
  endif
endfunc
 
let g:terminal_open = 0
 
augroup Terminal
  autocmd!
  autocmd BufEnter * if &buftype=='terminal' | execute('call feedkeys("\<c-w>N")') | endif
  autocmd BufEnter * if &buftype=='terminal' && !has('nvim')  | execute('set nonumber') | endif
  autocmd BufEnter * if &buftype=='terminal' && !has('nvim')  | execute('set norelativenumber') | endif
  autocmd BufEnter * if &buftype=='terminal' | execute('set scl=no') | endif
  autocmd BufEnter * if &buftype!='terminal' | execute('set scl=auto') | endif
  autocmd BufEnter * if empty(&buftype) || &buftype!='terminal' | execute('set relativenumber') | endif
  autocmd BufEnter * if empty(&buftype) || &buftype!='terminal' | execute('set number') | endif
  autocmd VimEnter * nmap <leader>tj :below terminal <CR>
  autocmd VimEnter * nmap <leader>tk :abo terminal <CR>
  autocmd VimEnter * nmap <leader>th :vert lefta terminal <CR>
  autocmd VimEnter * nmap <leader>thd :call HideAllTerminal()<CR>
  autocmd VimEnter * nmap <leader>tn :call NewTerminal("below")<CR>
  autocmd VimEnter * nmap <leader>to :call OpenTerminal("below")<CR>
  autocmd VimEnter * nmap <leader>tl :call OpenTerminal("rightb")<CR>
  autocmd VimEnter * nmap <leader>tc :call CloseAllTerminal()<CR>
  autocmd VimEnter * nmap <C-t> :call ToggleTerminal()<CR>
augroup END
 
 
func! CloseHelpDoc()
  let wn = winnr('$')
  for i in range(1, wn)
   if &buftype != 'help'
    exe "normal \<c-w>\<c-w>"
   else
    exe "normal :quit\<CR>"
   endif
  endfor
endfunc
augroup Doc
  au!
  au VimEnter * nmap <leader>hc :call CloseHelpDoc()<CR>
augroup END
 
" " citcdiff
" " let g:signify_vcs_cmds = {'perforce':'env DIFF=%d" -U0" citcdiff %f || [[ $? == 1 ]]'}
" " let g:signify_vcs_cmds_diffmode = {'perforce':'citcdiff -b %f || true'}
" " let g:signify_vcs_list = ['perforce', 'git']
set updatetime=100
let g:signify_priority = 5
 
" jumplist only available in neovim
if has('nvim') 
  set jop=stack 
endif
 
" markbar settings
augroup MarkBar
  au!
"   au VimEnter * nmap <Leader>m <Plug>ToggleMarkbar
augroup END
set shortmess=a
set cmdheight=2
let g:markbar_peekaboo_marks_to_display='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:markbar_marks_to_display='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:markbar_peekaboo_open_vertical=v:false
let g:markbar_open_vertical=v:false
 
" vimspector settings
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_code_minwidth = 90
let g:vimspector_bottombar_height = 15
 
 
augroup EasyMotion
  au!
  au VimEnter * nmap <a-s> <Plug>(easymotion-s)
  au VimEnter * nmap <Esc>s <Plug>(easymotion-s)
augroup END
 
".........................................................................................
"                                 markdown-preview.nvim
".........................................................................................
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
 
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
 
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
 
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
 
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
 
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
 
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
 
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
 
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
 
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview
"   page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the
"   preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default:
" v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }
 
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
 
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
 
" use a custom port to start server or random for empty
let g:mkdp_port = ''
 
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
 
" you complete me
augroup YouCompleteMe
  au!
  au VimEnter * nnoremap gt :YcmCompleter GoTo<CR>
  au VimEnter * nnoremap gd :YcmCompleter GoToDefinition<CR>
  au VimEnter * nnoremap gc :YcmCompleter GoToDeclaration<CR>
  au VimEnter * nnoremap gr :YcmCompleter GoToReferences<CR>
  au VimEnter * nnoremap <leader>tp :YcmCompleter GetType<CR>
  au VimEnter * nnoremap <leader>f :YcmCompleter FixIt<CR>
  au VimEnter * nmap <a-p> <plug>(YCMHover)
  au VimEnter * nmap <M-p> <plug>(YCMHover)
"   au VimEnter * nmap p <plug>(YCMHover)
augroup END
let g:ycm_always_populate_location_list = 1
let g:ycm_complete_in_comments = 1
let g:ycm_python_interpreter_path = '/usr/bin/python3'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py', '!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_auto_hover=""
" let g:ycm_language_server =
"   \ [
"   \   {
"   \      'name': 'cider',
"   \      'cmdline': ['/google/bin/releases/editor-devtools/ciderlsp', '--tooltag=vim-lsc', '--noforward_sync_responses'],
"   \      'filetypes': ['java', 'proto', 'textproto', 'go', 'python', 'gcl', 'borg']
"   \   }
"   \ ]
let g:ycm_java_jdtls_extension_path = [
      \ '~/.vim/plugged/vimspector/gadgets/linux'
      \]
let s:jdt_ls_debugger_port = 0
function! s:StartDebugging()
  if s:jdt_ls_debugger_port <= 0
    " Get the DAP port
    let s:jdt_ls_debugger_port = youcompleteme#GetCommandResponse(
      \ 'ExecuteCommand',
      \ 'vscode.java.startDebugSession' )
"
    if s:jdt_ls_debugger_port == ''
       echom "Unable to get DAP port - is JDT.LS initialized?"
       let s:jdt_ls_debugger_port = 0
       return
     endif
  endif
"
  " Start debugging with the DAP port
  call vimspector#LaunchWithSettings( { 'DAPPort': s:jdt_ls_debugger_port })
endfunction
"
nnoremap <silent> <buffer> <Leader><F5> :call <SID>StartDebugging()<CR>
