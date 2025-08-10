#!/bin/bash
# 🎲 Random Workspace Animation Switcher for Hyprland
# Randomly changes workspace animation styles for dynamic experience

# Animation styles array
styles=("slide" "slidevert" "slidefade" "fade")

# Bezier curves array  
beziers=("ultraSmooth" "silkEase" "velvetEase" "butterySmooth" "creamEase" "honeyEase" "legendaryEase" "magicFloat")

# Speed range (buttery slow)
speeds=(10 11 12 13 14 15)

# Function to get random element from array
get_random() {
    local arr=("$@")
    echo "${arr[RANDOM % ${#arr[@]}]}"
}

# Function to apply random workspace animation
randomize_workspace_animation() {
    local random_style=$(get_random "${styles[@]}")
    local random_bezier=$(get_random "${beziers[@]}")
    local random_speed=$(get_random "${speeds[@]}")
    
    echo "🎲 Applying: $random_style with $random_bezier @ ${random_speed}ms"
    hyprctl keyword animation "workspaces,1,$random_speed,$random_bezier,$random_style"
    
    # Optional: notify user
    notify-send -e -u low "🎲 Random Animation" "Style: $random_style\nCurve: $random_bezier\nSpeed: ${random_speed}ms" 2>/dev/null || true
}

# Function to randomize all workspace animations
randomize_all_workspace_animations() {
    echo "🎲 Randomizing all workspace animations..."
    
    # Main workspaces
    local style1=$(get_random "${styles[@]}")
    local bezier1=$(get_random "${beziers[@]}")
    local speed1=$(get_random "${speeds[@]}")
    hyprctl keyword animation "workspaces,1,$speed1,$bezier1,$style1"
    
    # Special workspace
    local style2=$(get_random "${styles[@]}")
    local bezier2=$(get_random "${beziers[@]}")
    local speed2=$(get_random "${speeds[@]}")
    hyprctl keyword animation "specialWorkspace,1,$speed2,$bezier2,$style2"
    
    # Workspace In
    local style3=$(get_random "${styles[@]}")
    local bezier3=$(get_random "${beziers[@]}")
    local speed3=$(get_random "${speeds[@]}")
    hyprctl keyword animation "workspacesIn,1,$speed3,$bezier3,$style3"
    
    # Workspace Out
    local style4=$(get_random "${styles[@]}")
    local bezier4=$(get_random "${beziers[@]}")
    local speed4=$(get_random "${speeds[@]}")
    hyprctl keyword animation "workspacesOut,1,$speed4,$bezier4,$style4"
    
    echo "✨ All workspace animations randomized!"
    notify-send -e -u normal "🎲 All Animations Randomized" "Workspace switching now has random styles!" 2>/dev/null || true
}

# Main execution
case "${1:-single}" in
    "all")
        randomize_all_workspace_animations
        ;;
    "single"|*)
        randomize_workspace_animation
        ;;
esac