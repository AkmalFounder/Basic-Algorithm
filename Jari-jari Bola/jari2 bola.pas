program jari2_bola;
uses crt;
var
        r               :integer;
        vol,luas,phi        :real;
begin
        clrscr;
        writeln('.....................................');
        writeln(                                       );
        writeln('      PROGRAM JARI-JARI BOLA         ');
        writeln('                                     ');
        writeln('.....................................');
        writeln(' Masukan jari-jari suatu BOLA :      ');
        readln (r);
        phi     :=3.14;
        vol     :=(4/3)*(phi)*r*r*r;
        luas    :=4*(phi)*r*r;
        writeln;
        writeln('luas kulit bola adalah : ',luas:1:1);
        writeln('volume bola adalah     : ',vol:1:1);
        readln;
End.

