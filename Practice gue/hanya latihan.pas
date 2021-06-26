{procedure dataPembeli();
var
    choice  : char;
    Npembeli: string;

begin
    writeln('Silakan Masukan Nama-nama Pembeli: ');
    readln(Npembeli);
    i:=1;
    jum:=0;
    while i<=Npembeli do
    begin
        writeln('Urutan antrian pembeli');
        case nama of
        1: 5000;
        2: 8000;
        3: 10000;
        4: 12000;
        5: 15000;
        end;

        i:=i+1;
    end;
    writeln('apakah anda sudah yakin dengan data yang diatas ? (y/n)');
    readln(choice);
end;}
Program TugasBesartest;
uses    crt;
CONST
    {Jenis Kamar}
    SuperDeluxe=500000;
    Deluxe2Bed=300000;
    Deluxe1Bed=350000;
    Regular=200000;
    {Servis Tambahan}
    ExtraBed=150000;
    Breakfast=100000;
    {Modifikasi Harga}
    Weekend=1.25;
    diskon=0.20;
TYPE
    formatpesan=record
            IDpel:array[1..10] of longint;
            nama:array[1..10] of string;
            jenisk:array[1..10] of string;
            jumhari:array[1..10] of integer;
            ekstrabed:array[1..10]  of integer;
            ekstrabf:array[1..10] of integer;
            checkin:array[1..10] of string[10];
            checkout:array[1..10] of string[100];
    end;
VAR
    {Inputan}
    Nama,JenisKamar,HariMasuk,HM:string;
    JumlahHari:integer;
    {Outputan}
    HargaKamar,BiayaTambahan,HargaBayar:integer;
    {Singkatan}
    FP:formatpesan;
    {slot kamar}
    slotSD,slotD1,slotD2,slotR:integer;
    {proses}
    pilihan,temp,checkout2,pencarian:string;
    x,i,n,counter,t,sampai,harian,bed,bf,j,jk,wanted,t2:integer;
    totalhargakamarmain:real;
    jawab:boolean;
    tabhari: array [1..7] of real;
    {hasil total}
    hs,hk:longint;
    c,m:char; {m sebagai pemanggil procedure saja}
    {forward}
    procedure menu_utama; forward;
    procedure Pemesanan_kamarmenu(m:char); forward;
    procedure ekstras(m:char);       forward;
    procedure hargaservis(m:char); forward;
    procedure kamaran(JenisKamar:string); forward;
    procedure biayakamar(HM:string); forward;
    procedure totalseluruh(hs:longint; var totalhargakamarmain:real); forward;
    procedure konfirmasiterakhir; forward;
    function slotkamar(hk:longint):integer; forward;
    procedure tampilanslotkamar; forward;
    procedure databasher(n:integer); forward;
    function harikeluar(sampai:integer):string; forward;
    procedure editdata; forward;
    procedure Konfirmasi2; forward;
    function slotkamar2b4(hk:longint):integer; forward;
    procedure ending; forward;
{==============================================================================================================}
procedure simpanhargahari(JenisKamar:string; var JumlahHari:integer);
    begin
            if (JenisKamar='Super Deluxe') and (JumlahHari>2) then
                begin
                tabhari[1]:= (hk*1)-(hk*diskon);
                tabhari[2]:= (hk*1)-(hk*diskon);
                tabhari[3]:= (hk*1)-(hk*diskon);
                tabhari[4]:= (hk*1)-(hk*diskon);
                tabhari[5]:= (hk*1)-(hk*diskon);
                tabhari[6]:= (hk*Weekend)-(hk*diskon);
                tabhari[7]:= (hk*Weekend)-(hk*diskon);
                end
            else
                begin
                tabhari[1]:= hk*1;
                tabhari[2]:= hk*1;
                tabhari[3]:= hk*1;
                tabhari[4]:= hk*1;
                tabhari[5]:= hk*1;
                tabhari[6]:= hk*Weekend;
                tabhari[7]:= hk*Weekend;
                end;
    end;

{procedure dataPembeli();
var
    choice  : char;
    Npembeli: string;

begin
    writeln('Silakan Masukan Nama-nama Pembeli: ');
    readln(Npembeli);
    i:=1;
    jum:=0;
    while i<=Npembeli do
    begin
        writeln('Urutan antrian pembeli');
        case nama of
        1: 5000;
        2: 8000;
        3: 10000;
        4: 12000;
        5: 15000;
        end;

        i:=i+1;
    end;
    writeln('apakah anda sudah yakin dengan data yang diatas ? (y/n)');
    readln(choice);
end;}

