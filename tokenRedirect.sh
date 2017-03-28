#!/bin/bash
dologin () {
tok=$(curl -i -s -k -x https://127.0.0.1:8080 -X $'POST' -H $'Content-Type: text/xml;charset=UTF-8' -H $'User-Agent: Apache-HttpClient/4.1.1 (java 1.5)' 
--data-binary $'
			<User></User>
			<Password></Password>'
 $'https://url' |grep -i -oP '(?<=<token>).*?(?=</token>)')

}

request1 () {
request1=$(curl -i -s -k -x https://127.0.0.1:8080 -X $'POST' -H $'Content-Type: text/xml;charset=UTF-8' -H $'User-Agent: Apache-HttpClient/4.1.1 (java 1.5)' 
--data-binary $'
<vir:token>'$tok'</vir:token>
<q1:param>'$1'</q1:param>' \
$'https://url')
}

request2 () {
request2=$(curl -i -s -k -x https://127.0.0.1:8080 -X $'POST' -H $'Content-Type: text/xml;charset=UTF-8' -H $'User-Agent: Apache-HttpClient/4.1.1 (java 1.5)' 
--data-binary $'
<vir:token>'$tok'</vir:token>
<q1:param>'$1'</q1:param>' \
$'https://url')
echo 'ok'
}

request3 () {
request3=$(curl -i -s -k -x https://127.0.0.1:8080 -X $'POST' -H $'Content-Type: text/xml;charset=UTF-8' -H $'User-Agent: Apache-HttpClient/4.1.1 (java 1.5)' 
--data-binary $'
<vir:token>'$tok'</vir:token>
<q1:param>'$1'</q1:param>' \
$'https://url')
echo 'ok'
}


while true; do 
dologin
read -p '(1)Request1 (11)loop1 (2)Request2 (22)loop2 (3)Request3 (33)loop3 (4)Exit ' caso
case "$caso" in
"1")
  read -p 'Default value for parameter: ' value
	request1 $value
	echo 'Sent'
    ;;
"11")
	#fuzzer
	read -p 'path diccionari: ' dict
	while read dic
		do
			echo $dic
			request1 $dic &
			sleep 0.2
	done < $dict
    ;;
"2")
    read -p 'Default value for parameter: ' value
	  request2 $value
    echo 'Sent'
    ;;
"22")
	read -p 'path diccionari: ' dict
	while read dic
		do
			echo $dic
			request2 $dic &
			sleep 0.2
	done < $dict
	;;
"3")
    read -p 'Default value for parameter: ' value
	  request2 $value
    echo 'Sent'
    ;;
"33")
	read -p 'path diccionari: ' dict
	while read dic
		do
			echo $dic
			request3 $dic &
			sleep 0.2
	done < $dict
    ;;
"4")
    break;
    ;;
*)
    echo "wrong option"
    ;;
esac

done
