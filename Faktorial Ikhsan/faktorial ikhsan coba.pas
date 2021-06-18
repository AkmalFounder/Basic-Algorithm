program faktorial;
uses crt;

function faktorial(a:integer):integer;
var
i       :integer;
begin
        i:=1;
        while (i<A) do
        begin
                if (A mod i =0) then
                        write(i);

        i:=i+1;
        end;
end;
var
        x       :integer;
begin
        clrscr;
        writeln('PROGRAM FAKTORIAL');
        writeln;
        writeln('Berapa Faktorial');
        readln(x);
        writeln(x,'faktorial nya',faktorial(x));
        writeln;
        write('tekan tombol untuk keluar');
        readln;
end.
