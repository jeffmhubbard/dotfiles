# -*- coding: utf-8 -*-

import re
import json
import platform
import socket
import sys
from datetime import datetime
from subprocess import call

from libqtile.config import Key, Click, Drag, Screen, Group, Match, Rule
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

# Xresources palette
Xres = {
    'black':        '000000',
    'dark_red':     'cd0000',
    'dark_green':   '00cd00',
    'dark_yellow':  'cdcd00',
    'dark_blue':    '0000ee',
    'dark_magenta': 'cd00cd',
    'dark_cyan':    '00cdcd',
    'grey':         'e5e5e5',
    'dark_grey':    '7f7f7f',
    'red':          'ff0000',
    'green':        '00ff00',
    'yellow':       'ffff00',
    'blue':         '5c5cff',
    'magenta':      'ff00ff',
    'cyan':         '00ffff',
    'white':        'ffffff',
}

# theme
theme = {
    "background":       Xres['black'],
    "background-alt":   Xres['dark_grey'],
    "foreground":       Xres['white'],
    "foreground-alt":   Xres['grey'],
    "active":           Xres['white'],
    "focused":          Xres['blue'],
    "unfocused":        Xres['black'],
    "activity":         Xres['green'],
    "urgent":           Xres['cyan'],
    "alert":            Xres['red'],
    "mode":             Xres['red'],
}

## keybindings

# modifier key
mod = "mod4"  # Super

keys = [
    # Bsp layout keys (vi)
    # focus window
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    # move window
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    # grow window
    Key([mod, "mod1"], "j", lazy.layout.grow_down()),
    Key([mod, "mod1"], "k", lazy.layout.grow_up()),
    Key([mod, "mod1"], "h", lazy.layout.grow_left()),
    Key([mod, "mod1"], "l", lazy.layout.grow_right()),
    # focus window
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    # move window
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right()),
    # grow window
    Key([mod, "mod1"], "Down", lazy.layout.grow_down()),
    Key([mod, "mod1"], "Up", lazy.layout.grow_up()),
    Key([mod, "mod1"], "Left", lazy.layout.grow_left()),
    Key([mod, "mod1"], "Right", lazy.layout.grow_right()),
    # toggle split direction
    Key([mod, "shift"], "t", lazy.layout.toggle_split()),
    # toggle floating window
    Key([mod, "shift"], 'f', lazy.window.toggle_floating()),
    # toggle fullscreen windo
    Key([mod, "shift"], 'm', lazy.window.toggle_fullscreen()),
    # switch layout
    #Key([mod, "shift"], "Tab", lazy.next_layout()),
    # switch display
    Key([mod], "bracketleft", lazy.to_screen(0)),
    Key([mod], "bracketright", lazy.to_screen(1)),
    # kill window
    Key([mod, "control"], "k", lazy.window.kill()),
    # restart qtile
    Key([mod, "control"], "r", lazy.restart()),
    # exit qtile
    Key([mod, "control"], "q", lazy.shutdown()),
    # terminal
    Key([mod], "Return", lazy.spawn("urxvt")),
    # window list
    Key([mod], "Tab", lazy.spawn("rofi -show window")),
    # application launcher
    Key([mod], "space", lazy.spawn("rofi -show drun")),
    # command launcher
    Key([mod], "grave", lazy.spawn("rofi -show run")),
    # randr settings 
    Key([mod, "control"], "equal", lazy.spawn("/usr/bin/zsh ~/.bin/rofi-randr")),
]

## group settings
#defaults
group_defaults = dict(
    exclusive = False,
    persist = True,
    init = True,
    layout = 'default',
)
# static groups
groups = [
    Group(name='home',label='',position=1,**group_defaults),
    Group(name='code',label='',position=2,**group_defaults),
    Group(name='util',label='',position=3,**group_defaults),
    Group(name='webs',label='',position=4,**group_defaults),
    Group(name='comm',label='',position=5,**group_defaults),
    Group(name='view',label='',position=6,**group_defaults),
]

