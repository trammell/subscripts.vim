" subscripts.vim: (global plugin) Subscripting helper
" Last Change:
" Maintainer:    John Trammell <johntrammell@gmail.com>
" Version:       0.01, for Vim 7.1+
" URL:
" Documentation: See file "subscripts.txt", also 
"                http://www.swaroopch.com/notes/Vim_en:Scripting

" don't load if we've already loaded, or if compatibility mode is on
if exists("loaded_subscripts") || &cp
    finish
endif
let loaded_subscripts = 1

" see ':help using-<Plug>'
if !hasmapto('<Plug>MakeSubScript')
    map <unique> <Leader>s <Plug>MakeSubScript
endif
noremap <unique> <script> <Plug>MakeSubScript <SID>MakeSubScript
noremap <SID>MakeSubScript :call <SID>MakeSubScript()<CR>

" convert numbers to subscripts
function! s:MakeSubScript() range
    for i in range(a:firstline, a:lastline)
        let x = tr(getline(i),"0123456789","₀₁₂₃₄₅₆₇₈₉")
        call setline(i,x)
    endfor
endfunction
