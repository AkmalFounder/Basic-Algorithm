program BelajarArray(PerhitunganNilai);
uses crt;

        const N        :integer;
        type dmhs        :(nim,nama      :string project,mid, fin, wscore: real);
        type tmhs        :array[1..N] of dmhs


        formmahasiswa   : tmhs;
        i,jumMhs        :integer;

        procedure isidata(output Mhs    :tmhs,nmhs: integer);
        procedure Hitungwscore(I/O mhs:tmhs, input nmhs: integer);
        begin
        isidata(formmahasiswa,jumMhs);
        HitungWscore(formmahasiswa),jumMhs);
        for i:=1 to jumMhs do
                output(formmahasiswa[i].Wscore);
        end;

        procedure isidata(output Mhs, nmhs:integer);
        var{var local}
        i       :integer;
        begin
                writeln('JUmlah Mahasiswa: ');
                readln(nmhs);
                for i:= to nmhs do
                write(mhs[i].nim);
                write(mhs[i].nama);
                write(mhs[i].project);
                write(mhs[i].mid);
                write(mhs[i].fin);
        procedure Hitungwscore(input/output mhs: tmhs, input nmhs:integer);
        var{var local}
                i       :integer;
                uts,uas,tubes   :real;
        begin
                for i:=1 to nmhs do
                        tubes :=0.3 * mhs[i].project;
                        uts    :=0.35 * mhs[i].mid;
                        uas    :=0.35 * mhs[i].fin;
                        mhs[i].wscore :=tubes + uts + uas;
                end;
                readln;
end.