{==============================================================================================================}
procedure simpananextra(bed,bf:integer);
    begin
        FP.ekstrabed[counter]:=bed;
        FP.ekstrabf[counter]:=bf;
    end;
{==============================================================================================================}
function searchkosong(nama,jenisk:array of string; var Jumhari:array of integer): Integer;
    begin
        if (FP.nama[counter]='') or (FP.jenisk[counter]='') or (FP.jumhari[counter]=0) then
            begin
            writeln('Data yang anda masukkan ada yang kosong!');
            x:=3;
            end;
    end;
{==============================================================================================================}
procedure simpanan(Nama,JenisKamar:string; var JumlahHari,counter:integer); {proses INPUT DATA}
    begin
    FP.IDpel[counter]:=1301184100+counter;
    FP.nama[counter]:=Nama;
    FP.jenisk[counter]:=JenisKamar;
    FP.jumhari[counter]:=JumlahHari;
    end;
{==============================================================================================================}
procedure Konfirmasi;
    begin
            clrscr;
            writeln('Apakah data yang anda masukkan sudah benar ?');
            writeln('============================================================');
            writeln('ID Pelanggan                 : ',FP.IDpel[counter]);
            writeln('Nama pemesan                 : ',FP.nama[counter]);
            writeln('Jenis kamar yang anda pesan  : ',FP.jenisk[counter]);
            writeln('Jumlah malam yang anda pesan : ',FP.jumhari[counter]);
            writeln;
    end;
{==============================================================================================================}
procedure Konfirmasi2;
    begin
            clrscr;
            writeln('Apakah data yang anda masukkan sudah benar ?');
            writeln('============================================================');
            writeln('ID Pelanggan                 : ',FP.IDpel[wanted]);
            writeln('Nama pemesan                 : ',FP.nama[wanted]);
            writeln('Jenis kamar yang anda pesan  : ',FP.jenisk[wanted]);
            writeln('Jumlah malam yang anda pesan : ',FP.jumhari[wanted]);
            writeln;
    end;
{==============================================================================================================}
procedure listhargaservis;
    begin
    writeln;
    writeln('Ekstra Bed');
    writeln('=======================================================================');
    writeln('Ekstra bed tidak tersedia pada kamar berikut : Deluxe Double Bed');
    writeln('Harga : Rp.150.000,00/bed');
    writeln;
    writeln('Breakfast <== RECOMMENDED');
    writeln('=======================================================================');
    writeln('Nikmati breakfast dengan koki *5 dengan rasa menyegarkan lidah anda!');
    writeln('Harga : Rp.100.000,00/orang');
    writeln('=======================================================================');
    writeln('>enter untuk melanjutkan');
    end;
{==============================================================================================================}
procedure listhargaservismenu;
    begin
    clrscr;
    writeln('Ekstra Bed');
    writeln('=======================================================================');
    writeln('Ekstra bed tidak tersedia pada kamar berikut : Deluxe Double Bed');
    writeln('Harga : Rp.150.000,00/bed');
    writeln;
    writeln('Breakfast <== RECOMMENDED');
    writeln('=======================================================================');
    writeln('Nikmati breakfast dengan koki *5 dengan rasa menyegarkan lidah anda!');
    writeln('Harga : Rp.100.000,00/orang');
    writeln();
    writeln('>enter untuk kembali');
    writeln();
    write('>');
    readln(c);
    menu_utama;
    end;
{==============================================================================================================}
procedure listharga;
    begin
    clrscr;
    writeln('==========================================================================');
    writeln('| Super Deluxe                                                           |');
    writeln('==========================================================================');
    writeln('| kualitas kamar super nyaman, yang dilengkapi oleh AC, TV, dan air panas|');
    writeln('| terjamin memberikan pengalaman baru dalam menginap, takkan terlupakan! |');
    writeln('| dianjurkan kepada couple yang sedang ingin menikmati malamnya~         |');
    writeln('| Harga : Rp.500.000,00/malam (weekdays)                                 |');
    writeln('| Harga : Rp.625.000,00/malam (weekend)                                  |');
    writeln('| Bonus Pemesanan lebih dari 2 malam diskon 20% Kamar terbatas!!         |');
    writeln('|======================= >enter untuk melanjutkan =======================|');
    writeln;
    readln ;
    writeln('==========================================================================');
    writeln('| Deluxe Double Bed                                                      |');
    writeln('==========================================================================');
    writeln('| kualitas kamar nyaman dan luas, yang dilengkapi oleh AC dan air panas  |');
    writeln('| traveling bersama keluarga terasa lebih nyaman di kamar ini!           |');
    writeln('| dianjurkan kepada keluarga yang sedang berpergian~                     |');
    writeln('| Harga : Rp.300.000,00/malam (weekdays)                                 |');
    writeln('| Harga : Rp.375.000,00/malam (weekend)                                  |');
    writeln('| Tidak tersedia ekstra bed                                              |');
    writeln('|======================= >enter untuk melanjutkan =======================|');
    writeln;
    readln;
    writeln('==========================================================================');
    writeln('| Deluxe Single Bed                                                      |');
    writeln('==========================================================================');
    writeln('| kualitas kamar nyaman dan indah, dilengkapi oleh AC dan air panas      |');
    writeln('| didesain khusus untuk traveler dan dilengkapi dengan guidebook touring |');
    writeln('| dianjurkan kepada seorang yang sedang dalam perjalanan atau traveling~ |');
    writeln('| Harga : Rp.350.000,00/malam (weekdays)                                 |');
    writeln('| Harga : Rp.435.000,00/malam (weekend)                                  |');
    writeln('|======================= >enter untuk melanjutkan =======================|');
    writeln;
    readln;
    writeln('==========================================================================');
    writeln('| Regular                                                                |');
    writeln('==========================================================================');
    writeln('| kualitas kamar yang tidak kalah dengan kamar lain dilengkapi dengan AC |');
    writeln('| harga murah bukan berarti murahan! kamar ini bisa dipakai couple juga! |');
    writeln('| dianjurkan kepada couple maupun seseorang yang sedang menghemat~       |');
    writeln('| Harga : Rp.200.000,00/malam (weekdays)                                 |');
    writeln('| Harga : Rp.250.000,00/malam (weekend)                                  |');
    writeln('|========================= >enter untuk kembali =========================|');
    writeln;
    readln;
    menu_utama;
    end;
{==============================================================================================================}
procedure bubblesort; {proses SORTINGDATA}
begin
clrscr;
for i:=1 to 10 do
begin
    for j:=1 to i-1 do
        begin
        if FP.nama[j] > FP.nama[j+1] then
            begin
            temp    := FP.nama[j+1];
            FP.nama[j+1]:=FP.nama[j];
            FP.nama[j]:=temp;
            end;
        end;
