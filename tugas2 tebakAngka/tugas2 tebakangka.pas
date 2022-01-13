program TebakAngka;
uses crt;
var
        a,b : integer;
begin
        clrscr;
        write('Masukan Angka Anda : ');
        readln(a);
        if(a=111) then
                writeln('selamat jawaban anda benar : ',a);
        else
                write('Maaf coba lagi');
                readln(b);
end.
