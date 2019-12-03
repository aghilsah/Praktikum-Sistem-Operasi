#!/bin/bash
clear
tes=y

while [ $tes == 'y' ]
do
echo "== Program Nilai Terkecil Kedua di dalam Array =="
echo "1. Demo Program Array"
echo "2. Lihat Data Arrray"
echo "3. Rata-rata Array"
echo "4. Exit"

echo -n "Masukkan Pilihan Menu Anda : "
read menu

case $menu in
	1)
	echo -n "Masukkan banyak element array : "
	read jml_arr

	for (( i=0; i<$jml_arr; i++ ))
	do
		echo -n "Index Array - $i : "
		read array[i]
	done

	terkecil_1=${array[0]}
	for((i=0; i<$jml_arr; i++))
	do
		if [[ $terkecil_1 -gt ${array[i]} ]]
		then
			let terkecil_1=${array[i]}
			let flags=i
		fi
	done

	terkecil_2=99999
	index=0

	for (( i=0; i<$jml_arr; i++ ))
	do
		if [[ $i -eq $flags ]]
		then
			let i=i+1
			let i=i-1
		else
			if [[ $terkecil_2 -gt ${array[i]} ]]
			then
				let terkecil_2=${array[i]}
				let index=i
			fi
		fi
	done

	echo ""
	echo "Nilai terkecil kedua di dalam array adalah : $terkecil_2"
	echo "Array terkecil kedua index ke : $index"
	read
	clear
	;;

	2)
	if [[ $jml_arr -eq 0 ]]
	then
		echo "Data masih kosong"
	else
		echo ${array[@]}
	fi
	read
	clear
	;;

	3)
	if [[ $jml_arr -eq 0 ]]
	then
		echo ""
		echo "0"
	else
		banyak_data=${#array[@]};
		flag=0
		for((i=0;i<$banyak_data;i++))
		do
			let flag=$(expr "$flag" + "${array[i]}")
		done

		let rat=$flag/$banyak_data
		echo "Rata rata data array : $rat"
	fi
	read
	clear
	;;

	4)
	echo""
	echo "Terima kasih telah menggunakan program ini"
	exit 1
	clear

esac
done