end;

writeln('==========================================================================');
writeln('|                      DATABASE PEMESAN KAMAR HOTEL                      |');
writeln('==========================================================================');
writeln('|                            ^Nama Pemesan^                              |');
writeln('|========================================================================|');
for i:=1 to 10 do
begin
        if (FP.nama[i]<>'') then
          writeln('| ',FP.nama[i]);
end;
writeln('==========================================================================');
writeln('|            Input apa saja untuk kembali ke Tabel Sebelumnya            |');
writeln('==========================================================================');
readln;
databasher(n);
end;
{==============================================================================================================}
procedure show(n:integer);{proses SHOWDATA}
var
    shown: Integer;
begin
    for i:=1 to n do
    begin
       if (FP.IDpel[i]<>0) then
            writeln('| ',FP.IDpel[i],'   | ',FP.nama[i],' | ',FP.jenisk[i],' | ',FP.jumhari[i],' Malam |');
    end;
end;
{==============================================================================================================}
function seqsearch(x:string):integer;
var
i: Integer;
begin
i:=1;
while (FP.nama[i]<>x) do
    i:=i+1;
    if FP.nama[i]=x then
        seqsearch:=i
    else
        seqsearch:=0;
end;
{==============================================================================================================}
procedure deletedata;
begin
    JenisKamar:=FP.jenisk[wanted];
    kamaran(JenisKamar);
    slotkamar2b4(hk);
    FP.IDpel[wanted]:=0;
    FP.nama[wanted]:=' ';
    FP.jenisk[wanted]:=' ';
    FP.jumhari[wanted]:=0;
    counter:=wanted;
end;
{==============================================================================================================}
procedure searching1(x:integer);
begin
    write('Nama yang akan dicari :');
    readln(pencarian);
    wanted:=seqsearch(pencarian);
    if wanted<>0 then
        begin
            writeln('Nama yang dicari, ',pencarian,' terdapat pada no. pelanggan ke ',FP.IDpel[wanted]);
            writeln('Apakah anda ingin mengedit kembali data yang telah dimasukkan ?');
            writeln;
            writeln('>1 untuk ya >2 untuk melanjutkan >3 untuk kembali ke database');
            write('>');
            readln(x);
            repeat
                begin
                t:=1;
                case x of
                    1 : editdata;
                    2 : t:=1;
                    3 : databasher(n);
                else
                    begin
                    writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
                    t:=0;
                    end;
                end;
                end;
            until t=1;
        end
    else
        begin
        write('nama yang dicari tidak ditemukan');
        delay(3000);
        databasher(n);
        end;
