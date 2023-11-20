---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/theme"

theme.wallpaper = os.getenv("HOME") .. "/Pictures/wallpapers/wallpaper10.jpg"

theme.font = "JetBrainsMono Nerd Font Bold 10"

theme.transparent = "#00000000"
theme.background = "#00141A"
theme.foreground = "#9EACAD"

theme.black = "#002B36"
theme.blue = "#268BD2"
theme.cyan = "#2AA198"
theme.green = "#859900"
theme.magenta = "#D33682"
theme.red = "#DC322F"
theme.white = "#EEE8D5"
theme.yellow = "#B58900"

theme.black2 = "#073642"
theme.blue2 = "#49AEF5"
theme.cyan2 = "#29EEDF"
theme.green2 = "#BAFB00"
theme.magenta2 = "#F255A1"
theme.red2 = "#F6524F"
theme.white2 = "#FDF6E3"
theme.yellow2 = "#FFC100"

theme.bg_normal = "#222222"
theme.bg_focus = "#535d6c"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#444444"

theme.bg_systray = theme.background
theme.systray_icon_spacing = 5

theme.bg_normal = theme.background
theme.fg_normal = theme.foreground
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(5)
theme.gap_single_client = false

theme.border_width = dpi(1)
theme.border_normal = theme.black
theme.border_focus = "#657B83"
theme.border_marked = "#91231c"

-- create taglist squares
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.white)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.foreground)

-- taglist
theme.taglist_bg_empty = theme.background
theme.taglist_fg_empty = theme.foreground
theme.taglist_bg_occupied = theme.black
theme.taglist_fg_occupied = theme.foreground
theme.taglist_bg_focus = theme.black
theme.taglist_fg_focus = theme.white
theme.taglist_bg_urgent = theme.red
theme.taglist_fg_urgent = theme.black
-- theme.taglist_bg_volatile = theme.color0
-- theme.taglist_fg_volatile = theme.color2

-- tasklist
theme.tasklist_bg_normal = theme.background
theme.tasklist_fg_normal = theme.foreground
theme.tasklist_bg_focus = theme.black2
theme.tasklist_fg_focus = theme.white
theme.tasklist_bg_urgent = theme.red
theme.tasklist_fg_urgent = theme.black
theme.tasklist_disable_icon = true

-- titlebar
theme.titlebar_bg_normal = theme.background
theme.titlebar_fg_normal = theme.foreground
theme.titlebar_bg_focus = theme.black
theme.titlebar_fg_focus = theme.white

-- tooltip
theme.tooltip_font = "JetBrainsMono Nerd Font 12"
theme.tooltip_bg = theme.black
theme.tooltip_fg = theme.white
theme.tooltip_border_color = "#657B83"
theme.tooltip_border_width = 1

-- prompt
theme.prompt_font = "JetBrainsMono Nerd Font 10"
theme.prompt_bg = theme.background
theme.prompt_fg = theme.white
theme.prompt_fg_cursor = theme.foreground
theme.prompt_bg_cursor = theme.foreground

-- notifications:
theme.notification_font = "JetBrainsMono Nerd Font Bold 14"
theme.notification_bg = theme.black
theme.notification_fg = theme.foreground
-- theme.notification_border_width = 1
theme.notification_border_color = "#657B83"
-- theme.notification_margin = 10
theme.notification_opacity = 1.0

-- hotkeys
theme.hotkeys_font = "JetBrainsMono Nerd Font Bold 9"
theme.hotkeys_description_font = "JetBrainsMono Nerd Font Bold 9"
theme.hotkeys_bg = theme.background
theme.hotkeys_fg = theme.foreground
-- theme.hotkeys_label_bg = theme.red
-- theme.hotkeys_label_fg = theme.foreground
-- theme.hotkeys_group_margin = 10
theme.hotkeys_modifiers_fg = theme.blue
theme.hotkeys_opacity = 0.90

-- menu
theme.menu_bg_normal = theme.background
theme.menu_fg_normal = theme.foreground
theme.menu_bg_focus = theme.black2
theme.menu_fg_focus = theme.white
theme.menu_border_color = "#657B83"
theme.menu_border_width = 1
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width = dpi(150)
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.blue, theme.white)

-- Define the image to load
theme.titlebar_close_button_normal = theme.dir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.dir .. "/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = theme.dir .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.dir .. "/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.dir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = theme.dir .. "/layouts/fairhw.png"
theme.layout_fairv = theme.dir .. "/layouts/fairvw.png"
theme.layout_floating = theme.dir .. "/layouts/floatingw.png"
theme.layout_magnifier = theme.dir .. "/layouts/magnifierw.png"
theme.layout_max = theme.dir .. "/layouts/maxw.png"
theme.layout_fullscreen = theme.dir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = theme.dir .. "/layouts/tilebottomw.png"
theme.layout_tileleft = theme.dir .. "/layouts/tileleftw.png"
theme.layout_tile = theme.dir .. "/layouts/tilew.png"
theme.layout_tiletop = theme.dir .. "/layouts/tiletopw.png"
theme.layout_spiral = theme.dir .. "/layouts/spiralw.png"
theme.layout_dwindle = theme.dir .. "/layouts/dwindlew.png"
theme.layout_cornernw = theme.dir .. "/layouts/cornernww.png"
theme.layout_cornerne = theme.dir .. "/layouts/cornernew.png"
theme.layout_cornersw = theme.dir .. "/layouts/cornersww.png"
theme.layout_cornerse = theme.dir .. "/layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
