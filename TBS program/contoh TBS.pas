program tubescoba;
uses crt;
        const
              nik     :12;
 type
 penduduk=record
 nik,nama,alamat,gender,agama,kawin:string;
 usia:integer;
 end;
var
 x,i:integer;
 p:array [1..1000] of penduduk;
 arsippen : file of penduduk;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------

 procedure pembukaan;
 begin
 clrscr;
 writeln('*************************************');
 writeln('** **');
 writeln('** SELAMAT DATANG DI **');
writeln('** PROGRAM DATA PENDUDUK **');
 writeln('** "HOGWARTS CITY" **');
 writeln('** **');
writeln('**---------------------------------**');
 writeln('** **');
 writeln('** SILAHKAN TEKAN TOMBOL ENTER **');
writeln('** UNTUK MELANJUTKAN **');
 writeln('** **');
 writeln('** **');
writeln('** 21.11.2017 **');
 writeln('** ulya mahsa anandiwa **');
writeln('** **');
 writeln('*************************************');
 readln;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 function cariNik(n : string): integer;
 var
 j,temp: Integer;
 found : boolean;
 begin
 found:= false;
 temp:= -1;
 j:=1;
 while (not found) and (J<=i) do
begin
 if (p[j].nik = n) and (n <> '') then
begin
 found := true;
 temp := j;
 end
else
 j:= j+1;
 end;
 cariNik := temp;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure tampilanbio(index : integer);
 begin
 clrscr;
 writeln('**********************************************');
 writeln('** INFO BIODATA PENDUDUK **');
 writeln('** "HOGWARTS CITY" **');
writeln('**------------------------------------------**');
 writeln('** **');
 writeln('** 1. NIK : ',p[index].nik);
writeln('** 2. Nama : ',p[index].nama);
 writeln('** 3. Usia : ',p[index].usia,' tahun');
 writeln('** 4. Alamat : ',p[index].alamat);
writeln('** 5. jenis Kelamin (P/L) : ',p[index].gender);
 writeln('** 6. Agama : ',p[index].agama);
writeln('** 7. Status kawin : ',p[index].kawin);
 writeln('** **');
 writeln('**********************************************');
writeln('');
 writeln('**********************************************');
 writeln('** TEKAN ENTER UNTUK KELUAR **');
writeln('**********************************************');
 readln;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure biotidakada;
 begin
 clrscr;
 writeln('****************************************');
 writeln('** **');
 writeln('** BIODATA PENDUDUK **');
 writeln('** TIDAK ADA ATAU TELAH DIHAPUS **');
 writeln('** **');
 writeln('****************************************');
 writeln('');
 writeln('****************************************');
 writeln('** TEKAN ENTER UNTUK KELUAR **');
 writeln('****************************************');
 readln;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure menulihatbio;
 var
 xnik: string;
 index : integer;
 begin
 clrscr;
 writeln('********************************************');
 writeln('** **');
 writeln('** SELAMAT DATANG **');
 writeln('** SILAHKAN MASUKKAN NOMOR NIK ANDA UNTUK **');
 writeln('** MELIHAT INFO BIODATA **');
 writeln('** **');
 writeln('********************************************');
 write ('Masukkan nomor NIK anda : ');readln(xnik);
 index := cariNik(xnik);
 if index <> -1 then
 tampilanbio(index)
 else
 biotidakada;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure berhasiledit;
 begin
 clrscr;
 writeln('****************************************');
 writeln('** **');
 writeln('** BIODATA PENDUDUK **');
 writeln('** TELAH BERHASIL DIEDIT **');
 writeln('** **');
 writeln('****************************************');
 writeln('');
 writeln('****************************************');
 writeln('** TEKAN ENTER UNTUK KELUAR **');
 writeln('****************************************');
 readln;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure menueditbio2(index:integer);
 var
 yt : char;
 begin
 clrscr;
 writeln('**********************************************');
writeln('** INFO BIODATA PENDUDUK **');
 writeln('** "HOGWARTS CITY" **');
writeln('**------------------------------------------**');
 writeln('** 1. NIK : ',p[index].nik);
 writeln('** 2. Nama : ',p[index].nama);
writeln('** 3. Usia : ',p[index].usia,' tahun');
 writeln('** 4. Alamat : ',p[index].alamat);
 writeln('** 5. jenis Kelamin (P/L) : ',p[index].gender);
writeln('** 6. Agama : ',p[index].agama);
 writeln('** 7. Status kawin : ',p[index].kawin);
 writeln('**------------------------------------------**');
