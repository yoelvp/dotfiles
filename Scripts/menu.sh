#!/bin/bash

ZONES=(/sys/devices/platform/hp-wmi/rgb_zones/zone*)

# Colores para la UI
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
RESET='\033[0m'

# --- Funciones de efectos ---

set_color() {
    local color=$1
    for zone in "${ZONES[@]}"; do
        echo "$color" | sudo tee "$zone" > /dev/null
    done
}

effect_solid() {
    echo -en "${CYAN}Ingresa el color en hex (ej: FF0000): ${RESET}"
    read -r color
    set_color "$color"
    echo -e "${GREEN}Color #$color aplicado.${RESET}"
    sleep 1
}

effect_off() {
    set_color "000000"
    echo -e "${GREEN}Teclado apagado.${RESET}"
    sleep 1
}

effect_cycle() {
    local colors=("FF0000" "FF7F00" "FFFF00" "00FF00" "0000FF" "8B00FF" "115F5D")
    echo -en "${CYAN}Segundos entre cada color (ej: 5): ${RESET}"
    read -r seconds

    echo -e "${YELLOW}Ciclo activo. Presiona Ctrl+C para detener.${RESET}"
    trap 'echo -e "\n${RED}Ciclo detenido.${RESET}"; return' INT

    while true; do
        for color in "${colors[@]}"; do
            set_color "$color"
            sleep "$seconds"
        done
    done

    trap - INT
}

# --- Menú interactivo ---

OPTIONS=("Color sólido" "Ciclo de colores" "Apagar teclado" "Salir")
SELECTED=0

print_menu() {
    clear
    echo -e "${BOLD}${CYAN}"
    echo "  ╔═══════════════════════════════╗"
    echo "  ║     HP Omen RGB Controller    ║"
    echo "  ╚═══════════════════════════════╝"
    echo -e "${RESET}"

    for i in "${!OPTIONS[@]}"; do
        if [[ $i -eq $SELECTED ]]; then
            echo -e "  ${BOLD}${GREEN}▶ ${OPTIONS[$i]}${RESET}"
        else
            echo -e "     ${OPTIONS[$i]}"
        fi
    done

    echo ""
    echo -e "${YELLOW}  ↑↓ Navegar   Enter Seleccionar${RESET}"
}

while true; do
    print_menu

    # Leer tecla
    IFS= read -rsn1 key
    if [[ $key == $'\x1b' ]]; then
        read -rsn2 key
        case $key in
            '[A') ((SELECTED > 0)) && ((SELECTED--)) ;;           # Arriba
            '[B') ((SELECTED < ${#OPTIONS[@]} - 1)) && ((SELECTED++)) ;;  # Abajo
        esac
    elif [[ $key == '' ]]; then  # Enter
        case $SELECTED in
            0) effect_solid ;;
            1) effect_cycle ;;
            2) effect_off ;;
            3) echo -e "${CYAN}Hasta luego.${RESET}"; exit 0 ;;
        esac
    fi
done
