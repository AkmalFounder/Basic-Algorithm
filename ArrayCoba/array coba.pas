program posyandu;
uses crt;
var
        Pyandu:array[1..10] of real;
        bmin,bmax       :real;
        n,jum,rerata    :real;
        i               :integer;
procedure hitungminmax(Pyandu:array of real; var bmin,bmax:real);

begin
        writeln('masukan banyak data berat balita: ');
        readln(n);
        jum:=0;
        i:=i+1;
        repeat
                writeln('masukan berat balita ke-',i);
                readln(Pyandu[i]);
                i:=i+1;
        until (i>n);

        repeat
                jum:=jum + Pyandu[i];
                rerata:=jum/n;
                i:=i+1;
        until (i>n);
        bmin:=Pyandu[i];
        bmax:=Pyandu[i];
        repeat
        begin
        if Pyandu[i]>bmax then
                bmax:=Pyandu[i]
        else
                bmin:=Pyandu[i];
        end;
        i:=i+1;
        until (i>n);
        writeln('Berat balita minimum:',bmin:2:2);
        writeln('Berat balita masksimum:',bmax:2:2);
        writeln('Rerata berat balita:',rerata:2:2);
end;
begin
        hitungminmax(Pyandu,bmin,bmax);

        readln;
end.

