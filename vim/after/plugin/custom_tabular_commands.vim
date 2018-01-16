if !exists(':Tabularize')
  finish " Give up here; the Tabular plugin musn't have been loaded
endif

" Make line wrapping possible by resetting the 'cpo' option, first saving it
let s:save_cpo = &cpo
set cpo&vim

AddTabularPattern! whitespace / \+\zs/l1r0

" Align ruby blocks, but ignore string interpolation
AddTabularPattern! ruby_block /[^#]\@<={/

" Restore the saved value of 'cpo'
let &cpo = s:save_cpo
unlet s:save_cpo
