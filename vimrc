"
" Vim Configuration
" Blantantly copied from: https://github.com/derekwyatt/vim-config
"

scriptencoding utf-8
set encoding=utf-8

"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------
" Vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim

call plug#begin()
Plug 'derekwyatt/vim-fswitch'
Plug 'elixir-editors/vim-elixir'
Plug 'lervag/vimtex'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/EasyMotion'
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/L9'
Plug 'xolox/vim-misc'
"Plug 'xuhdev/vim-latex-live-preview'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'mhinz/vim-mix-format'
"Plug 'slashmili/alchemist.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'janko/vim-test'
Plug 'lifepillar/vim-solarized8'
Plug 'wlangstroth/vim-racket'
Plug 'vim-syntastic/syntastic'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin indent on

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" CScope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    "set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

" Search down into sub-directories
" Provides tab-completion for all file related tasks
set path+=**

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Show tabs as >--- and spaces as ·
set list!
set listchars=tab:>-,trail:·

" set the search scan to wrap lines
set wrapscan

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash
if has("unix")
    set shell=bash
else
    set shell=ksh.exe
endif

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

" Setting this below makes it sow that error messages don't disappear after one second on startup.
"set debug=msg

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
"set virtualedit=all
set virtualedit=onemore,block

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=80

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=ag\ --vimgrep

"-----------------------------------------------------------------------------
" coc.nvim BEGIN
"-----------------------------------------------------------------------------

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"-----------------------------------------------------------------------------
" coc.nvim END
"-----------------------------------------------------------------------------

" Map Ctrl+P, Ctrl+N to prev-next search result
nnoremap <silent> <C-p> :cp<CR>
nnoremap <silent> <C-n> :cn<CR>

nnoremap <leader>w :split <CR> :grep <cword> . <CR>

" Trying out the line numbering thing... never liked it, but that doesn't mean
" I shouldn't give it another go :)
"set relativenumber
set number

" Spell checking
set spell
set spelllang=en_us
"set spelllang=en_gb
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Set the makeprg variable
set makeprg=make\ -j3

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" System default for mappings is now the "," character
let mapleader = ","

" Toggle paste mode
nmap <silent> <leader>pp :set invpaste<CR>:set paste?<CR>

" Turn off that stupid highlight search
nmap <silent> <leader>n :nohls<CR>

" The following beast is something i didn't write... it will return the 
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as 
" syntax highlighting goes.
nmap <silent> <leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" set text wrapping toggles
nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>

" CScope mappings
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Maps to make handling windows a bit easier
"noremap <silent> <leader>h :wincmd h<CR>
"noremap <silent> <leader>j :wincmd j<CR>
"noremap <silent> <leader>k :wincmd k<CR>
"noremap <silent> <leader>l :wincmd l<CR>
"noremap <silent> <leader>sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> <leader>s8 :vertical resize 83<CR>
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>
noremap <silent> <leader>cc :close<CR>
noremap <silent> <leader>cw :cclose<CR>
noremap <silent> <leader>ml <C-W>L
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> <leader>sw :execute ":resize " . line('$')<cr>

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Search the current file for what's currently in the search register and display matches
nmap <silent> <leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> <leader>gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap <leader>bd :BD<cr>

" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

" Alright... let's try this out
imap jj <esc>

" Make the current file executable
nmap <leader>x :w<cr>:!chmod 755 %<cr>:e<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" I don't like it when the matching parens are automatically highlighted
"let loaded_matchparen = 1

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

if has("mac")
  let g:main_font = "Anonymous\\ Pro:h16"
  let g:small_font = "Anonymous\\ Pro:h2"
else
  let g:main_font = "DejaVu\\ Sans\\ Mono\\ 10"
  let g:small_font = "DejaVu\\ Sans\\ Mono\\ 2"
endif

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$', '\.o$',
                   \ '\.lo$', '^tags$', '^cscope\.' ]

"-----------------------------------------------------------------------------
" FSwitch mappings
"-----------------------------------------------------------------------------
nmap <silent> <leader>of :FSHere<CR>
nmap <silent> <leader>ol :FSRight<CR>
nmap <silent> <leader>oL :FSSplitRight<CR>
nmap <silent> <leader>oh :FSLeft<CR>
nmap <silent> <leader>oH :FSSplitLeft<CR>
nmap <silent> <leader>ok :FSAbove<CR>
nmap <silent> <leader>oK :FSSplitAbove<CR>
nmap <silent> <leader>oj :FSBelow<CR>
nmap <silent> <leader>oJ :FSSplitBelow<CR>

