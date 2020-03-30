#!/bin/bash

#Elias Baumann 03/2020

BLINK='\033[5;96m'
RED='\033[0;31m'
GREEN='\033[1;92m'
CYAN='\033[1;96m'
PURPLE='\033[0;95m'
NC='\033[0m' 																			#NC steht hier für NoColour

progress-bar() { 																		#Ein Ladebalken der als Parameter Zeit in Sekunden annimmt.
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "${PURPLE}▇${NC}"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "${PURPLE}| %s%%${NC}" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

echo -e "${BLINK}Installation läuft Bitte warten...${NC}"
progress-bar 20 																		                                          #Die Zwanzig ist die Zeit bis Countdown fertig ist.
sudo cp -f /home/pi/Desktop/Teams/Teams/Teams/msteams.png /usr/share/pixmaps/msteams.png& 	  #Hier wird das PNG von dem Icon nach pixmaps kopiert
sudo cp -f /home/pi/Desktop/Teams/Teams/Teams/Teams.desktop /home/pi/Desktop/Teams.desktop& 	#Die Desktopdatei wird kopiert
sudo cp -fR /home/pi/Desktop/Teams/Teams/Teams /home/pi/Documents/Teams& 						          #Der Ordner mit der dem Teams-skript wird kopiert
sudo chmod a+x /home/pi/Desktop/Teams.desktop& 											                    #Die Desktopdatei wir ausführbar gemacht
sudo chmod a+x /home/pi/Documents/Teams/Teams.sh& 									                    #Das Teams-skript wird ausführbar gemacht
sleep 0.5 																				                                            #Delay um vorzeitiges Löschen des Ordners zu verhindern (Ohne dem wird der Ordner vor dem abschließen der vorhergegangenen Befehle gelöscht!)
sudo rm -r /home/pi/Desktop/Teams& 														                                #Hier wird der auf den Dektop kopierte Ordner gelöscht.
echo -e "${CYAN}Der Installtionsprozess wurde${NC} ${GREEN}Abgeschlossen!${NC}"
sleep 2
clear
exit