writeln;
writeln('Apakah anda ingin menghapus data yang telah dimasukkan ?');
writeln('>1 untuk ya >2 untuk tidak dan kembali ke database');
write('>');
readln(x);
repeat
    begin
    t:=1;
    case x of
        1 : deletedata;
        2 : t:=1;
    else
        begin
        writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
        t:=0;
        end;
    end;
    end;
until t=1;
databasher(n);
end;
{==============================================================================================================}
procedure simpanan2(Nama,JenisKamar:string; var JumlahHari,wanted:integer); {proses INPUT DATA}
    begin
    FP.IDpel[wanted]:=1301184100+wanted;
    FP.nama[wanted]:=Nama;
    FP.jenisk[wanted]:=JenisKamar;
    FP.jumhari[wanted]:=JumlahHari;
    end;
{==============================================================================================================}
function slotkamar2b4(hk:longint):integer;
begin
    case hk of
        500000 : slotSD:=slotSD+1;
        350000 : slotD1:=slotD1+1;
        300000 : slotD2:=slotD2+1;
        200000 : slotR:=slotR+1;
        end;
end;
{==============================================================================================================}
function slotkamar2(hk:longint):integer;
begin
    case hk of
        500000 : slotSD:=slotSD-1;
        350000 : slotD1:=slotD1-1;
        300000 : slotD2:=slotD2-1;
        200000 : slotR:=slotR-1;
    else
        begin
        writeln('Slot kamar telah habis! pilih kamar yang lain!');
        jk:=0;
        end;
        end;

end;
{==============================================================================================================}
procedure editdata;
    begin
        clrscr;
        repeat
            begin
            t2:=0;
            JenisKamar:=FP.jenisk[wanted];
            kamaran(JenisKamar);
            slotkamar2b4(hk);
            writeln('=================================================');
            writeln('Silahkan isi formulir yang tersedia dibawah ini :');
            writeln('=================================================');
            write('Nama         : ');
            readln(Nama);
                repeat
                    begin
                    jk:=1;
                    write('Jenis Kamar  : ');
                    readln(JenisKamar);
                    kamaran(JenisKamar);
                    slotkamar2(hk);
                    end;
                until jk=1;
            write('Jumlah Malam : ');
            readln(JumlahHari);
            simpanan2(Nama,JenisKamar,JumlahHari,wanted);
            Konfirmasi2;
            writeln('============================================================');
            writeln('>1 untuk melanjutkan >2 untuk memperbaiki');
                repeat
                    begin
                    t:=1;
                    write('>');
                    readln(x);
                    case x of
                        1:t2:=1;
                        2:t:=1;
                    else
                        begin
                        writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
                        t:=0;
                        end;
                    end;
                    end;
                until t=1;
            end;
        until t2=1;
        databasher(n);
    end;
{==============================================================================================================}
function seqsearch2(x:integer):integer;
var
i: Integer;
begin
i:=1;
while (FP.jumhari[i]<>x) do
    i:=i+1;
    if FP.jumhari[i]=x then
        seqsearch2:=i
    else
        seqsearch2:=0;
end;
{==============================================================================================================}
procedure searching2(x:integer);
begin
    write('Jumlah malam yang akan dicari :');
    readln(x);
    wanted:=seqsearch2(x);
    if wanted<>0 then
        begin
            writeln('Jumlah malam ',x,' terdapat pada no. pelanggan ke ',FP.IDpel[wanted]);
            writeln('Apakah anda ingin mengedit kembali data yang telah dimasukkan ?');
            writeln;
            writeln('>1 untuk ya >2 untuk melanjutkan >3 untuk kembali ke database');
            write('>');
            readln(x);
            repeat
                begin
                t:=1;
                case x of
                    1 : editdata;
                    2 : t:=1;
                    3 : databasher(n);
                else
                    begin
                    writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
                    t:=0;
                    end;
                end;
                end;
            until t=1;
        end
    else
        begin
        write('Jumlah malam yang dicari tidak ditemukan');
        delay(3000);
        databasher(n);
        end;
    writeln;
    writeln('Apakah anda ingin menghapus data yang telah dimasukkan ?');
    writeln('>1 untuk ya >2 untuk tidak dan kembali ke database');
    write('>');
    readln(x);
    repeat
        begin
        t:=1;
        case x of
            1 : deletedata;
            2 : t:=1;
        else
            begin
            writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
            t:=0;
            end;
        end;
        end;
    until t=1;
    databasher(n);
