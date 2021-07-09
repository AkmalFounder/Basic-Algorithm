program PT_POS;
uses crt;
var
        Dberat,Sisaberat,Dbiaya :integer;
        massa                   :integer;
        total                   :integer;
begin
        clrscr;
        writeln('Silakan masukan Berat Parsel: ');
        readln(massa);
        Dberat:= massa div 1000;
        Sisaberat:= massa mod 1000 ;

        if Sisaberat > 500 then
                Dbiaya:= Dberat * 10000 + Sisaberat *5
        else if massa > 10000 then
                Dbiaya:= Dberat * 10000
        else
                Dbiaya:= Dberat * 10000 + Sisaberat *15;

        total := Dbiaya;


        writeln('Detail Berat : ',Dberat,'+',Sisaberat);
        writeln('Detail Biaya : ','Rp. ',Dberat,' + ',Sisaberat);
        writeln('Total Biaya : ','Rp. ',total);
        readln;
end.