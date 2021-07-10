program LatihanKetik;
{program ini akan menampilkan angka yang telah ditentukan kedalam masing-masing bilangan}
uses crt;

        function fak(x,y: integer):integer;
        begin
        if y=0 then
                fak:=1
        else
                fak:= x* fak (x,y-1);
        end;
begin
        clrscr;
        writeln(fak(5,3));
        readln;

end.
