program TubesBengkel;
uses crt;
type
                costumer = record
                NoAntrian,nama,alamat,tgl,bln,thn       :string;
                biaya                                   :longint;
                usia                                    :integer;
                jenisKelamin                            :string;
                lamaservis                              :integer;
end;
type
                keperluan = record
                jenisKendaraan                          :string;
                ketokMagic                              :integer;
                aki                                     :integer;
                spion,lampu                             :integer;
                oli                                     :integer;
                tambalBan,gantiBan,isiangin             :integer;
                shockBreaker                            :integer;
                GantiKaca,pilox                         :integer;
                bemper                                  :integer;
end;

type
                dataCostumer=array [1..1000] of costumer;
                dataKeperluan=array [1..100] of keperluan;
var
                datcos  : costumer;
                hari : array [1..7] of longint;
                btambahan : array [1..2] of longint;
                index  :integer;

                plg     :dataCostumer ;


        procedure menuBiodata(index     :integer);
        {I.S. proses menginputkan data oleh konsumen
        F.S. Menampilkan menu input data}
        begin
                writeln;
                writeln;
                writeln('            MENU INPUT            ');
                writeln('============ BIODATA  ============');
                writeln('1. Nama          : ',plg[index].nama );
                writeln('2. alamat        : ',plg[index].alamat);
                writeln('3. Usia          : ',plg[index].usia);
                writeln('4. Jenis Kelamin : ',plg[index].jenisKelamin);
                writeln('5. Tgl : ',plg[index].tgl,' Bln : ',plg[index].bln,' Thn : ',plg[index].thn);
                writeln('===================================');
                writeln;
                writeln('      TEKAN ENTER UNTUK KELUAR     ');
                readln;
        end;

        procedure officialMenu();
        var
                nom     : integer;
        begin
                //repeat
                        clrscr;
                        writeln('-------------------------------------------------------------');
                        writeln('               SELAMAT DATANG DI PROGRAM BENGKEL             ');
                        writeln('      ``==============================================``     ');
                        writeln('      ||NO.||            MENU UTAMA                   ||     ');
                        writeln('      ||| |||-----------------------------------------||     ');
                        writeln('      ||===||=========================================||     ');
                        writeln('      || 1.|| Info Biodata                            ||     ');
                        writeln('      || 2.|| Pengeditan Biodata                      ||     ');
                        writeln('      || 3.|| Hapus Biodata Costumer                  ||     ');
                        writeln('      || 4.|| Lihat Data Costumer  Berdasarkan Usia   ||     ');
                        writeln('      || 5.|| Kembali                                 ||     ');
                        writeln('       ``==============================================``    ');
                        write  ('              Pilih nomor menu :  '); readln(nom);
                     {   case nom of
                        1 :menulihatBio();
                        2 :editanMenuBio();
                        3 :menuHapusBio();
                        4 :sortOld();
                        5 :MenuTERAWAL();
                        end;
                until (nom=5);}                  // BELUM DIBUAT PROCEDURE UNTUK officialMenu
        end;

begin
        menuBiodata(index);
        officialMenu();
end.
