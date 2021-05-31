# weather
 A simple command line script to display current weather. For those who live in the command line.

 ```shell
 =======WEATHER=UPDATE========
 |  City:            New Haven
 |  State:           Indiana
 |  Temp:            50°F
 |  Feels Like:      48°F
 |  Humidity:        77%
 |  Wind Speed:      4 MPH
 |  Wind Direction:  WSW
 |  UV Index:        1 UV
 |----------------------------
 |  Today is: Monday
 |  Date: 05/31/2021 07:08
 =============================
```
## Installation
* Clone repository.
* Make sure Ruby is installed.
* Get an API key from https://weatherstack.com/
  * Update **API_KEY** variable in script with key.
* Update **QUERY** variable in script.
  * Use ZIPCODE:  **QUERY='46774'**
  * OR use CITY: **QUERY='New Haven'**
  * OR use CITY/STATE: **QUERY='Indianapolis,Indiana'**

Running script:
```shell
ruby /path/to/script/weather.rb
```

OR

Create an alias:
 ```shell
alias weather='ruby /path/to/script/weather.rb'
```

Run script:
```shell
weather
```

Website
----
https://drewlenhart.com/

License
----
MIT License

Copyright (c) 2021 Drew D. Lenhart

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
