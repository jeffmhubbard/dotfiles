" ============================================================================
" File: antsy.vim
" Description: Minimal lightline theme
" Author: Jeff M. Hubbard
" Source: https://github.com/novadev94/lightline-onedark
" Last Modified: May 30, 2018
" ===========================================================================

let s:bold = get(g:, 'lightline#antsy#disable_bold_style', 0) ? '' : 'bold'

let s:dark_grey     = [ '#000000', 0 ]
let s:grey          = [ '#7f7f7f', 8 ]
let s:dark_red      = [ '#cd0000', 1 ]
let s:red           = [ '#ff0000', 9 ]
let s:dark_green    = [ '#00cd00', 2 ]
let s:green         = [ '#00ff00', 10 ]
let s:dark_yellow   = [ '#cdcd00', 3 ]
let s:yellow        = [ '#ffff00', 11 ]
let s:dark_blue     = [ '#0000ee', 4 ]
let s:blue          = [ '#5c5cff', 12 ]
let s:dark_magenta  = [ '#cd00cd', 5 ]
let s:magenta       = [ '#ff00ff', 13 ]
let s:dark_cyan     = [ '#00cdcd', 6 ]
let s:cyan          = [ '#00ffff', 14 ]
let s:dark_white    = [ '#e5e5e5', 7 ]
let s:white         = [ '#ffffff', 15 ]

let s:comment_grey  = [ '#7f7f7f', 8 ]
let s:gutter_grey   = [ '#7f7f7f', 8 ]
let s:cursor_grey   = [ '#7f7f7f', 8 ]
let s:visual_grey   = [ '#7f7f7f', 8 ]
let s:menu_grey     = s:visual_grey
let s:special_grey  = [ '#7f7f7f', 8 ]
let s:vertsplit     = [ '#7f7f7f', 8 ]

let s:tab_color     = s:blue
let s:normal_color  = s:grey
let s:insert_color  = s:cyan
let s:replace_color = s:yellow
let s:visual_color  = s:magenta
let s:active_bg     = s:dark_grey
let s:inactive_bg   = s:dark_grey

let s:p = {'normal': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'inactive': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:dark_grey, s:tab_color ], [ s:white, s:active_bg, s:bold ] ]
let s:p.normal.right    = [ [ s:white, s:active_bg, s:bold ], [ s:cyan, s:active_bg, s:bold ] ]
let s:p.normal.middle   = [ [ s:magenta, s:active_bg, s:bold ] ]

let s:p.insert.left     = [ [ s:dark_grey, s:insert_color ], [ s:white, s:active_bg, s:bold ] ]
let s:p.insert.right    = [ [ s:white, s:active_bg, s:bold ], [ s:cyan, s:active_bg, s:bold ] ]
let s:p.insert.middle   = [ [ s:magenta, s:active_bg, s:bold ] ]

let s:p.replace.left    = [ [ s:dark_grey, s:replace_color ], [ s:white, s:active_bg, s:bold ] ]
let s:p.replace.right   = [ [ s:white, s:active_bg, s:bold ], [ s:cyan, s:active_bg, s:bold ] ]
let s:p.replace.middle  = [ [ s:magenta, s:active_bg, s:bold ] ]

let s:p.visual.left     = [ [ s:dark_grey, s:visual_color ], [ s:white, s:active_bg, s:bold ] ]
let s:p.visual.right    = [ [ s:white, s:active_bg, s:bold ], [ s:cyan, s:active_bg, s:bold ] ]
let s:p.visual.middle   = [ [ s:magenta, s:active_bg, s:bold ] ]

let s:p.inactive.left   = [ [ s:grey, s:inactive_bg, s:bold ], [ s:grey, s:inactive_bg, s:bold ] ]
let s:p.inactive.right  = [ [ s:dark_white, s:inactive_bg ], [ s:grey, s:inactive_bg ] ]
let s:p.inactive.middle = [ [ s:grey, s:inactive_bg ] ]

"let s:p.tabline.left    = [ [ s:gutter_grey, s:cursor_grey ] ]
let s:p.tabline.left    = [ [ s:red, s:cursor_grey ] ]
"let s:p.tabline.right   = [ [ s:tab_color, s:cursor_grey ] ]
let s:p.tabline.right   = [ [ s:red, s:cursor_grey ] ]
let s:p.tabline.middle  = [ [ s:dark_grey, s:dark_grey ] ]
let s:p.tabline.tabsel  = [ [ s:dark_grey, s:blue, s:bold ] ]
let s:p.tabline.bufsel  = [ [ s:tab_color, s:visual_grey ] ]
let s:p.tabline.tabsep  = [ [ s:white, s:cursor_grey ] ]

let s:p.normal.error    = [ [ s:dark_grey, s:red ] ]
let s:p.normal.warning  = [ [ s:dark_grey, s:yellow ] ]

let g:lightline#colorscheme#antsy#palette = lightline#colorscheme#flatten(s:p)
