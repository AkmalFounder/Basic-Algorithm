program tiga;
uses crt;
var
       angka: integer;

begin

        readln(angka);
        if (angka>70) then
                writeln('A')
        else
                if(angka>60) then
                writeln('B')
         else
                writeln('C');
         writeln('selesai');
end.
