scriptencoding utf-8
" Author: Guillermo Roig <groig@protonmail.com>
" Description: Sort TailwindCSS classes with djlint

call ale#Set('html_djlint_executable', 'djlint')
call ale#Set('html_djlint_options', '')

function! ale#fixers#djlint#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'html_djlint_executable')
    let l:options = ale#Var(a:buffer, 'html_djlint_options')

    return {
    \   'command': ale#Escape(l:executable)
    \       . (empty(l:options) ? '' : ' ' . l:options)
    \       . ' --stdin'
    \}
endfunction
