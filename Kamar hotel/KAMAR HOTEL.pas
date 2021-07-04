uses crt;
const
        superdeluxe=625000;
type
hotel=record
kelas,lamamenginap,bTambah,biayatambah:integer;
namaPlg:string;
uang:longint;
YN      :char;

end;
var

h:hotel;

hr:array[1..7] of longint;
bt:array[1..2] of longint;

total,kembali:real;
disc:real;


procedure MenuPrice();forward;
procedure MenuExtraPrice();forward;
procedure totalharga1();forward;
procedure totalharga2();forward;

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

//case h.biayatambah of
//1:bt[1];
//2:bt[2];
//end;

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
readln;
end;

procedure totalharga1();
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
readln;
end;

begin
clrscr;
MenuPrice();
END.
