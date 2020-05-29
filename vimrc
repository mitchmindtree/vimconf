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
autocmd BufWritePre *.rs,*.txt,*.md,*.pl,*.apl,*.idr,*.h,*.hpp,*.cpp,*.c :call <SID>StripTrailingWhitespaces()


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

" APL character picker on leader.
au FileType apl nnoremap <leader><Tab> :emenu APL.<C-Z>
au FileType dyalog nnoremap <leader><Tab> :emenu APL.<C-Z>

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


" let l:data = [
"     \ ["?",     "?B A?B",   "Roll, Deal",   "[M] Randomly select from first B ints. [D] A ints selected randomly from first B ints."],
"     \ ["×",     "×B A×B",   "Signum, Multiply",         "[M] ¯1 if B<0; 0 if B=0; 1 if B>0. [D] A multiplied by B."],
"     \ ["÷",     "÷B A÷B",   "Reciprocal, Divide",       "[M] 1 divided by B. [D] A divided by B."],
"     \ ["+",     "+B A+B",   "Identity, Add",            "[M] No change to B. [D] Sum of A and B."],
"     \ [",",     ",B A,B",   "Ravel, Catenation      ",  "[M] Reshapes B into a vector. [D] Elements of B appended to the elements of A"],
"     \ ["!",     "!B A!B",   "Factorial, Combinations",  "[M] Product of ints 1 to B. [D] Num combinations of B taken A at a time."],
"     \ ["⋆",     "⋆B A⋆B",   "Exponentiation         ",  "[M] e to the B power. [D] A raised to the B power."],
"     \ ["○",     "○B A○B",   "Pi times, Circle",         "[M] Multiply by π. [D] Trigonometric functions of B selected by A."],
"     \ ["∼",     "∼B",       "Not, Tilde",               "Logical: ∼1 is 0, ∼0 is 1."],
"     \ ["⌊",     "⌊B A⌊B",   "Floor, Min",               "[M] Greatest int <= B. [D] The smaller value of A or B."],
"     \ ["⌽",     "⌽B A⌽B",   "Reversal, Rotation",   "[M] Reverse elems of B along last axis. [D] Elems of B are rotated A positions."],
"     \ ["⍋",     "⍋B",       "Grade up",                 "Indices of B which will arrange B in ascending order."],
"     \ ["⍎",     "⍎B",       "Execute",                  "Execute an APL expression."],
"     \ ["⍟",     "⍟B A⍟B",   "Logarithm",                "[M] Natural logarithm of B. [D] Logarithm of B to base A."],
"     \ ["−",     "−B A−B",   "Negation, Subtract",       "[M] Changes sign of B. [D] A minus B."],
"     \ ["∣",     "∣B A∣B",   "Absolute, Residue",        "[M] Magnitude of B. [D] B modulo A."],
"     \ ["⊖",     "⊖B A⊖B",   "Reversal, Rotation",   "[M] Reverse elems of B along 1st axis. [D] Elems of B are rotated A positions."],
"     \ ["⌈",     "⌈B A⌈B",   "Ceiling, Max",             "[M] Least int >= B. [D] The max of A and B."],
"     \ ["⌹",     "⌹B A⌹B",   "Inverse, Matrix divide",   "[M] Inverse of matrix B. [D] Solution to system of linear equations, multiple regression Ax = B."],
"     \ ["⍉",     "⍉B A⍉B",   "Transpose",                "[M] Reverse the axes of B. [D] Order axes of B by A."],
"     \ ["⍒",     "⍒B",       "Grade down",               "Indices of B which will arrange B in descending order."],
"     \ ["⍕",     "⍕B A⍕B",   "Format",               "[M] A char representation of B. [D] Format B into a char matrix according to A."],
"     \ ["⍳",     "⍳B A⍳B",   "Indices, Iota",            "[M] Vector of the first B ints. [D] The location (index) of B in A."],
"     \ ["⍴",     "⍴B A⍴B",   "Shape, Rho, Reshape",      "Num of components in each dimension. Array of shape A with data B."],
" 
"     \ ["¨",     "A¨B",  "Diaeresis, Double-Dot",        "Over each, or perform each separately."],
"     \ ["/",     "A/B",  "Compression, Dyadic Slash",    "Select elements in B corresponding to ones in A."],
"     \ ["<",     "A<B",  "Less than",                    "Comparison: 1 if true, 0 if false."],
"     \ ["=",     "A=B",  "Equal",                        "Comparison: 1 if true, 0 if false."],
"     \ [">",     "A>B",  "Greater than",                 "Comparison: 1 if true, 0 if false."],
"     \ ["\\",    "A\B", "Expansion, Backslash",          "Insert zeros (or blanks) in B corresponding to zeros in A."],
"     \ ["⊢",     "A⊢B",  "Right",                        "B."],
"     \ ["⊣",     "A⊣B",  "Left",                         "A."],
"     \ ["⊤",     "A⊤B",  "Encode",                       "Base-A representation of the value of B."],
"     \ ["⊥",     "A⊥B",  "Decode",                       "Value of a polynomial whose coefficients are B at A."],
"     \ ["↑",     "A↑B",  "Take",                         "Select the first (or last) A elements of B according to ×A."],
"     \ ["↓",     "A↓B",  "Drop",                         "Remove the first (or last) A elements of B according to ×A."],
"     \ ["∈",     "A∈B",  "Membership, Epsilon",          "1 for elements of A present in B; 0 where not."],
"     \ ["∧",     "A∧B",  "And",                          "Boolean Logic: 1 if both A and B = 1, 0 otherwise."],
"     \ ["∨",     "A∨B",  "Or",                           "Boolean Logic: 0 if both A and B = 0, 1 otherwise."],
"     \ ["≠",     "A≠B",  "Not equal",                    "Comparison: 1 if true, 0 if false."],
"     \ ["≤",     "A≤B",  "Less than or equal",           "Comparison: 1 if true, 0 if false."],
"     \ ["≥",     "A≥B",  "Greater than or equal",        "Comparison: 1 if true, 0 if false."],
"     \ ["⍱",     "A⍱B",  "Nor",                          "Boolean Logic: 1 if both A and B are 0, otherwise 0. Alt: ~∨ = not Or."],
"     \ ["⍲",     "A⍲B",  "Nand",                         "Boolean Logic: 0 if both A and B are 1, otherwise 1. Alt: ~∧ = not And."],
" \ ]





