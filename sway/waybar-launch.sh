#!/bin/bash

pkill waybar 2>/dev/null
sleep 0.5
exec waybar
