" Author: Dalius Dobravolskas <dalius.dobravolskas@gmail.com>
" Description: VSCode html language server

function! ale_linters#html#tailwindcss#GetProjectRoot(buffer) abort
    let l:git_path = ale#path#FindNearestDirectory(a:buffer, '.git')

    return !empty(l:git_path) ? fnamemodify(l:git_path, ':h:h') : ''
endfunction

call ale#linter#Define('html', {
\   'name': 'tailwindcss',
\   'lsp': 'stdio',
\   'executable': 'tailwindcss-language-server',
\   'command': '%e --stdio',
\   'project_root': function('ale_linters#html#tailwindcss#GetProjectRoot'),
\})
