program pemilutpsss;
uses crt;
const nmax=100;
type
                pemilu = record
                        tps:integer;
                        nama,nama2:string;
                        jumSuara:integer;
                        coblos:string;
                end;

type jumTps=array[1..nmax]of pemilu;
var
tab:jumTps;
calon :jumTps;
calonA,calonB,coblos:string;
i,n,A,B   :integer;
hasil1,hasil2:integer;

begin
        clrscr;
        writeln('masukan jumlah Tps: ');
        readln(n);
        writeln('calon A: ');
        readln(calonA);
        writeln('calon B: ');
        readln(calonB);
        writeln;
        i:=1;
        while i<=n do
        begin
                writeln('Tps',i);
                writeln('Coblos calon: ');
                readln(coblos);
                if coblos = calonA then
                        A:= A + 1
                else
                        B:= B + 1;
                i:=i+1;
        end;

        hasil1:=A;
        hasil2:=B;
        writeln('pemenang: ','calon A: ',hasil1,' ','calon B ',hasil2);
        readln;
end.
