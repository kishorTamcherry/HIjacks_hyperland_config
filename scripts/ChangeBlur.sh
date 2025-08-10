#!/bin/bash
# 💫 Frost Glass Toggle for Hyprland – dreamy glass effect with neon-aware tweaks

notif="$HOME/.config/swaync/images"
state_file="/tmp/.hypr_blur_mode"

# Emojis & Labels
frost_emoji="❄️"
normal_emoji="🌊"
separator="━━━━━━━━━━━━━━━━━━━━━━"

# Function: Enhanced Dream Frost Blur Mode
function enable_frost() {
    # Enhanced frost glass parameters for maximum dreamy effect
    hyprctl keyword decoration:blur:size 8
    hyprctl keyword decoration:blur:passes 8
    hyprctl keyword decoration:blur:noise 0.001
    hyprctl keyword decoration:blur:contrast 1.6
    hyprctl keyword decoration:blur:brightness 0.95
    hyprctl keyword decoration:blur:vibrancy 0.95
    hyprctl keyword decoration:blur:vibrancy_darkness 0.1
    
    # Additional frost effects
    hyprctl keyword decoration:blur:xray 1
    hyprctl keyword decoration:blur:special 1
    hyprctl keyword decoration:blur:popups 1
    hyprctl keyword decoration:blur:popups_ignorealpha 0.2
    
    # Opacity settings for frosted glass look
    hyprctl keyword decoration:active_opacity 0.75
    hyprctl keyword decoration:inactive_opacity 0.65
    hyprctl keyword decoration:fullscreen_opacity 0.85
    
    # Enable shadow effects for depth
    hyprctl keyword decoration:shadow:enabled 1
    hyprctl keyword decoration:shadow:range 20
    hyprctl keyword decoration:shadow:render_power 3
    
    touch "$state_file"

    notify-send -e -u low -i "$notif/ja.png" \
    "$frost_emoji Enhanced Frost Glass Enabled" \
    "$separator\nBlur: 8px × 8 passes\nVibrancy: 95% • Maximum frost effect\nX-Ray: Enabled • Popups: Frosted"
}

# Function: Ultra Dream Frost Blur Mode (Even More Intense)
function enable_ultra_frost() {
    # Maximum frost glass parameters for ultimate dreamy effect
    hyprctl keyword decoration:blur:size 12
    hyprctl keyword decoration:blur:passes 12
    hyprctl keyword decoration:blur:noise 0.0005
    hyprctl keyword decoration:blur:contrast 1.8
    hyprctl keyword decoration:blur:brightness 0.9
    hyprctl keyword decoration:blur:vibrancy 1.0
    hyprctl keyword decoration:blur:vibrancy_darkness 0.15
    
    # Additional ultra frost effects
    hyprctl keyword decoration:blur:xray 1
    hyprctl keyword decoration:blur:special 1
    hyprctl keyword decoration:blur:popups 1
    hyprctl keyword decoration:blur:popups_ignorealpha 0.1
    hyprctl keyword decoration:blur:new_optimizations 1
    
    # Ultra opacity settings for maximum frosted glass look
    hyprctl keyword decoration:active_opacity 0.70
    hyprctl keyword decoration:inactive_opacity 0.60
    hyprctl keyword decoration:fullscreen_opacity 0.80
    
    # Enhanced shadow effects for depth
    hyprctl keyword decoration:shadow:enabled 1
    hyprctl keyword decoration:shadow:range 30
    hyprctl keyword decoration:shadow:render_power 5
    
    touch "$state_file"

    notify-send -e -u low -i "$notif/ja.png" \
    "$frost_emoji Ultra Frost Glass Enabled" \
    "$separator\nBlur: 12px × 12 passes\nVibrancy: 100% • Maximum frost effect\nUltra X-Ray: Enabled • Enhanced shadows"
}

# Function: Normal Blur Mode
function enable_normal() {
    hyprctl keyword decoration:blur:size 6
    hyprctl keyword decoration:blur:passes 2
    hyprctl keyword decoration:blur:noise 0.009
    hyprctl keyword decoration:blur:contrast 1.05
    hyprctl keyword decoration:blur:brightness 1.0
    hyprctl keyword decoration:blur:vibrancy 0.2
    hyprctl keyword decoration:blur:vibrancy_darkness 0.0
    
    # Reset additional effects
    hyprctl keyword decoration:blur:xray 0
    hyprctl keyword decoration:blur:special 0
    hyprctl keyword decoration:blur:popups 0
    
    # Normal opacity settings
    hyprctl keyword decoration:active_opacity 0.94
    hyprctl keyword decoration:inactive_opacity 0.86
    hyprctl keyword decoration:fullscreen_opacity 1.0
    
    # Disable enhanced shadows
    hyprctl keyword decoration:shadow:enabled 0

    rm -f "$state_file"

    notify-send -e -u low -i "$notif/note.png" \
    "$normal_emoji Normal Blur Restored" \
    "$separator\nBlur: 6px × 2 passes\nBalanced contrast & crisp windows"
}

# Toggle Logic
if [[ -f "$state_file" ]]; then
    # Check if we're in ultra frost mode
    if [[ -f "${state_file}_ultra" ]]; then
        enable_normal
        # Remove ultra state file
        rm -f "${state_file}_ultra"
    else
        # Enable ultra frost mode
        enable_ultra_frost
        touch "${state_file}_ultra"
    fi
else
    enable_frost
fi
