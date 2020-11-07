-- {{{
-- Awesome config
-- }}}

-- {{{ Libraries
local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local common        = require("awful.widget.common")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")
                      require("awful.hotkeys_popup.keys")

local freedesktop   = require("freedesktop") -- AUR: aweome-freedesktop-git
-- }}}

-- {{{ Error handling
-- Check is using default config
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Global settings
modkey = "Mod4"
--
terminal = os.getenv("TERMINAL") or "xterm"
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal .. " -e " .. editor
--
lock_cmd = "light-locker-command -l"
suspend_cmd = "systemctl suspend"
reboot_cmd = "systemctl reboot"
halt_cmd = "systemctl halt"
-- }}}

-- {{{ Theme
--beautiful.init(gears.filesystem.get_themes_dir() .. "xresources/theme.lua") -- system
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/antsy/theme.lua") -- local
-- }}}

-- {{{ Wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
-- }}}

-- {{{ Layouts
awful.layout.layouts = {
    -- Available
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,

    -- Enabled (order matters)
    awful.layout.suit.tile.left,
    awful.layout.suit.fair,
    awful.layout.suit.max,
    awful.layout.suit.floating,
}
-- }}}

-- {{{ Menus
menu_awesome = {
   { "Open Terminal", terminal },
   { "Show Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Read Manual", terminal .. " -e man awesome" },
   { "Edit Config", editor_cmd .. " " .. awesome.conffile },
}

menu_session = {
   { "Lock Desktop", function (c) awful.util.spawn(lock_cmd) end },
   { "Restart Desktop", awesome.restart },
   { "Exit Desktop", function() awesome.quit() end },
   { "Suspend System", function (c) awful.util.spawn(suspend_cmd) end },
   { "Reboot System", function (c) awful.util.spawn(reboot_cmd) end },
   { "Halt System", function (c) awful.util.spawn(halt_cmd) end },
}

menu_main = freedesktop.menu.build({
    before = {
        { "Awesome", menu_awesome, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        -- other triads can be put here
        { "Session", menu_session, nil },
    }
})
-- }}}

-- {{{ Statusbar
-- Start menu
local menu_start_icon = gears.color.recolor_image(
                            beautiful.start_icon,
                            beautiful.bg_focus) or beautiful.awesome_icon
local menu_start = awful.widget.launcher({ image = menu_start_icon, menu = menu_main })

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

-- Keymap indicator
--keymap_widget = awful.widget.keyboardlayout()

-- Date and time widget
local date_widget = wibox.widget.textclock()

-- Calendar popup
local cal_popup = awful.widget.calendar_popup.month()
cal_popup:attach( date_widget, "br" )


-- create statusbar for each screen
awful.screen.connect_for_each_screen(function(s)

    -- wallpaper
    set_wallpaper(s)

    -- create the wibar
    s.bar_widget = awful.wibar {
        screen = s,
        position = "bottom",
        height = 20,
        border_width = 2,
        border_color = beautiful.bg_normal
    }

    -- separator
    space = wibox.widget.textbox(" ")

    -- create tags
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- taglist widget
    s.tag_widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- prompt widget
    s.prompt_widget = awful.widget.prompt {
        fg_cursor   = beautiful.fg_normal,
        bg_cursor   = beautiful.bg_normal,
    }

    -- resize tasklist widgets
    function tasklist_resize(w, buttons, label, data, objects)
        common.list_update(w, buttons, label, data, objects)
        w:set_max_widget_size(beautiful.task_width or 250)
    end

    -- tasklist widget
    s.task_widget = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        update_function = tasklist_resize
    }

    -- systray widget
    s.tray_widget = wibox.widget.systray()
    s.tray_widget.opacity = 1
    s.tray_widget:set_base_size(20)

    -- layout widget
    s.layout_widget = awful.widget.layoutbox(s)
    s.layout_widget:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- add widgets to wibar
    s.bar_widget:setup {
        layout = wibox.layout.align.horizontal,
        { -- left
            layout = wibox.layout.fixed.horizontal,
            space,
            menu_start,
            space,
            s.tag_widget,
            space,
            s.prompt_widget,
        },
        s.task_widget, -- middle
        { -- right
            layout = wibox.layout.fixed.horizontal,
            s.tray_widget,
            space,
            date_widget,
            space,
            s.layout_widget,
            space,
        },
    }
end)
-- }}}

