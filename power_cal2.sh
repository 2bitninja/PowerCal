#!/bin/bash
# This script is for calculating power usage in kWh
# Created by twobitminer

source ~/scripts/defaults.txt
# Variables & functions
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
data_collection(){
#read -p "Enter the total wattage of Rig: " watts
#if [[ -z "$watts" ]]
#then printf '%s\n' "No input entered"
#fi

#while read -p "Enter the total wattage of Rig: " watts && [ -z "$watts" ]; do :; done
#while read -rp "Enter the total wattage of Rig: " watts && [ -z "$watts" ] && echo "Please try again"; do :; done
while read -rp "Enter the total wattage of Rig: " watts && ! [[ -z "$watts =~ ^[0-9]+$}" ]] ; do then contine:; done

#while read -p "Enter the total wattage of Rig: " watts && [ -z "$watts" ] || [ -n ${watts//[0-9]/} ]; do :; done

read -p "How many hours did the RIG ran? [24]: " hours
hours=${hours:-$ahours}
read -p "What is the voltage the RIG is plugged into? [120]: " volts
volts=${volts:-$awatts}
read -p "What is your electric rate? Price per kWh [0.10]: " rate
rate=${rate:-$arate} 
}
data_collection

# Validate data
#if [ -z "$watts" ] || [ -z "$hours" ] || [ -z "$volts" ] || [ -z "$rate" ]
#then 
#    echo 'Inputs cannot be blank please try again' 
#    data_collection 
#fi

#if ! [[ "$watts" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || ! [[ "$hours" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || ! [[ "$volts" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || ! [[ "$rate" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
#then 
#    echo "Inputs must be a numbers" 
#     data_collection
#fi

#if [ -z "$watts" ]
#then echo 'Inputs cannot be blank please try again'
#data_collection
#fi


clear
# Printout
message
s=$(echo "scale=3;$watts * $hours / 1000" | bc -l)
cost=$(echo "scale=2;$s * $rate" | bc -l)
amps=$( echo "scale=2;$watts / $volts" |bc -l)

#echo "   RIG Specks:"
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

#echo -e "\t*********************************"
echo -e "\t---------------------------------"
printf "\t| Cost Per hour \t%0.2f \t|\n" $H
printf "\t| Cost Per day  \t%0.2f \t|\n" $D
printf "\t| Cost Per Week \t%0.2f \t|\n" $W
printf "\t| Cost Per Month \t%0.2f\t|\n" $M
printf "\t| Cost Per Year \t%0.2f\t|\n" $Y
echo -e "\t---------------------------------"
#echo -e "\t*********************************"
echo -e "\n Note the figures above excluding any taxes and fees.\n"
echo -e "$ahours"
echo -e "$arate"