end;
{==============================================================================================================}
function pilihmenu3(x:integer):string;
begin
    case x of
        1 : databasher(n);
        2 : searching1(x);
        3 : searching2(x);
    end;
end;
{==============================================================================================================}
procedure menu_searching;
begin
    clrscr;
    writeln('========================== BAGIAN SEARCHING ==============================');
    writeln('==========================================================================');
    writeln('    >1 untuk kembali  >2 untuk search nama >3 untuk search jumlah malam   ');
    writeln('==========================================================================');
    repeat
        write('>');
        readln(x);
        if (x=1) or (x=2) or (x=3) then
            t:=1
        else
        begin
        writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
        t:=0
        end;
    until t=1;
    pilihmenu3(x);

end;
{==============================================================================================================}
function pilihmenu2(x:integer):string;
    begin
            case x of
                    1 : menu_utama;
                    2 : bubblesort;
                    3 : menu_searching;
                    end;
    end;
{==============================================================================================================}
procedure databasher(n:integer);
begin
    clrscr;
    n:=10;
    writeln('==========================================================================');
    writeln('|                      DATABASE PEMESAN KAMAR HOTEL                      |');
    writeln('==========================================================================');
    writeln('| ID Pelanggan | Nama pemesan            | Jenis Kamar | Durasi Menginap |');
    writeln('|========================================================================|');
    show(n);
    writeln('==========================================================================');
    writeln('  >1 untuk kembali ke menu utama~ >2 untuk sort nama >3 untuk searching   ');
    writeln('==========================================================================');
    repeat
        write('>');
        readln(x);
        if (x=1) or (x=2) or (x=3) then
            t:=1
        else
        begin
        writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
        t:=0
        end;
    until t=1;
    pilihmenu2(x);
end;
{==============================================================================================================}
function pilihmenu(x:integer):string;
    begin
            case x of
                    1 : Pemesanan_kamarmenu(m);
                    2 : listharga;
                    3 : listhargaservismenu;
                    4 : tampilanslotkamar;
                    5 : databasher(n);
                    6 : ending;
                    end;
    end;
{==============================================================================================================}
procedure Pemesanan_kamarmenu(m:char);
    begin
    clrscr;
    writeln;
    bed:=0;
    bf:=0;
    repeat
            begin
            writeln('=================================================');
            writeln('Silahkan isi formulir yang tersedia dibawah ini :');
            writeln('=================================================');
            write('Nama         : ');
            readln(Nama);
            repeat
                begin
                jk:=1;
                write('Jenis Kamar  : ');
                readln(JenisKamar);
                kamaran(JenisKamar);
                slotkamar(hk);
                end;
            until jk=1;
            write('Jumlah Malam : ');
            readln(JumlahHari);
            simpanhargahari(JenisKamar,JumlahHari);
            simpanan(Nama,JenisKamar,JumlahHari,counter);
            Konfirmasi;
            writeln('============================================================');
            writeln('>1 untuk melanjutkan >2 untuk memperbaiki');
            repeat
            begin
                t:=1;
                write('>');
                readln(x);
                searchkosong(FP.nama,FP.jenisk,FP.jumhari);
                writeln;
                case x of
                    1: t2:=1;
                    2: t:=1;
                    3: t:=1;
                else
                    writeln('Angka yang anda masukkan salah! lakukan dengan format angka!');
                    t:=0;
                    end;
            end;
            until t=1;
            end;
    until t2=1;
    ekstras(m);
    simpananextra(bed,bf);
    biayakamar(HM);
    konfirmasiterakhir;
    counter:=counter+1;
    menu_utama;
    end;
{==============================================================================================================}
function slotkamar(hk:longint):integer;
begin
    case hk of
        500000 : slotSD:=slotSD-1;
        350000 : slotD1:=slotD1-1;
        300000 : slotD2:=slotD2-1;
        200000 : slotR:=slotR-1;
    else
        begin
        writeln('Slot kamar telah habis! pilih kamar yang lain!');
        jk:=0;
        end;
        end;

