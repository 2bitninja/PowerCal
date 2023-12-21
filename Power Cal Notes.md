# Power Cal Notes

Ideas for improvements
1) Add menu\
	A) Set defaults\
	B) Save RIG setting
2) Make launcher icon
3) Setup zip or tar file
4) Add Amps calculation //DONE//
5) Add info section with version
6) Support or help
7) Add colors
8) Add ability to save RIG setting

*** Not functioning yet ***

Defaults.txt
```
Hours
Electric rate
Voltage
Amps
```

## Reference URLs
Site the math came from: 
https://www.datacenters.com/news/how-to-convert-and-calculate-power-for-crypto-miners-what-is-a-kilowatt-vs-kilow

US state by state electric rate: 
https://paylesspower.com/blog/electric-rates-by-state/

Japanese electric prices from Tepco Electric company: 
https://www.tepco.co.jp/en/ep/rates/electricbill-e.html
***

Rigs.txt
Rig_name,watts,hours,electric,voltage,notes

In script VARs
$1
Watts -for watts used
Hours - for hours run
Rate  -for electric rate

#### Example
`echo -e \'93$hours\'94}`
