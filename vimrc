" Launch Config {{{
set encoding=utf-8
scriptencoding utf-8

set nocompatible

if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

call plug#begin()

Plug 'Keithbsmiley/investigate.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'arecarn/crunch.vim'
Plug 'arecarn/selection.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bogado/file-line'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala'
Plug 'drmikehenry/vim-fontsize'
Plug 'fatih/vim-go'
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'gabebw/vim-spec-runner', { 'for': 'ruby' }
Plug 'garbas/vim-snipmate'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'jeroenp/vim-xquery-syntax'
Plug 'joker1007/vim-ruby-heredoc-syntax', { 'for': 'ruby' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-update-rc --key-bindings --completion' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': ['Goyo'] }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee', 'ruby'] }
Plug 'ktonga/vim-follow-my-lead'
Plug 'kylef/apiblueprint.vim'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'miyakogi/conoline.vim'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript', { 'for': ['ruby', 'javascript', 'markdown'] }
Plug 'pbrisbin/vim-mkdir'
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'plasticboy/vim-markdown', { 'for': ['pandoc', 'markdown'] }
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown', { 'for': ['pandoc', 'markdown'] }
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-pandoc/vim-pandoc', { 'for': ['pandoc', 'markdown'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['pandoc', 'markdown'] }
Plug 'vim-pandoc/vim-rmarkdown', { 'for': ['pandoc', 'markdown'] }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/renumber.vim'
Plug 'vim-scripts/MatlabFilesEdition', { 'for': 'matlab' }
Plug 'vimwiki/vimwiki'
Plug 'zaiste/tmux.vim'
Plug 'zorab47/vim-gams', { 'for': 'gams' }

Plug 'lifepillar/pgsql.vim'
Plug 'lifepillar/vim-cheat40'

" Specialized NeoVim versus Vim8 configs
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" }}}
" Colors {{{
syntax enable
set background=dark

if has("gui_running") || &t_Co >= 256
  let g:seoul256_background = 236
  let g:seoul256_light_background = 256

  if(exists('+termguicolors'))
    let &t_8f = "[38;2;%lu;%lu;%lum"
    let &t_8b = "[48;2;%lu;%lu;%lum"

    set termguicolors
  endif

  colorscheme seoul256
  set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h11

  if &term =~ 'screen-256color' && exists('$TMUX')
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
  endif
else
  colorscheme bluegreen

endif
" }}}
" Misc {{{
set backspace=indent,eol,start
set timeoutlen=500
" }}}
" Digraphs {{{
digraphs .. 8230              " Add digraph for ellipsis (…) mapped to '..'
" }}}
" Spaces & Tabs {{{
set tabstop=2                 " number of visual spaces per TAB
set softtabstop=2             " number of spaces in TAB when editing
set shiftwidth=2
set expandtab                 " convert tab to spaces
set smarttab                  " smartly insert those tabs
set shiftround                " round shifts to a multiple of shiftwidth
" }}}
" UI Config {{{
set number                    " show line numbers
set nowrap                    " do not wrap long lines
set showcmd                   " display incomplete commands
set cursorline                " highlights row with cursor
" set cursorcolumn              " highlights column with the cursor
set title                     " change the terminal's title
set wildmenu                  " visual autocomplete for command menu
set wildignore=*.swp          " ignore swp files in completion
set list                      " show whitespace chars
set listchars=                " Reset listchars
set listchars+=tab:»\         " Symbols to use for invisible characters
set listchars+=trail:·        " trailing whitespace
set listchars+=nbsp:•         " non-breaking space
set listchars+=extends:→      " line continues past screen (to the right)
set lazyredraw                " redraw only when we need to
set modeline                  " always show modeline
set ttyfast                   " Send more characters for redraws
set shortmess=atI             " Don’t show the intro message when starting Vim
set cmdheight=2               " more room to display messages
set scrolloff=10              " keep cursor line from the bottom of the window
set sidescrolloff=15          " keep cursor line from the bottom of the window
set sidescroll=1              " keep cursor line from the bottom of the window
set splitright                " Opens vertical split right of current window
set splitbelow                " Opens horizontal split below current window
set laststatus=2              " Always show status line of last window
set showmode                  " Show current mode in the modeline
set ruler                     " Show line and column number
filetype plugin indent on     " load filetype-specific indent and plugin files

set mouse=a                   " enable mouse

if exists('+colorcolumn')
  set colorcolumn=81          " highlight column 81 for text alignment