end;
{==============================================================================================================}
procedure konfirmasiterakhir();
begin
    clrscr;
    writeln('===================================================');
    writeln('Pesanan yang anda masukkan, akan kami proses segera');
    writeln('===================================================');
    writeln('ID Pelanggan: ',FP.IDpel[counter]);
    writeln('Nama        : ',FP.nama[counter]);
    writeln('Jenis Kamar : ',FP.jenisk[counter]);
    writeln('Jumlah Malam: ',FP.jumhari[counter]);
    writeln('Extra Bed   : ',FP.ekstrabed[counter]);
    writeln('Breakfast   : ',FP.ekstrabf[counter]);
    writeln('Check-in    : ',FP.checkin[counter]);
    writeln('Check-out   : ',FP.checkout[counter]);
    writeln('===================================================');
    writeln('             >enter untuk melanjutkan              ');
    writeln('===================================================');
    totalseluruh(hs,totalhargakamarmain);
    readln;
end;
{==============================================================================================================}
procedure totalseluruh(hs:longint; var totalhargakamarmain:real);
    var
        total: Real;
    begin
        total:=hs+totalhargakamarmain;
        writeln('Total dari seluruh pesanan anda adalah Rp.',total:0:0);
        writeln('Mohon lakukan pembayaran pada kasir terdekat~');
        writeln('===================================================');
        total:=0;
    end;
{==============================================================================================================}
procedure kamaran(JenisKamar:string);
    begin
 case JenisKamar of
    'Super Deluxe':   hk:=SuperDeluxe;
    'superdeluxe':   hk:=SuperDeluxe;
    'Superdeluxe':   hk:=SuperDeluxe;
    'SuperDeluxe':   hk:=SuperDeluxe;
    'superDeluxe' :   hk:=SuperDeluxe;
    'Super deluxe' :   hk:=SuperDeluxe;
    'super Deluxe' :   hk:=SuperDeluxe;
    'super deluxe':   hk:=SuperDeluxe;
    'Deluxe Single Bed':   hk:=Deluxe1Bed;
    'deluxe single bed':   hk:=Deluxe1Bed;
    'DeluxeSingleBed':   hk:=Deluxe1Bed;
    'Deluxesinglebed':   hk:=Deluxe1Bed;
    'Deluxe singlebed':   hk:=Deluxe1Bed;
    'Deluxe Double Bed':   hk:=Deluxe2Bed;
    'deluxe double bed' :   hk:=Deluxe2Bed;
    'DeluxeDoubleBed':   hk:=Deluxe2Bed;
    'deluxedoublebed':   hk:=Deluxe2Bed;
    'Deluxe doublebed' :   hk:=Deluxe2Bed;
    'Regular' :   hk:=Regular;
    'regular' :   hk:=Regular;
    'Reguler':   hk:=Regular;
    'reguler' :   hk:=Regular;
    else
    writeln('Inputan yang anda masukkan kurang tepat! coba masukkan inputan sesuai list harga.');
    jk:=0;
        end;
    end;
{==============================================================================================================}
procedure HariMasukan(HM:string);
    begin
            case HM of
                    'Senin' : harian:=1;
                    'senin' : harian:=1;
                    'Selasa': harian:=2;
                    'selasa': harian:=2;
                    'Rabu'  : harian:=3;
                    'rabu'  : harian:=3;
                    'Kamis' : harian:=4;
                    'kamis' : harian:=4;
                    'Jumat' : harian:=5;
                    'jumat' : harian:=5;
                    'Sabtu' : harian:=6;
                    'sabtu' : harian:=6;
                    'Minggu': harian:=7;
                    'minggu': harian:=7;
            else
                writeln('Inputan yang anda masukkan kurang tepat! coba masukkan inputan diawali dengan kapital.');
                jk:=0;
            end;
    end;
{==============================================================================================================}
function Harikeluar(sampai:integer):string;
begin
    case sampai of
        1 : checkout2:='Senin';
        2 : checkout2:='Selasa';
        3 : checkout2:='Rabu';
        4 : checkout2:='Kamis';
        5 : checkout2:='Jumat';
        6 : checkout2:='Sabtu';
        7 : checkout2:='Minggu';
    end;
end;
{==============================================================================================================}
procedure simpancheckout(sampai:integer);
begin
    Harikeluar(sampai);
    FP.checkout[counter]:=checkout2;
