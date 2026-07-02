#!/usr/bin/env bash

# Obtener ventana actual (antes de abrir rofi)
wid=$(xdotool getwindowfocus)

# Lanzar rofi con greenclip
selection=$(rofi -modi "clipboard:greenclip print" -show clipboard)

# Si el usuario presiona ESC o no selecciona nada → salir
[ -z "$selection" ] && exit 0

# Pequeño delay para asegurar foco correcto
sleep 0.1

# Restaurar clipboard y pegar
printf "%s" "$selection" | xclip -selection clipboard

# Detectar si es terminal (opcional pero útil)
wm_class=$(xprop -id "$wid" WM_CLASS 2>/dev/null)

if echo "$wm_class" | grep -qiE "term|alacritty|kitty|xterm|wezterm"; then
    # Terminal → usar Shift+Insert (más fiable)
    xdotool windowactivate --sync "$wid" key --clearmodifiers Shift+Insert
else
    # GUI normal → Ctrl+V
    xdotool windowactivate --sync "$wid" key --clearmodifiers ctrl+v
fi
