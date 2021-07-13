" vim: ts=4 sw=4 et

function! neomake#makers#ft#ruby#standardrb() abort
    let maker = {
        \ 'args': ['--format', 'emacs', '--force-exclusion', '--display-cop-names'],
        \ 'errorformat': '%f:%l:%c: %t: %m,%E%f:%l: %m',
        \ 'postprocess': function('neomake#makers#ft#ruby#RubocopEntryProcess'),
        \ 'output_stream': 'stdout',
        \ }

    function! maker.supports_stdin(_jobinfo) abort
        let self.args += ['--stdin', '%']
        let self.tempfile_name = ''
        return 1
    endfunction

    return maker
endfunction
