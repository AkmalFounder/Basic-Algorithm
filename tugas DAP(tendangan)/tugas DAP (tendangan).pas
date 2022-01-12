program Tendangan;
uses crt;
var
        angka   :integer;

function is_kelipatan2(angka: integer):boolean;
begin
        if angka mod 2=0 then
                angka:=true
        else
                angka:=false;
end;
function is_kelipatan5(angka:integer):boolean;

begin
        if angka mod 5=0 then;
                angka:=true;

        else
                angka:=false;
end;
function is_ganjil(angka:integer):boolean;

begin
        if angka mod 2=1 then
                angka:=true;
        else
                angka:=false;
end;
{program utama}
program bola;
var
        n,i,skorM,skorDG,indeks,letakBola     :integer;
begin
        clrscr;
        skorM:=0;
        skorDG:=0;
        for indeks:=1 to 5 do
        begin
                writeln('masukan letak bola: ');
                readln(letakbola);
                skorM:=skorM + 1;
                skor:=skor + 1;
                if (is_kelipatan5(letakBola))then;
                        writeln('tendangan terlalu ke atas');
                        skorDG:=skorDG + 1;
                        else if (is_kelipatan2(letakBola));
                                writeln('tendangan terlalu ke kiri atau ke kanan');
                                skorDG:=skorDG + 1;
                else(is_ganjil(letakBola));
                        writeln('tendangan tepat sasaran');
                        skorM:=skorM + 1;
        end;
        writeln('skor akhir  ',skorM,'untuk Marcus',skorDG,'untuk Degea');
        if skorM > skorDG then
                writeln('superb Marcus');
        else
                writeln('well Done De Gea');
        readln;
end.

