program Anagram2;
uses crt;
var
  s1,s2 : string;
  anagram:boolean;
  i : integer;
  j: char;
  tp1, tp2 : array['a'..'z'] of integer;

{ Algoritma Utama }
begin
  { TODO -oUser -cConsole Main : Insert code here }
  { Selalu Cek http://falah-kharisma.blogspot.com }
  { Untuk Contoh Pemrograman Pascal Lainnya       }

  { Memasukkan 2 kata yang akan dicek apakah anagram atau bukan }
  write('Masukkan s1 : ');
  readln(s1);
  write('Masukkan s2 : ');
  readln(s2);

  { Suatu susunan kata otomatis tidak akan termasuk anagram }
  { Jika panjang 2 kata tersebut tidak sama }
  if (Length(s1) <> Length(s2)) then
  begin
    Writeln(s1,' dan ',s2,' bukanlah anagram');
  end else

  { Jika panjang 2 kata tersebut sama }
  { akan dicek apakah anagram atau bukan }
  begin
    //Menghitung jumlah karakter dalam kata sesuai hurufnya
   for i:=1 to Length(s1) do
   begin
     tp1[s1[i]] := tp1[s1[i]]+1;
     tp2[s2[i]] := tp2[s2[i]]+1;
   end;

   // Inisialisasi dengan menganggap benar anagram
   anagram:=true;

   //Cek dari a sampai z, jumlah setiap huruf harus sama
   for j:='a' to 'z' do
   begin
     if tp1[j] <> tp2[j] then
     begin
       anagram:=false;
     end;
   end;
  end;

  // Jika anagram true, maka tuliskan benar anagram
  if anagram then
    Writeln(s1,' dan ',s2,' adalah anagram')
  else
     Writeln(s1,' dan ',s2,' bukanlah anagram');
end.
