program tebakangka;
uses crt;
var
        angka   :integer;
begin
        clrscr;
        writeln('tebak angka');
        repeat
                writeln('masukan tebakan anda: ');
                readln(angka);
                if (angka<100) then
                writeln('belum max');
        until(angka>100);
        writeln('kelebihan dari 100');
readln;
end.