" APL insert-mode auto-completion.

" Map ctrl+m to APL character completion.
au FileType apl inoremap <C-x><C-m> <C-r>=AplUnicodeList()<CR>
" Make subsequent <C-m> presses go to the next entry.
inoremap <expr> <C-m> pumvisible() ?  "\<C-n>" : "\<C-m>"
" Completion function for APL characters.
fun! AplUnicodeList()
    let l:data = [
        \ ["?",     "?B A?B ",  "Roll, Deal",   "[M] Randomly select from first B ints. [D] A ints selected randomly from first B ints."],
        \ ["×",     "×B A×B ",  "Signum, Multiply",         "[M] ¯1 if B<0; 0 if B=0; 1 if B>0. [D] A multiplied by B."],
        \ ["÷",     "÷B A÷B ",  "Reciprocal, Divide",       "[M] 1 divided by B. [D] A divided by B."],
        \ ["+",     "+B A+B ",  "Identity, Add",            "[M] No change to B. [D] Sum of A and B."],
        \ [",",     ",B A,B ",  "Ravel, Catenation",  "[M] Reshapes B into a vector. [D] Elements of B appended to the elements of A"],
        \ ["!",     "!B A!B ",  "Factorial, Combinations",  "[M] Product of ints 1 to B. [D] Num combinations of B taken A at a time."],
        \ ["⋆",     "⋆B A⋆B ",  "Exponentiation",  "[M] e to the B power. [D] A raised to the B power."],
        \ ["○",     "○B A○B ",  "Pi times, Circle",         "[M] Multiply by π. [D] Trigonometric functions of B selected by A."],
        \ ["∼",     "∼B     ",  "Not, Tilde",               "Logical: ∼1 is 0, ∼0 is 1."],
        \ ["⌊",     "⌊B A⌊B ",  "Floor, Min",               "[M] Greatest int <= B. [D] The smaller value of A or B."],
        \ ["⌽",     "⌽B A⌽B ",  "Reversal, Rotation",   "[M] Reverse elems of B along last axis. [D] Elems of B are rotated A positions."],
        \ ["⍋",     "⍋B     ",  "Grade up",                 "Indices of B which will arrange B in ascending order."],
        \ ["⍎",     "⍎B     ",  "Execute",                  "Execute an APL expression."],
        \ ["⍟",     "⍟B A⍟B ",  "Logarithm",                "[M] Natural logarithm of B. [D] Logarithm of B to base A."],
        \ ["−",     "−B A−B ",  "Negation, Subtract",       "[M] Changes sign of B. [D] A minus B."],
        \ ["∣",     "∣B A∣B ",  "Absolute, Residue",        "[M] Magnitude of B. [D] B modulo A."],
        \ ["⊖",     "⊖B A⊖B ",  "Reversal, Rotation",   "[M] Reverse elems of B along 1st axis. [D] Elems of B are rotated A positions."],
        \ ["⌈",     "⌈B A⌈B ",  "Ceiling, Max",             "[M] Least int >= B. [D] The max of A and B."],
        \ ["⌹",     "⌹B A⌹B ",  "Inverse, Mat div", "[M] Inverse of matrix B. [D] Solution to system of linear equations, multiple regression Ax = B."],
        \ ["⍉",     "⍉B A⍉B ",  "Transpose",                "[M] Reverse the axes of B. [D] Order axes of B by A."],
        \ ["⍒",     "⍒B     ",  "Grade down",               "Indices of B which will arrange B in descending order."],
        \ ["⍕",     "⍕B A⍕B ",  "Format",           "[M] A char representation of B. [D] Format B into a char matrix according to A."],
        \ ["⍳",     "⍳B A⍳B ",  "Indices, Iota",            "[M] Vector of the first B ints. [D] The location (index) of B in A."],
        \ ["⍴",     "⍴B A⍴B ",  "Shape, Rho, Reshape",      "Num of components in each dimension. Array of shape A with data B."],
        \ ["¨",     "A¨B    ",  "Diaeresis, Double-Dot",        "Over each, or perform each separately."],
        \ ["<",     "A<B    ",  "Less than",                    "Comparison: 1 if true, 0 if false."],
        \ ["=",     "A=B    ",  "Equal",                        "Comparison: 1 if true, 0 if false."],
        \ [">",     "A>B    ",  "Greater than",                 "Comparison: 1 if true, 0 if false."],
        \ ["⊢",     "A⊢B    ",  "Right",                        "B."],
        \ ["⊣",     "A⊣B    ",  "Left",                         "A."],
        \ ["⊤",     "A⊤B    ",  "Encode",                       "Base-A representation of the value of B."],
        \ ["⊥",     "A⊥B    ",  "Decode",                       "Value of a polynomial whose coefficients are B at A."],
        \ ["↑",     "A↑B    ",  "Take",                         "Select the first (or last) A elements of B according to A."],
        \ ["↓",     "A↓B    ",  "Drop",                         "Remove the first (or last) A elements of B according to A."],
        \ ["∈",     "A∈B    ",  "Membership, Epsilon",          "1 for elements of A present in B; 0 where not."],
        \ ["∧",     "A∧B    ",  "And",                          "Boolean Logic: 1 if both A and B = 1, 0 otherwise."],
        \ ["∨",     "A∨B    ",  "Or",                           "Boolean Logic: 0 if both A and B = 0, 1 otherwise."],
        \ ["≠",     "A≠B    ",  "Not equal",                    "Comparison: 1 if true, 0 if false."],
        \ ["≤",     "A≤B    ",  "Less than or equal",           "Comparison: 1 if true, 0 if false."],
        \ ["≥",     "A≥B    ",  "Greater than or equal",        "Comparison: 1 if true, 0 if false."],
        \ ["⍱",     "A⍱B    ",  "Nor",                          "Boolean Logic: 1 if both A and B are 0, otherwise 0. Alt: ~∨ = not Or."],
        \ ["⍲",     "A⍲B    ",  "Nand",                         "Boolean Logic: 0 if both A and B are 1, otherwise 1. Alt: ~∧ = not And."],
        \ ["/",     "A/B +/B",  "Compression, Reduce",      "[M] Select elements in B corresponding to ones in A. [D] Sum across B."],
        \ ["\\",    "A\\B +\\B",    "Expansion, Scan",      "[M] Insert zeros (or blanks) in B corresponding to zeros in A. [D] Running sum across B."],
        \ ["⌿",     "+⌿B    ",  "Reduce (first axis)",          "E.g. Sum down B."],
        \ ["⍀",     "+⍀B    ",  "Scan (first axis)",            "E.g. Running sum down B."],
        \ [".",     "A+.×B  ",  "Inner product",                "E.g Matrix product of A and B."],
        \ ["∘.",    "A∘.×B  ",  "Outer product",                "E.g. Outer product of A and B."],
        \ ["⍝",     "⍝ Foo  ",  "Lamp, Comment",                "Illuminates code."],
        \ ["←",     "B←A    ",  "Assign",                       "Assign the result of the expression to B."],
        \ ["→",     "→B/0   ",  "Branch",                       "If B=1 branch occurs, in this case 0 exits function."],
        \ ["∇",     "∇B←A   ",  "Function Declaration",         "Declares a function."],
        \ ["⍵",     "B←{⍵}  ",  "Right Function Argument",      "Represents an implicit argument to the function B."],
        \ ["⍺",     "B←{⍺+⍵}",  "Left Function Argument",       "Represents the left, implicit argument to the dyadic function B."],
        \ ["⊂",     "⊂A B   ",  "Enclose, Bag, Box",            "Encloses values A and B within a single value."],
        \ ["⊃",     "⊃B     ",  "Disclose, Pick, Unbox",        "Discloses (unboxes) the boxed value B."],
        \ [" ̄",     " ̄B     ",  "High Minus, Negative Value",   "Indicates a value that is the negative of B."],
        \ ["⎕",     "⎕SIGNAL",  "Quad, System Function",        "Unique character used to start system function names."],
    \ ]

    " Locate the start of the word.
    let l:line = getline('.')
    let l:start = col('.') - 1
    while l:start > 0 && l:line[l:start - 1] =~ '\a'
        let l:start -= 1
    endwhile

    " Record what matches − we pass this to complete() later
    let l:res = []
    for m in l:data
        call add(l:res, {
            \ 'word': l:m[0],
            \ 'menu': l:m[1] . ' ⍝ ' . l:m[2] . '.',
            \ 'info': l:m[3],
        \ })
    endfor

    " Now call the complete() function
    call complete(l:start + 1, l:res)
    return ''
endfun
