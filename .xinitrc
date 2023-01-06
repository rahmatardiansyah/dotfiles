#!/bin/sh

xrdb -load ~/.Xresources

/usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/wireplumber &
# /usr/bin/pipewire -c ~/.config/pipewire/input-filter-chain.conf &

exec dbus-launch dwm
# exec dbus-launch awesome
