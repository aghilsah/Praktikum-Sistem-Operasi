#!/bin/bash
declare -i a;
echo -n "batas bawah : ";
read bb;
echo -n "batas atas : ";
read ba;
echo -n "modulus : ";
read mod;

for ((;$bb <= $ba; bb=bb+1 )); do
  #statements
  let hm=$bb%$mod;
  if [[ hm -eq 0 ]]; then
    #statements
    echo "Eureka!";
    let a=a+1;
  else
    echo $bb
  fi
done

hasil=1

while [ $a -gt 1 ]
do
  hasil=$((hasil * a))
  a=$((a - 1))
done

echo;
echo $hasil;
