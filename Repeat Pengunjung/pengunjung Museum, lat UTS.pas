program pengunjung_museum;
uses crt;
var
        hari,pbaru,plama,turun,i        :integer;

begin
        clrscr;
        hari:=1;
        writeln('hari',hari,' :');
        readln(pbaru);
        plama:=-9999;
        //hari:=1;
        repeat
                if pbaru < plama then
                        turun:=turun+1;
                hari:=hari + 1;
                plama:=pbaru;
                repeat
                       // if pbaru <0 then
                                writeln('hari',hari,' : ');
                                readln(pbaru);
                until (pbaru > 0);
        until (plama >100) and (pbaru > 100);
        writeln('Output: ',turun+1,hari);
        readln;
end.


