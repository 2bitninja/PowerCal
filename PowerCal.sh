# This script is for calculating power usage in kWh
# Version 0.01
clear
echo "*************************************************"
echo -e "* This script is for figuring out mining costs *"
echo -e "* Have the wattage of the RIG and the electric *"
echo -e "* rate ready.                                  *"
echo -e "*                                              *"
echo -e "*            Keep this in mind.                *"
echo -e "*    The RIG will draw a different wattage     *"
echo -e "*  depending on hashing algorithm mined and    *"
echo -e "*  system settings applied. So recheck the     *"
echo -e "*  RIG's wattage after changes are made.       *"
echo "*************************************************"

# Data collection
read -p "Enter the total wattage of Rig: " watts
read -p "How many hours did the RIG ran? [24]: " hours
hours=${hours:-24}
read -p "What is your electic rate? Price per kWh: " rate
clear
# Printout

s=$(echo "scale=3;$watts * $hours / 1000" | bc -l)
cost=$(echo "scale=2;$s * $rate" | bc -l)

echo "RIG Specks:"
echo -e "Watts: \t$watts"
echo -e "kWh: \t$rate"
echo -e "\nThe RIG ran for ${hours}hrs and cost $cost to mine. "

echo -e "\nBelow are some additional figures  "
H=$(echo "$watts * 1 / 1000 * $rate" | bc -l)
D=$(echo "$watts * 24 / 1000 * $rate" | bc -l)
W=$(echo "$watts * 24 * 7 / 1000 * $rate" | bc -l)
M=$(echo "$watts * 24 * 30 / 1000 * $rate" | bc -l)

echo "*********************************"
printf "*   Cost Per hour \t%0.2f \t*\n" $H
printf "*   Cost Per day \t%0.2f \t*\n" $D
printf "*   Cost Per Week \t%0.2f \t*\n" $W
printf "*   Cost Per Month \t%0.2f \t*\n" $M
echo "*********************************"
echo "\nNote the figures above excluding any taxes and fees."
