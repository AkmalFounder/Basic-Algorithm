program HitungPermen;
uses crt;
var
                prevprioritas,indeks,anak,jumlah,prioritas      :integer;

begin
        clrscr;
        writeln('masukan jumlah anak yang mau Permen: ');
        readln(anak);
        jumlah:=0;
        prevprioritas:=0;
        indeks:=0;
                while (indeks<=anak) do
                begin
                writeln('masukan skala prioritas: ');
                readln(prioritas);
                if (indeks<>1) then
                        if prioritas>prevprioritas then
                                jumlah:=jumlah + (prioritas-prevprioritas);
                jumlah:=jumlah + 1;
                prevprioritas:=prioritas;
                indeks:=indeks + 1;
                end;
                writeln('jumlah minimum permen= ',anak);
                writeln('jumlah permen yang diberikan= ',jumlah);
                readln;
end.