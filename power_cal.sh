#!/bin/bash
# This script is for calculating power usage in kWh
# Created by twobitminer

source ~/scripts/defaults.txt
# Varibls & functions
version=" Power Cal version 0.03"

banner() {
echo "*************************************************"
echo -e "* This script is for figuring out mining costs *"
echo -e "* Have the wattage of the RIG and the electric *"
echo -e "* rate ready.                                  *"
echo "*************************************************"
}
message(){
echo "**************************************************"
echo -e "*            Keep this in mind.                 *"
echo -e "*    The RIG will draw a different wattage      *"
echo -e "*  depending on which hashing algorithm is used *"
echo -e "*  and the system settings applied. So recheck  *"
echo -e "*  the RIG's wattage after changes are made.    *"
echo "**************************************************"
}

# Main Section

case "$1" in
 -v) echo -e "$version"
     exit ;;
# -w) $1="$watts"
#echo "$watts"
# ;;
 *) if [ -z $1 ]
      then clear
      else echo "option $1 not recognized"
      exit
    fi 
;;
esac

banner
# Data collection
read -p "Enter the total wattage of Rig: " watts
read -p "How many hours did the RIG ran? [24]: " hours
hours=${hours:-24}
read -p "What is the voltage the RIG is plugged into? [220]: " volts
volts=${volts:-220}
read -p "What is your electric rate? Price per kWh: " rate
clear
message
s=$(echo "scale=3;$watts * $hours / 1000" | bc -l)
cost=$(echo "scale=2;$s * $rate" | bc -l)
amps=$( echo "scale=2;$watts / $volts" |bc -l)

echo -e "\n\tRIG Specks: \tWatts: \t$watts"
echo -e "\t\t\tkWh: \t$rate"
echo -e "\t\t\tAmps: \t$amps"
echo -e "\n The RIG ran for ${hours}hrs and cost $cost to mine.\n "

echo -e "\tBelow are some additional figures  "
H=$(echo "$watts * 1 / 1000 * $rate" | bc -l)
D=$(echo "$watts * 24 / 1000 * $rate" | bc -l)
W=$(echo "$watts * 24 * 7 / 1000 * $rate" | bc -l)
M=$(echo "$watts * 24 * 30 / 1000 * $rate" | bc -l)
Y=$(echo "$watts * 24 * 365 / 1000 * $rate" | bc -l)

echo -e "\t---------------------------------"
printf "\t| Cost Per hour \t%0.2f \t|\n" $H
printf "\t| Cost Per day  \t%0.2f \t|\n" $D
printf "\t| Cost Per Week \t%0.2f \t|\n" $W
printf "\t| Cost Per Month \t%0.2f\t|\n" $M
printf "\t| Cost Per Year \t%0.2f\t|\n" $Y
echo -e "\t---------------------------------"
echo -e "\n Note the figures above excluding any taxes and fees.\n"
