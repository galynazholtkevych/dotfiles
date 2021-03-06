"=====
" Plug
"=====
call plug#begin()
"
" GENARAL VIM GOODIES
"
" close files instead of closing views
Plug 'moll/vim-bbye'
" sidebar file browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" use vimdiff on folders!
Plug 'will133/vim-dirdiff'
" FIXME: does not work in tmux
" auto-set paste mode when inserting thru terminal shortcut keys
"Plug 'ConradIrwin/vim-bracketed-paste'
"
" GIT INTEGRATION
"
" Git integration
Plug 'tpope/vim-fugitive'
" display git status per line in buffer, stage/instage hunks, integrates with vim-airline
Plug 'airblade/vim-gitgutter'
"
" GENRAL PROGRAMMING
"
" auto-complete, supports Jedi for Python code
" Plug 'Shougo/neocomplete' | Plug 'Konfekt/FastFold'

" code and style checks
Plug 'scrooloose/syntastic'
"
" PYTHON SUPPORT
"
" Python goodies
Plug 'klen/python-mode', { 'for': 'python' }
" Python code completion and refactoring
Plug 'davidhalter/jedi-vim', { 'for': 'python' }


" MARKUP LANGUAGES SUPPORT
"
" reStructured text
Plug 'gu-fan/riv.vim', { 'for': 'rst,python' }
" YAML indentation
Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
" YAML folds
Plug 'digitalrounin/vim-yaml-folds', { 'for': 'yaml' }
"
" VISUALS
"
" best colorscheme of them all
Plug 'altercation/vim-colors-solarized'
" lightweight alternative to Powerline
" Plug 'vim-airline/vim-airline'
" additional themes for vim-airline
" Plug 'vim-airline/vim-airline-themes'
"

" generate Powerline-like config for Tmux interface, based on vim-airline
Plug 'edkolev/tmuxline.vim', { 'on': 'Tmuxline' }

call plug#end()

" FIXME - Vundle leftovers, need to test if I need them back or not
"filetype off                 " required for Vundle
"filetype plugin indent on    " required for Vundle
"filetype plugin on           " use this instead of ^ to ignore plugin indent changes

"==========
" Solarized
"==========
set background=dark
:silent! colorscheme solarized

"=====
"CtrlP
"=====
let g:ctrlp_cmd = 'CtrlPMixed'

"=====
" Jedi
"=====
" Do not use Jedi for autocompletion (using neocomplete for that)
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" Change default binding of jedi's rename command
" let g:jedi#rename_command = "<leader>rn"
" Set function call signatures display
" 0 - turned off
" 1 - pop-up (easier to refer to)
" 2 - vim's command line (nicer undo history)
let g:jedi#show_call_signatures = 0
" Use tabs for go-to commands
let g:jedi#use_tabs_not_buffers = 0

" Other completions (builtin)
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Key-mappings are in keymaps.vim

"============
" Python-mode
"============
let g:pymode = 1

" disable some features in favor of Jedi and YCM
let g:pymode_rope = 0
let g:pymode_doc = 0

" trim whitespace on save
let g:pymode_trim_whitespaces = 1
" load some code formatting defaults
let g:pymode_options = 1

" use PEP8-compatible indent
let g:pymode_indent = 1
" use advanced pymode folding
let g:pymode_folding = 1
" use pymode motions
let g:pymode_motion = 1
" use virualenv support
let g:pymode_virtualenv = 1

" use running the code facilities
let g:pymode_run = 1
let g:pymode_run_key = '<leader>r'

" use inserting breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Code checking - disable (use Syntastic for this)
let g:pymode_lint = 0

" Pymode custom syntax highlight
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1

"==========
" Syntastic
"==========
" Define nice error symbols
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Allways stick found errors to loclist
let g:syntastic_always_populate_loc_list=1
" Automatically close and open loclist
let g:syntastic_auto_loc_list=1
" Aggregate errors from all checkers
let g:syntastic_aggregate_errors=1

" Use flake8 as a sole checker for Python files
" Available are pep8,pep257,pyflakes,pylint,py3kwarn,python,flake8,pylama
let g:syntastic_python_checkers = ['flake8']

"=========
" NERDTree
"=========

" filter on *.pyc files in NERDTree plugin
let NERDTreeIgnore = ['\.pyc$']

" Key to toggle NERDTree sidebar
map <F3> :NERDTreeToggle<CR>

"=============
"NERDCommenter
"=============
" Use octothorpe for comments in ini/conf files, keep ; as alternative
let g:NERDCustomDelimiters = {
    \ 'dosini': {'left': '#', 'leftAlt': ';'}
    \ }

"=======
" Tagbar
"=======
let g:tagbar_width = 32

" Key to toggle TagBar sidebar
nmap <F4> :TagbarToggle<CR>

"====
" Riv
"====
" output path for converted file _not_ in projects
let g:riv_temp_path = 0  " the same dir as source

" highlight Python docstrings as RST
let g:riv_python_rst_hl = 1
" use this highlighting (otherwise interferes? with python highlighting)
let g:riv_highlight_code = 'python'
"do not use fixdel
let g:riv_disable_del = 1

