program tetesan_hujanRANDOM;
uses crt;
var
        i          :char;
        much       :longint;
begin
        clrscr;
        randomize;
        writeln('Masukan Banyaknya Tetesan Air: ');
        readln(much);
        for i:='a' to 'd' do
        begin
                writeln('Curah hujan daerah ',i,': ',random(much),' Milimeter');
        end;
        //writeln('
        readln;
end.