-- {{{ Notifications
naughty.config.defaults.icon_size = 64
naughty.config.defaults.position = "bottom_right"
naughty.config.defaults.border_width = 1
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "awesome"}),
    awful.key({ modkey,           }, "w", function () menu_main:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey,           }, "x",      function () awful.screen.focused().prompt_widget:run() end,
              {description = "show run prompt", group = "awesome"}),
    awful.key({ modkey, "Mod1"    }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().prompt_widget.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "show lua prompt", group = "awesome"}),
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "restart awesome", group = "awesome"}),
    -- Tags
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    -- Focus
    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx( 1) end,
              {description = "focus next client", group = "client"}),
    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx(-1) end,
              {description = "focus previous client", group = "client"}),
    awful.key({ "Mod1",           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus last client", group = "client"}),
    awful.key({ modkey,           }, "'", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "]", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey,           }, "[", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),
    -- Rofi
    awful.key({ modkey,           }, "space", function (c) awful.util.spawn("rofi -show drun") end,
              {description = "show application search", group = "rofi"}),
    awful.key({ modkey,           }, ";", function (c) awful.util.spawn("rofi -show run") end,
              {description = "show command search", group = "rofi"}),
    awful.key({ modkey,           }, "Tab", function (c) awful.util.spawn("rofi -show window") end,
              {description = "show window search", group = "rofi"}),
    awful.key({ modkey, "Mod1"    }, "p", function (c) awful.util.spawn("rofi-pass") end,
              {description = "show password search", group = "rofi"}),
    -- Media keys
    awful.key({ }, "XF86AudioPlay", function () awful.util.spawn("mpc toggle") end,
              {description = "toggle play and pause", group = "mediakeys"}),
    awful.key({ }, "XF86AudioNext", function () awful.util.spawn("mpc next") end,
              {description = "go to next track", group = "mediakeys"}),
    awful.key({ }, "XF86AudioPrev", function () awful.util.spawn("mpc prev") end,
              {description = "go to previous track", group = "mediakeys"}),
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("volume-ctl.sh -u 5") end,
              {description = "raise volume", group = "mediakeys"}),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("volume-ctl.sh -d 5") end,
              {description = "lower volume", group = "mediakeys"}),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn("volume-ctl.sh -m") end,
              {description = "toggle mute", group = "mediakeys"}),
    awful.key({ }, "XF86KbdBrightnessUp", function () awful.util.spawn("backlight-ctl -u 5") end,
              {description = "increase backlight brightness", group = "mediakeys"}),
    awful.key({ }, "XF86KbdBrightnessUp", function () awful.util.spawn("backlight-ctl -d 5") end,
              {description = "decrease backlight brightness", group = "mediakeys"}),
    -- screenshot
    awful.key({                   }, "Print", function (c) awful.util.spawn("screen-capture.sh") end,
              {description = "capture screenshot", group = "maim"}),
    awful.key({ modkey            }, "Print", function (c) awful.util.spawn("screen-capture.sh -s") end,
              {description = "capture screenshot from selection", group = "maim"})
)

clientkeys = gears.table.join(
    awful.key({ modkey, "Mod1"    }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "f",  awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey, "Shift"   }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Shift" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"})
)

-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

root.keys(globalkeys)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () menu_main:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Wpa_gui",
          "Pavucontrol",
          "Lxappearance",
          "qt5ct"},
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "pop-up",
        }
      }, properties = { floating = true }},

    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    { rule = { class = "qutebrowser" },
      properties = { screen = 1, tag = "2" } },
} 
-- }}}

-- {{{ Signals
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    if c.floating or c.first_tag.layout.name == "floating" then
        awful.titlebar.show(c)
    else
        awful.titlebar.hide(c)
    end
end)

-- titlebars for floating only
client.connect_signal("property::floating", function(c)
    local b = false;
    if c.first_tag ~= nil then
        b = c.first_tag.layout.name == "floating"
    end
    if c.floating or b then
        awful.titlebar.show(c)
    else
        awful.titlebar.hide(c)
    end
end)

-- titlebars for floating only
tag.connect_signal("property::layout", function(t)
    local clients = t:clients()
    for k,c in pairs(clients) do
        if c.floating or c.first_tag.layout.name == "floating" then
            awful.titlebar.show(c)
        else
            awful.titlebar.hide(c)
        end
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        -- move, left-click
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        -- resize, right-click
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = 20}) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            -- Available
            --awful.titlebar.widget.floatingbutton (c),
            --awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton   (c),
            --awful.titlebar.widget.ontopbutton    (c),
            --awful.titlebar.widget.closebutton    (c),

            -- Enabled
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Autostart
awful.spawn.with_shell(
   'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
   'xrdb -merge <<< "awesome.started:true";' ..
   -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
   -- [[[
   -- 'some command -args;' ..
   -- ]]]
   'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
-- }}}

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80:foldmethod=marker
