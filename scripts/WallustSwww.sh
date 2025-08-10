#!/bin/bash
# 💫 https://github.com/JaKooLit
# Wallust Colors for current wallpaper + Kitty fallback theme fixes

cache_dir="$HOME/.cache/swww/"
current_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
cache_file="$cache_dir$current_monitor"
ln_success=false

if [ -f "$cache_file" ]; then
    wallpaper_path=$(grep -v 'Lanczos3' "$cache_file" | head -n 1)
    ln -sf "$wallpaper_path" "$HOME/.config/rofi/.current_wallpaper" && ln_success=true
    cp -r "$wallpaper_path" "$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
fi

if [ "$ln_success" = true ]; then
    echo "Applying Wallust..."
    wallust run "$wallpaper_path" -s

    sleep 1  # allow Wallust to generate files
    kitty_theme_path="$HOME/.config/kitty/kitty-themes/01-Wallust.conf"

    # Improved fallback values
    fallback_fg="#f0f0f0"
    fallback_bg="#1a1b26"
    fallback_cursor="#00ffff"
    fallback_tab_fg="#1a1b26"
    fallback_tab_bg="#f0f0f0"
    fallback_tab_fg_inactive="#aaaaaa"
    fallback_tab_bg_inactive="#121212"
    fallback_color8="#888888"
    fallback_color4="#61afef"  # commands like 'cd', 'ls', etc.

    if [ -f "$kitty_theme_path" ]; then
        echo "Patching Kitty theme for readability..."

        sed -i \
            -e "s/^foreground .*/foreground $fallback_fg/" \
            -e "s/^background .*/background $fallback_bg/" \
            -e "s/^cursor .*/cursor $fallback_cursor/" \
            -e "s/^active_tab_foreground .*/active_tab_foreground $fallback_tab_fg/" \
            -e "s/^active_tab_background .*/active_tab_background $fallback_tab_bg/" \
            -e "s/^inactive_tab_foreground .*/inactive_tab_foreground $fallback_tab_fg_inactive/" \
            -e "s/^inactive_tab_background .*/inactive_tab_background $fallback_tab_bg_inactive/" \
            -e "s/^color8 .*/color8 $fallback_color8/" \
            -e "s/^color4 .*/color4 $fallback_color4/" \
            "$kitty_theme_path"

        echo "Applying updated Kitty theme..."
        for sock in /tmp/kitty-*; do
            kitty @ --to "unix:${sock}" set-colors --all "$kitty_theme_path" 2>/dev/null
        done
    else
        echo "❌ Kitty theme file not found: $kitty_theme_path"
    fi
fi
