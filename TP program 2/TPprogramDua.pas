program satu;
uses crt;
var

       angka: integer;

begin
        clrscr;
        readln(angka);
        if (angka>70) then
                writeln('A');
        if (angka>60) then
                writeln('B');
        if (angka>50) then
                writeln('C');
        writeln('selesai');
end.