endif
" }}}
" Searching {{{
" }}}
" Folding {{{
set foldenable
set foldlevelstart=10   " open most folds by default to
set foldnestmax=10      " 10 nested fold max
" }}}
" Leader Shortcuts {{{
" open NerdTree
nnoremap <leader>b :NERDTreeFind<CR>

" edit vimrc and reload vimrc - mnemonic: (e)dit(v)imrc, (r)eload(v)imrc
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" edit global todo list
map <Leader>n :tabe ~/todo.md<CR>

" edit global improvement / tool sharpening list
map <Leader>i :tabe ~/tool_sharpening.md<CR>

" edit standup doc
" map <Leader>w :tabe ~/standup.jrnl<CR>

" Execute Dispatch for current file
map <Leader>d :w<CR>:Dispatch<CR>

" Execute RSpec for current file
map <Leader>t :w<CR>:call RunCurrentSpecFile()<CR>
map <Leader>s :w<CR>:call RunNearestSpec()<CR>
map <Leader>l :w<CR>:call RunLastSpec()<CR>
map <Leader>as :w<CR>:call RunAllSpecs()<CR>

if has("gui_macvim")
  "don't set rspec_command"
  let g:rspec_command = "bundle exec rspec {spec}"
else
  let g:rspec_command = "Dispatch bundle exec rspec --format=progress {spec}"
endif

" Paste from system clipboard
map <Leader>p :set paste<CR>o<ESC>"+]p:set nopaste<CR>

" Edit snippets - mnemonic: (e)dit(s)nippets
map <Leader>es :tabe ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<CR>

" Yank to system clipboard
map <Leader>y "+y

nnoremap <leader>fw :FixLastSpellingError<CR>

" TODO
" yank path to current file - mnemonic: (c)urrent-file(p)ath
nnoremap <silent> <Leader>cp :let @" = expand("%:~")<CR>

" yank current file basename - mnemonic: (c)urrent(f)ilename
nnoremap <silent> <Leader>cf :let @" = expand("%:t")<CR>

" yank current file basename striped of extension - mnemonic: (c)urrent(n)ame
nnoremap <silent> <Leader>cn :let @" = expand("%:t:r")<CR>

" Leader shortcuts for Rails commands
" map <Leader>m :Rmodel
" map <Leader>c :Rcontroller
" map <Leader>v :Rview
" map <Leader>u :Runittest
" map <Leader>f :Rfunctionaltest
" map <Leader>i :Rintegrationtest
" map <Leader>h :Rhelper
" map <Leader>tm :RTmodel
" map <Leader>tc :RTcontroller
" map <Leader>tv :RTview
" map <Leader>tu :RTunittest
" map <Leader>tf :RTfunctionaltest
" map <Leader>sm :RSmodel
" map <Leader>sc :RScontroller
" map <Leader>sv :RSview
" map <Leader>su :RSunittest
" map <Leader>sf :RSfunctionaltest
" map <Leader>si :RSintegrationtest

map <Leader>sc :RVschema<space>
map <Leader>ag :tabe<CR>:Ag<space>

nnoremap <Leader>tn :call MoveToNextTab()<CR>
nnoremap <Leader>tp :call MoveToPrevTab()<CR>

map <Leader>f :FZF<CR>

