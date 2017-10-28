" Zeal integration for investigate.vim
" Setup ------ {{{
if exists("g:investigate_loaded_zeal")
  finish
endif
let g:investigate_loaded_zeal = 1
" }}}

" Get string to use with Zeal. ------ {{{
function! investigate#zeal#zealString(syntax)
  let l:format = s:ZealFormat(g:investigate_path_to_zeal)
  return s:SyntaxString(l:format, a:syntax)
endfunction
" }}}

" Replace the identifier with the syntax if it exists ------ {{{
function! s:SyntaxString(string, syntax)
  return substitute(substitute(a:string, '\M\^g', a:syntax, 'g'), '\M\^f', split(a:syntax, ',')[0], 'g')
endfunction
" }}}

" Create the format string based on Dash versions ------ {{{
function! s:ZealFormat(path)
  return "dash://^f:^s"
endfunction
" }}}

" vspec ------ {{{
function! investigate#zeal#sid()
  return maparg('<SID>', 'n')
endfunction
nnoremap <SID> <SID>

function! investigate#zeal#scope()
  return s:
endfunction
" }}}
