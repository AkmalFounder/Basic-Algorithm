
program satu;
uses crt;
var
tabAngka: array [1..10,1..10] of integer;
i, j,k,l: integer;
begin
clrscr;
for i:=1 to 10 do
        for j:= 1 to 10 do
                tabAngka[i][j]:=i*j;
for k:=1 to 10 do
begin
        for l := 1 to 10 do
	        write(tabAngka[k][l],' ');
                writeln;
end;
end.

