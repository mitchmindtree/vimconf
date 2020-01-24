set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif

set t_Co=256
let g:colors_name="nightrun"

hi Normal guifg=#ffffff guibg=#0d0a18
hi Comment guifg=#FFAEAC guibg=NONE
hi Constant guifg=#DD97C9 guibg=NONE
hi String guifg=#f483c3 guibg=NONE
hi htmlTagName guifg=#92a5d1 guibg=NONE
hi Identifier guifg=#8BF2FD guibg=NONE
hi Statement guifg=#DD97C9 guibg=NONE
hi PreProc guifg=#8FE7C8 guibg=NONE
hi Type guifg=#D49FFF guibg=NONE
hi Function guifg=#FFFFFF guibg=NONE
hi Repeat guifg=#dd97c9 guibg=NONE
hi Operator guifg=#DD97C9 guibg=NONE
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff
hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment  Comment
hi link Debug		Special