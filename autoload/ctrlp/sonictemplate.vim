if exists('g:loaded_ctrlp_sonictemplate') && g:loaded_ctrlp_sonictemplate
  finish
endif
let g:loaded_ctrlp_sonictemplate = 1

let s:sonictemplate_var = {
\  'init':   'ctrlp#sonictemplate#init()',
\  'accept': 'ctrlp#sonictemplate#accept',
\  'lname':  'sonictemplate',
\  'sname':  'sonictemplate',
\  'enter':  'ctrlp#sonictemplate#enter()',
\  'exit':   'ctrlp#sonictemplate#exit()',
\  'type':   'sonictemplate',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:sonictemplate_var)
else
  let g:ctrlp_ext_vars = [s:sonictemplate_var]
endif

function! ctrlp#sonictemplate#init()
  return s:list
endfunc

function! ctrlp#sonictemplate#accept(mode, str)
  call ctrlp#exit()
  call sonictemplate#apply(a:str, 'n')
endfunction

function! ctrlp#sonictemplate#enter()
  let s:list = sonictemplate#complete("", "", 0)
endfunction

function! ctrlp#sonictemplate#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#sonictemplate#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
