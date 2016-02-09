#!/bin/bash

if test $# -ne 1
then
	echo "[Usage] $0 <targetword>"
	exit 1;
fi

urlbase="www.ozdic.com/collocation-dictionary/"
targeturl=$urlbase$1
outputhtml=$1.html
htmlresult=$1.html.sedout
txtresult=$1.txt
wget -q -c $targeturl -O $outputhtml && sed -n '/DIV/,/\/DIV/ p' $outputhtml > $htmlresult

#col -b is used to not to output any backspaces
html2text $htmlresult |col -b > $txtresult

function cleantmpfiles(){
	rm $outputhtml $htmlresult
}

cleantmpfiles