end;
{==============================================================================================================}
procedure biayakamar(HM:string);
    var
            totalhargakamar: real;
    begin
            totalhargakamar:=0;
            totalhargakamarmain:=0;
            writeln;
            Repeat
                begin
                jk:=1;
                writeln('Masukkan Hari Masuk :');
                readln(HM);
                HariMasukan(HM);
                end;
            until jk=1;
            FP.checkin[counter]:=HM;
            sampai:=harian+JumlahHari;
            repeat
             begin
                totalhargakamar:=totalhargakamar+tabhari[harian];
                harian:=harian+1;
                if harian>7 then
                    begin
                    sampai:=sampai-7;
                    harian:=1;
                    end;
             end;
            until harian=sampai;
            totalhargakamarmain:=totalhargakamar;
            simpancheckout(sampai);
    end;
{==============================================================================================================}
procedure ekstras(m:char);
    begin
    writeln;
    writeln('Apakah ada servis ekstra yang ingin anda tambahkan ?');
    writeln('>1 untuk ada >2 untuk melanjutkan');
    repeat
    begin
    write('>');
    readln(x);
    if x=1 then
            begin
                writeln;
                writeln('Apakah anda ingin kembali melihat menu list harga ekstra servis ?');
                writeln('>1 untuk melihat kembali list harga >2 untuk melanjutkan');
                repeat
                begin
                write('>');
                readln(x);
                        if x=1 then
                                begin
                                t:=1;
                                listhargaservis;
                                readln;
                                hargaservis(m);
                                end
                        else if x=2 then
                        begin
                        t:=1;
                        hargaservis(m);
                        end
                        else
                        begin
                            writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
                            t:=0
                        end;

                end;
                until t=1;
            end
    else if x=2 then
        t:=1
    else
        begin
            writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
            t:=0
        end;
    end;
    until t=1;
    end;
{==============================================================================================================}
procedure hargaservis(m:char);
    begin
    writeln;
    if (JenisKamar='Deluxe Double Bed') then
        repeat
            begin
            clrscr;
            bed:=0;
            writeln('==================================================');
            writeln('Dikarenakan anda memesan Deluxe Double Bed maka');
            writeln('Pemesanan extra bed tidak dapat dilakukan saat ini');
            writeln('==================================================');
            writeln('|Berapa jumlah breakfast yang anda inginkan ?');
            writeln('==================================================');
            readln(bf);
            hs:=(bed*ExtraBed)+(bf*Breakfast);
            writeln('==================================================');
            writeln('|Total dari harga servis yang anda tambahkan adalah ',hs);
            writeln('==================================================');
            writeln('|Apakah tambahan layanan yang anda masukkan benar ?');
            writeln('==================================================');
            writeln('>1 untuk benar >2 untuk salah');
            write('>');
            readln(x);
            if x=1 then
                    t:=1
            else if x=2 then
                    t:=0;
            end;
        until t=1
    else
        repeat
            begin
            clrscr;
            writeln('==================================================');
            writeln('|Berapa banyak ExtraBed yang akan anda pesan ?');
            writeln('==================================================');
            readln(bed);
            writeln('==================================================');
            writeln('|Berapa jumlah breakfast yang anda inginkan ?');
            writeln('==================================================');
            readln(bf);
            hs:=(bed*ExtraBed)+(bf*Breakfast);
            writeln('==================================================');
            writeln('|Total dari harga servis yang anda tambahkan adalah ',hs);
            writeln('==================================================');
            writeln('|Apakah tambahan layanan yang anda masukkan benar ?');
            writeln('==================================================');
            writeln('>1 untuk benar >2 untuk salah');
            write('>');
            readln(x);
            if x=1 then
                    t:=1
            else if x=2 then
                    t:=0;
            end;
        until t=1;
    end;
{==============================================================================================================}
procedure tampilanslotkamar;
    begin
        clrscr;
        writeln('======================================================================');
        writeln('Sisa slot kamar kosong pada Super Deluxe      adalah ',slotSD,' kamar.');
        writeln('Sisa slot kamar kosong pada Deluxe Single Bed adalah ',slotD1,' kamar.');
        writeln('Sisa slot kamar kosong pada Deluxe Double Bed adalah ',slotD2,' kamar.');
        writeln('Sisa slot kamar kosong pada Regular           adalah ',slotR,' kamar.');
        writeln('|======================= >enter untuk kembali =======================|');
        readln;
        menu_utama;
    end;
{==============================================================================================================}
procedure menu_utama;
    begin
    clrscr;
    writeln;
    writeln('======================================================');
    writeln('===================== MENU UTAMA =====================');
    writeln('Instruksi  : >x artinya masukkan x untuk memilih opsi!');
    writeln('======================================================');
    writeln;
    writeln('>1 Pesan kamar');
    writeln('>2 List harga kamar');
    writeln('>3 List harga ekstra servis');
    writeln('>4 Slot kamar pada tiap jenis kamar');
    writeln('>5 Database pelanggan');
    writeln('>6 Keluar Program');
    writeln;
    repeat
        write('>');
        readln(x);
        if (x=1) or (x=2) or (x=3) or (x=4) or (x=5) or (x=6) then
            t:=1
        else
            begin
            writeln('Angka yang anda masukkan salah! lakukan dengan format angka yang tersedia!');
            t:=0
            end;
    until t=1;
    pilihmenu(x);
    end;
{==============================================================================================================}
procedure welcome;
begin
    textcolor(white);
    writeln('^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^');
    writeln('I[][][][][][][][][][][][][][][][][][][][][][I');
    writeln('I  ________  [][] [TELKOM] [][]  ________   I');
    writeln('I  [  ||  ]   ][HOTELVERSITY][   [  ||  ]   I');
    writeln('I  [  ||  ]  [][][][][][][][][]  [  ||  ]   I');
    write('I  [__||__]  [][]');textcolor(red);write('##########');textcolor(white);writeln('[][]  [__||__]   I');
    write('I  +_+_+_+_  [][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][]  _+_+_+_+   I');
    write('I[][][][][][][][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][][][][][][][][I');
    write('I[][][][][][][][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][][][][][][][][I');
    write('I  ________  [][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][]  ________   I');
    write('I  [  ||  ]  [][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][]  [  ||  ]   I');
    writeln('I  [  ||  ]  [][][][][][][][][]  [  ||  ]   I');
    writeln('I  [__||__]  [][][][][][][][][]  [__||__]   I');
    writeln('I  +_+_+_+_  [][][][][][][][][]  _+_+_+_+   I');
    writeln('I[][][][][][][________________][][][][][][][I');
    writeln('I[][][][][][][|      ||      |][][][][][][][I');
    writeln('I[][][][][][][| Were ||  24  |][][][][][][][I');
    writeln('I[][][][][][][| Open[||]Hours|][][][][][][][I');
    writeln('I[][][][][][][|      ||      |][][][][][][][I');
    writeln('I[][][][][][][|______||______|][][][][][][][I');
    writeln('I[][][][][][____________________][][][][][][I');
    writeln;
    textcolor(white);
    writeln('>enter untuk melanjutkan kebagian menu');
    readln;