" }}}
" Tabularize {{{
" if exists(":Tabularize")
" mnemonic: (a)lign
"
" tabularize "=", but not "<=" or "==".
  nmap <Leader>a= :Tabularize /[^<=]\@<=\(=\)=\@!/<CR>
  vmap <Leader>a= :Tabularize /[^<=]\@<=\(=\)=\@!/<CR>

  nmap <Leader>a: :Tabularize /:\zs/l1<CR>
  vmap <Leader>a: :Tabularize /:\zs/l1<CR>
  nmap <Leader>a{ :Tabularize /{<CR>
  vmap <Leader>a{ :Tabularize /{<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
  nmap <Leader>a, :Tabularize /,\zs/l1<CR>
  vmap <Leader>a, :Tabularize /,\zs/l1<CR>
  nmap <Leader>a< :Tabularize /<-<CR>
  vmap <Leader>a< :Tabularize /<-<CR>
" endif
" }}}
" Abbreviations {{{
ab zaa ActiveAdmin

" Date abbr: 2014-10-30
ab <expr> zda strftime("%Y-%m-%d")

" Date and time abbr: 2014-10-30 10:00
ab <expr> zdt strftime("%Y-%m-%d %H:%M:%S")

" }}}
" Custom Key Mappings {{{
" quickly open new tabs
nnoremap <C-W>e :tabe<cr>

map <F10> :NERDTreeFind<CR>
map  <F9> :NERDTreeFind<CR>

" Avoid using escape key
imap jj <Esc>
imap jk <Esc>

" Duplicated selected text using v_D
vmap D y'>p

" Remove trailing whitespace using F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Common Command Typos
command! Q  quit    " converts ... :Q  => :q
command! W  write   " converts ... :W  => :w
command! Wq wq      " converts ... :Wq => :wq
command! Wn wn      " converts ... :Wn => :wn
command! WN wN      " converts ... :WN => :wN

" Ignore F1 (help)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Clear highlighting after a search
nnoremap  <Leader>/ :nohlsearch<CR>
"

" Insert mode movement
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
" }}}

" Plugin Configs
" --------------

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]

let g:goyo_width = 82
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Builtin Customizations {{{
" Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'sql']
let g:vim_markdown_new_list_item_indent = 2

"}}}

" Tabularize {{{
" if exists(":Tabularize")
" mnemonic: (a)lign

  " Ruby
  " align "=" but not "<=" or "==".
  nmap <Leader>a= :Tabularize /[^<=]\@<=\(=\)=\@!/<CR>
  vmap <Leader>a= :Tabularize /[^<=]\@<=\(=\)=\@!/<CR>

  " align ":" but not "::"
  nmap <Leader>a: :Tabularize /[^:]\@<=:\zs\(:\)\@!<CR>
  vmap <Leader>a: :Tabularize /[^:]\@<=:\zs\(:\)\@!<CR>

  nmap <Leader>a{ :Tabularize /[^#]\@<={<CR>
  vmap <Leader>a{ :Tabularize /[^#]\@<={<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
  nmap <Leader>a, :Tabularize /,\zs/l1r0<CR>
  vmap <Leader>a, :Tabularize /,\zs/l1r0<CR>

  " hash keys (a)lign (k)eys
  nmap <Leader>ak :Tabularize /\w\+:[:]\@!<CR>
  vmap <Leader>ak :Tabularize /\w\+:[:]\@!<CR>

  " R script
  nmap <Leader>a< :Tabularize /<-<CR>
  vmap <Leader>a< :Tabularize /<-<CR>

  " GAMS align on periods
  nmap <Leader>a. :Tabularize /[^0-9]\@<=\.<CR>
  vmap <Leader>a. :Tabularize /[^0-9]\@<=\.<CR>

  nmap <Leader>aw :Tabularize whitespace<CR>
  vmap <Leader>aw :Tabularize whitespace<CR>

" endif
" }}}
" NERD Tree {{{
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}
" Syntastic {{{
" let g:syntastic_ignore_files = ['.java$']

" mark syntax errors with :signs
" let g:syntastic_enable_signs=1

" automatically jump to the error when saving the file
" let g:syntastic_auto_jump=0

" show the error list automatically
" let g:syntastic_auto_loc_list=0

" don't care about warnings
" let g:syntastic_quiet_messages = {'level': 'warnings'}

" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open=1

" let g:syntastic_check_on_wq = 0

" let g:syntastic_ruby_checkers = ['mri']
" }}}

" Vim-Ruby {{{
let g:ruby_indent_access_modifier_style = 'indent'

let ruby_spellcheck_strings = 1
" }}}

" Titlecase {{{
let g:titlecase_map_keys = 0
nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine
" }}}

" fzf {{{
set rtp+=~/.fzf
" }}}

" Ctrl-P {{{
let g:ctrlp_max_height = 20            " provide more space to display results
set wildignore+=tmp/cache/**,*.scssc,*.sassc " ignore tmp files and Sass caches

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --nocolor --hidden'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let &grepprg = 'ag --nogroup --nocolor --column'
else
  let &grepprg = 'grep -rn $* *'
endif

" }}}
" Airline {{{

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Use unicode character separators instead of patched fonts for portability
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

let g:airline_theme='wombat'

" }}}
" Invetigate.vim {{{
let g:investigate_command_for_ruby="^i!ri --format ansi ^s"
" }}}
" AutoGroups {{{
augroup vimrc
  autocmd!

  " Neomake
  autocmd! BufWritePost * Neomake
  let g:neomake_ruby_enabled_makers = ["rubocop", "mri"]

  let g:neomake_typescript_enabled_makers = ["tslint"]

  " Automatic rename of tmux window
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif

  let g:pandoc#formatting#mode = "h"
  let g:pandoc#modules#disabled = ['chdir']

  " Markdown specifics: enable spellchecking and hard wrap at 80 characters
  autocmd FileType markdown setlocal spell nolist textwidth=80 complete+=kspell
  autocmd FileType mkd      setlocal spell nolist textwidth=80 complete+=kspell
  autocmd FileType pandoc   setlocal spell nolist textwidth=80 complete+=kspell
  autocmd FileType rmd      setlocal spell nolist textwidth=80 complete+=kspell
  autocmd FileType vimwiki  setlocal spell nolist textwidth=80 complete+=kspell

  " Enable spellchecking for gitcommits
  autocmd FileType gitcommit setlocal spell complete+=kspell

  " Enable spellchecking for LaTex files and hard wrap
  autocmd FileType tex setlocal spell nolist textwidth=80 complete+=kspell

  autocmd FileType journal setlocal spell nolist textwidth=80 complete+=kspell

  " Disable expandtab for php
  autocmd FileType php setlocal noexpandtab sw=2 ts=2

  " Use hash as R comment string
  autocmd FileType r set commentstring=#\ %s

  " Use -- as SQL comment string
  autocmd FileType sql setlocal commentstring=--\ %s

  let g:sql_type_default = 'pgsql'

  " Use # for pandoc (i.e. markdown files)
  autocmd FileType pandoc setlocal commentstring=#\ %s

  " Doing entries as markdown
  autocmd BufRead /tmp/doing* setfiletype markdown

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Use Ruby syntax on Arbre template files
  autocmd BufRead,BufNewFile *.arb set filetype=ruby

  " Use Ruby syntax on Capistrano files
  autocmd BufRead,BufNewFile *.cap setfiletype ruby

  " Setup vim-dispatch for RSpec files
  autocmd BufRead,BufNewFile *_spec.rb let g:dispatch = "rspec expand('%:p')"

  " Always treat .tex files as LaTeX.
  autocmd BufRead,BufNewFile *.tex set filetype=tex

  " Add journal filetype
  autocmd BufRead,BufNewFile *.jrnl set filetype=journal
  autocmd BufRead,BufNewFile *.journal set filetype=journal

  autocmd BufRead,BufNewFile *.wiki set filetype=vimwiki

  " Assume conf on basic configuration file type patterns
  autocmd BufRead,BufNewFile *.conf set filetype=conf

  " Setup snytax highlighting for rspec files if rails is not loaded (in which
  " case vim-rails will handle the highlighting for us)
  if !exists('g:loaded_rails')

    autocmd BufRead,BufNewFile *_spec.rb syn keyword rubyRspec describe context it its specify shared_context shared_examples shared_examples_for shared_context include_examples include_context it_should_behave_like it_behaves_like before after around subject fixtures controller_name helper_name scenario feature background given described_class violated pending expect expect_any_instance_of allow allow_any_instance_of double instance_double mock mock_model stub_model violated pending expect expect_any_instance_of allow allow_any_instance_of double instance_double mock mock_model stub_model
    hi def link rubyRspec Function
  endif

  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=? spell

  autocmd ColorScheme * highlight clear SignColumn

  autocmd Filetype coffee map <buffer> <Leader>t :!teaspoon<CR>
  autocmd Filetype php    map <buffer> <Leader>t :!phpunit --colors %<CR>
  autocmd Filetype qf     setlocal nolist wrap

  " deoplete ensure the popup window is closed correctly
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" }}}
" Titlecase {{{
  let g:titlecase_map_keys = 0
  nmap <leader>gt <Plug>Titlecase
  vmap <leader>gt <Plug>Titlecase
  nmap <leader>gT <Plug>TitlecaseLine
" }}}
" Conoline {{{
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1
" }}}

" Syntastic {{{
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1
call deoplete#custom#buffer_option('auto_complete', v:false)

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

"}}}


" Javascript syntax/highlighting {{{

let g:javascript_plugin_flow = 1

"}}}

" Ctags - Scala specificly (sbt-ctag) {{{
set tags=./tags,tags,./.git/tags,../tags
" }}}

" Python Syntax {{{
let python_version_2 = 1
let python_highlight_all = 1
" }}}
" Backups {{{
set nobackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup
" }}}
" Custom Commands {{{
augroup vimrcEx
  autocmd!

  " Resize splits when the window is resized
  autocmd VimResized * :wincmd =

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

augroup END

command! Scratch new +setlocal\ buftype=nofile\ bufhidden=wipe\ ft=ruby\ noswapfile
" }}}

" vim:foldmethod=marker:foldlevel=0
