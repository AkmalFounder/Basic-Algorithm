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
TYPE
        formatpesan=record
                IDpel:array[1..10] of longint;
                nama:array[1..10] of string[30];
                jenisk:array[1..10] of string[30];
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
        pilihan,temp,checkout2:string;
        x,i,n,counter,t,sampai,harian,bed,bf,j:integer;
        totalhargakamarmain:real;
        jawab:boolean;
        tabhari: array [1..7] of real;
        {hasil total}
        hs,hk:longint;
        c,m:char; {m sebagai pemanggil procedure saja}
        {forward}
        procedure menu_utama; forward;
        procedure Pemesanan_kamarmenu; forward;
        procedure ekstras;       forward;
        procedure hargaservis; forward;
        function kamaran(JenisKamar:string):longint; forward;
        procedure biayakamar; forward;
        procedure totalseluruh; forward;
        procedure konfirmasiterakhir; forward;
        function slotkamar(JenisKamar:string):integer; forward;
        procedure tampilanslotkamar; forward;
        procedure databasher; forward;
        function harikeluar(sampai:integer):string; forward;
{==============================================================================================================}
procedure simpanhargahari;
        begin
                tabhari[1]:= hk*1;
                tabhari[2]:= hk*1;
                tabhari[3]:= hk*1;
                tabhari[4]:= hk*1;
                tabhari[5]:= hk*1;
                tabhari[6]:= hk*Weekend;
                tabhari[7]:= hk*Weekend;
        end;
{==============================================================================================================}
procedure simpananextra(bed,bf:integer);
        begin
            FP.ekstrabed[counter]:=bed;
            FP.ekstrabf[counter]:=bf;
        end;
{==============================================================================================================}
procedure simpanan(Nama,JenisKamar:string; var JumlahHari,counter:integer);
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
                writeln();
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
procedure bubblesort;
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
        writeln('| ',FP.nama[i]);
    end;
    writeln('==========================================================================');
    writeln('|            Input apa saja untuk kembali ke Tabel Sebelumnya            |');
    writeln('==========================================================================');
    readln;
    databasher;
    end;
{==============================================================================================================}
procedure show;
    begin
        for i:=1 to 10 do
        begin
           writeln('| ',FP.IDpel[i],' | ',FP.nama[i],' | ',FP.jenisk[i],' | ',FP.jumhari[i],' Malam |');
        end;
    end;
{==============================================================================================================}
function seqsearch(x:integer):integer;
var
    i: Integer;
begin
    i:=1;
    while (FP.jumhari[i]<>x) do
        i:=i+1;
        if FP.jumhari[i]=x then
            seqsearch:=i
        else
            seqsearch:=0;
end;
{==============================================================================================================}
procedure searching;
    var
        wanted: Integer;
    begin
        write('Jumlah malam yang akan dicari :');
        readln(x);
        wanted:=seqsearch(x);
        if wanted<>0 then
            write('Jumlah malam ',x,' terdapat pada indeks ke ',wanted)
        else
            write('x tidak ditemukan');
            delay(10000);
            databasher;

    end;
{==============================================================================================================}
function pilihmenu2(x:integer):string;
        begin
                case x of
                        1 : menu_utama;
                        2 : bubblesort;
                        3 : searching;
                        end;
        end;
{==============================================================================================================}
procedure databasher;
    begin
        clrscr;
        writeln('==========================================================================');
        writeln('|                      DATABASE PEMESAN KAMAR HOTEL                      |');
        writeln('==========================================================================');
        writeln('| ID Pelanggan | Nama pemesan            | Jenis Kamar | Durasi Menginap |');
        writeln('|========================================================================|');
        show;
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
            writeln('Inputan yang anda masukkan salah! lakukan dengan format angka!');
            t:=0
            end;
        until t=1;
        pilihmenu2(x);
    end;
{==============================================================================================================}
function pilihmenu(x:integer):string;
        begin
                case x of
                        1 : Pemesanan_kamarmenu;
                        2 : listharga;
                        3 : listhargaservismenu;
                        4 : tampilanslotkamar;
                        5 : databasher;
                        6 : writeln('Terimakasih telah menggunakan program ini~');
                        end;
        end;
{==============================================================================================================}
procedure Pemesanan_kamarmenu;
        begin
        clrscr;
        writeln();
        bed:=0;
        bf:=0;
        repeat
                begin
                writeln('=================================================');
                writeln('Silahkan isi formulir yang tersedia dibawah ini :');
                writeln('=================================================');
                write('Nama         : ');
                readln(Nama);
                write('Jenis Kamar  : ');
                readln(JenisKamar);
                slotkamar(JenisKamar);
                kamaran(JenisKamar);
                simpanhargahari;
                write('Jumlah Malam : ');
                readln(JumlahHari);
                simpanan(Nama,JenisKamar,JumlahHari,counter);
                Konfirmasi;
                writeln('============================================================');
                writeln('>1 untuk melanjutkan >2 untuk memperbaiki');
                write('>');
                readln(x);
                writeln;
                if x=1 then
                        t:=1
                else if x=2 then
                        t:=0;
                end;
        until t=1;
        ekstras;
        simpananextra(bed,bf);
        biayakamar;
        konfirmasiterakhir;
        counter:=counter+1;
        menu_utama;
        end;
{==============================================================================================================}
function slotkamar(JenisKamar:string):integer;
begin
    if JenisKamar='Super Deluxe' then
        slotSD:=slotSD-1;
    if JenisKamar='Deluxe Single Bed' then
        slotD1:=slotD1-1;
    if JenisKamar='Deluxe Double Bed' then
        slotD2:=slotD2-1;
    if JenisKamar='Regular' then
        slotR:=slotR-1;
