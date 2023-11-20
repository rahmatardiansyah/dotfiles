#!/usr/bin/env bash

function run {
    if ! pgrep $1; then
        $@ &
    fi
}

run "picom"
# run "xcompmgr"
run "flameshot"
run "nm-applet"
run "blueman-applet"
run "remaps"
run "clipmenud"
run "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1"

run brightnessctl --restore

xinput set-prop "SYNA0001:00 06CB:CE2D Touchpad" "libinput Tapping Enabled" 1 &

xautolock -time 10 -locker 'slock' -notify 15 -notifier "notify-send 'Screen will lock in 15 s'" -detectsleep -killtime 15 -killer "systemctl suspend"
