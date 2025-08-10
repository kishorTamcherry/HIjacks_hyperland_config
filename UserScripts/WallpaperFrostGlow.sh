#!/bin/bash
# ❄️ WALLPAPER FROST GLOW — See-through wallpaper effect with frost glass and glow

# Configuration
state_file="/tmp/.wallpaper_frost_glow"

# Store original settings to restore on exit
original_blur_size=$(hyprctl getoption decoration:blur:size | head -1 | awk '{print $2}')
original_blur_passes=$(hyprctl getoption decoration:blur:passes | head -1 | awk '{print $2}')
original_active_opacity=$(hyprctl getoption decoration:active_opacity | head -1 | awk '{print $2}')
original_inactive_opacity=$(hyprctl getoption decoration:inactive_opacity | head -1 | awk '{print $2}')

# Reset to original settings on exit
trap "hyprctl keyword decoration:blur:size $original_blur_size; \
      hyprctl keyword decoration:blur:passes $original_blur_passes; \
      hyprctl keyword decoration:active_opacity $original_active_opacity; \
      hyprctl keyword decoration:inactive_opacity $original_inactive_opacity; \
      rm -f $state_file; \
      exit" INT TERM

# Function: Enable Wallpaper Frost Glow Effect
function enable_wallpaper_frost_glow() {
    # Intense frost glass parameters for maximum see-through effect
    hyprctl keyword decoration:blur:size 15
    hyprctl keyword decoration:blur:passes 15
    hyprctl keyword decoration:blur:noise 0.0001
    hyprctl keyword decoration:blur:contrast 2.0
    hyprctl keyword decoration:blur:brightness 0.85
    hyprctl keyword decoration:blur:vibrancy 1.2
    hyprctl keyword decoration:blur:vibrancy_darkness 0.2
    
    # Advanced frost effects for see-through appearance
    hyprctl keyword decoration:blur:xray 1
    hyprctl keyword decoration:blur:special 1
    hyprctl keyword decoration:blur:popups 1
    hyprctl keyword decoration:blur:popups_ignorealpha 0.05
    hyprctl keyword decoration:blur:new_optimizations 1
    hyprctl keyword decoration:blur:ignore_opacity 1
    
    # Ultra-low opacity settings for maximum see-through effect
    hyprctl keyword decoration:active_opacity 0.5
    hyprctl keyword decoration:inactive_opacity 0.4
    hyprctl keyword decoration:fullscreen_opacity 0.6
    
    # Enhanced glow effects
    hyprctl keyword decoration:shadow:enabled 1
    hyprctl keyword decoration:shadow:range 40
    hyprctl keyword decoration:shadow:render_power 8
    hyprctl keyword decoration:shadow:color "rgba(255, 255, 255, 0.3)"
    
    # Enable glow for all windows
    hyprctl keyword decoration:dim_inactive 1
    hyprctl keyword decoration:dim_strength 0.3
    
    touch "$state_file"
    
    echo "❄️ Wallpaper Frost Glow Effect Enabled"
    echo "Blur: 15px × 15 passes"
    echo "Vibrancy: 120% • Maximum see-through effect"
    echo "Glow: Enhanced • X-Ray: Enabled"
}

# Function: Disable Wallpaper Frost Glow Effect
function disable_wallpaper_frost_glow() {
    # Restore original settings
    hyprctl keyword decoration:blur:size $original_blur_size
    hyprctl keyword decoration:blur:passes $original_blur_passes
    hyprctl keyword decoration:active_opacity $original_active_opacity
    hyprctl keyword decoration:inactive_opacity $original_inactive_opacity
    hyprctl keyword decoration:fullscreen_opacity 1.0
    
    # Disable special effects
    hyprctl keyword decoration:blur:xray 0
    hyprctl keyword decoration:blur:special 0
    hyprctl keyword decoration:blur:popups 0
    hyprctl keyword decoration:blur:ignore_opacity 0
    
    # Disable glow effects
    hyprctl keyword decoration:shadow:enabled 0
    hyprctl keyword decoration:dim_inactive 0
    
    rm -f "$state_file"
    
    echo "🌊 Wallpaper Frost Glow Effect Disabled"
    echo "Restored original blur and opacity settings"
}

# Main logic
if [[ -f "$state_file" ]]; then
    disable_wallpaper_frost_glow
else
    enable_wallpaper_frost_glow
fi