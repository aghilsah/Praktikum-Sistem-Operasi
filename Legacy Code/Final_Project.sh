#!/bin/sh

declare -a nama
declare -a npm

function menu(){

	echo "Tugas Final Project"
	echo "   Oleh : Aghil   "
	echo "=================="
	echo "Pilih Menu"
	echo "1. Membuat file program dengan Sublime"
	echo "2. Membaca manual Linux"
	echo "3. Sistem Penghitung Ranking"
	echo "4. Keluar"
	echo "=================="

}

function menu1(){

	echo "Sistem Penghitung Ranking"
	echo "=================="
	echo "Pilih Menu"
	echo "1. Memasukkan Data"
	echo "2. Menampilkan Data"
	echo "3. Menampilkan Urutan Ranking"
	echo "4. Menu Awal"
	echo "=================="

}

function sublime(){

	echo "=================="
	echo -n "Masukkan nama file : "
	read nama_file_subl
	echo "Tunggu Sublime Terbuka"

	sleep 5
	subl $nama_file_subl

	echo "Penggunaan Sublime Sudah Selesai"

	clear

}

function manual(){

	echo "=================="
	echo -n "Masukkan manual yang akan dibaca : "
	read manual
	echo "Tunggu Manual Terbuka"

	sleep 5
	man $manual

	clear

}

function input(){

	echo "=================="
	echo -n "Masukkan jumlah mahasiswa : "
	read jumlah

	for (( i = 1; i <= jumlah; i++ ));
	do
		echo "=================="
		echo -n "Masukkan nama mahasiswa ke ${i} : "
		read nama[i]
		echo -n "Masukkan nilai mahasiswa ke ${i} : "
		read ip[i]
	done

}

function view(){

	for (( i = 1; i <= jumlah; i++ ));
	do
		echo "=================="
		echo "Nama mahasiswa ke ${i} : ${nama[i]} "
		echo "Nilai mahasiswa ke ${i} : ${ip[i]} "
	done

	sleep 10

	clear

}

function ranking(){

	clear

	for (( i = 1; i <= jumlah; i++ ));
	do
      for (( j=i+1; j <= jumlah; j++ ));
      do
         if [[ ${ip[i]} -lt ${ip[j]} ]];
         then
         	tempp=${nama[i]}
            nama[$i]=${nama[j]}
            nama[$j]=$tempp

            temp=${ip[i]}
            ip[$i]=${ip[j]}
            ip[$j]=$temp
         fi
      done
  	done

   for (( i = 1; i <= jumlah; i++ ));
   do
   	echo "=================="
   	echo "Peringkat ke ${i}"
   	echo "Nama Mahasiswa ke : ${nama[i]}"
   	echo "Nilai mahasiswa : ${ip[i]}"
   done

   sleep 10

   clear

}

function main(){

while :;
do
	clear
	menu

	echo -n "Masukkan Pilihan : "
	read pilih

	if [[ $pilih -eq 1 ]];
	then
		sublime
	elif [[ $pilih -eq 2 ]];
		then
		manual
	elif [[ $pilih -eq 3 ]];
		then
		while :;
		do
			clear
			menu1

			echo -n "Masukkan Pilihan : "
			read pilihh

			if [[ $pilihh -eq 1 ]];
			then
				input
			elif [[ $pilihh -eq 2 ]];
				then
				view
			elif [[ $pilihh -eq 3 ]];
				then
				ranking
			else
				main
			fi

		done
	else
		echo -n "Terima Kasih"
		sleep 3
		clear
		exit
	fi

done

}

main
