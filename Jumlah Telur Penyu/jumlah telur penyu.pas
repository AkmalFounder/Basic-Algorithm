program JumlahTelurPenyu;
{program ini akan menampilkan indetitas penyu}
uses crt;
var
        jum,U,H,i,penyu1 :integer;
        JK         :string;
        penyu      :array[0..20] of string[20];

begin
        clrscr;
        writeln('Jumlah penyu: 3');
        jum:=11;
        penyu[1]:='masukan umur: ';
        penyu[2]:='masukan berat: ';
        penyu[3]:='masukan jenis kelamin: ';
        repeat
                writeln(penyu[1]);
                writeln(penyu[2]);
                writeln(penyu[3]);

                        i:=i+1;
                readln;
        until(i=3);
        writeln('jumlah telur penyu adalah: ',jum);
end.
