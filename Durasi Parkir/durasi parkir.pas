program DurasiParkir;
uses crt;
var
        jam1,menit1,detik1,jam2,menit2,detik2,masuk1,masuk2,keluar1,keluar2,Hmasuk,Hkeluar,hasil,jam3
        ,sisa,menit3,detik3:longint;
begin
        clrscr;
        writeln('+++++++++++++++++++++++++++++++');
        write('PROGRAM PERHITUNGAN DURASI PARKIR : ');
        writeln('+++++++++++++++++++++++++++++++');
        writeln;
        write('Masukan jam Parkir Masuk : ');
        readln(jam1);
        write('Masukan menit parkir masuk : ');
        readln(menit1);
        write('masukan detik parkir masuk : ');
        readln(detik1);
        writeln;
        write('Masukan jam parkir keluar: ');
        readln(jam2);
        write('Masukan menit keluar : ');
        readln(menit2);
        write('masukan detik keluar : ');
        readln(detik2);
        masuk1:=(jam1 * 3600);
        masuk2:=(menit1 * 60);
        keluar1:=(jam2 * 3600);
        keluar2:=(menit2 * 60);
        Hmasuk:=(masuk1 + masuk2 + detik1);
        Hkeluar:=(masuk2 + masuk3 + detik1);
        readln;
end.




