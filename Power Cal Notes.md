Power Cal Notes

Ideas for improvements
1) Add menu
	A) Set defaults
	B) Save RIG setting
2) make launcher icon
3) setup zip/tar file
4) Add Amps calculation //DONE//
5) Add info section with version
6) Support/help
7) Add colors
8) Add ability to save RIG setting

*** Not functioning ***
Defaults.txt
Hours 
Electric rate
Voltage
Amps
*** ***

Reference URLs
Site the math came from
https://www.datacenters.com/news/how-to-convert-and-calculate-power-for-crypto-miners-what-is-a-kilowatt-vs-kilow

US state by state electric rate
https://paylesspower.com/blog/electric-rates-by-state/

Japanese electric in my area
https://www.tepco.co.jp/en/ep/rates/electricbill-e.html

Rigs.txt
Rig_name,watts,hours,electric,voltage,notes

In script VARs
$1
Watts -for watts used
Hours - for hours run
Rate  -for electric rate

Example
Echo -e \'93$hours\'94}
