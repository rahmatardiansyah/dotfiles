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

theme.wallpaper = os.getenv("HOME") .. "/Pictures/wallpapers/wallpaper7.jpg"

theme.font = "JetBrainsMono Nerd Font Bold 10"

theme.transparent = "#00000000"

theme.color0 = "#1E2127"
theme.color8 = "#5C6370"
theme.color1 = "#E06C75"
theme.color9 = "#E06C75"
theme.color2 = "#98C379"
theme.color10 = "#98C379"
theme.color3 = "#D19A66"
theme.color11 = "#D19A66"
theme.color4 = "#61AFEF"
theme.color12 = "#61AFEF"
theme.color5 = "#C678DD"
theme.color13 = "#C678DD"
theme.color6 = "#56B6C2"
theme.color14 = "#56B6C2"
theme.color7 = "#ABB2BF"
theme.color15 = "#FFFFFF"

theme.bg_normal = "#222222"
theme.bg_focus = "#535d6c"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#444444"
theme.bg_systray = theme.color0

theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(5)
theme.gap_single_client = false

theme.border_width = dpi(1)
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"
theme.border_marked = "#91231c"

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.color4)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.color7)

theme.taglist_bg_empty = theme.color0
theme.taglist_fg_empty = theme.color7
theme.taglist_bg_occupied = theme.color0
theme.taglist_fg_occupied = theme.color7
theme.taglist_bg_focus = theme.color0
theme.taglist_fg_focus = theme.color4
theme.taglist_bg_urgent = theme.color1
theme.taglist_fg_urgent = theme.color0
-- theme.taglist_bg_volatile = theme.color0
-- theme.taglist_fg_volatile = theme.color2

-- tasklist_[bg|fg]_[focus|urgent]
theme.tasklist_bg_focus = theme.color4
theme.tasklist_fg_focus = theme.color0
theme.tasklist_bg_urgent = theme.color1
theme.tasklist_fg_urgent = theme.color0

-- titlebar_[bg|fg]_[normal|focus]
theme.titlebar_bg_normal = theme.color0
theme.titlebar_fg_normal = theme.color4
theme.titlebar_bg_focus = theme.color4
theme.titlebar_fg_focus = theme.color0

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
theme.notification_font = "JetBrainsMono Nerd Font Bold 14"
theme.notification_bg = theme.color0
theme.notification_fg = theme.color7
theme.notification_border_width = 5
theme.notification_border_color = theme.color4
theme.notification_opacity = 0.9

-- theme.notification_border_width = 5
-- theme.notification_margin = 10

-- local notif_shape = function(cr, width, height)
-- 	gears.shape.infobubble(cr, 400, 70)
-- end
--
-- theme.notification_shape = notif_shape

-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
theme.hotkeys_font = "JetBrainsMono Nerd Font Bold 9"
theme.hotkeys_description_font = "JetBrainsMono Nerd Font Bold 9"
theme.hotkeys_modifiers_fg = theme.color4
theme.hotkeys_fg = theme.color7
theme.hotkeys_bg = theme.color0

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width = dpi(150)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- local gears = require("gears")
-- local btnCloseColor = gears.surface.load_from_shape(20, 20, gears.shape.circle, "#D12D2D")
-- theme.titlebar_close_button_normal = btnCloseColor

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

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.color4, theme.color15)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
theme.tasklist_disable_icon = true

return theme
