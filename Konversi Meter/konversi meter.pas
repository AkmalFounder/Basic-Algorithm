program konversimeter;
uses crt;
var
        c,b     :integer;
        h         :real;
begin
        clrscr;
        write('Masukan angka(CM): ');
        readln(c);
        b:= c div 100;
        h:= c mod 5;
        write('angka konversinya: ',h);
        writeln(b);
        readln;
end.
