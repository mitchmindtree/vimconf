" MY VIMRC!

" Run Pathogen...
execute pathogen#infect()

" Tab business (set to 4 spaces)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Smart indenting specific to files
filetype indent plugin on
set autoindent smartindent

" File saving and confirmation
set confirm
set autowriteall

" be iMproved, required
set nocompatible

" Improves drawing with fast terminals
set ttyfast

" Show cursor in ruler
set ruler

" Better command line completion
set wildmenu

" Show what you are typing as a command.
set showcmd

" Turn on syntax highlighting.
syntax enable
syntax on

" Allow filetype dependent stuff.
filetype on

" Keep at least 3 lines above/below when scrolling
set scrolloff=3

" Uncomment this to enable mouse support in console.
" set mouse=a

" Turn on line numbers
set number

" Sync clipboards
set clipboard=unnamedplus

" Make backspace delete over newlines etc
set backspace=2

" Ignore case using / but consider when uppercase is specified
set ignorecase
set smartcase

" Move cursor to matched string while searching and highlight
set incsearch
set hlsearch

" Map jj to escape
inoremap jj <Esc>

" Set off matching parenthesis
highlight MatchParen ctermbg=4

" Always show statusline
set laststatus=2

" Keep all backup and temp files in the same place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Automatically set directory to current file
set autochdir

" Soft wrap text
set wrap linebreak nolist

" Change line number colour.
highlight LineNr ctermfg=darkblue

" Mapping to make colon command easier
" nnoremap ; :
" nnoremap : ;
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap j gj
nnoremap k gk

" Map ctrl j/k to scroll 3lines in insert mode.
nnoremap <C-k> 3<C-y>
nnoremap <C-j> 3<C-e>

" Auto open NERDTree...
autocmd vimenter * NERDTree

" Turn spell checking on for .txt files.
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

" Line wrap for txt and md files.
autocmd BufRead,BufNewFile *.txt set tw=80
autocmd BufRead,BufNewFile *.md set tw=80


" Force markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Allow for fenced code within markdown blocks in the following languages.
let g:markdown_fenced_languages = ['rust']

" Color markdown italics light grey (instead of ugly white highlight block).
hi markdownItalic ctermfg=lightgrey


" Change spell check to use an underline rather than highlight.
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Function for stripping whitespace from the end of all lines in the buffer.
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Strip whitespace from ends of lines when saving rust files.
autocmd BufWritePre *.rs :call <SID>StripTrailingWhitespaces()


""""" Colors

" Make statusbar black.
hi StatusLine ctermbg=white ctermfg=black
hi StatusLineNC ctermbg=white ctermfg=black

" Make vsplits black
hi VertSplit ctermfg=black


""""""" Syntastic...

" Check header files
let g:syntastic_cpp_check_header=1

" Compiler
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++'
let g:syntastic_check_on_open=0
let g:syntastic_cpp_config_file='.clang_complete'

" Passive Mode for cpp / h / rs
let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['cpp', 'h', 'rust'] }
autocmd FileType cpp nnoremap <C-e> :SyntasticCheck<CR>
autocmd FileType h nnoremap <C-e> :SyntasticCheck<CR>
au FileType rust nnoremap <leader>c :SyntasticCheck<CR>


" Auto-complete easier with ctrl-space
autocmd Filetype cpp inoremap <C-Space> <C-x><C-o>
autocmd Filetype h inoremap <C-Space> <C-x><C-o>
autocmd Filetype rust inoremap <C-Space> <C-x><C-o>
if !has("gui_running")
    inoremap <C-@> <C-x><C-o>
endif

" Syntax highlighting
let g:syntastic_enable_highlighting=0

" Turn off signs for Rust
" autocmd Filetype rust let g:sytastic_enable_signs=0

" Stop weird backspace behaviour from elm.vim in .elm files.
let g:Haskell_no_mapping=1

" Point to the racer exe.
set hidden
let g:racer_cmd = "/home/mindtree/.cargo/bin/racer"

" Racer's GoTo definition mappings.
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Run on \r
au FileType rust nnoremap <leader>r :RustRun<CR>
" Fmt on \f
au FileType rust nnoremap <leader>f :RustFmt<CR>

let g:syntastic_rust_checkers = ['cargo']

" Smarter idris indentations
let g:idris_indent_if = 3
let g:idris_indent_case = 5
let g:idris_indent_let = 4
let g:idris_indent_where = 6
let g:idris_indent_do = 3
let g:idris_indent_rewrite = 8

" Read `.vs` and `.fs` as GLSL file extensions.
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" Two space tabs for arduino files.
autocmd FileType arduino setlocal shiftwidth=2 softtabstop=2 expandtab
