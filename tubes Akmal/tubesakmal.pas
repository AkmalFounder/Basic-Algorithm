program TubesPerhotelan;
uses crt;
        type
                pelanggan= record
                ID,nama,alamat,namaPlg             :string;
                kelas,lamamenginap,biayatambah     :integer;
                uang                               :longint;
                usia                               :char;
                YN                                 :char;
        end;
type
        dataPlg = array [1..1000] of pelanggan;

var
        h       :pelanggan;
        hr      :array[1..7] of longint;
        bt      :array[1..2] of longint;

        total,kembali   :real;
        disc            :real;

        x,i     :longint;
        //arsip   : file of pelanggan;
        Plg : dataPlg;
        jum : integer; //Menghitung Jumlah Pelanggan

        procedure officialMenu(); forward;
        procedure MenuTERAWAL(); forward;
        procedure MenuPrice();forward;
        procedure MenuExtraPrice();forward;
        procedure totalharga1();forward;
        procedure totalharga2();forward;

        procedure Opening();
        begin
                clrscr;
                 writeln('------------------------------------------------------');
                 writeln('          SELAMAT DATANG DI HOTEL SAMUDRA CITY        ');
                 writeln('      ``=======================================``     ');
                 writeln('      ||                                       ||     ');
                 writeln('      ||  SILAKAN TEKAN TOMBOL ENTER UNTUK     ||     ');
                 writeln('      ||             MELANJUTKAN               ||     ');
                 writeln('      ||                                       ||     ');
                 writeln('      ||                                       ||     ');
                 writeln('      ||                       03.23.2018      ||     ');
                 writeln('      ||                      Akmal Ikhsan     ||     ');
                 writeln('      ``=======================================``     ');
                readln;
        end;

        function findID(P : dataPlg; N : string; Jml : integer ):integer;
        var
                i : integer;
        begin
                i       := 1;
                        while (i<Jml) and (Plg[i].ID<>N) do
                        begin
                                i := i+1;
                        end;
                        if (Plg[i].ID = N) and (N <> (' ')) then
                                findID := i
                        else
                                findID := -1;
        end;

        procedure bioDisplay(index     : integer);
        begin
                 clrscr;
                 writeln('------------------------------------------------------');
                 writeln('                    TAMPILAN BIODATA                  ');
                 writeln('      ``=======================================``     ');
                 writeln('      ||NO.||     INFO BIODATA PELANGGAN       ||     ');
                 writeln('      ||| |||----------------------------------||     ');
                 writeln('      ||===||==================================||     ');
                 writeln('      || 1.|| ID    : ',Plg[index].ID ,'       ||     ');
                 writeln('      || 2.|| Nama  : ',Plg[index].nama, '     ||     ');
                 writeln('      || 3.|| Alamat: ',Plg[index].alamat,'    ||     ');
                 writeln('      || 4.|| Usia  : ',Plg[index].usia,'      ||     ');
                 writeln('      ``=======================================``     ');
                 writeln('------------------------------------------------------');
                 writeln('                                                      ');
                 writeln('                TEKAN ENTER UNTUK KELUAR              ');
                 writeln('                ________________________              ');
                 readln;
        end;

        procedure tdkadaBio();
        begin
                clrscr;
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||     BIODATA PELANGGAN TIDAK ADA       ||     ');
                        writeln('      ||        ATAU TIDAK DITEMUKAN           ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        writeln('------------------------------------------------------');
                        writeln('                                                      ');
                        writeln('                TEKAN ENTER UNTUK KELUAR              ');
                        writeln('                ________________________              ');
                        readln;
        end;

        procedure menuLihatBio(P : dataPlg);
        var
                RepID    : string;
                index     : integer;
        begin
                 clrscr;
                        writeln('-----------------------------------------------------------');
                        writeln('      ``============================================``     ');
                        writeln('      ||                                            ||     ');
                        writeln('      ||               SELAMAT DATANG               ||     ');
                        writeln('      ||     SILAHKAN MASUKKAN NO. NIK ANDA UNTUK   ||     ');
                        writeln('      ||        MELIHAT INFO BIODATA PELANGGAN      ||     ');
                        writeln('      ||                                            ||     ');
                        writeln('      ``============================================``     ');
                        writeln('-----------------------------------------------------------');
                        writeln('                                                           ');
                        write  ('Masukan nomor ID anda : '); readln(RepID);

                        index   := findID(Plg,RepID,Jum);

                        if index <> -1 then
                                bioDisplay(index)
                        else
                                tdkadaBio;
                 officialMenu();
        end;

        procedure editSukses();
        begin
                clrscr;
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||      PENGEDITAN BIODATA PELANGGAN     ||     ');
                        writeln('      ||              " SUCCSES "              ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        writeln('------------------------------------------------------');
                        writeln('                                                      ');
                        writeln('                TEKAN ENTER UNTUK KELUAR              ');
                        writeln('                ________________________              ');
                        readln;
                        officialMenu();

        end;

        procedure editMenuBio2(index : integer);
        var
                   YN   :char;
        begin
                clrscr;
                 writeln('------------------------------------------------------');
                 writeln('                    TAMPILAN BIODATA                  ');
                 writeln('      ``=======================================``     ');
                 writeln('      ||NO.||     INFO BIODATA PELANGGAN       ||     ');
                 writeln('      ||| |||----------------------------------||     ');
                 writeln('      ||===||==================================||     ');
                 writeln('      || 1.|| ID   : ',Plg[index].ID ,'        ||     ');
                 writeln('      || 2.|| Nama  : ',Plg[index].nama, '     ||     ');
                 writeln('      || 3.|| Alamat: ',Plg[index].alamat,'    ||     ');
                 writeln('      || 4.|| Usia  : ',Plg[index].usia,'      ||     ');
                 writeln('      ``=======================================``     ');
                 writeln('------------------------------------------------------');
                 writeln('                                                      ');
                 writeln('             PENGEDITAN BIODATA PELANGGAN             ');
                 writeln('            _______________________________           ');
                 writeln('------------------------------------------------------');
                 writeln('      ``================================================``     ');
                 writeln('      ||NO.||     EDIT BIODATA PELANGGAN                ||     ');
                 writeln('      ||| |||-------------------------------------------||     ');
                 writeln('      ||===||===========================================||     ');
                 writeln('      || 1.|| ID   : ');readln(Plg[index].ID                    );
                 writeln('      || 2.|| Nama  : ');readln(Plg[index].nama                 );
                 writeln('      || 3.|| Alamat: ');readln(Plg[index].alamat               );
                 writeln('      || 4.|| Usia  : ');readln(Plg[index].usia                 );
                 writeln('
                 writeln('      ``================================================``     ');
                 write  ('       Apakah anda sudah yakin dengan editan ini ? (Y/N) :     ');
                 readln(YN);
                 repeat
                        if YN = 'y' then
                               editSukses
                        else
                                editMenuBio2(index);
                 until (YN = 'y') or (YN = 'n');
                 officialMenu();
        end;

        procedure editanMenuBio(var P : dataPlg);
        var
                RepID  :string;
                index   : integer;
        begin
                 clrscr;
                        writeln('                   SELAMAT DATANG                     ');
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||         SILAKAN MASUKAN NO.ID ANDA    ||     ');
                        writeln('      ||          UNTUK MENGEDIT BIODATA       ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        writeln('------------------------------------------------------');
                        writeln('                                                      ');
                        write('                Masukan Nomor ID Anda :                '); readln(RepID);

                 index := findID(Plg,RepID,jum);
                 if index <> -1 then
                 begin
                        editMenuBio2(index);
                 end;
        end;

        procedure terhapus();
        begin
                 clrscr;
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||      PENGEDITAN BIODATA PELANGGAN     ||     ');
                        writeln('      ||             TELAH DIHAPUS             ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        writeln('------------------------------------------------------');
                        writeln('                                                      ');
                        writeln('                TEKAN ENTER UNTUK KELUAR              ');
                        writeln('                ________________________              ');
                        readln;
        end;

        procedure tampilHapus(index     :integer);
        begin
                 clrscr;
                        writeln('------------------------------------------------------');
                        writeln('                    TAMPILAN BIODATA                  ');
                        writeln('      ``=======================================``     ');
                        writeln('      ||NO.||     INFO BIODATA PELANGGAN       ||     ');
                        writeln('      ||| |||----------------------------------||     ');
                        writeln('      ||===||==================================||     ');
                        writeln('      || 1.|| ID   : ',Plg[index].ID ,'        ||     ');
                        writeln('      || 2.|| Nama  : ',Plg[index].nama, '     ||     ');
                        writeln('      || 3.|| Alamat: ',Plg[index].alamat,'    ||     ');
                        writeln('      || 4.|| Usia  : ',Plg[index].usia,'      ||     ');
                        writeln('      ``=======================================``     ');
        end;

        procedure menuHapusBio(var Plg : dataPlg);
        var
                RepID,pil      : string;
                index, j        : integer;
                temp            : pelanggan;
                usia            : char;
        begin
                 clrscr;
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||      PENGEDITAN BIODATA PELANGGAN     ||     ');
                        writeln('      ||             TELAH DIHAPUS             ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        writeln('------------------------------------------------------');
                        write  ('    Masukan Nomor ID Anda : '); readln(RepID);

                        index := findID(Plg,RepID,jum);
                        if index <> -1 then
                        begin
                                tampilHapus(index);
                                write('Apakah Anda Yakin Ingin Menghapus Biodata ini ? (Y/N)');
                                readln(pil);
                                if pil = 'y' then
                                        begin
                                                Plg[index].ID := ' ';
                                                Plg[index].nama := ' ';
                                                Plg[index].alamat := ' ';
                                                Plg[index].usia := ' ';
                                                jum := jum-1;
                                                terhapus;
                                        end
                                else if pil ='n' then
                                        begin

                                        end;
                        end;
                        readln;
        end;

        procedure tampilSort(Plg : dataPlg; Jml : integer);
        var
                i : integer;
        begin
                i := 1;
                while i<Jml do
                begin
                        bioDisplay(i);
                        i := i+1;
                end;
        end;

        procedure sortOld(Plg : dataPlg; Jml : integer); //ini pake insertionsort descending
        var
                pass, i     : integer;
                temp    : pelanggan;
        begin
                pass := 1;
                while pass <=Jml-1 do
                begin
                        i := pass+1;
                        temp := Plg[i];
                        while(i>1) and(temp.usia>Plg[i-1].usia) do
                        begin
                                Plg[i] := Plg[i-1];
                                i := i-1;
                end;
                Plg[i] := temp;
                pass := pass+1;
                end;
                tampilSort(Plg,Jml);
        end;

        procedure officialMenu();
        var
                nom     : integer;
        begin
                repeat
                        clrscr;
                        writeln('-------------------------------------------------------------');
                        writeln('          SELAMAT DATANG DI PROGRAM PERHOTELAN               ');
                        writeln('      ``==============================================``     ');
                        writeln('      ||NO.||            MENU UTAMA                   ||     ');
                        writeln('      ||| |||----------------------------------       ||     ');
                        writeln('      ||===||=========================================||     ');
                        writeln('      || 1.|| Info Biodata                            ||     ');
                        writeln('      || 2.|| Pengeditan Biodata                      ||     ');
                        writeln('      || 3.|| Hapus Biodata Pelanggan                 ||     ');
                        writeln('      || 4.|| Lihat Data Pelanggan Berdasarkan Usia   ||     ');
                        writeln('      || 5.|| Kembali                                 ||     ');
                        writeln('       ``==============================================``    ');
                        write  ('              Pilih nomor menu :  '); readln(nom);
                        case nom of
                        1 :menulihatBio(Plg);
                        2 :editanMenuBio(Plg);
                        3 :menuHapusBio(Plg);
                        4 :sortOld(Plg,jum);
                        5 :MenuTERAWAL();
                        end;
                until (nom=5);
        end;

        procedure berhasilMesen();
        begin
                        writeln('------------------------------------------------------');
                        writeln('      ``=======================================``     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ||      SELAMAT ANDA TELAH BERHASIL      ||     ');
                        writeln('      ||         MEMESAN KAMAR DI HOTEL        ||     ');
                        writeln('      ||              "SAMUDRA CITY"           ||     ');
                        writeln('      ||                                       ||     ');
                        writeln('      ``=======================================``     ');
                        readln;
                        officialMenu;
        end;

        procedure MenuExtraPrice();
        var
        YN      : char;
        begin
        clrscr;
        bt[1]:=100000;
        bt[2]:=150000;
                writeln('Silakan pilih Tambahan kenyamanan');
                writeln('============== BIAYA TAMBAHAN ===========');
                writeln('1. Breakfast  harga= Rp.100000');
                writeln('2. Ekstra Bed harga= Rp.150000');
                writeln('Silakan pilih sesuai menu diatas: ');
                readln(h.biayatambah);

        writeln('apakah anda sudah yakin dengan pilihan anda : (Y/N)');
        readln(YN);
                repeat
                if YN='y' then
                        totalharga2()

                else if YN='n' then
                        MenuPrice();
                until (YN='y') or (YN='n');
                readln;
                end;

        procedure MenuPrice();
        var
        YN      :char;
        diskon  :string;
begin
        clrscr;
        hr[1]:=500000;
        hr[2]:=300000;
        hr[3]:=350000;
        hr[4]:=200000;
        hr[5]:=625000;
        hr[6]:=375000;
        hr[7]:=250000;
        writeln('====== HOTEL SAMUDRA CITY ======');
        write('masukan nama pelanggan: ');
        readln(h.namaPlg);
        writeln('silahkan pilih kelas kamar');
        writeln('==============( WEEKDAYS )=================');
        writeln('1. Super Deluxe harga= Rp.500000');
        writeln('2. Deluxe 1 bed harga= Rp.300000');
        writeln('3. Deluxe 2 bed harga= Rp.350000');
        writeln('4. Regular      harga= Rp.200000');
        writeln('                                ');
        writeln('==============( WEEKEND )=================');
        writeln('5. Super Deluxe harga= Rp.625000 dan Diskon 20% untuk pelanggan yang memesan lebih dari 2 hari');
        writeln('6. Deluxe 1 bed harga= Rp.375000 dan tidak ada untuk Double bed dikarenakan jumlah ruangan yang tidak cukup');
        writeln('7. Regular      harga= Rp.250000 ');
        readln(h.kelas);
        write('berapa lama anda menginap:');
        read(h.lamamenginap);
                if (h.kelas=hr[5])and (h.lamamenginap > 2) then
                        writeln('SELAMAT ANDA MENDAPATKAN DISKON 20%');
                        readln(diskon);
        write('Apakah Ingin Menambah Kenyamanan Anda (Y/N)');
        readln(YN);
        repeat
                if YN='y' then
                        MenuExtraPrice()
                else if YN='n' then
                        totalharga1();
        until (YN='y') or (YN='n');
        readln;
        end;

        procedure totalharga2();
        var
                puss2   :char;
        begin
                case h.biayatambah of
                1:total:= hr[1]*h.lamamenginap+h.biayatambah;
                2:total:= hr[2]*h.lamamenginap+h.biayatambah;
                3:total:= hr[3]*h.lamamenginap+h.biayatambah;
                4:total:= hr[4]*h.lamamenginap+h.biayatambah;
                5:total:= hr[5]*h.lamamenginap+h.biayatambah-disc;
                6:total:= hr[6]*h.lamamenginap+h.biayatambah;
                7:total:= hr[7]*h.lamamenginap+h.biayatambah;
                end;
                        writeln('======================');
                        writeln('total        =Rp.',total:0:2);
                        writeln('======================');
                        writeln('masukan jumlah pembayaran anda:');
                        readln(h.uang);
                        kembali:=h.uang-total;
                        writeln('kembalian =Rp.',kembali:0:2);
                        writeln('TERIMA KASIH');
                        repeat
                                writeln('PRESS y TO CONTINUE');
                                readln(puss2);
                                        if puss2='y' then
                                        MenuTERAWAL();
                        until (puss2='y');
                        readln;
                readln;
        end;

        procedure totalharga1();
        var
                puss    :char;
        begin
        disc:=20/100;
                case h.kelas of
                1:total:= hr[1]*h.lamamenginap;
                2:total:= hr[2]*h.lamamenginap;
                3:total:= hr[3]*h.lamamenginap;
                4:total:= hr[4]*h.lamamenginap;
                5:total:= hr[5]*h.lamamenginap-disc;
                6:total:= hr[6]*h.lamamenginap;
                7:total:= hr[7]*h.lamamenginap;
                end;
                        writeln('======================');
                        writeln('total        =Rp.',total:0:2);
                        writeln('======================');
                        writeln('masukan jumlah pembayaran anda:');
                        readln(h.uang);
                        kembali:=h.uang-total;
                        writeln('kembalian =Rp.',kembali:0:2);
                        writeln('TERIMA KASIH');
                        writeln('                               ');
                        writeln('                               ');
                        repeat
                                writeln('PRESS y TO CONTINUE');
                                readln(puss);
                                        if puss='y' then
                                        MenuTERAWAL();
                        until (puss='y');
                        readln;
                readln;
        end;

        procedure menuBlumDaftar(var Plg : dataPlg; var Jml : integer);
        var
                YN      :char;
                i : integer;
        begin
                 i := Jml+1;
                 writeln('                                                     ');
                 writeln('               Nomor ID anda belum terdaftar         ');
                 writeln('             Silakan mengisi biodata dibawah ini      ');
                 writeln('------------------------------------------------------');
                 writeln('      ``================================================``     ');
                 writeln('      ||NO.||          BIODATA PELANGGAN                ||     ');
                 writeln('      ||| |||-------------------------------------------||     ');
                 writeln('      ||===||===========================================||     ');
                 write  ('      || 1.|| ID    : ');readln(Plg[i].ID                       );
                 write  ('      || 2.|| Nama  : ');readln(Plg[i].nama                     );
                 write  ('      || 3.|| Alamat: ');readln(Plg[i].alamat                   );
                 write  ('      || 4.|| Usia  : ');readln(Plg[i].usia                     );
                 writeln('      ``================================================``     ');
                 write  ('       Apakah pengisian biodata di atas sudah benar ? (Y/N)    ');
                 readln(YN);
                        if YN='y' then
                                begin
                                        MenuPrice();
                                        //berhasilMesen;
                                       //read(arsip,dataPlg[i]);
                                        Jml := i;
                                end
                        else if YN='n' then
                                begin

                                        menuBlumDaftar(Plg,jum);
                                end
        end;

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

        procedure cekPemesanan();
        var
                RepID    : string;
                index : integer;
        begin
                 clrscr;
                        writeln('------------------------------------------------------');
                        writeln('      ``=============================================``     ');
                        writeln('      ||                                             ||     ');
                        writeln('      ||      SILAKAN MASUKAN NOMOR NIK ANDA UNTUK   ||     ');
                        writeln('      ||        UNTUK PENGECEKAN SEBELUM MEMESAN     ||     ');
                        writeln('      ||                                             ||     ');
                        writeln('      ``=============================================``     ');
                        write  ('      Masukan nomor ID anda : '); readln(RepID);

                        index := findID(Plg,RepID,jum);
                                if index <> -1 then
                                        terdaftar
                                else
                                        menuBlumDaftar(Plg,jum);
        end;

        procedure MenuTERAWAL();
        var
                x : integer;
        begin
        repeat
                repeat
                clrscr;
                writeln('------------------------------------------------------');
                writeln('          SELAMAT DATANG DI PROGRAM PERHOTELAN        ');
                writeln('      ``==========================================``     ');
                writeln('      ||NO.||            MENU UTAMA               ||     ');
                writeln('      ||| |||-------------------------------------||     ');
                writeln('      ||===||=====================================||     ');
                writeln('      ||      Apakah Anda Sudah Memesan kamar     ||     ');
                writeln('      ||      Sebagai Pelanggan di Hotel ini ?    ||     ');
                writeln('      || 1.   Saya sudah memesan kamar sebelumnya.||     ');
                writeln('      || 2.   Belum memesan kamar.                ||     ');
                writeln('      ||                                          ||     ');
                writeln('      ||                              3. Kembali  ||     ');
                writeln('      ``=======================================``        ');
                write  ('Pilih Nomor Menu yang Anda Inginkan : '); readln(x);
                until (x=1) or (x=2) or (x=3);

                if x=1 then
                        officialMenu
                else if x=2 then
                        cekPemesanan;
        until x=3;
        end;


       {procedure saveFile(); //Gausah dipake kalau ga pake database
        var
                n       : integer;
        begin
                for n :=1 to i-1 do
                begin
                        write(arsip,Plg[n]);
                end;
        end;}

BEGIN
        clrscr;
                Opening;
                menuTERAWAL;
                //assign(arsip, 'pelanggan.txt');
                //reset(arsip);


              //  for i:=1 to filesize(arsip) do
                //begin
                  //      read(arsip,Plg[i]);
               // end;


               // reWrite(arsip);
               // saveFile;

               // close(arsip);

END.