for index, grp in enumerate(groups):
     keys.extend([
        # switch to group
        Key([mod], str(index+1), lazy.group[grp.name].toscreen()),
        # send to group
        Key([mod, "shift"], str(index+1), lazy.window.togroup(grp.name)),
    ])

## layout settings
layout_defaults = dict(
    border_width = 2,
    border_focus = theme['focused'],
    border_normal = theme['background'],
)
# layouts
layouts = [
    layout.Bsp(
        name = 'default',
        fair = True,
        lower_right = True,
        grow_amount = 10,
        margin = 10,
        ratio = 1.0,
        **layout_defaults
    ),
#    layout.TreeTab(**layout_defaults),
#    layout.Max(
#        name='max',
#        **layout_defaults
#    ),
]
# floating
floating_layout = layout.Floating(
    float_rules=[
        {'wmclass': 'confirm'},
        {'wmclass': 'dialog'},
        {'wmclass': 'download'},
        {'wmclass': 'error'},
        {'wmclass': 'file_progress'},
        {'wmclass': 'notification'},
        {'wmclass': 'splash'},
        {'wmclass': 'toolbar'},
        {'wmclass': 'confirmreset'},  # gitk
        {'wmclass': 'makebranch'},  # gitk
        {'wmclass': 'maketag'},  # gitk
        {'wname': 'branchdialog'},  # gitk
        {'wname': 'pinentry'},  # GPG key password entry
        {'wmclass': 'ssh-askpass'},  # ssh-askpass
    ],
    **layout_defaults
)

## widget settings
# defaults
widget_defaults = dict(
    background = theme['background'],
    foreground = theme['foreground'],
    font = 'Hack Nerd Font',
    fontsize = 14,
    padding = 2,
)
groupbox_theme = dict(
    background = theme['background'],
    foreground = theme['foreground'],
    border = theme['background-alt'],
    active = theme["active"],
    inactive = theme['background-alt'],
    this_screen_border = theme['background-alt'],
    this_current_screen_border = theme["focused"],
    other_current_screen_border = theme['foreground'],
    other_screen_border = theme['background-alt'],
    center_aligned = True,
    urgent_alert_method = 'line',
    urgent_border = theme['urgent'],
    highlight_method = 'line',
    highlight_color = theme['background'],
    borderwidth = 2,
    padding = 2,
    font = 'Hack Nerd Font',
    fontsize = 12,
    markup = True,
    rounded = False,
    spacing = 2,
)
separator_theme = dict(
    foreground = theme['background-alt'],
    linewidth = 2,
    padding = 10,
    size_percent = 50,
)
# the main bar
screens = [
    Screen(bottom=bar.Bar(
    [
        widget.GroupBox(**groupbox_theme),
        widget.Sep(**separator_theme),
        widget.WindowName(**widget_defaults),
        widget.Pacman(**widget_defaults),
        widget.Sep(**separator_theme),
        widget.Systray(**widget_defaults),
        widget.Clock(**widget_defaults),
    ],
    24,
),),]

def detect_screens(qtile):
    while len(screens) < len(qtile.conn.pseudoscreens):
        screens.append(Screen(
        bottom=bar.Bar([
            widget.GroupBox(**groupbox_theme),
            widget.Sep(**separator_theme),
            widget.WindowName(**widget_defaults),
        ],
        24,
    ),))


## mouse settings
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

## hooks
# subscribe for change of screen setup, just restart if called
@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
    # TODO only if numbers of screens changed
    qtile.cmd_restart()

##
main = None

dgroups_key_binder = None
dgroups_app_rules = []

follow_mouse_focus = True
bring_front_click = True
cursor_warp = True
focus_on_window_activation = "smart"

auto_fullscreen = True

wmname = 'LG3D'

def main(qtile):
        detect_screens(qtile)
