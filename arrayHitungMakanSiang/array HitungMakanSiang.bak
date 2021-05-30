program HitungUangMakanSiang;
uses crt;
        type
        DPeg = record
        nik, nama:string;
        harihadir:integer;
        uangmaksi:longint;

        end;

        type TPeg = array [1..30] of Dpeg;


        var
        tabPeg: TPeg;
        nPeg:integer;
        i:integer;

        procedure IsiData(n:integer; var ArrPeg: TPeg);
        {I.S. Belum terdefinisi data kehadiran pegawai
        F.S. Terdefinisi tabel kehadiran n pegawai yang terdiri atas:
        nik, nama, dan hari hadir, dari masukan user }


        var
        nama,nik:string;
        hadir:integer;
        i:integer;
        begin
        i:=0;
        writeln('Masukan jumlah pegawai yang ingin diinput:');
        readln(n);
        nPeg:=n;
        writeln;
        while  ( i < nPeg) do
        begin
                write('NIK: ');
                readln(nik);
                write('Nama: ');
                readln(nama);
                write('Hari hadir: ');
                readln(hadir);

                i:=i+1;
                ArrPeg[i].nik:=nik;
                ArrPeg[i].nama:=nama;
                ArrPeg[i].harihadir:=hadir;
                writeln();
        end;
        end;

        procedure HitungUangMaksi(n: integer; var ArrPeg: TPeg);
        {I.S. Tabel kehadiran pegawai terdefinisi
        F.S. Atribut uang makan siang untuk masing-masing pegawai pada
        tabel kehadiran pegawai telah terhitung. }

        var
        i,jum:integer;
        rata:real;
        begin
        i:=1;
        n:=nPeg;
        while (i<=n) do
        begin
                 i:=1;
                 jum:=0;
                 repeat
                   ArrPeg[i].uangmaksi:=20000 * ArrPeg[i].harihadir;
                   i:=i+1;
                 until ( i > n);

        end;
        end;




begin
clrscr;
i:=0;
IsiData(nPeg,tabPeg);
HitungUangMaksi(nPeg,tabPeg);
writeln('KELUARANNYA: ');
repeat

                i:=i+1;
                writeln('NIK: ',tabPeg[i].nik);
                writeln('Nama: ',tabPeg[i].nama);
                writeln('Hari Hadir: ',tabPeg[i].harihadir);
                writeln('Uang Makan Siang: ',tabPeg[i].uangmaksi);
                writeln;
until (i = nPeg);
readln;
end.
