program konversiwaktu;
uses crt;
var
        s,jam,menit     : real;
begin
        clrscr;
        writeln('///////////////////////');
        writeln('program konveksi waktu');
        writeln('\\\\\\\\\\\\\\\\\\\\\\\');
        writeln;
        write('Masukan Nilai Detik(s)  : ');
        readln(s);
        writeln;
                jam     :=(s/3600);
                menit   :=(s/60);
        writeln('Konversi ',s:0:0,' Detik ke menit adalah   : ',menit:0:2,' Menit');
        writeln('konversi ',s:0:0,' Detik ke jam adalah     : ',jam:0:2,' Jam');
        readln;
end.
