program PraktikumKimia;
uses crt;
var
        wrna1,wrna2,wrna3,wrna4,wrna5             :string;
        BERHASIL,Nberhasil                        :boolean;
        sukses,sukses2,sukses3,sukses4,jadi       :string;
        percobaan                                 :integer;
        i,j                                       :integer;
begin
        writeln('masukan warna pertama: ');
        readln(wrna1);
        writeln('masukan warna ke-2 : ');
        readln(wrna2);
        writeln('masukan warna ke-3 : ');
        readln(wrna3);
        writeln('masukan warna ke-4 : ');
        readln(wrna4);

        BERHASIL:= true;
        Nberhasil:= false;

        sukses  := 'merah';
        sukses2 := 'kuning';
        sukses3 := 'hijau' ;
        sukses4 := 'ungu'  ;
       // jadi    := wrna1 and wrna2 and wrna3 and wrna4;

        i:=1;
        while i<= 5 do
        begin
                        if  (wrna1 = sukses) and (wrna2=sukses2) and (wrna3=sukses3) and (wrna4 = sukses4) then
                                writeln('percobaan ke-',i,' ',wrna1,' ',wrna2,' ',wrna3,' ',wrna4)
                              // if jadi ='merah''kuning''hijau''ungu' then
                                       // writeln(BERHASIL)
                        else
                                writeln(Nberhasil);
                        i:=i+1;
        end;
        if  (wrna1 = sukses) and (wrna2=sukses2) and (wrna3=sukses3) and (wrna4 = sukses4) then
                writeln('BERHASIL',' ',BERHASIL);
        readln;
end.