end;
{==============================================================================================================}
procedure konfirmasiterakhir();
begin
        clrscr;
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
        writeln('             >enter untuk melanjutkan             ');
        writeln('===================================================');
        totalseluruh;
        readln;
end;
{==============================================================================================================}
procedure totalseluruh;
        var
            total: Real;
        begin
            total:=hs+totalhargakamarmain;
            writeln('Total dari seluruh pesanan anda adalah Rp.',total:0:0);
            writeln('Mohon lakukan pembayaran pada kasir terdekat~');
            writeln('===================================================');
        end;
{==============================================================================================================}
function kamaran(JenisKamar:string):longint;
        begin
                case JenisKamar of
                        'Super Deluxe': hk:=SuperDeluxe;
                        'Deluxe Single Bed': hk:=Deluxe1Bed;
                        'Deluxe Double Bed': hk:=Deluxe2Bed;
                        'Regular': hk:=Regular;
                end;
        end;
{==============================================================================================================}
function HariMasukan(HM:string):integer;
        begin
                case HM of
                        'Senin' : harian:=1;
                        'Selasa': harian:=2;
                        'Rabu'  : harian:=3;
                        'Kamis' : harian:=4;
                        'Jumat' : harian:=5;
                        'Sabtu' : harian:=6;
                        'Minggu': harian:=7;
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
procedure simpancheckout;
    begin
        Harikeluar(sampai);
        FP.checkout[counter]:=checkout2;
    end;
{==============================================================================================================}
procedure biayakamar;
        var
                totalhargakamar: real;
        begin
                totalhargakamar:=0;
                writeln;
                writeln('Masukkan Hari Masuk :');
                readln(HM);
                FP.checkin[counter]:=HM;
                HariMasukan(HM);
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
                simpancheckout;
        end;
{==============================================================================================================}
procedure ekstras;
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
                                    hargaservis;
                                    end
                            else if x=2 then
                            begin
                            t:=1;
                            hargaservis;
                            end
                            else
                            begin
                                writeln('Inputan yang anda masukkan salah! lakukan dengan format angka!');
                                t:=0
                            end;

                    end;
                    until t=1;
                end
        else if x=2 then
            t:=1
        else
            begin
                writeln('Inputan yang anda masukkan salah! lakukan dengan format angka!');
                t:=0    
            end;
        end;
        until t=1;
        end;
{==============================================================================================================}
procedure hargaservis;
        begin
        writeln;
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
                writeln('*1* YA *2* TIDAK');
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
                writeln('Inputan yang anda masukkan salah! lakukan dengan format angka!');
                t:=0
                end;
        until t=1;
        pilihmenu(x);
        end;
{==============================================================================================================}
procedure incremen_satu;
begin
        counter:=1;
        slotSD:=10;
        slotD1:=10;
        slotD2:=10;
        slotR :=10; 
end;
{==============================================================================================================}
procedure welcome;
    begin
        writeln('^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^');
        writeln('I[][][][][][][][][][][][][][][][][][][][][][I');
        writeln('I  ________  [][] [TELKOM] [][]  ________   I');
        writeln('I  [  ||  ]   ][HOTELVERSITY][   [  ||  ]   I');
        writeln('I  [  ||  ]  [][][][][][][][][]  [  ||  ]   I');
        writeln('I  [__||__]  [][]##########[][]  [__||__]   I');
        writeln('I  +_+_+_+_  [][][][]##[][][][]  _+_+_+_+   I');
        writeln('I[][][][][][][][][][]##[][][][][][][][][][][I');
        writeln('I[][][][][][][][][][]##[][][][][][][][][][][I');
        writeln('I  ________  [][][][]##[][][][]  ________   I');
        writeln('I  [  ||  ]  [][][][]##[][][][]  [  ||  ]   I');
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
        writeln('>enter untuk melanjutkan kebagian menu');
        readln;
    end;
{==============================================================================================================}
BEGIN
clrscr;
        incremen_satu;
        welcome;
        menu_utama;
readln;
END.
























