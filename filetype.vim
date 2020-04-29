" Overrides detection of some file types.

" Specify that `.pl` files are for Prolog, not for Perl.
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.pl setfiletype prolog
  au! BufRead,BufNewFile *.plt setfiletype prolog
augroup END
