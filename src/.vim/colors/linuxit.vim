" vim:fdm=marker
" Vim Color File
" Name:       linuxit.vim
" Maintainer: https://github.com/jeffmhubbard/boxcar-shell/
" License:    The MIT License (MIT)
" Based On:   https://github.com/joshdick/onedark.vim/

" Initialization {{{

highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=16

let g:colors_name="linuxit"

" Set to "256" for 256-color terminals, or
" set to "16" to use your terminal emulator's native colors
" (a 16-color palette for this color scheme is available; see
" < https://github.com/joshdick/onedark.vim/blob/master/README.md >
" for more information.)
if !exists("g:theme_termcolors")
  let g:theme_termcolors = 256
endif

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:theme_terminal_italics")
  let g:theme_terminal_italics = 0
endif

" This function is based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:theme_terminal_italics == 0
    if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
      unlet a:style.cterm
    endif
    if has_key(a:style, "gui") && a:style["gui"] == "italic"
      unlet a:style.gui
    endif
  endif
  if g:theme_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  endif
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" public {{{

function! linuxit#set_highlight(group, style)
  call s:h(a:group, a:style)
endfunction

" }}}

" }}}

" Color Variables {{{

let s:colors = linuxit#GetColors()

let s:dark_grey = s:colors.dark_grey
let s:grey = s:colors.grey
let s:dark_red = s:colors.dark_red
let s:red = s:colors.red
let s:dark_green = s:colors.dark_green
let s:green = s:colors.green
let s:dark_yellow = s:colors.dark_yellow
let s:yellow = s:colors.yellow
let s:dark_blue = s:colors.dark_blue
let s:blue = s:colors.blue
let s:dark_magenta = s:colors.dark_magenta
let s:magenta = s:colors.magenta
let s:dark_cyan = s:colors.dark_cyan
let s:cyan = s:colors.cyan
let s:dark_white = s:colors.dark_white
let s:white = s:colors.white
let s:visual_black = s:colors.visual_black " black out selected text in 16-color visual mode
let s:comment_grey = s:colors.comment_grey
let s:gutter_fg_grey = s:colors.gutter_fg_grey
let s:cursor_grey = s:colors.cursor_grey
let s:visual_grey = s:colors.visual_grey
let s:menu_grey = s:colors.menu_grey
let s:special_grey = s:colors.special_grey
let s:vertsplit = s:colors.vertsplit

" }}}

" Syntax Groups (descriptions and ordering from `:h w18`) {{{

call s:h("Comment", { "fg": s:grey, "gui": "italic", "cterm": "italic" }) " any comment
call s:h("Constant", { "fg": s:white, "gui": "bold", "cterm": "bold" })
call s:h("String", { "fg": s:green }) " a string constant: "this is a string"
call s:h("Character", { "fg": s:yellow }) " a character constant: 'c', '\n'
call s:h("Number", { "fg": s:yellow }) " a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:yellow }) " a boolean constant: TRUE, false
call s:h("Float", { "fg": s:yellow }) " a floating point constant: 2.3e10
call s:h("Identifier", { "fg": s:white, "cterm": "bold" }) " any variable name
call s:h("Function", { "fg": s:magenta }) " function name (also: methods for classes)
call s:h("Statement", { "fg": s:blue }) " any statement
call s:h("Conditional", { "fg": s:blue }) " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:blue }) " for, do, while, etc.
call s:h("Label", { "fg": s:blue }) " case, default, etc.
call s:h("Operator", { "fg": s:blue }) " sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:blue }) " any other keyword
call s:h("Exception", { "fg": s:blue }) " try, catch, throw
call s:h("PreProc", { "fg": s:blue }) " generic Preprocessor
call s:h("Include", { "fg": s:blue }) " preprocessor #include
call s:h("Define", { "fg": s:blue }) " preprocessor #define
call s:h("Macro", { "fg": s:blue }) " same as Define
call s:h("PreCondit", { "fg": s:blue }) " preprocessor #if, #else, #endif, etc.
call s:h("Type", { "fg": s:white }) " int, long, char, etc.
call s:h("StorageClass", { "fg": s:yellow }) " static, register, volatile, etc.
call s:h("Structure", { "fg": s:red }) " struct, union, enum, etc.
call s:h("Typedef", { "fg": s:yellow }) " A typedef
call s:h("Special", { "fg": s:dark_white })
call s:h("SpecialChar", {}) " special character in a constant
call s:h("Tag", {}) " you can use CTRL-] on this
call s:h("Delimter", { "fg": s:white, "gui": "bold", "cterm": "bold" })
call s:h("SpecialComment", { "fg": s:comment_grey }) " special things inside a comment
call s:h("Debug", {}) " debugging statements
call s:h("Underlined", { "gui": "underline", "cterm": "underline" }) " text that stands out, HTML links
call s:h("Ignore", {}) " left blank, hidden
call s:h("Error", { "fg": s:red }) " any erroneous construct
call s:h("Todo", { "fg": s:blue }) " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" }}}

" Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{
call s:h("ColorColumn", { "bg": s:cursor_grey }) " used for the columns set with 'colorcolumn'
call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:grey, "bg": s:blue }) " the character under the cursor
call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
call s:h("CursorColumn", { "bg": s:cursor_grey }) " the screen column that the cursor is in when 'cursorcolumn' is set
if &diff
  " Don't change the background color in diff mode
  call s:h("CursorLine", { "gui": "underline" }) " the screen line that the cursor is in when 'cursorline' is set
else
  call s:h("CursorLine", { "bg": s:cursor_grey, }) " the screen line that the cursor is in when 'cursorline' is set
endif
call s:h("Directory", { "fg": s:blue }) " directory names (and other special names in listings)
call s:h("DiffAdd", { "bg": s:green, "fg": s:grey }) " diff mode: Added line
call s:h("DiffChange", { "bg": s:yellow, "fg": s:grey }) " diff mode: Changed line
call s:h("DiffDelete", { "bg": s:red, "fg": s:grey }) " diff mode: Deleted line
call s:h("DiffText", { "bg": s:grey, "fg": s:yellow }) " diff mode: Changed text within a changed line
call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:vertsplit,  }) " the column separating vertically split windows
call s:h("Folded", { "fg": s:comment_grey }) " line used for closed folds
call s:h("FoldColumn", {}) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:yellow, "bg": s:comment_grey }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "bg": s:dark_grey, "fg": s:gutter_fg_grey }) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", { "bg": s:grey, "fg": s:dark_white }) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:cyan, "gui": "underline" }) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", { "bg": s:dark_grey, "fg": s:cyan }) " 'showmode' message (e.g., "-- INSERT --")
call s:h("MoreMsg",{  "bg": s:dark_grey, "fg": s:cyan }) " more-prompt
call s:h("NonText", { "fg": s:special_grey }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal", { "fg": s:white }) " normal text
call s:h("Pmenu", { "bg": s:menu_grey }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:grey, "bg": s:dark_blue }) " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:special_grey }) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:white }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:magenta }) " hit-enter prompt and yes/no questions
call s:h("Search", { "fg": s:grey, "bg": s:yellow }) " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:h("QuickFixLine", { "fg": s:grey, "bg": s:yellow }) " Current quickfix item in the quickfix window.
call s:h("SpecialKey", { "fg": s:special_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellCap", { "fg": s:dark_yellow }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:white, "bg": s:dark_grey }) " status line of current window
call s:h("StatusLineNC", { "bg": s:dark_grey, "fg": s:dark_white }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("TabLine", { "bg": s:dark_grey, "fg": s:comment_grey }) " tab pages line, not active tab page label
call s:h("TabLineFill", { "bg": s:dark_grey, "fg": s:comment_grey }) " tab pages line, where there are no labels
call s:h("TabLineSel", {  "bg": s:blue, "fg": s:dark_grey }) " tab pages line, active tab page label
call s:h("Title", { "fg": s:green }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "fg": s:visual_black, "bg": s:visual_grey }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:visual_grey }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
call s:h("WildMenu", { "fg": s:blue, "bg": s:dark_grey }) " current match in 'wildmenu' completion

" }}}

" Language-Specific Highlighting {{{

" CSS
call s:h("cssAttrComma", { "fg": s:magenta })
call s:h("cssAttributeSelector", { "fg": s:green })
call s:h("cssBraces", { "fg": s:white })
call s:h("cssClassName", { "fg": s:dark_yellow })
call s:h("cssClassNameDot", { "fg": s:dark_yellow })
call s:h("cssDefinition", { "fg": s:magenta })
call s:h("cssFontAttr", { "fg": s:dark_yellow })
call s:h("cssFontDescriptor", { "fg": s:magenta })
call s:h("cssFunctionName", { "fg": s:blue })
call s:h("cssIdentifier", { "fg": s:blue })
call s:h("cssImportant", { "fg": s:magenta })
call s:h("cssInclude", { "fg": s:white })
call s:h("cssIncludeKeyword", { "fg": s:magenta })
call s:h("cssMediaType", { "fg": s:red })
call s:h("cssProp", { "fg": s:white })
call s:h("cssPseudoClassId", { "fg": s:red })
call s:h("cssSelectorOp", { "fg": s:magenta })
call s:h("cssSelectorOp2", { "fg": s:magenta })
call s:h("cssTagName", { "fg": s:red })

" Go
call s:h("goDeclaration", { "fg": s:magenta })

" HTML
call s:h("htmlTitle", { "fg": s:white })
call s:h("htmlArg", { "fg": s:dark_yellow })
call s:h("htmlEndTag", { "fg": s:white })
call s:h("htmlH1", { "fg": s:white })
call s:h("htmlLink", { "fg": s:magenta })
call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
call s:h("htmlSpecialTagName", { "fg": s:red })
call s:h("htmlTag", { "fg": s:white })
call s:h("htmlTagName", { "fg": s:red })

" JavaScript
call s:h("javaScriptBraces", { "fg": s:white })
call s:h("javaScriptFunction", { "fg": s:magenta })
call s:h("javaScriptIdentifier", { "fg": s:magenta })
call s:h("javaScriptNull", { "fg": s:dark_yellow })
call s:h("javaScriptNumber", { "fg": s:dark_yellow })
call s:h("javaScriptRequire", { "fg": s:cyan })
call s:h("javaScriptReserved", { "fg": s:magenta })
" https://github.com/pangloss/vim-javascript
call s:h("jsArrowFunction", { "fg": s:magenta })
call s:h("jsClassKeyword", { "fg": s:magenta })
call s:h("jsClassMethodType", { "fg": s:magenta })
call s:h("jsDocParam", { "fg": s:blue })
call s:h("jsDocTags", { "fg": s:magenta })
call s:h("jsExport", { "fg": s:magenta })
call s:h("jsExportDefault", { "fg": s:magenta })
call s:h("jsExtendsKeyword", { "fg": s:magenta })
call s:h("jsFrom", { "fg": s:magenta })
call s:h("jsFuncCall", { "fg": s:blue })
call s:h("jsFunction", { "fg": s:magenta })
call s:h("jsGenerator", { "fg": s:yellow })
call s:h("jsGlobalObjects", { "fg": s:yellow })
call s:h("jsImport", { "fg": s:magenta })
call s:h("jsModuleAs", { "fg": s:magenta })
call s:h("jsModuleWords", { "fg": s:magenta })
call s:h("jsModules", { "fg": s:magenta })
call s:h("jsNull", { "fg": s:dark_yellow })
call s:h("jsOperator", { "fg": s:magenta })
call s:h("jsStorageClass", { "fg": s:magenta })
call s:h("jsSuper", { "fg": s:red })
call s:h("jsTemplateBraces", { "fg": s:dark_red })
call s:h("jsTemplateVar", { "fg": s:green })
call s:h("jsThis", { "fg": s:red })
call s:h("jsUndefined", { "fg": s:dark_yellow })
" https://github.com/othree/yajs.vim
call s:h("javascriptArrowFunc", { "fg": s:magenta })
call s:h("javascriptClassExtends", { "fg": s:magenta })
call s:h("javascriptClassKeyword", { "fg": s:magenta })
call s:h("javascriptDocNotation", { "fg": s:magenta })
call s:h("javascriptDocParamName", { "fg": s:blue })
call s:h("javascriptDocTags", { "fg": s:magenta })
call s:h("javascriptEndColons", { "fg": s:white })
call s:h("javascriptExport", { "fg": s:magenta })
call s:h("javascriptFuncArg", { "fg": s:white })
call s:h("javascriptFuncKeyword", { "fg": s:magenta })
call s:h("javascriptIdentifier", { "fg": s:red })
call s:h("javascriptImport", { "fg": s:magenta })
call s:h("javascriptMethodName", { "fg": s:white })
call s:h("javascriptObjectLabel", { "fg": s:white })
call s:h("javascriptOpSymbol", { "fg": s:cyan })
call s:h("javascriptOpSymbols", { "fg": s:cyan })
call s:h("javascriptPropertyName", { "fg": s:green })
call s:h("javascriptTemplateSB", { "fg": s:dark_red })
call s:h("javascriptVariable", { "fg": s:magenta })

" JSON
call s:h("jsonCommentError", { "fg": s:white })
call s:h("jsonKeyword", { "fg": s:red })
call s:h("jsonBoolean", { "fg": s:dark_yellow })
call s:h("jsonNumber", { "fg": s:dark_yellow })
call s:h("jsonQuote", { "fg": s:white })
call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonString", { "fg": s:green })
call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })

