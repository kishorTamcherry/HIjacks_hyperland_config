#!/bin/bash
# 🎨 WALLPAPER COLOR BORDERS — Dynamic borders that match your wallpaper with breathing effect

# Configuration
speed=0.04  # Speed of the breathing effect

# Store original border color to restore on exit
original_color=$(hyprctl getoption general:col.active_border | head -1 | awk '{print $2}')

# Reset to original color on exit
trap "hyprctl keyword general:col.active_border $original_color; exit" INT

# Function to get wallpaper color from wallust
get_wallpaper_color() {
  # Use wallust to get the dominant color from current wallpaper
  if [ -f "$HOME/.config/hypr/wallust/wallust-hyprland.conf" ]; then
    # Get color12 which is typically the accent color from wallust
    local color_line=$(grep "color12" "$HOME/.config/hypr/wallust/wallust-hyprland.conf")
    if [ -n "$color_line" ]; then
      # Extract hex color directly if it's in the format we can recognize
      # For the format we saw: $color12 = rgb(2B0A0B)
      # We need to convert 2B0A0B from hex to RGB values
      if echo "$color_line" | grep -q "rgb("; then
        # Extract the hex part between parentheses
        local hex_part=$(echo "$color_line" | sed -n 's/.*rgb(\([0-9A-Fa-f]*\)).*/\1/p')
        if [ -n "$hex_part" ] && [ ${#hex_part} -eq 6 ]; then
          # Validate that it's valid hex
          if [[ $hex_part =~ ^[0-9A-Fa-f]{6}$ ]]; then
            echo "$hex_part"
            return
          fi
        fi
      fi
    fi
  fi
  
  # Fallback to a nice purple if wallust not available
  echo "aa00ff"
}

# Function to create smooth breathing effect
breathing_effect() {
  local base_color="$1"
  
  # Predefined alpha values for smooth breathing effect
  local alphas=("22" "33" "44" "55" "66" "77" "88" "99" "aa" "bb" "cc" "dd" "ee" "ff")
  
  # Breathing cycle: inhale (dim to bright) then exhale (bright to dim)
  while true; do
    # Inhale - gradually brighten
    for alpha in "${alphas[@]}"; do
      hyprctl keyword general:col.active_border "0x${base_color}${alpha}"
      sleep $speed
    done
    
    # Hold at peak brightness
    hyprctl keyword general:col.active_border "0x${base_color}ff"
    sleep 0.1
    
    # Exhale - gradually dim (reverse order)
    for ((i=${#alphas[@]}-1; i>=0; i--)); do
      hyprctl keyword general:col.active_border "0x${base_color}${alphas[$i]}"
      sleep $speed
    done
    
    # Brief pause at minimum brightness
    hyprctl keyword general:col.active_border "0x${base_color}22"
    sleep 0.3
  done
}

# Main loop with wallpaper color matching and breathing effect
current_color=$(get_wallpaper_color)
echo "Using wallpaper color: $current_color"

# Create continuous breathing effect with wallpaper color
breathing_effect "$current_color"