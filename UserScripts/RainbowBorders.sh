#!/bin/bash
# 🌊 BREATHING BORDERS — Simple breathing effect with wallpaper color matching

# Configuration
speed=0.05  # Speed of the breathing effect

# Store original border color to restore on exit
original_color=$(hyprctl getoption general:col.active_border | head -1 | awk '{print $2}')

# Reset to original color on exit
trap "hyprctl keyword general:col.active_border $original_color; exit" INT

# Function to lighten a hex color
lighten_color() {
  local hex_color="$1"
  # Extract RGB components
  local r=$(printf "%d" 0x${hex_color:0:2})
  local g=$(printf "%d" 0x${hex_color:2:2})
  local b=$(printf "%d" 0x${hex_color:4:2})
  
  # Lighten each component (add 50 to each, max 255)
  r=$((r + 50))
  g=$((g + 50))
  b=$((b + 50))
  
  # Ensure values don't exceed 255
  [ $r -gt 255 ] && r=255
  [ $g -gt 255 ] && g=255
  [ $b -gt 255 ] && b=255
  
  # Convert back to hex
  printf "%02x%02x%02x" $r $g $b
}

# Function to get wallpaper color from wallust
get_wallpaper_color() {
  # Use wallust to get the dominant color from current wallpaper
  if [ -f "$HOME/.config/hypr/wallust/wallust-hyprland.conf" ]; then
    # Get color12 which is typically the accent color from wallust
    local color_line=$(grep "color12" "$HOME/.config/hypr/wallust/wallust-hyprland.conf")
    if [ -n "$color_line" ]; then
      # Extract hex color directly if it's in the format we can recognize
      if echo "$color_line" | grep -q "rgb("; then
        # Extract the hex part between parentheses
        local hex_part=$(echo "$color_line" | sed -n 's/.*rgb(\([0-9A-Fa-f]*\)).*/\1/p')
        if [ -n "$hex_part" ] && [ ${#hex_part} -eq 6 ]; then
          # Validate that it's valid hex
          if [[ $hex_part =~ ^[0-9A-Fa-f]{6}$ ]]; then
            # Lighten the color to make it more visible
            local light_color=$(lighten_color "$hex_part")
            echo "$light_color"
            return
          fi
        fi
      fi
    fi
  fi
  
  # Fallback to a nice light purple if wallust not available
  echo "cc66ff"
}

# Function to create smooth breathing effect
breathing_effect() {
  local base_color="$1"
  
  # Much brighter alpha values for more intense glow effect
  local alphas=("55" "66" "77" "88" "99" "aa" "bb" "cc" "dd" "ee" "ff" "ff" "ff" "ff" "ff" "ff" "ee" "dd" "cc" "bb" "aa" "99" "88" "77" "66" "55")
  
  # Completely remove border line
  hyprctl keyword general:border_size 0
  hyprctl keyword decoration:rounding 10  # Keep rounded corners
  
  # Breathing cycle: inhale (dim to bright) then exhale (bright to dim)
  while true; do
    # Inhale - gradually brighten with enhanced glow
    for alpha in "${alphas[@]}"; do
      # Set both active and inactive borders for more visible effect
      hyprctl keyword general:col.active_border "0x${base_color}${alpha}"
      hyprctl keyword general:col.inactive_border "0x${base_color}${alpha}"
      sleep $speed
    done
    
    # Hold at peak brightness with extra glow
    hyprctl keyword general:col.active_border "0x${base_color}ff"
    hyprctl keyword general:col.inactive_border "0x${base_color}ff"
    sleep 0.8  # Hold longer at peak for more dramatic visibility
    
    # Exhale - gradually dim (reverse order)
    for ((i=${#alphas[@]}-1; i>=0; i--)); do
      hyprctl keyword general:col.active_border "0x${base_color}${alphas[$i]}"
      hyprctl keyword general:col.inactive_border "0x${base_color}${alphas[$i]}"
      sleep $speed
    done
    
    # Brief pause at minimum brightness but still maintain some glow
    hyprctl keyword general:col.active_border "0x${base_color}55"
    hyprctl keyword general:col.inactive_border "0x${base_color}55"
    sleep 0.2
  done
}

# Main loop with wallpaper color matching and breathing effect
current_color=$(get_wallpaper_color)
echo "Using wallpaper color: $current_color"

# Create continuous breathing effect with wallpaper color
breathing_effect "$current_color"