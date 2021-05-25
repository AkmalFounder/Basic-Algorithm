program gratis;
uses crt;
var
        A,B : integer;
        function adalahPrima(X:integer):boolean;
        var
                count,i : integer;
        begin
                count:=0;
                i:=1;
                while (i<=X) do
                  begin
                        if(X mod i=0) then
                                count:=count+1;
                        i:=i+1;
                  end;
                if(count=2) then
                        adalahPrima:=True
                else
                        adalahPrima:=False;
        end;

        function adalah7(X:integer):boolean;
        var
                i,j:integer;
                cek:boolean;
        begin
                i:=7;
                j:=10;
                cek:=True;
                while(cek)do
                  begin
                        if(X<j) then
                          begin
                                cek:=false;
                                if((X-i)=0) then
                                        adalah7:=true
                                else
                                        adalah7:=false;
                          end
                        else
                                i:=i+10;
                                j:=j+10;
                  end;
        end;


        procedure faktor(X:integer);
        var
                i : integer;
        begin
                i:=2;
                while (i<X) do
                  begin
                        if(X mod i=0) then
                                write(i,' ');
                        i:=i+1;
                  end;
        end;


        procedure adalahFaktorPrima7(N,M:integer);
        var
                i:integer;
        begin
                i:=N;
                while(i<=M) do
                  begin
                        write(i,' ');
                        if(adalahPrima(i)) then
                                write('Prima ');
                        if(adalah7(i)) then
                                write('Tujuh ');
                        faktor(i);
                        writeln;
                        i:=i+1;
                  end;
        end;

begin
        clrscr;
        readln(A,B);
        if(A>0) and (B>0) then
                if(A>B) then
                        adalahFaktorPrima7(B,A)
                else if(B>A) then
                        adalahFaktorPrima7(A,B)
        else
                write('HARUS BIL.POSITIF');
end.
























































