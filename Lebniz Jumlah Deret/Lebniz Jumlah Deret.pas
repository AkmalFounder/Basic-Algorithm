program LeibnizJumlahderet;
uses crt;
var
        si,jum          :real;
        hasil,hasil2    :real;
        i               :integer;

begin
        clrscr;
        si:=3.14/4;
        jum:=1/5;
        hasil:=1;
        i:=1;
        repeat
        begin
                writeln('Suku S',i);
                hasil:=hasil-1/3+jum-1/7+1/9;
                i:=i+1;
        end;
        until i=si;
        writeln('Rumus suku ke Si adalah: ',hasil);
        readln;
end.
