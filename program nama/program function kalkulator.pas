program functioncoba;
uses crt;
var
        a,b     :integer;
        pil     :integer;
function kali(a,b:integer):integer;
begin
        kali:= a * b;
end;
function jumlah(a,b:integer):integer;
begin
        jumlah:= a + b;
end;
function kurang(a,b:integer):integer;
begin;
        kurang:= a - b;
end;
procedure input(var a,b:integer);
begin
        writeln('masukan angka pertama: ');
        readln(a);
        writeln('masukan angka ke dua: ');
        readln(b);
end;
begin
        repeat
        clrscr;
        writeln('menu utama');
        writeln('1. perkalian');
        writeln('2. penjumlahan');
        writeln('3. pengurangan');
        writeln('4. keluar');
        writeln('pilih: ');
        readln(pil);
        case pil of
                1:begin
                        input(a,b);
                        writeln('hasil kali: ',kali(a,b));
                        readln;
                end;
                2:begin
                        input(a,b);
                        writeln('hasil penjumlahan: ',jumlah(a,b));
                readln;
                end;
                3:begin
                        input(a,b);
                        writeln('hasil pengurangan: ',kurang(a,b));
                        readln;
                end;
        end;
        until pil=4;
        readln;
end.
