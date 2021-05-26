program kata;
uses crt;
const Nmax=97;
type tabel=array[1..Nmax]of string;
var
        tabstring:tabel;
        i,kata1,j:integer;
        kata2   :string;
begin
        writeln('Masukan jumlah kata: ');
        readln(kata1);
        i:=1;
        repeat
        begin
                writeln('kata ',i,' : ');
                readln(tabstring[i]);
                i:=i+1;
        end;
        until (i>kata1);
        writeln('kata yang dicari: ');
        readln(kata2);
        j:=1;
        repeat
                if tabstring[j]=kata2 then
                        writeln('posisi saya ada pada indeks: ',j);
                j:=j+1;
        until (j>kata1);
        readln;
end.