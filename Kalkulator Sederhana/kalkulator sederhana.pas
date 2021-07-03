program kalkulatorsederhana;
uses crt;
var
        bil1,bil2,jum,kur,kali,bagi:real;
begin
        clrscr;
        write('masukan nilai bilangan pertama : ');
        readln(bil1);
        writeln;
        write('masukan nilai bilangan kedua : ');
        readln(bil2);
                jum :=(bil1+bil2);
                kur :=(bil1-bil2);
                kali:=(bil1*bil2);
                bagi:=(bil1/bil2);
        writeln;
        writeln('calculating suucessfull , displaing...');
        writeln('hasil jumlah : ',jum:6:1);
        writeln('hasil kurang : ',kur:6:1);
        writeln('hasil kali   : ',kali:6:1);
        writeln('hasil bagi   : ',bagi:6:1);
        writeln;
        writeln('terima kasih telah menggunakan aplikasi ini');
        readln;
end.