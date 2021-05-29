program HitungNilai;
uses crt;
var
        constant N: integer =60;
        type dmhs:(nim, nama :string
        project, Mid, Fin, Wscore: real);
        type tmhs:array [1..N] of dmhs;

        formMahasiswa   :tmhs;
        i,jumMhs        :integer;

        procedure Isidata(var Mhs: tmhs, nMhs: integer);
        procedure HitungWscore(var Mhs:tmhs, var nMhs:integer);
begin
        isidata(formMahasiswa, jumMhs);
        HitungWscore(formMahasiswa,jumMhs);
        for i:= 1 to jumMhs do
        begin
                writeln(formMahasiswa[i].Wscore)
        end;

procedure Isidata(var Mhs: tmhs, nMhs: integer);
var
i       :integer;
begin
        writeln('jumlah mahsiswa: ');
        readln(nMhs);
        for i :=(Mhs[i].nim);
        begin
                readln(Mhs[i].nama);
                readln(Mhs[i].project);
                readln(Mhs[i].mid);
                readln(Mhs[i].fin);
        end;
procedure HitungWscore(var Mhs: tMhs, var nMhs:integer);
var
i       :integer;
begin
        for i := nMhs do
        begin
        tubes := 0.3 * Mhs[i]. project;
        uts := 0.35 * Mhs [i].mid;
        uas := 0.35 * Mhs[i].fin;
        Mhs[i].Wscore:=tubes + uts +uas;
        end;
end.