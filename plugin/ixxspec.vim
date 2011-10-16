" -*- vim -*-
" vim:sts=2:sw=2:ff=unix:
" FILE: "$HOME/.vim/plugin/ixxspec.vim"
" Maintainer:   Taylor Carpenter <taylor@codecafe.com>
" Version:      1.0
" (C) 2011 by Taylor Carpenter, <taylor@codecafe.com>


" Find the path to this script so that the links
" to formatter don't need to be hard coded.
if !exists('g:IxxSpecPlugin')
  let g:IxxSpecPlugin = fnamemodify(expand("<sfile>"), ":p:h") 
endif

if !exists('g:IxxSpecUseBundler')
  let g:IxxSpecUseBundler = 1
endif

if !exists('g:IxxSpecRunBelow')
  if $TERM == "screen" || $TMUX != ""
    let g:IxxSpecRunBelow = 1
  else
    let g:IxxSpecRunBelow = 0
  endif
endif

if !exists('g:IxxSpecRunBelowExecutable') && g:IxxSpecRunBelow == 1
  let g:IxxSpecRunBelowExecutable = t:IxxSpecPlugin . "/ixxspec_runbelow"
  if ! filereadable(g:IxxSpecRunBelowExecutable)
    echo "Could not find spec script (" . specscriptname . ") in any known plugin path"
    finish
  end
endif

" ** Suggested mapping **
" NOTE: leader by default is \
command! IxxSpecDefaultMaps :call IxxSpecDefaultMaps()
function! IxxSpecDefaultMaps()
  map <leader>SS :Spec<cr>
  map <leader>ST :SpecThis<cr>
  map <leader>SL :SpecLast<cr>
  map <leader>SB :SpecBlock<cr>
endfunction

if !exists('t:IxxSpecVersion')
  " FIXME: this stuff delays startup to long
  " let t:cmd = ""
  " if g:IxxSpecUseBundler == 1
  "   let t:cmd .= "bundle exec "
  " endif
  " let t:cmd .=  "spec --version 2>/dev/null"
  " " Execute the spec --version command which, if returns without error
  " " means that the version of rspec is ONE otherwise assume rspec2
  " cgete system( t:cmd ) 
  " let t:IxxSpecVersion = v:shell_error == 0 ? 1 : 2
  let t:IxxSpecVersion = 2
endif

if !exists('t:IxxSpecExecutable') || empty(t:IxxSpecExecutable)
  let t:IxxSpecExecutable =  g:IxxSpecUseBundler == 0 ? "" : "bundle exec " 
  if  t:IxxSpecVersion  > 1
    let t:IxxSpecExecutable .= "rspec --color "
  else
    let t:IxxSpecExecutable .= "spec "
  endif
endif
 
let t:speccmd = g:IxxSpecRunBelow == 0 ? "" : g:IxxSpecRunBelowExecutable . " "
let t:speccmd .= t:IxxSpecExecutable

" TODO: combine functions into one and pass variable for different types
"
command! Spec :call s:Spec()
command! SpecThis :call SpecThis(expand('%'))
command! SpecLast :call SpecThis(expand(lastspecfile))
command! SpecBlock :call SpecBlock(expand('%'))

function! s:Spec()
  return system(t:speccmd)
endfunction  

let g:lastspecfile=''
function! SpecThis(file)
  let g:lastspecfile=a:file
  return system(t:speccmd . " " . a:file)
endfunction  

function! SpecBlock(file)
  let g:lastspecfile=a:file
  let g:mylinenum=line('.')
  return system(t:speccmd . " -l " . g:mylinenum . " " . a:file)
endfunction  
