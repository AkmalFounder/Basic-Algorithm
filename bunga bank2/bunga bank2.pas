program BungaBank2;
{program ini akan mengecek bunga bank sesuai periode tahun yang diminta}
uses crt;
var
        uangawal        :real;
        sukubunga       :real;
        bunga           :real;
        uangakhir       :real;
        periode         :integer;
        i               :integer;
        target          :real;
        jtarget         :real;
begin
        write('masukan suku bunga: ');
        readln(sukubunga);
        write('masukan target: ');
        readln(target);
        uangawal:=1000000;
        i:=1;
        writeln();
        jtarget:=uangawal*target;
        repeat
                uangakhir:=(sukubunga)*uangawal+uangawal;
                bunga:=sukubunga*uangawal;
                uangawal:=uangakhir;
                if (uangawal >= jtarget) then
                writeln('pada tahun ke ', i ,' uang akan mencapai target',target,'x','yaitu: Rp   ',uangakhir:10:2);
                i:=i+1;
        until (uangawal >= jtarget);
end.

