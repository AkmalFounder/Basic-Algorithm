program whiledo;
uses crt;
var
        k,hasil,input: real;
begin
        clrscr;
         writeln('input: ');
        readln(input);
        k:=0;
        hasil:=1;
        k:=1;
        while (k<>input) do
        //repeat
                begin
                        k:=k+1;
                        hasil:=hasil*(2*k+1);
                        writeln('input: ',k:2:2);
                end;
        //until(k=input+1);
        writeln('hasil: ',hasil:2:2);
        readln;
end.

