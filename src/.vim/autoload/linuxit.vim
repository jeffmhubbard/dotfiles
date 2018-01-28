" autoload/linuxit.vim

let s:overrides = get(g:, "theme_color_overrides", {})

let s:colors = {
      \ "dark_grey": get(s:overrides, "dark_grey", { "gui": "#000000", "cterm": "0", "cterm16": "0" }),
      \ "grey": get(s:overrides, "grey", { "gui": "#7f7f7f", "cterm": "8", "cterm16": "8" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "#cd0000", "cterm": "1", "cterm16": "1" }),
      \ "red": get(s:overrides, "red", { "gui": "#ff0000", "cterm": "9", "cterm16": "9" }),
      \ "dark_green": get(s:overrides, "dark_green", { "gui": "#00cd00", "cterm": "2", "cterm16": "2" }),
      \ "green": get(s:overrides, "green", { "gui": "#00ff00", "cterm": "10", "cterm16": "10" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#cdcd00", "cterm": "3", "cterm16": "3" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "#ffff00", "cterm": "11", "cterm16": "11" }),
      \ "dark_blue": get(s:overrides, "dark_blue", { "gui": "#0000ee", "cterm": "4", "cterm16": "4" }),
      \ "blue": get(s:overrides, "blue", { "gui": "#5c5cff", "cterm": "12", "cterm16": "12" }),
      \ "dark_purple": get(s:overrides, "dark_purple", { "gui": "#cd00cd", "cterm": "5", "cterm16": "5" }),
      \ "purple": get(s:overrides, "purple", { "gui": "#ff00ff", "cterm": "13", "cterm16": "13" }),
      \ "dark_cyan": get(s:overrides, "dark_cyan", { "gui": "#00cdcd", "cterm": "6", "cterm16": "6" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "#00ffff", "cterm": "14", "cterm16": "14" }),
      \ "dark_white": get(s:overrides, "dark_white", { "gui": "#e5e5e5", "cterm": "7", "cterm16": "7" }),
      \ "white": get(s:overrides, "white", { "gui": "#ffffff", "cterm": "15", "cterm16": "15" }),
      \ "visual_black": get(s:overrides, "visual_black", { "gui": "NONE", "cterm": "NONE", "cterm16": "0" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#7f7f7f", "cterm": "8", "cterm16": "8" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#7f7f7f", "cterm": "8", "cterm16": "8" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#f7f7f7", "cterm": "8", "cterm16": "8" }),
      \ "cursor_line_grey": get(s:overrides, "cursor_line_grey", { "gui": "NONE", "cterm": "NONE", "cterm16": "NONE" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#7f7f7f", "cterm": "8", "cterm16": "8" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#7f7f7f", "cterm": "8", "cterm16": "8" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "#7f7f7f", "cterm": "8", "cterm16": "8" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#7f7f7f", "cterm": "8", "cterm16": "8" }),
      \}

function! linuxit#GetColors()
  return s:colors
endfunction
