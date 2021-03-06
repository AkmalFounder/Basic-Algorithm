program bengkel;
uses	crt;
type
	akun = record
	nama: string;
	alamat: string;
	tanggal: string;
	biaya: longint;
        harga:longint;
	usia: integer;
        uang:longint;
	kelamin: string;
	lama: string;
	antrian: string;
	hp: string;
	kendaraan: string;
	rusak: string;
        hr :longint;
END;

type
	data = array[1..100] of akun;
var
        tab:data;
        rusak:integer;
        jmlh:integer;
        total,kembali:real;
	i,x,iglobal: integer;
	ip: string;
        jum: integer;
        index: boolean;
        noantrian:string;

        procedure sortName(var T: data); forward;
        procedure optionMenu(opsi:integer); forward;
        procedure Pembukaan(); forward;
        procedure MenuTERAWAL(); forward;

    function findAntrian(var T : data;var  N : string):boolean;
    var
      i:integer;
      found:boolean;
    begin
        i:=1;
        found:=false;
        while (i<=jmlh) and (not found) do
        begin
            if (T[i].antrian = N) then
                found:=true
            else
                i:=i+1;
        end;

        findAntrian:=found;
        iglobal:=i;
    end;
      procedure tdkterdaftar();
        begin
                 clrscr;
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||          MOHOH MAAF NOMOR INI         ||     ');
                        writeln('      ||             TIDAK TERDAFTAR           ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        readln;
        end;

    procedure bioDisplay(var tab:data );
    var
        p:string;
        n:integer;
        //index:boolean;
        begin
                clrscr;
                writeln('Masukan No Antrian yang dicari');
                readln(p);
                iglobal:=1;
                n:=iglobal;
                if(tab[n].usia = 0)then
                begin
                clrscr;
                tdkterdaftar();
                end
                else
                 writeln('------------------------------------------------------');
                 writeln('                    TAMPILAN BIODATA                  ');
                 writeln('      ``=============================================``     ');
                 writeln('      ||NO.||     INFO BIODATA PELANGGAN             ||     ');
                 writeln('      ||| |||----------------------------------------||     ');
                 writeln('      ||===||========================================||     ');
                 writeln('      || 1.|| Nama      : ',tab[n].nama ,'       ||     ');
                 writeln('      || 2.|| Kelamin   : ',tab[n].kelamin, '    ||     ');
                 writeln('      || 3.|| Usia      : ',tab[n].usia,'        ||     ');
                 writeln('      || 4.|| Alamat    : ',tab[n].alamat,'      ||     ');
                 writeln('      || 5.|| Tgl       : ',tab[n].tanggal,'     ||     ');
                 writeln('      || 6.|| No hp     : ',tab[n].hp,     '     ||     ');
                 writeln('      || 7.|| No Antrian: ',tab[n].antrian,'     ||     ');
                 writeln('      ``=============================================``     ');
                 writeln('------------------------------------------------------');
                 writeln('                                                      ');
                 writeln('                TEKAN ENTER UNTUK KELUAR              ');
                 writeln('                ________________________              ');
                 readln;
        end;


    {Procedure Pembukaan();
    var
                nom: integer;
    begin
                repeat
        clrscr;
            writeln ('=====================================');
            writeln ('=          SELAMAT DATANG           =');
            writeln ('=                di                 =');
            writeln ('=               B M M               =');
            writeln ('=       Bengkel Mobil dan Motor     =');
            writeln ('=====================================');
            writeln ('=                                   =');
            writeln ('=   APA YANG INGIN ANDA LAKUKAN?    =');
            writeln ('=                                   =');
            writeln ('=====================================');
            writeln ('= 1. Info Biodata                   =');
            writeln ('= 2. sorting data                   =');
            writeln ('= 3.                                =');
            writeln ('= 4. Show data                      =');
            writeln ('= 7. Keluar                         =');
            writeln ('=====================================');
            write   ('= Masukan angka: ');
            readln  (nom);
            writeln ('=====================================');
            case nom of
                        1:bioDisplay(tab);
                        2:sortName(tab);
                        end;
                until (nom=5);
    end;}

    procedure terdaftar();
        begin
                 clrscr;
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||          MOHOH MAAF NOMOR INI         ||     ');
                        writeln('      ||             TELAH TERDAFTAR           ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        readln;
        end;


    procedure totalharga1();
        var
                puss   :char;
                uang:longint;
        begin
                total:= tab[rusak].harga;
                        writeln('======================');
                        writeln('total        =Rp.',total:0:2);
                        writeln('======================');
                        writeln('masukan jumlah pembayaran anda:');
                        readln(uang);
                        kembali:=uang-total;
                        writeln('kembalian =Rp.',kembali:0:2);
                        writeln('TERIMA KASIH');
                        writeln(' ');
                        writeln(' ');

                        repeat
                                writeln('PRESS y TO CONTINUE');
                                readln(puss);
                                        if puss='y' then
                                        Pembukaan();
                        until (puss='y');
                        readln;
                readln;
        end;
    procedure MenuPrice();
        var
        YN      :char;
        diskon  :string;
        begin
        clrscr;
        tab[1].harga:=500000;
        tab[2].harga:=300000;
        tab[3].harga:=350000;
        tab[4].harga:=200000;
        tab[5].harga:=625000;
        tab[6].harga:=375000;
        tab[7].harga:=250000;
        tab[8].harga:=20000;
        tab[9].harga:=100000;
        tab[10].harga:=200000;
        tab[11].harga:=250000;
        tab[12].harga:=600000;
                writeln;
	        writeln('============== BENGKEL MOBIL MOTOR =============');
	        writeln('======== SILAHKAN PILIH KATEGORI RUSAK ==========');
	        writeln('===============( Mobil/Motor )==================');
	        writeln('= 1. ketok magic        : 500.000              =');
	        writeln('= 2. Ganti aki          : 300.000              =');
	        writeln('= 3. Ganti spion        : 350.000              =');
	        writeln('= 4. Ganti lampu        : 200.000              =');
	        writeln('= 5. Ganti oli          : 625.000              =');
	        writeln('= 6. Tambal ban         : 375.000              =');
	        writeln('= 7. Ganti ban          : 250.000              =');
	        writeln('= 8. Isi angin ban      : 20.000               =');
	        writeln('= 9. Ganti shock breaker: 100.000              =');
	        writeln('= 10. Ganti kaca        : 200.000              =');
	        writeln('= 11. Pilox             : 250.000              =');
	        writeln('= 12. Ganti bemper      : 600.000              =');
	        writeln('================================================');
	        write('Pilihan: ');
                readln(rusak);
                totalharga1();
        end;

     procedure inputData(var tab:data);
        var
        YN,pil       :char;
        i        :integer;
        begin
              repeat
                    clrscr;
                    i:=jmlh;
                    writeln('============== INPUT DATA ===================');
                    write  ('Nama: ');
                    readln (tab[i].nama);
                    writeln ('Jenis kelamin: L/l.Laki-Laki ');
                    writeln ('               P/p.Perempuan ');
                    write ('Pilih: ');
                    readln (tab[i].kelamin);

                    if (tab[i].kelamin = 'l') then
                        writeln('Kelamin anda Laki-Laki');
                        writeln;
                    if (tab[i].kelamin = 'p') then
                        writeln('Kelamin anda Perempuan');
                        writeln;

                    write  ('Usia: ');
                    readln (tab[i].usia);

                    //repeat
                    if tab[i].usia <= 16 then
                        repeat
                            writeln('Maaf anda masih dibawah umur');
                            writeln;
                            write('Usia: ');
                            readln(tab[i].usia);
                        until (tab[i].usia > 16);
                    {end if}
                        {end looping}

                    write  ('Alamat: ');
                    readln (tab[i].alamat);
                    write  ('Tanggal: ');
                    readln (tab[i].tanggal);
                    write  ('No.Hp: ');
                    readln (tab[i].hp);
                    writeln('Jenis kendaraan yang ingin diperbaiki: 1.Mobil ');
                    writeln('                                       2.Motor ');
                    write('Pilihan: ');
                            readln(tab[i].kendaraan);


                    if (tab[i].kelamin = '1') then
                        writeln('Mobil');
                        writeln;
                    if (tab[i].kelamin = '2') then
                        writeln('Motor');

                    write ('No.Antrian: ');
                    readln(tab[i].antrian);
                    writeln;

                    writeln('1. lanjut');
                    writeln('0. keluar');
                    write('pilihan: ');
                    readln(pil);

                    if pil = '1' then
                        inputData(tab);
                    if pil = '0' then
                        clrscr;
                        Menuprice();

                                       { writeln('       Apakah pengisian biodata di atas sudah benar ? (y/n)    ');
                                        readln(YN);

                                        if YN='y' then
                                        begin
                                                MenuPrice();
                                                //jmlh:= jmlh+1;

                                        end
                                        else if YN='n' then
                                        begin
                                                clrscr;
                                                inputData(tab);
                                        end;      }

                   i:=i+1;
               until (pil = '0');
        end;

     procedure cekPemesanan();
        var
                Repantri    : string;
        begin
                 clrscr;

                        writeln('------------------------------------------------------');
                        writeln('      ``===============================================``     ');
                        writeln('      ||                                               ||     ');
                        writeln('      ||      SILAKAN MASUKAN NOMOR Antrian ANDA UNTUK ||     ');
                        writeln('      ||        UNTUK PENGECEKAN SEBELUM MEMESAN       ||     ');
                        writeln('      ||                                               ||     ');
                        writeln('      ``===============================================``     ');
                        write  ('      Masukan nomor Antrian anda : '); readln(Repantri);
                        index := findAntrian(tab,Repantri);
                                if index then
                                        terdaftar()

                                else
                                        inputData(tab);

        end;
    procedure sortName(var T: data);
    {IS. Terdefinisi data pelanggan dalam array
    FS. Mengurutkan data pelanggan dalam array berdasarkan nama pelanggan}
    var
    i,pass,ix: integer;
    temp:akun ;
    opt: char;
    begin
        writeln('====================================');
        writeln('Data akan diurutkan berdasarkan nama');
	writeln('[1]Dari A-Z');
	writeln('[2]Dari Z-A');
	write('Masukkan pilihan :');
	repeat
		readln(opt);
	until (opt='1') or (opt='2');
	for pass:=1 to length(T)-1 do begin
		ix:=pass;
			for i:=pass+1 to length(T)-1 do begin
				if (T[i].nama < T[ix].nama) and (opt='1') then
				        ix:=i;
				if (T[i].nama > T[ix].nama) and (opt='2') then
				        ix:=i;
			end;
        temp:=tab[pass];
        tab[pass]:=tab[ix];
        tab[ix]:=temp;
	end;
    end;

    procedure sortDataOption(opsi: char);
    {IS. Pilihan dari menu sort
    FS. Memanggil prosedur yang bersangkutan}
    begin
	case opsi of
        '1': sortName(tab);
	//'2': sorttlp(tab);
	end;
    end;

    procedure sortData(var T:data );
    {IS. Terdefinisi data pelanggan dalam array
    FS. Mengurutkan data pelanggan dalam array}
    var
    opsi: char;
    begin
	writeln('=====================');
	writeln('[1]Berdasarkan Nama');
	writeln('[2]Berdasarkan Golongan');
	write('Masukkan pilihan: ');
	readln(opsi);
	sortDataOption(opsi);
    end;

    procedure deleteData(var T: data);
    {IS. Terdefinisi data pelanggan dalam array
    FS. Menghapus data pelanggan dalam array tersebut}
    var
	i,n,opsi: integer;
	p: char;
    begin
	n:=length(T);
    writeln('Delete Data');
    repeat
        write('Data yang akan dihapus: '); readln(opsi);
    until(opsi>=1) and (opsi<=length(T));

    repeat
        write('Yakin akan menghapus data no.',opsi,'? (y/n): ');
        readln(p);
    until (lowercase(p)='y') or (lowercase(p)='n');

    if (lowercase(p)='y') then
    begin
        i:=opsi-1;
        while(i<n-1) do begin
            if opsi-1<>n-1 then
                T[i]:=T[i+1];
            i:=i+1;
        end;
        //setlength(T,n-1);
    end;
    end;

    procedure viewMenuOption(pil: char);
    {IS. Pilihan dari menu view
    FS. Memanggil prosedur yang bersangkutan}
    begin
	case pil of
	              //'1' : editData(tab);
		'2' : sortData(tab);
		'3' : deleteData(tab);
	              //'4' : searchData(tab);
                '5' : Pembukaan();
	end;
    end;

    procedure viewMenu(var tab: data);
    {IS. Terdefinisi data pelanggan dalam array
    FS. Menampilkan data pelanggan}
    var
        i,n: integer;
        option: char;
        p:string;
    begin
        repeat
	clrscr;
            for i:=1 to length(tab)-1 do begin

                 writeln('                    TAMPILAN BIODATA                  ');
                 writeln('      ``=============================================``     ');
                 writeln('      ||NO.||     INFO BIODATA PELANGGAN             ||     ');
                 writeln('      ||| |||----------------------------------------||     ');
                 writeln('      ||===||========================================||     ');
                 writeln('      || 1.|| Nama      : ',tab[i].nama ,'       ||     ');
                 writeln('      || 2.|| Kelamin   : ',tab[i].kelamin, '    ||     ');
                 writeln('      || 3.|| Usia      : ',tab[i].usia,'        ||     ');
                 writeln('      || 4.|| Alamat    : ',tab[i].alamat,'      ||     ');
                 writeln('      || 5.|| Tgl       : ',tab[i].tanggal,'     ||     ');
                 writeln('      || 6.|| No hp     : ',tab[i].hp,     '     ||     ');
                 writeln('      || 7.|| No Antrian: ',tab[i].antrian,'     ||     ');
                 //writeln('      || 8.|| NO        : ',i+1            '     ||     ');
                 writeln('      ``=============================================``     ');
                 writeln;
				if ((i+1) mod 4 = 0) then
				begin
					writeln('======================================');
					writeln('Tekan [1] menyunting, [2] menghapus,');
					writeln('[3] mengurutkan, [4] mencari [5] menu utama');
					writeln('======================================');
					write('Masukkan pilihan: '); readln(option);
					viewMenuOption(option);
					clrscr;
				end
				else if (i = length(tab)-1) then
				begin
					writeln('======================================');
					writeln('Tekan [1] menyunting, [2] menghapus,');
					writeln('[3] mengurutkan, [4] mencari, [5] menu utama');
					writeln('======================================');
					write('Masukkan pilihan: '); readln(option);
					viewMenuOption(option);
					clrscr;
				end;
            end;
        until (option='1') or (option='2') or (option='3') or (option='4') or (option='5');

    end;

    procedure optionMenu(opsi:integer);
    {IS. Pilihan dari menu utama
    FS. Memanggil prosedur yang bersangkutan}
    begin
	case opsi of
	        1:bioDisplay(tab);
                2: viewMenu(tab);
                3: MenuTERAWAL();
	end;
    end;

    procedure Pembukaan();
    {IS. -
    FS. Menampilkan menu utama}
    var
	opsi:integer;
    begin
	repeat
	        clrscr;
	        writeln('==========================');
		writeln('MENU UTAMA');
		writeln('==========================');
                writeln('1. cari data Antrian      ');
                writeln('2. View Data              ');
                writeln('3. Kembali ke Menu Utama  ');
		writeln('==========================');
            write('Masukkan pilihan: '); readln(opsi);

	until (opsi=1) or (opsi=2) or (opsi=3);
	if opsi<>3 then
		begin
			optionMenu(opsi);
			Pembukaan();
		end
	else
		begin
			writeln('Yakin ingin kembali ke menu awal ? (y/n)');
			readln;
                        MenuTERAWAL();
		end;
    end;

    procedure MenuTERAWAL();
        var
                x : integer;
        begin
        repeat
                repeat
                writeln('-------------------------------------------------------------');
                writeln('               SELAMAT DATANG DI PROGRAM B M M               ');
                writeln('      ``==============================================``     ');
                writeln('      ||NO.||            MENU UTAMA                   ||     ');
                writeln('      ||| |||-----------------------------------------||     ');
                writeln('      ||===||=========================================||     ');
                writeln('      ||      Apakah Anda Sudah Mengambil no antrian  ||     ');
                writeln('      ||      Sebagai Pelanggan di bengkel ini ?      ||     ');
                writeln('      || 1.   Saya sudah memesan ambil sebelumnya.    ||     ');
                writeln('      || 2.   belum mengambil.                        ||     ');
                writeln('      ||                                              ||     ');
                writeln('      ||                              3. Kembali      ||     ');
                writeln('      ``==============================================``     ');
                write  ('Pilih Nomor Menu yang Anda Inginkan : '); readln(x);
                until (x=1) or (x=2) or (x=3);

                if x=1 then
                        Pembukaan()
                else if x=2 then
                        cekPemesanan();
        until x=3;

    end;
begin
        clrscr;
        jmlh:=1;
        MenuTERAWAL;
        //bioDisplay(tab);
        readln;
end.
