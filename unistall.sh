#!/bin/bash
#
# DHCP: (22/ABRL/2022)
#
# [Open Source] - [Código Abierto]
#
# CREADO POR ZAKARIA GUENDOUDI (SUBZONE)
#
PWD=$(pwd)
OS=$(uname -o)
USER=$(id -u)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'


comillas='"'
#
# Banner SETSMS
#
echo -e "${cian}
▓█████▄  ██░ ██  ▄████▄   ██▓███      ██▓ ███▄    █   ██████ ▄▄▄█████▓ ▄▄▄       ██▓    ▄▄▄       ▄████▄   ██▓ ▒█████   ███▄    █ 
▒██▀ ██▌▓██░ ██▒▒██▀ ▀█  ▓██░  ██▒   ▓██▒ ██ ▀█   █ ▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██▒   ▒████▄    ▒██▀ ▀█  ▓██▒▒██▒  ██▒ ██ ▀█   █ 
░██   █▌▒██▀▀██░▒▓█    ▄ ▓██░ ██▓▒   ▒██▒▓██  ▀█ ██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▒██▒▒██░  ██▒▓██  ▀█ ██▒
░▓█▄   ▌░▓█ ░██ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒   ░██░▓██▒  ▐▌██▒  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░   ░██▄▄▄▄██ ▒▓▓▄ ▄██▒░██░▒██   ██░▓██▒  ▐▌██▒
░▒████▓ ░▓█▒░██▓▒ ▓███▀ ░▒██▒ ░  ░   ░██░▒██░   ▓██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░██████▒▓█   ▓██▒▒ ▓███▀ ░░██░░ ████▓▒░▒██░   ▓██░
 ▒▒▓  ▒  ▒ ░░▒░▒░ ░▒ ▒  ░▒▓▒░ ░  ░   ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░░▓  ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ 
 ░ ▒  ▒  ▒ ░▒░ ░  ░  ▒   ░▒ ░         ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒    ▒ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░
 ░ ░  ░  ░  ░░ ░░        ░░           ▒ ░   ░   ░ ░ ░  ░  ░    ░        ░   ▒     ░ ░    ░   ▒   ░         ▒ ░░ ░ ░ ▒     ░   ░ ░ 
   ░     ░  ░  ░░ ░                   ░           ░       ░                 ░  ░    ░  ░     ░  ░░ ░       ░      ░ ░           ░ 
 ░              ░                                                                                ░                               "${blanco}

echo -e "${cian}
_________________________________________________________________________________________________________________________________________________"${blanco}


sudo rm -R /etc/dhcp/sh
sudo rm -R /usr/bin/config-dhcpd	

sleep 15s

clear
echo -e "${cian}
▓█████▄  ██░ ██  ▄████▄   ██▓███      ██▓ ███▄    █   ██████ ▄▄▄█████▓ ▄▄▄       ██▓    ▄▄▄       ▄████▄   ██▓ ▒█████   ███▄    █ 
▒██▀ ██▌▓██░ ██▒▒██▀ ▀█  ▓██░  ██▒   ▓██▒ ██ ▀█   █ ▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██▒   ▒████▄    ▒██▀ ▀█  ▓██▒▒██▒  ██▒ ██ ▀█   █ 
░██   █▌▒██▀▀██░▒▓█    ▄ ▓██░ ██▓▒   ▒██▒▓██  ▀█ ██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▒██▒▒██░  ██▒▓██  ▀█ ██▒
░▓█▄   ▌░▓█ ░██ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒   ░██░▓██▒  ▐▌██▒  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░   ░██▄▄▄▄██ ▒▓▓▄ ▄██▒░██░▒██   ██░▓██▒  ▐▌██▒
░▒████▓ ░▓█▒░██▓▒ ▓███▀ ░▒██▒ ░  ░   ░██░▒██░   ▓██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░██████▒▓█   ▓██▒▒ ▓███▀ ░░██░░ ████▓▒░▒██░   ▓██░
 ▒▒▓  ▒  ▒ ░░▒░▒░ ░▒ ▒  ░▒▓▒░ ░  ░   ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░░▓  ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ 
 ░ ▒  ▒  ▒ ░▒░ ░  ░  ▒   ░▒ ░         ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒    ▒ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░
 ░ ░  ░  ░  ░░ ░░        ░░           ▒ ░   ░   ░ ░ ░  ░  ░    ░        ░   ▒     ░ ░    ░   ▒   ░         ▒ ░░ ░ ░ ▒     ░   ░ ░ 
   ░     ░  ░  ░░ ░                   ░           ░       ░                 ░  ░    ░  ░     ░  ░░ ░       ░      ░ ░           ░ 
 ░              ░                                                                                ░                               "${blanco}

echo -e "${cian}
_________________________________________________________________________________________________________________________________________________"${blanco}


echo -e "${cian} DESINSTALACIÓN CON EXITO"${blanco}