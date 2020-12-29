" Palette: {{{

let g:dracula#palette           = {}
let g:dracula#palette.fg        = ['#F8F8F2', 253]

let g:dracula#palette.bglighter = ['#424450', 238]
let g:dracula#palette.bglight   = ['#343746', 237]
let g:dracula#palette.bg        = ['#282A36', 236]
let g:dracula#palette.bgdark    = ['#21222C', 235]
let g:dracula#palette.bgdarker  = ['#191A21', 234]

let g:dracula#palette.comment   = ['#6272A4',  61]
let g:dracula#palette.selection = ['#44475A', 239]
let g:dracula#palette.subtle    = ['#424450', 238]

let g:dracula#palette.cyan      = ['#8BE9FD', 117]
let g:dracula#palette.green     = ['#50FA7B',  84]
let g:dracula#palette.orange    = ['#FFB86C', 215]
let g:dracula#palette.pink      = ['#FF79C6', 212]
let g:dracula#palette.purple    = ['#BD93F9', 141]
let g:dracula#palette.red       = ['#FF5555', 203]
let g:dracula#palette.yellow    = ['#F1FA8C', 228]

"
" ANSI
"
let g:dracula#palette.color_0  = '#21222C'
let g:dracula#palette.color_1  = '#FF5555'
let g:dracula#palette.color_2  = '#50FA7B'
let g:dracula#palette.color_3  = '#F1FA8C'
let g:dracula#palette.color_4  = '#BD93F9'
let g:dracula#palette.color_5  = '#FF79C6'
let g:dracula#palette.color_6  = '#8BE9FD'
let g:dracula#palette.color_7  = '#F8F8F2'
let g:dracula#palette.color_8  = '#6272A4'
let g:dracula#palette.color_9  = '#FF6E6E'
let g:dracula#palette.color_10 = '#69FF94'
let g:dracula#palette.color_11 = '#FFFFA5'
let g:dracula#palette.color_12 = '#D6ACFF'
let g:dracula#palette.color_13 = '#FF92DF'
let g:dracula#palette.color_14 = '#A4FFFF'
let g:dracula#palette.color_15 = '#FFFFFF'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! dracula#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'dracula'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:


" =============================================================================


" Dracula Airline Theme: {{{
"
" Copyright 2016, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Extrante <extrante@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>
"}}}
" Helpers: {{{

" Takes a foreground color name, background color name, and optionally one or
" more attr-list items as input, transforms it to the format accepted by
" airline#themes#generate_color_map and returns that value
func! s:clr(fg, bg, ...)
  let l:fg = g:dracula#palette[a:fg]
  let l:bg = g:dracula#palette[a:bg]
  return [ l:fg[0], l:bg[0], l:fg[1], l:bg[1] ] +
       \ filter(copy(a:000), 'type(v:val) == 1 && len(v:val) > 0')
endfunc

" Takes three ['fg', 'bg'] color lists and optionally a dictionary of extra
" key-value pairs and returns the value generated by
" airline#themes#generate_color_map after optionally merging the dictionary of
" extra key-value pairs.
"
" a:a -> airline_a, airline_x
" a:b -> airline_b, airline_y
" a:c -> airline_c, airline_z
func! s:color_map(a, b, c, ...)
  if a:0 == 0
    return call('airline#themes#generate_color_map', [call('s:clr', a:a), call('s:clr', a:b), call('s:clr', a:c)])
  else
    return call('extend', [ call('airline#themes#generate_color_map', [call('s:clr', a:a), call('s:clr', a:b), call('s:clr', a:c)]) ] + a:000)
  endif
endfunc

"}}}

let g:airline#themes#dracula#palette = {
\   'normal': s:color_map(
\       ['bg', 'purple'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'normal_modified': s:color_map(
\       ['bg', 'purple'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'insert': s:color_map(
\       ['bg', 'green'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'insert_modified': s:color_map(
\       ['bg', 'green'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'replace': s:color_map(
\       ['bg', 'orange'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'replace_modified': s:color_map(
\       ['bg', 'orange'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'visual': s:color_map(
\       ['bg', 'yellow'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'visual_modified': s:color_map(
\       ['bg', 'yellow'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'inactive': s:color_map(
\       ['bg', 'comment'],
\       ['fg', 'bgdark'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'terminal': s:color_map(
\       ['bg', 'green'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_term': s:clr('fg', 'selection'),
\       },
\     ),
\}

" Extensions: {{{
" Tabline: {{{
if get(g:, 'airline#extensions#tabline#enabled', 0)
  let g:airline#themes#dracula#palette.tabline = {
        \ 'airline_tabfill': s:clr('bg', 'bglight'),
        \
        \ 'airline_tab': s:clr('comment', 'bg'),
        \ 'airline_tabsel': s:clr('bg', 'purple'),
        \ 'airline_tabmod': s:clr('green', 'bg'),
        \
        \ 'airline_tab_right': s:clr('comment', 'bg'),
        \ 'airline_tabsel_right': s:clr('fg', 'bg', ),
        \ 'airline_tabmod_right': s:clr('green', 'bg'),
        \}
endif
"}}}
" CtrlP: {{{2
if exists('g:loaded_ctrlp')
  let g:airline#themes#dracula#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ s:clr('fg', 'selection'),
        \ s:clr('fg', 'comment'),
        \ s:clr('fg', 'purple'),
        \)
endif
"}}}2
"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
