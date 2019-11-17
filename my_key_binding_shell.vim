" call bin/build_xc_proj.sh to build current xc proj, generating compile db {{{
let s:build_xc_proj_cmd = expand('<sfile>:p:h') . '/bin/build_xc_proj.sh'
let s:build_cmake_proj_cmd = expand('<sfile>:p:h') . '/bin/build_cmake_proj.sh'

function! WS_BuildXcProj(...)
  execute ':Spawn! -wait=always -dir=. ' .
        \ shellescape(s:build_xc_proj_cmd) . ' ' . join(a:000)
endfunction

function! WS_BuildCmakeProj()
  execute ':Spawn! -wait=always -dir=. ' .
        \ shellescape(s:build_cmake_proj_cmd)
endfunction

command! -complete=file -nargs=* BuildXcProj call WS_BuildXcProj(<f-args>) 
command! -complete=file BuildCmakeProj call WS_BuildCmakeProj()
" }}}