end;
{==============================================================================================================}
procedure ending;
begin
    clrscr;
    textcolor(white);
    writeln('^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^');
    writeln('I[][][][][][][][][][][][][][][][][][][][][][I');
    writeln('I  ________  [][] [TELKOM] [][]  ________   I');
    writeln('I  [  ||  ]   ][HOTELVERSITY][   [  ||  ]   I');
    writeln('I  [  ||  ]  [][][][][][][][][]  [  ||  ]   I');
    write('I  [__||__]  [][]');textcolor(red);write('##########');textcolor(white);writeln('[][]  [__||__]   I');
    write('I  +_+_+_+_  [][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][]  _+_+_+_+   I');
    write('I[][][][][][][][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][][][][][][][][I');
    write('I[][][][][][][][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][][][][][][][][I');
    write('I  ________  [][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][]  ________   I');
    write('I  [  ||  ]  [][][][]');textcolor(red);write('##');textcolor(white);writeln('[][][][]  [  ||  ]   I');
    writeln('I  [  ||  ]  [][][][][][][][][]  [  ||  ]   I');
    writeln('I  [__||__]  [][][][][][][][][]  [__||__]   I');
    writeln('I  +_+_+_+_  [][][][][][][][][]  _+_+_+_+   I');
    writeln('I[][][][][][][________________][][][][][][][I');
    writeln('I[][][][][][][|      ||      |][][][][][][][I');
    writeln('I[][][][][][][| Were ||  24  |][][][][][][][I');
    writeln('I[][][][][][][| Open[||]Hours|][][][][][][][I');
    writeln('I[][][][][][][|      ||      |][][][][][][][I');
    writeln('I[][][][][][][|______||______|][][][][][][][I');
    writeln('I[][][][][][____________________][][][][][][I');
    writeln;
    writeln('Terimakasih telah menggunakan program ini~');
    writeln('Program ini dibuat dengan usaha dan cinta dari programmer');
    Textcolor(LightBlue);
    writeln('yang bernama muhammad ravli ramadhan >xeroxleft');
    delay(400);
end;
{==============================================================================================================}
BEGIN
clrscr;
    counter:=1;
    slotSD:=3;
    slotD1:=3;
    slotD2:=3;
    slotR :=3;
    welcome;
    menu_utama;
readln;
END.

