writeln('** PENGEDITAN BIODATA PENDUDUK **');
 writeln('**------------------------------------------**');
 write ('** 1. NIK : ');readln(p[index].nik);
write ('** 2. Nama : ');readln(p[index].nama);
 write ('** 3. Usia : ');readln(p[index].usia);
write ('** 4. Alamat : ');readln(p[index].alamat);
 write (
 '** 5. jenis Kelamin (P/L) : ');readln(p[index].gender);
 write ('** 6. Agama : '); readln(p[index].agama);
 write ('** 7. Status kawin : '); readln(p[index].kawin);
writeln('**********************************************');
 write('Apakah anda yakin akan mengedit biodata ini ? (y/t): ');
 readln(yt);
 repeat

if yt='y' then
 berhasiledit
 else
 menueditbio2(index);
 until (yt='y') or (yt='t');
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure menueditbio;
 var
 xnik : string;
 index : integer;
 begin
 clrscr;
 writeln('********************************************');
 writeln('** **');
 writeln('** SELAMAT DATANG **');
 writeln('** SILAHKAN MASUKKAN NOMOR NIK ANDA UNTUK **');
 writeln('** MENGEDIT INFO BIODATA **');
 writeln('** **');
 writeln('********************************************');
 write ('Masukkan nomor NIK anda : ');readln(xnik);
 index := cariNik(xnik);
 if index <> -1 then
 begin
menueditbio2(index);
 end;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure telahdiapus;
 begin
 clrscr;
 writeln('****************************************');
 writeln('** **');
 writeln('** BIODATA PENDUDUK ANDA **');
 writeln('** TELAH DIHAPUS **');
 writeln('** **');
 writeln('****************************************');
 writeln('');
 writeln('****************************************');
 writeln('** TEKAN ENTER UNTUK KELUAR **');
 writeln('****************************************');
 readln;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure tampilanapus(index : integer);
 begin
 clrscr;
 writeln('**********************************************');
writeln('** INFO BIODATA PENDUDUK **');
 writeln('**------------------------------------------**');
 writeln('** **');
writeln('** 1. NIK : ',p[index].nik);
 writeln('** 2. Nama : ',p[index].nama);
 writeln('** 3. Usia : ',p[index].usia,' tahun');
writeln('** 4. Alamat : ',p[index].alamat);
 writeln('** 5. jenis Kelamin (P/L) : ',p[index].gender);
 writeln('** 6. Agama : ',p[index].agama);
 writeln('** 7. Status kawin : ',p[index].kawin);
 writeln('** **');
writeln('**********************************************');
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure menuhapusbio;
 var
 xnik,pil : string;
 index,j : integer;
 temp : penduduk;
 begin
 clrscr;
 writeln('********************************************');
 writeln('** **');
 writeln('** SELAMAT DATANG **');
 writeln('** SILAHKAN MASUKKAN NOMOR NIK ANDA UNTUK **');
 writeln('** MENGHAPUS BIODATA PENDUDUK **');
 writeln('** **');
 writeln('********************************************');
 write ('Masukkan nomor NIK anda : ');readln(xnik);
 index := cariNik(xnik);
 if index <> -1 then
 begin
 tampilanapus(index);
 write('Apakah anda yakin akan menghapus biodata ini ? (y/t): ');
 readln(pil);
 if pil='y' then
 begin
 p[index].nik := '';
 p[index].nama := '';
 p[index].usia := 0;
p[index].alamat := '';
p[index].gender := '';
p[index].agama := '';
p[index].kawin := '';
 for j:=1 to i-1 do
 begin
 if (p[j].nik='') and (p[j].nama='') and
(p[j].usia=0) and (p[j].alamat='') and (p[j].gender='') and (p[j].agama='')
and (p[j].kawin='') then
 begin
 temp := p[j];
p[j] := p[j+1];
p[j+1] := temp;
 end;
 end;
 i:=i-1;
telahdiapus;
 end
 else if pil='t' then
 begin
 end;
 end;
 readln;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure sortusia;
 var
 j,k : integer;
 temp2 : penduduk;
 begin
 for j:=1 to i-1 do
 begin
 for k:=i downto j+1 do
 begin
 if (p[k].usia > p[k-1].usia) then
begin
 temp2 := p[k];
p[k] := p[k-1];
p[k-1] := temp2;
 end;
 end;
 end;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure tampilansort;
 var
 m : Integer;
 begin
 for m:=1 to i do
 begin
 sortusia;
if (p[m].nik <> '') then
 tampilanbio(m);
 end;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure menuresmi;
 var
 nmr : integer;
 begin
