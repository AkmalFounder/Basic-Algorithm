program Leibniz;
uses crt;
var
        hasil,pi        :real;
        N               :longint;
begin
        clrscr;
        write('Input SUKU Pertama: ');
        readln(N);
        pi:=22/7;
        hasil:=pi*N;

        writeln('Hasil PI adalah: ',hasil:2:2);
        readln;
end.
