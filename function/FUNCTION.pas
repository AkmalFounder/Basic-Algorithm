program fungsi;
uses crt;
function luas (a,b:integer)  :integer;
        begin
                luas:= a*b;
        end;
var
        x,y     :integer;
begin
        clrscr;
        writeln('masukan lebar persegi panjang: ');
        readln(x);
        writeln('masukan panjang persegi: ');
        readln(y);
        writeln('luas persegi panjang adalah: ',luas(x,y));
        readln;
end.