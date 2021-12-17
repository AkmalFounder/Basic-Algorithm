program potongandiskon;
uses crt;
var
        jh,dsk,hasil1,hasil2 :real;
begin
        clrscr;
        writeln('masukan jumlah harga');
        readln(jh);
        writeln('masukan presentase diskon');
        readln(dsk);
        hasil1:=(jh*dsk/100);
        hasil2:=(jh-hasil1);
        writeln('hasilnya',hasil2:20:0);
        readln;
end.