" LESS
call s:h("lessVariable", { "fg": s:magenta })
call s:h("lessAmpersandChar", { "fg": s:white })
call s:h("lessClass", { "fg": s:dark_yellow })

" Markdown
call s:h("markdownCode", { "fg": s:green })
call s:h("markdownCodeBlock", { "fg": s:green })
call s:h("markdownCodeDelimiter", { "fg": s:green })
call s:h("markdownHeadingDelimiter", { "fg": s:red })
call s:h("markdownRule", { "fg": s:comment_grey })
call s:h("markdownHeadingRule", { "fg": s:comment_grey })
call s:h("markdownH1", { "fg": s:red })
call s:h("markdownH2", { "fg": s:red })
call s:h("markdownH3", { "fg": s:red })
call s:h("markdownH4", { "fg": s:red })
call s:h("markdownH5", { "fg": s:red })
call s:h("markdownH6", { "fg": s:red })
call s:h("markdownIdDelimiter", { "fg": s:magenta })
call s:h("markdownId", { "fg": s:magenta })
call s:h("markdownBlockquote", { "fg": s:comment_grey })
call s:h("markdownItalic", { "fg": s:magenta, "gui": "italic", "cterm": "italic" })
call s:h("markdownBold", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
call s:h("markdownListMarker", { "fg": s:red })
call s:h("markdownOrderedListMarker", { "fg": s:red })
call s:h("markdownIdDeclaration", { "fg": s:blue })
call s:h("markdownLinkText", { "fg": s:magenta })
call s:h("markdownLinkDelimiter", { "fg": s:white })
call s:h("markdownUrl", { "fg": s:blue })

" Perl
call s:h("perlFiledescRead", { "fg": s:green })
call s:h("perlFunction", { "fg": s:magenta })
call s:h("perlMatchStartEnd",{ "fg": s:blue })
call s:h("perlMethod", { "fg": s:magenta })
call s:h("perlPOD", { "fg": s:comment_grey })
call s:h("perlSharpBang", { "fg": s:comment_grey })
call s:h("perlSpecialString",{ "fg": s:cyan })
call s:h("perlStatementFiledesc", { "fg": s:red })
call s:h("perlStatementFlow",{ "fg": s:red })
call s:h("perlStatementInclude", { "fg": s:magenta })
call s:h("perlStatementScalar",{ "fg": s:magenta })
call s:h("perlStatementStorage", { "fg": s:magenta })
call s:h("perlSubName",{ "fg": s:yellow })
call s:h("perlVarPlain",{ "fg": s:blue })

" PHP
call s:h("phpVarSelector", { "fg": s:red })
call s:h("phpOperator", { "fg": s:white })
call s:h("phpParent", { "fg": s:white })
call s:h("phpMemberSelector", { "fg": s:white })
call s:h("phpType", { "fg": s:magenta })
call s:h("phpKeyword", { "fg": s:magenta })
call s:h("phpClass", { "fg": s:yellow })
call s:h("phpUseClass", { "fg": s:white })
call s:h("phpUseAlias", { "fg": s:white })
call s:h("phpInclude", { "fg": s:magenta })
call s:h("phpClassExtends", { "fg": s:green })
call s:h("phpDocTags", { "fg": s:white })
call s:h("phpFunction", { "fg": s:blue })
call s:h("phpFunctions", { "fg": s:cyan })
call s:h("phpMethodsVar", { "fg": s:dark_yellow })
call s:h("phpMagicConstants", { "fg": s:dark_yellow })
call s:h("phpSuperglobals", { "fg": s:red })
call s:h("phpConstants", { "fg": s:dark_yellow })

" Ruby
call s:h("rubyBlockParameter", { "fg": s:red })
call s:h("rubyBlockParameterList", { "fg": s:red })
call s:h("rubyClass", { "fg": s:magenta})
call s:h("rubyConstant", { "fg": s:yellow})
call s:h("rubyControl", { "fg": s:magenta })
call s:h("rubyEscape", { "fg": s:red })
call s:h("rubyFunction", { "fg": s:blue})
call s:h("rubyGlobalVariable", { "fg": s:red })
call s:h("rubyInclude", { "fg": s:blue})
call s:h("rubyIncluderubyGlobalVariable", { "fg": s:red })
call s:h("rubyInstanceVariable", { "fg": s:red })
call s:h("rubyInterpolation", { "fg": s:cyan })
call s:h("rubyInterpolationDelimiter", { "fg": s:red })
call s:h("rubyInterpolationDelimiter", { "fg": s:red })
call s:h("rubyRegexp", { "fg": s:cyan})
call s:h("rubyRegexpDelimiter", { "fg": s:cyan})
call s:h("rubyStringDelimiter", { "fg": s:green})
call s:h("rubySymbol", { "fg": s:cyan})

" Sass
" https://github.com/tpope/vim-haml
call s:h("sassAmpersand", { "fg": s:red })
call s:h("sassClass", { "fg": s:dark_yellow })
call s:h("sassControl", { "fg": s:magenta })
call s:h("sassExtend", { "fg": s:magenta })
call s:h("sassFor", { "fg": s:white })
call s:h("sassFunction", { "fg": s:cyan })
call s:h("sassId", { "fg": s:blue })
call s:h("sassInclude", { "fg": s:magenta })
call s:h("sassMedia", { "fg": s:magenta })
call s:h("sassMediaOperators", { "fg": s:white })
call s:h("sassMixin", { "fg": s:magenta })
call s:h("sassMixinName", { "fg": s:blue })
call s:h("sassMixing", { "fg": s:magenta })
call s:h("sassVariable", { "fg": s:magenta })
" https://github.com/cakebaker/scss-syntax.vim
call s:h("scssExtend", { "fg": s:magenta })
call s:h("scssImport", { "fg": s:magenta })
call s:h("scssInclude", { "fg": s:magenta })
call s:h("scssMixin", { "fg": s:magenta })
call s:h("scssSelectorName", { "fg": s:dark_yellow })
call s:h("scssVariable", { "fg": s:magenta })

" TypeScript
call s:h("typescriptReserved", { "fg": s:magenta })
call s:h("typescriptEndColons", { "fg": s:white })
call s:h("typescriptBraces", { "fg": s:white })

" XML
call s:h("xmlAttrib", { "fg": s:dark_yellow })
call s:h("xmlEndTag", { "fg": s:red })
call s:h("xmlTag", { "fg": s:red })
call s:h("xmlTagName", { "fg": s:red })

" }}}

" Plugin Highlighting {{{

" airblade/vim-gitgutter
"hi link GitGutterAdd    SignifySignAdd
"hi link GitGutterChange SignifySignChange
"hi link GitGutterDelete SignifySignDelete

" mhinz/vim-signify
"call s:h("SignifySignAdd", { "fg": s:green })
"call s:h("SignifySignChange", { "fg": s:yellow })
"call s:h("SignifySignDelete", { "fg": s:red })

" neomake/neomake
"call s:h("NeomakeWarningSign", { "fg": s:yellow })
"call s:h("NeomakeErrorSign", { "fg": s:red })
"call s:h("NeomakeInfoSign", { "fg": s:blue })

" tpope/vim-fugitive
"call s:h("diffAdded", { "fg": s:green })
"call s:h("diffRemoved", { "fg": s:red })

" }}}

" Git Highlighting {{{

call s:h("gitcommitComment", { "fg": s:comment_grey })
call s:h("gitcommitUnmerged", { "fg": s:green })
call s:h("gitcommitOnBranch", {})
call s:h("gitcommitBranch", { "fg": s:magenta })
call s:h("gitcommitDiscardedType", { "fg": s:red })
call s:h("gitcommitSelectedType", { "fg": s:green })
call s:h("gitcommitHeader", {})
call s:h("gitcommitUntrackedFile", { "fg": s:cyan })
call s:h("gitcommitDiscardedFile", { "fg": s:red })
call s:h("gitcommitSelectedFile", { "fg": s:green })
call s:h("gitcommitUnmergedFile", { "fg": s:yellow })
call s:h("gitcommitFile", {})
call s:h("gitcommitSummary", { "fg": s:white })
call s:h("gitcommitOverflow", { "fg": s:red })
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" }}}

" Neovim terminal colors {{{

"if has("nvim")
"  let g:terminal_color_0 =  s:grey.gui
"  let g:terminal_color_1 =  s:red.gui
"  let g:terminal_color_2 =  s:green.gui
"  let g:terminal_color_3 =  s:yellow.gui
"  let g:terminal_color_4 =  s:blue.gui
"  let g:terminal_color_5 =  s:magenta.gui
"  let g:terminal_color_6 =  s:cyan.gui
"  let g:terminal_color_7 =  s:white.gui
"  let g:terminal_color_8 =  s:visual_grey.gui
"  let g:terminal_color_9 =  s:dark_red.gui
"  let g:terminal_color_10 = s:green.gui " No dark version
"  let g:terminal_color_11 = s:dark_yellow.gui
"  let g:terminal_color_12 = s:blue.gui " No dark version
"  let g:terminal_color_13 = s:magenta.gui " No dark version
"  let g:terminal_color_14 = s:cyan.gui " No dark version
"  let g:terminal_color_15 = s:comment_grey.gui
"  let g:terminal_color_background = g:terminal_color_0
"  let g:terminal_color_foreground = g:terminal_color_7
"endif

" }}}

" Must appear at the end of the file to work around this oddity:
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
