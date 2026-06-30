#!/bin/sh -eux

kscreen-doctor output.DP-1.mode.3840x2160@120
kscreen-doctor output.DP-1.vrrpolicy.never
notify-send 'VRR Script' "set DP-1 screen mode rate to 3840x2160@120, VRR: never"
