b_awal = input("Masukkan batas bawah: ")
b_akhir = input("Masukkan batas atas: ")

def cetak1(j):
    print((j+b_awal)**b_awal,"- ID proses', Rahasia")
    sleep(1)

def cetak3(i):
    if ((i+b_awal)%b_awal == 0 ):
        print((i+b_awal)**b_awal,"- ID proses', Rahasia")
        sleep(1)
    else:
        cetak4(i)
    
def cetak(i):
    print((i+b_awal),"- ID proses", getpid())
    sleep(1)

def cetak5(i):
    if ((i+b_awal)%b_awal == 0 ):
        print((i+b_awal)**b_awal,"- ID proses", getpid())
        sleep(1)
    else:
        cetak(i)

def cetak4(i):
    print((i+b_awal),"- ID proses', Rahasia")
    sleep(1)

# PAKE INI AJA BIAR NGGAK RIBET(OPSIONAL AJA SIH-NGGAK WAJIB KOK :P)
if __name__ == '__main__':

    # SEKUENSIAL
    print("\n== Pemrograman Sekuensial ==")
    sekuensial_awal = time()
    
    x = 3
    y = 1
    z = b_awal - y 
    for i in range(b_akhir-z):
        if ((i+b_awal)%b_awal == 0 ):
            print((i+b_awal)**b_awal, "Proses Dilewati..")
            sleep(1)
        else:
            cetak(i)    
        
    
    sekuensial_akhir = time()
    
    # KELAS PROCESS
    print("\n== Pemrograman Paralel dengan multiprocessing.Process ==")
    
    kumpulan_proses = []
    process_awal = time()
    
    y = 1
    z = b_awal - y 
    if ((i+b_awal)%b_awal == 0 ):
        for i in range(b_akhir-z):
            p = Process(target=cetak3, args=(i,))
            kumpulan_proses.append(p)
            p.start()

        for i in kumpulan_proses:
            p.join()

    process_akhir = time()
    
    # KELAS POOL
    print("\n== Pemrograman Paralel dengan multiprocessing.Pool ==")
    pool_awal = time()

    x = 3
    genap = 2
    y = 1
    z = b_awal - y 
    
    pool = Pool()
    pool.map(cetak5, range(0,b_akhir-z))
    pool.close()
    
    pool_akhir = time()

print("")    
print("Sekuensial :", sekuensial_akhir - sekuensial_awal, "detik")
print("Kelas Process :", process_akhir - process_awal, "detik")
print("Kelas Pool :", pool_akhir - pool_awal, "detik")
