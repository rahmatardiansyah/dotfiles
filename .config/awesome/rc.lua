pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
naughty.config.defaults["icon_size"] = 200
naughty.config.presets["critical"].bg = "#E06C75"
naughty.config.presets["critical"].fg = "#1E2127"
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-- {{{ Custom function
-- Double click titlebar
function double_click_event_handler(double_click_event)
	if double_click_timer then
		double_click_timer:stop()
		double_click_timer = nil
		return true
	end

	double_click_timer = gears.timer.start_new(0.20, function()
		double_click_timer = nil
		return false
	end)
end
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/rahmat/.config/awesome/theme/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.floating,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	awful.layout.suit.corner.ne,
	awful.layout.suit.corner.sw,
	awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", terminal },
	},
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar

-- Create a textclock widget
date_widget = wibox.widget.textclock("%a,%d/%m/%Y %H:%M:%S", 1)

local myclock_t = awful.tooltip({
	objects = { date_widget },
	timer_function = function()
		return os.date("Today is %A %B %d %Y\nThe time is %T")
	end,
})

-- Volume
local volume_widget = require("widgets.volume.volume")

-- Battery
local battery_widget = require("widgets.battery.battery")

-- Brightness
local brightness_widget = require("widgets.brightness.brightness")

-- cpu
-- local cpu_widget = require("widgets.cpu.cpu")

-- ram
-- local ram_widget = require("widgets.ram.ram")

-- capslock
-- local capslock = require("widgets.capslock.capslock")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Systray
	s.systray = wibox.widget.systray()
	s.systray.visible = false

	-- Ram
	-- s.ram = ram_widget()
	-- s.ram.visible = false

	-- CPU
	-- s.cpu = cpu_widget({
	-- 	width = 70,
	-- 	step_width = 2,
	-- 	step_spacing = 0,
	-- 	color = "#434c5e",
	-- })
	-- s.cpu.visible = false

	-- Brightness
	s.brightness = brightness_widget({
		type = "icon_and_text",
		program = "brightnessctl",
		step = 5,
		base = 30,
		rmb_set_max = true,
		tooltip = false,
		percentage = false,
	})
	s.brightness.visible = true

	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			s.systray,
			-- s.ram,
			-- s.cpu,
			-- s.brightness,
			volume_widget({
				widget_type = "horizontal_bar",
				with_icon = true,
				shape = "octogon",
			}),
			battery_widget({
				font = "Lilex Nerd Font 10",
				show_current_level = true,
				display_notification = false,
			}),
			date_widget,
			s.mylayoutbox,
			spacing = 10,
		},
	})
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(awful.button({}, 3, function()
	mymainmenu:toggle()
end)))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
	-- capslock.key,
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Tab", awful.tag.history.restore, { description = "go back", group = "tag" }),

	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "w", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "`", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Control" }, "r", function()
		awful.spawn("brightnessctl --save")
		awesome.restart()
	end, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "Delete", function()
		awful.spawn("brightnessctl --save")
		awesome.quit()
	end, { description = "quit awesome", group = "awesome" }),

	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "]", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey }, "[", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	-- Custom Keybind{{{
	awful.key({ modkey, "Shift" }, "Escape", function()
		awful.spawn("powermenu.sh")
	end, { description = "menu power", group = "application" }),

	awful.key({}, "XF86_MonBrightnessUp", function()
		brightness_widget:inc()
	end, { description = "increase brightness level", group = "function" }),

	awful.key({}, "XF86_MonBrightnessDown", function()
		brightness_widget:dec()
	end, { description = "decrease brightness level", group = "function" }),

	awful.key({}, "XF86_AudioRaiseVolume", function()
		volume_widget:inc(1)
	end, { description = "increase speaker volume", group = "function" }),

	awful.key({}, "XF86_AudioLowerVolume", function()
		volume_widget:dec(1)
	end, { description = "decrease speaker volume", group = "function" }),

	awful.key({}, "XF86_AudioMicMute", function()
		awful.spawn("amixer -c 1 set Capture toggle")
	end, { description = "speaker mute toggle", group = "function" }),

	awful.key({}, "XF86_AudioMute", function()
		volume_widget:toggle()
	end, { description = "speaker mute toggle", group = "function" }),

	awful.key({}, "Print", function()
		awful.spawn("flamefull.sh")
	end, { description = "screenshot entire screen", group = "function" }),

	awful.key({ modkey }, "Print", function()
		awful.spawn("flameshot gui")
	end, { description = "screenshot select area", group = "function" }),

	awful.key({ modkey }, "p", function()
		awful.spawn("arandr")
	end, { description = "monitor settings", group = "application" }),

	awful.key({ modkey, "Shift" }, "p", function()
		awful.spawn("pavucontrol --tab=1")
	end, { description = "monitor settings", group = "application" }),

	awful.key({ modkey }, "v", function()
		awful.spawn("clipmenu")
	end, { description = "show clipboard", group = "application" }),

	awful.key({ modkey, "Shift" }, "v", function()
		awful.spawn("clipdel -d '.'")
	end, { description = "clear all clipboard", group = "application" }),

	awful.key({ modkey, "Control" }, "v", function()
		awful.spawn("clipmenu-toggle.sh")
	end, { description = "toggle disable/enable clipboard", group = "application" }),

	awful.key({ modkey, "Control" }, "d", function()
		naughty.toggle()
		if naughty.is_suspended == true then
			naughty.destroy_all_notifications()
		end
	end, { description = "toggle notifications", group = "hotkeys" }),

	awful.key({ modkey }, "b", function()
		local myscreen = awful.screen.focused()
		myscreen.mywibox.visible = not myscreen.mywibox.visible
	end, { description = "toggle statusbar", group = "awesome" }),

	awful.key({ modkey }, "\\", function()
		awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
		-- awful.screen.focused().ram.visible = not awful.screen.focused().ram.visible
		-- awful.screen.focused().cpu.visible = not awful.screen.focused().cpu.visible
		-- awful.screen.focused().brightness.visible = not awful.screen.focused().brightness.visible
	end, { description = "Toggle systray visibility", group = "awesome" }),

	awful.key({ modkey, "Control" }, "=", function()
		awful.tag.incgap(5)
	end, { description = "increase gaps", group = "customise" }),

	awful.key({ modkey, "Control" }, "-", function()
		awful.tag.incgap(-5)
	end, { description = "decrease gaps", group = "customise" }),

	awful.key({ modkey }, "e", function()
		awful.spawn("rofi-emoji.sh")
	end, { description = "menu power", group = "application" }),

	awful.key({ modkey }, "a", function()
		awful.spawn("rofi-surfraw.sh")
	end, { description = "search website", group = "application" }),

	awful.key({ modkey, "Shift" }, "a", function()
		awful.spawn("rofi-surfraw-bookmarks.sh")
	end, { description = "search bookmarks", group = "application" }),
	-- }}}

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, { description = "run prompt", group = "launcher" }),

	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),
	-- Menubar
	awful.key({ modkey }, "d", function()
		awful.spawn("rofi -show drun")
	end, { description = "show rofi launcher", group = "launcher" })
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Shift" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey }, "space", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey, "Shift" }, "s", function(c)
		c.sticky = not c.sticky
	end, { description = "toggle sticky", group = "client" }),
	awful.key({ modkey, "Control" }, "t", awful.titlebar.toggle, { description = "toggle title bar", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Disable titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Floating clients.
	{
		rule_any = { class = { "Gcolor3", "Gnome-calculator", "File-roller" } },
		properties = { floating = true, placement = awful.placement.centered },
	},

	-- Floating & Show Titlebar
	{
		rule_any = {
			class = {
				"Arandr",
				"mpv",
				"Pavucontrol",
				"flameshot",
				"Nm-applet",
				"scrcpy",
				"Blueman-manager",
				"Lxappearance",
			},
		},
		properties = { floating = true, titlebars_enabled = true, placement = awful.placement.centered },
	},

	-- Rule per client
	{ rule = { class = "firefox" }, properties = { tag = "1" } },
	{ rule = { class = "Brave-browser" }, properties = { tag = "1" } },
	{ rule = { class = "obsidian" }, properties = { tag = "5" } },
	{ rule = { class = "discord" }, properties = { tag = "9" } },
	{ rule = { class = "TelegramDesktop" }, properties = { tag = "8" } },
	{ rule = { class = "Thunar" }, properties = { maximized = false } },
	{ rule = { class = "Postman" }, properties = { maximized = false } },
}
-- }}}

-- {{{ Signals
-- Signal when a client fullscreen
local targetApplications = { "youtube", "mpv", "netflix" }

client.connect_signal("property::fullscreen", function(c)
	if c.name then
		local lowerName = c.name:lower()
		for _, app in ipairs(targetApplications) do
			if string.match(lowerName, app) then
				awful.spawn("presentation-toggle-awesome.sh")
				break
			end
		end
	end
end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			if double_click_event_handler() then
				c.maximized = not c.maximized
				c:raise()
			else
				awful.mouse.client.move(c)
			end
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{ -- Left
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
	if c.name then
		local lowerName = c.name:lower()
		for _, app in ipairs(targetApplications) do
			if string.match(lowerName, app) then
				if c.fullscreen then
					awful.spawn("preon.sh")
				end
				if not c.fullscreen then
					awful.spawn("preoff.sh")
				end
				break
			end
		end
	end
end)

client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
	if c.fullscreen then
		awful.spawn("preoff.sh")
	end
end)
-- }}}