repeat
 clrscr;
 writeln('**********************************************');
writeln('** **');
 writeln('** -SELAMAT DATANG- **');
 writeln('** Apa yang ingin anda lakukan ? **');
writeln('** 1. Lihat Info Biodata **');
 writeln('** 2. Pengeditan Biodata **');
 writeln('** 3. Hapus Biodata Penduduk **');
 writeln('** 4. Lihat Data Penduduk Berdasarkan **');
 writeln('** Usia Penduduk **');
writeln('** **');
 writeln('** 0. kembali **');
 writeln('** **');
writeln('**********************************************');
 write('Pilih nomor menu : ');readln(nmr);
 case nmr of
 1 : menulihatbio;
2 : menueditbio;
3 : menuhapusbio;
4 : tampilansort;
0 : begin
 end;
 end;
until (nmr=0);
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure selamat;
 begin
 clrscr;
writeln('**********************************************');
 writeln('** **');
writeln('** SELAMAT ANDA TELAH TERDAFTAR **');
 writeln('** MENJADI PENDUDUK : **');
 writeln('** "HOGWARTS CITY" **');
writeln('** **');
 writeln('**********************************************');
 readln;
menuresmi;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure menublmdaftar;
 var
 yt:integer;
 begin
 clrscr;
 writeln('**********************************************');
 writeln('** Nomor NIK anda belum terdaftar, **');
 writeln('** Silahkan isi biodata dibawah ini : **');
writeln('**------------------------------------------**');
 writeln('** BIODATA PENDUDUK **');
writeln('**------------------------------------------**');
 write ('** 1. NIK : ');readln(p[i].nik);
 write ('** 2. Nama : ');readln(p[i].nama);
write ('** 3. Usia : ');readln(p[i].usia);
 write ('** 4. Alamat : ');readln(p[i].alamat);
 write ('** 5. jenis Kelamin (P/L) : ');readln(p[i].gender);
 write ('** 6. Agama : '); readln(p[i].agama);
 write ('** 7. Status kawin : '); readln(p[i].kawin);
writeln('**********************************************');
 writeln('Apakah data yang anda masukan sudah benar ?');
 writeln(' 1. Ya ');
 writeln(' 2. Tidak ');
 write ('Pilih nomor : ');readln(yt);
 if yt=1 then
 begin
 selamat;
write(arsippen,p[i]);
i:=i+1;
 end
 else
 menublmdaftar;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure maafsdhdaftar;
 begin
 clrscr;
 writeln('********************************************');
 writeln('** **');
 writeln('** MOHON MAAF NOMOR NIK **');
 writeln('** YANG ANDA MASUKKAN TELAH TERDAFTAR **');
 writeln('** **');
 writeln('********************************************');
 readln;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure ceksblmdaftar;
 var
 xnik : string;
 index : integer;
 begin
 clrscr;
 writeln('********************************************');
 writeln('** **');
 writeln('** SILAHKAN MASUKKAN NOMOR NIK ANDA UNTUK **');
 writeln('** PENGECEKAN SEBELUM DAFTAR **');
 writeln('** **');
 writeln('********************************************');
 write ('Masukkan nomor NIK anda : ');readln(xnik);
 index := cariNik(xnik);
 if index <> -1 then
 maafsdhdaftar
 else
 menublmdaftar;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure menuutama;
 begin
 repeat
 repeat
 clrscr;
 writeln('******************************************');
writeln('** **');
 writeln('** Apakah anda sudah pernah mendaftar **');
writeln('** sebagai penduduk disini? **');
 writeln('** 1. Sudah pernah mendaftar **');
 writeln('** 2. Belum pernah mendaftar **');
writeln('** **');
 writeln('** **');
 writeln('** 0. Keluar **');
writeln('** **');
 writeln('******************************************');
 write('pilih nomor menu yang anda inginkan : ');readln(x);
 until (x=1) or(x=2) or (x=0);
 if x=1 then
 menuresmi
 else if x=2 then
 ceksblmdaftar;
 until x=0;
 end;
//-------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------
 procedure save;
 var
 n: Integer;
 begin
 for n:=1 to i-1 do
 begin
 write(arsippen,p[n]);
 end;
 end;

BEGIN
 clrscr;
 //pembukaan;
 //menuutama;
 assign(arsippen, 'penduduk.txt');
// reset(arsippen);
 pembukaan;
 menuutama;
 for i:=1 to filesize(arsippen) do
 begin
 read(arsippen,p[i]);
 end;
 rewrite(arsippen);
 save;
 close(arsippen);
END.
