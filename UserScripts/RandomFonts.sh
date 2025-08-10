#!/bin/bash

# 🌟 RANDOM FONTS FOR HYPRLOCK 🌟
# Randomly selects fonts for hyprlock on each lock

# Cool font families (base names)
FONT_FAMILIES=(
    "Poppins"
    "Montserrat"
    "Raleway"
    "SF Pro Display"
    "Inter"
    "Roboto"
    "Ubuntu"
    "Open Sans"
    "Lato"
    "Source Sans Pro"
    "Nunito"
    "Work Sans"
    "Quicksand"
    "Comfortaa"
    "Josefin Sans"
)

# Font weights for different elements
DATE_WEIGHTS=("Bold" "SemiBold" "Medium")
TIME_WEIGHTS=("Black" "ExtraBold" "Bold")
SECONDS_WEIGHTS=("Bold" "SemiBold")
OTHER_WEIGHTS=("Bold" "SemiBold" "Medium")

# Get random font family
RANDOM_FAMILY=${FONT_FAMILIES[$RANDOM % ${#FONT_FAMILIES[@]}]}

# Get random weights for different elements
RANDOM_DATE_WEIGHT=${DATE_WEIGHTS[$RANDOM % ${#DATE_WEIGHTS[@]}]}
RANDOM_TIME_WEIGHT=${TIME_WEIGHTS[$RANDOM % ${#TIME_WEIGHTS[@]}]}
RANDOM_SECONDS_WEIGHT=${SECONDS_WEIGHTS[$RANDOM % ${#SECONDS_WEIGHTS[@]}]}
RANDOM_OTHER_WEIGHT=${OTHER_WEIGHTS[$RANDOM % ${#OTHER_WEIGHTS[@]}]}

# Create font combinations
DATE_FONT="$RANDOM_FAMILY $RANDOM_DATE_WEIGHT"
TIME_FONT="$RANDOM_FAMILY $RANDOM_TIME_WEIGHT"
SECONDS_FONT="$RANDOM_FAMILY $RANDOM_SECONDS_WEIGHT"
OTHER_FONT="$RANDOM_FAMILY $RANDOM_OTHER_WEIGHT"

# Backup original hyprlock config
cp ~/.config/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf.backup

# Create a temporary file with the new fonts - update ALL font_family lines
sed "s/font_family = .*/font_family = $OTHER_FONT/g" ~/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf.tmp

# Replace the original with the updated version
mv ~/.config/hypr/hyprlock.conf.tmp ~/.config/hypr/hyprlock.conf

echo "🎨 Applied random fonts:"
echo "   All elements: $OTHER_FONT"
echo "   Family: $RANDOM_FAMILY" 