-- {{{
--  Antsy Awesome Theme by Jeff M Hubbard
-- }}}

-- {{{ Requirements
local gfs           = require("gears.filesystem")
local theme_assets  = require("beautiful.theme_assets")
local themes_path   = gfs.get_themes_dir()
local gears_shape   = require("gears.shape")
local wibox         = require("wibox")
local clienticon    = require("awful.widget.clienticon")

-- inherit default theme
local theme         = dofile(themes_path.."default/theme.lua")
-- }}}

-- {{{ Custom variables
theme.start_icon    = "/usr/share/pixmaps/archlinux-logo.png"
theme.task_width    = 250
-- }}}

-- {{{ Fonts
theme.font          = "Hack Nerd Font 10"
theme.font_bold     = "Hack Nerd Font Bold 10"
-- }}}

-- {{{ Custom color aliases
theme.black         = "#000000"
theme.dark_red      = "#c23621"
theme.dark_green    = "#25bc24"
theme.dark_yellow   = "#adad27"
theme.dark_blue     = "#492ee1"
theme.dark_magenta  = "#d338d3"
theme.dark_cyan     = "#33bbc8"
theme.gray          = "#cbcccd"
theme.dark_gray     = "#818383"
theme.red           = "#fc391f"
theme.green         = "#31e722"
theme.yellow        = "#eaec23"
theme.blue          = "#5833ff"
theme.magenta       = "#f935f8"
theme.cyan          = "#14f0f0"
theme.white         = "#e9ebeb"
theme.opacity       = "e6"

-- }}}

-- {{{ Base
theme.fg_normal     = theme.gray
theme.bg_normal     = theme.black
theme.wibar_fg      = theme.gray
theme.wibar_bg      = theme.black
theme.fg_focus      = theme.black
theme.bg_focus      = theme.blue
theme.fg_urgent     = theme.black
theme.bg_urgent     = theme.cyan
theme.fg_minimize   = theme.black
theme.bg_minimize   = theme.dark_gray
theme.bg_systray    = theme.black
theme.separator     = theme.dark_gray
theme.border_normal = theme.black
theme.border_focus  = theme.blue
theme.border_marked = theme.cyan
theme.border_width  = 1
theme.border_radius = 0
theme.useless_gap   = 5
-- }}}

-- {{{ Tasklist
theme.tasklist_fg_normal    = theme.gray
theme.tasklist_bg_normal    = theme.black
theme.tasklist_fg_focus     = theme.black
theme.tasklist_bg_focus     = theme.blue
theme.tasklist_font_focus   = theme.font
theme.tasklist_spacing      = 2
theme.tasklist_shape_border_width               = 1
theme.tasklist_shape_border_color               = theme.black
theme.tasklist_shape_border_color_focus         = theme.blue
theme.tasklist_shape_border_color_minimized     = theme.dark_gray
theme.tasklist_shape_border_color_urgent        = theme.cyan
theme.tasklist_widget_template = {
    {
        {
            {
                {
                    id     = 'clienticon',
                    widget = clienticon,
                },
                margins = 4,
                widget  = wibox.container.margin,
            },
            {
                id     = 'text_role',
                widget = wibox.widget.textbox,
            },
            layout = wibox.layout.fixed.horizontal,
        },
        left  = 4,
        right = 4,
        widget = wibox.container.margin
    },
    id     = 'background_role',
    widget = wibox.container.background,
    create_callback = function(self, c)
        self:get_children_by_id('clienticon')[1].client = c
    end,
}
-- }}}

-- {{{ Taglist
theme.taglist_fg_focus = theme.black
theme.taglist_bg_focus = theme.blue
theme.taglist_fg_urgent = theme.black
theme.taglist_bg_urgent = theme.cyan
theme.taglist_fg_occupied = theme.black
theme.taglist_bg_occupied = theme.dark_gray
theme.taglist_fg_volatile = theme.black
theme.taglist_bg_volatile = theme.red
theme.taglist_shape = gears_shape.rectangle
theme.taglist_shape_border_width = 1
theme.taglist_shape_border_color = theme.dark_gray
theme.taglist_shape_border_color_empty = theme.black
theme.taglist_shape_border_color_focus = theme.blue
theme.taglist_shape_border_color_urgent = theme.cyan
theme.taglist_shape_border_color_volatile = theme.red
theme.taglist_spacing = 2
theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil
-- }}}

-- {{{ Titlebar
theme.titlebar_font_normal = theme.font
theme.titlebar_fg_normal = theme.dark_gray
theme.titlebar_bg_normal = theme.black .. theme.opacity
theme.titlebar_font_focus = theme.font_bold
theme.titlebar_fg_focus = theme.white
theme.titlebar_bg_focus = theme.black .. theme.opacity
-- }}}

-- {{{ Tooltip
theme.tooltip_fg = theme.gray
theme.tooltip_bg = theme.black
-- }}}

-- {{{ Menu
theme.menu_border_color = theme.blue
theme.menu_width  = 160
theme.menu_height = 20
theme.menu_submenu = "▸ "
theme.menu_submenu_icon = nil
-- }}}

-- {{{ Recolor layout icon
theme = theme_assets.recolor_layout(theme, theme.dark_gray)
-- }}}

-- {{{ Recolor titlebar buttons
theme = theme_assets.recolor_titlebar(theme, theme.gray, "normal")
theme = theme_assets.recolor_titlebar(theme, theme.blue, "normal", "hover")
theme = theme_assets.recolor_titlebar(theme, theme.red, "normal", "press")
theme = theme_assets.recolor_titlebar(theme, theme.white, "focus")
theme = theme_assets.recolor_titlebar(theme, theme.blue, "focus", "hover")
theme = theme_assets.recolor_titlebar(theme, theme.red, "focus", "press")
-- }}}

-- {{{ Icon theme
theme.icon_theme = "Antsy"
-- }}}

-- {{{ Awesome icon
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.magenta, theme.black)
-- }}}

-- {{{ Awesome wallpaper
local wallpaper_bg = theme.dark_gray
local wallpaper_fg = theme.black
local wallpaper_alt_fg = theme.dark_magenta
theme.wallpaper = function(s)
    return theme_assets.wallpaper(wallpaper_bg, wallpaper_fg, wallpaper_alt_fg, s)
end
-- }}}
return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