"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
let g:fuf_file_exclude = '\v\~$|\.(o|lo|exe|dll|bak|class|meta|lock|orig|jar|swp)$|/test/data\.|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_splitPathMatching = 0
let g:fuf_maxMenuWidth = 110
let g:fuf_timeFormat = ''
nmap <silent> <leader>fv :FufFile ~/.vim/<cr>
nmap <silent> <leader>fb :FufBuffer<cr>
nmap <silent> <leader>ff :FufFile<cr>
nmap <silent> <leader>fc :FufMruCmd<cr>
nmap <silent> <leader>fm :FufMruFile<cr>
nmap <silent> <leader>fp :FufFile ~/git/*<cr>
nmap <silent> <leader>ft :FufTag<cr>

"-----------------------------------------------------------------------------
" Gundo Settings
"-----------------------------------------------------------------------------
if has('python3')
  let g:gundo_prefer_python3 = 1
endif

nmap <F5> :GundoToggle<cr>

"-----------------------------------------------------------------------------
" Latex Plugin Settings
"-----------------------------------------------------------------------------
"let g:tex_flavor='latex'
"let g:Tex_ViewRule_pdf='okular'
"let g:Tex_GotoError=0
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'

"-----------------------------------------------------------------------------
" fzf.vim Settings
"-----------------------------------------------------------------------------
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>g :GFiles?<CR>
nmap <Leader>gg :GFiles<CR>
nmap <Leader>r :BTags<CR>
nmap <Leader>rr :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>ll :Lines<CR>
nmap <Leader>b :BCommits<CR>
nmap <Leader>bb :Commits<CR>
nmap <Leader>hh :Helptags<CR>

"-----------------------------------------------------------------------------
" ack.vim Settings
"-----------------------------------------------------------------------------
nmap <Leader>a :Rg<CR>

"-----------------------------------------------------------------------------
" ALE Settings
"-----------------------------------------------------------------------------
let g:ale_lint_on_text_changed='never'
"let g:ale_lint_delay=200

let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters = {
  \  'haskell': ['cabal_ghc', 'cspell', 'ghc_mod', 'hdevtools', 'hie', 'hlint', 'hls', 'stack_build']
  \}

"let g:ale_linters = {
"  \  'cpp': ['clang', 'clangtidy', 'cppcheck', 'cpplint', 'gcc'],
"  \  'elixir': ['credo', 'dialyxir', 'dogma']
"  \}
"
"let g:ale_pattern_options = {
"  \  'sharemind-hi.git': {
"  \    'ale_linters': {
"  \      'cpp': ['clang', 'cppcheck', 'cpplint', 'gcc']
"  \    }
"  \  }
"  \}
"
"let g:ale_cpp_clangtidy_options = '-std=c++14 -Wall'
"
"let g:ale_cpp_clangtidy_checks=[
"            \'*',
"            \'-cppcoreguidelines-pro-bounds-array-to-pointer-decay',
"            \'-cppcoreguidelines-pro-bounds-pointer-arithmetic',
"            \'-cppcoreguidelines-pro-type-vararg',
"            \'-google-build-using-namespace',
"            \'-google-readability-todo',
"            \'-google-runtime-references',
"            \'-llvm-header-guard',
"            \'-readability-implicit-bool-cast',
"            \'-readability-named-parameter',
"            \'-readability-non-const-parameter'
"            \]
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"-----------------------------------------------------------------------------
" vim-clang-format
"-----------------------------------------------------------------------------
"let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#enable_fallback_style = 0

"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

"-----------------------------------------------------------------------------
" vim-test
"-----------------------------------------------------------------------------
let g:test#strategy = 'vimterminal'
let test#vim#term_position = "botright 30"

nmap <silent> <leader>tr :TestNearest<CR>
nmap <silent> <leader>tR :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVbsit<CR>

"-----------------------------------------------------------------------------
" syntastic
"-----------------------------------------------------------------------------
let g:syntastic_enable_racket_racket_checker = 1

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------
function! IndentToNextBraceInLineAbove()
    :normal 0wk
    :normal "vyf(
    let @v = substitute(@v, '.', ' ', 'g')
    :normal j"vPl
endfunction

nmap <silent> <leader>ii :call IndentToNextBraceInLineAbove()<cr>

function! HighlightAllOfWord(onoff)
    if a:onoff == 1
        :augroup highlight_all
            :au!
            :au CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
        :augroup END
    else
        :au! highlight_all
        match none /\<%s\>/
    endif
endfunction

nmap <leader>ha :call HighlightAllOfWord(1)<cr>
nmap <leader>hA :call HighlightAllOfWord(0)<cr>

"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
augroup Binary
  au!
  au BufReadPre   *.bin let &bin=1
  au BufReadPost  *.bin if &bin | %!xxd
  au BufReadPost  *.bin set filetype=xxd | endif
  au BufWritePre  *.bin if &bin | %!xxd -r
  au BufWritePre  *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre *.cmake,*.h,*.hh,*.hpp,*.hxx,*.h++,*.cc,*.cpp,*.cs,*.cxx,*.c++,*.c,*.py,*.sc,*.sa,*.java,*.stg,*.g,*.html,*.js,*.jsx,*.sh,*.tex,*.erl,*.conf,*.xml,*.yaml,*.yml,*.json,*.ex,*.exs :call Preserve("%s/\\s\\+$//e")

autocmd BufEnter,BufNew *.edl :set filetype=c
"autocmd BufEnter,BufNew *.ex,*.exs :set filetype=erlang
autocmd BufEnter,BufNew *.sc :set filetype=secrec
autocmd BufEnter,BufNew *.rmind :set filetype=r
autocmd BufEnter,BufNew *.template :set filetype=yaml

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
set termguicolors

set background=dark
colorscheme solarized8
