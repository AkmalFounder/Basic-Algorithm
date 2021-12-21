program nama;
uses crt;
var
        a,c,e       :string;
        rendi     :string;
        b,i       :integer;
        true,false      :boolean;

begin
        clrscr;
        rendi:=a;
        writeln('masukan nama anda: ');
        readln(a);
        writeln('masukan tanggal lahir anda: ');
        readln(b);
                if(a= 'rendi') then
                        writeln('jawaban anda benar',true);
                        if a='jawaban anda benar' then
                                writeln(true)
                else
                        writeln('maaf jawaban anda salah',false);
        readln;
end.