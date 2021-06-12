program belanjadiskonmurah;
uses crt;
var
        n,belanjaawal,voucher                   :integer;
        belanjaakhir,diskonrupiah,diskonpersen  :real;
begin
        clrscr;
        writeln('masukan nilai DISKON: ');
        readln(n);
        if(belanjaawal>500000) then
                diskonpersen:=0.15
        else if belanjaawal> 300000 and belanjaawal<=500000 then
                diskonpersen <=0.1
        else if belanjaawal> 100000 and belanjaawal <= 300000 then
                diskonpersen<=0.05
        else
                diskonpersen<=0
        end;
        diskonrupiah:=belanjaawal*diskonpersen
        belanjaakhir:=belanjaawal-diskonrupiah
        voucher:=belanjaakhir div 50000
        writeln(diskonrupiah,belanjaakhir,voucher);
        readln;
end.