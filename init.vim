
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"File Browser:
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mkitt/tabline.vim'
Plug 'ryanoasis/vim-devicons'
"Color:
Plug 'morhetz/gruvbox'
"PowerLine
Plug 'vim-airline/vim-airline'
"Snippets:
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
"Suptertap
Plug 'ervandew/supertab'
"Autopairs
Plug 'jiangmiao/auto-pairs'
"clangx
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim/'
Plug 'sbdchd/neoformat'
"Rust
Plug 'racer-rust/vim-racer'
Plug 'sebastianmarkow/deoplete-rust'
"cursor line
Plug 'itchyny/vim-cursorword'
"ale
Plug 'dense-analysis/ale'

call plug#end()


"COPY/PASTE:
"-----------
"Increases the memory limit from 50 lines to 1000 lines
set viminfo='100,<1000,s10,h

"utf8
set encoding=UTF-8

"NUMBERING:
"----------
set number

"COLOR:
"------
colorscheme gruvbox

"AUTO IMPORT:
"------------
let g:go_fmt_command = "goimports"

"SNIPPETS:
"---------
"Change default expand since TAB is used to cycle options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"FILE BROWSER:
"-------------
"allows NERDTree to open/close by typing 'n' then 't'
"map <ENTER> :NERDTreeTabsToggle<CR>
map nt :NERDTreeTabsToggle<CR>
"Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=2
"Add a close button in the upper right for tabs
let g:tablineclosebutton=1
"Automatically find and select currently opened file in NERDTree
let g:nerdtree_tabs_autofind=1
"Add folder icon to directories
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"Hide expand/collapse arrows
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
highlight! link NERDTreeFlags NERDTreeDir

"SOURCING:
"---------
"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

"TEXT SEARCH:
"------------
"Makes Search Case Insensitive
set ignorecase

"SYNTAX HIGHLIGHTING:
"--------------------
syntax on

"HIGHLIGHTING:
"-------------
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Highlight the current line the cursor is on
set cursorline

"
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" jk map to ESC
inoremap jk <ESC>

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
nmap <Leader>gd :GoDoc<CR>
nmap <Leader>test :GoTest<CR>
nmap <Leader>gt :GoAddTags<CR>
let g:go_guru_scope = ["github.com/fatih/vim-go-tutorial"]
let g:go_guru_scope = ["..."]
let g:go_guru_scope = ["github.com/...", "golang.org/x/tools"]
let g:go_guru_scope = ["encoding/...", "-encoding/xml"]

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Clangx

"rust racer
let g:deoplete#sources#rust#racer_binary='/Users/yutao/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/yutao/.rustup/toolchains/stable-aarch64-apple-darwin/lib/rustlib/src'

let g:racer_cmd = "/Users/yutao/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" clang format
" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 2}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

"augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
"augroup END
