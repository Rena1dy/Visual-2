unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids;

type
  TForm1 = class(TForm)
    l2: TLabel;
    dbgrd1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    zqry2: TZQuery;
    e_1: TEdit;
    l1: TLabel;
    l3: TLabel;
    e_2: TEdit;
    e_3: TEdit;
    l6: TLabel;
    l4: TLabel;
    l5: TLabel;
    l7: TLabel;
    l8: TLabel;
    l9: TLabel;
    e_4: TEdit;
    dtp1: TDateTimePicker;
    cbb1: TComboBox;
    e_5: TEdit;
    cbb2: TComboBox;
    l10: TLabel;
    e_6: TEdit;
    l11: TLabel;
    e_8: TEdit;
    e_7: TEdit;
    l12: TLabel;
    l13: TLabel;
    cbb3: TComboBox;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id:string;

implementation

{$R *.dfm}

procedure TForm1.b1Click(Sender: TObject);
begin
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
b6.Enabled:= True;
e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
dtp1.Enabled:= True;
cbb1.Enabled:= True;
e_5.Enabled:= True;
cbb2.Enabled:= True;
e_6.Enabled:= True;
e_7.Enabled:= True;
e_8.Enabled:= True;
cbb3.Enabled:= True;
end;

procedure TForm1.b2Click(Sender: TObject);
begin
 if e_1.Text='' then
  begin
    ShowMessage('NIS BELUM DIISI DENGAN BENAR');
    end else
    if e_2.Text=''then
    begin
     ShowMessage('NISN BELUM DIISI DENGAN BENAR');
    end else
    if e_3.text=''then
    begin
     ShowMessage('NAMA SISWA BELUM DIISI DENGAN BENAR');
    end else
    if e_4.text=''then
    begin
    ShowMessage('NIK BELUM SESUAI');
    end else
    if cbb1.Text='' then
    begin
     ShowMessage('JENIS KELAMIN BELUM DIISI DENGAN BENAR');
    end else
    if e_5.text=''then
    begin
     ShowMessage('INPUTAN TINGKAT KELAS  BELUM SESUAI');
    end else
     if (cbb2.Text='')or(cbb2.Text='---PILIH JURUSAN---') then
    begin
     ShowMessage('JURUSAN BELUM DIISI DENGAN BENAR');
    end else
    if e_6.Text='' then
     begin
     ShowMessage(' NAMA WALI KELAS BELUM SESUAI');
    end else
     if e_7.text=''then
    begin
     ShowMessage('INPUTAN ALAMAT BELUM SESUAI');
    end else
    if (e_8.Text='-') then
      begin
     ShowMessage(' NO TELP BELUM SESUAI');
    end else
     if cbb3.Text='' then
    begin
     ShowMessage('STATUS BELUM DIISI DENGAN BENAR');
    end else
  if Form1.zqry1.Locate('Nik',e_1.Text,[]) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end else
  begin

 zqry1.SQL.Clear;
 zqry1.SQL.Add('insert into siswa values(null,"'+e_1.Text+'","'+e_2.Text+'","'+e_3.Text+'","'+e_4.Text+'","'+formatdatetime('yyyy-mm-dd',dtp1.Date)+'","'+cbb1.Text+'","'+e_5.Text+'","'+cbb2.Text+'","'+e_6.Text+'","'+e_7.Text+'","'+e_8.Text+'","'+cbb3.Text+'")');
 zqry1.ExecSQL ;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from siswa');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
posisiawal;
end;
end;
procedure TForm1.b3Click(Sender: TObject);
begin
if (e_1.Text= '')or (e_2.Text ='')or(e_3.Text= '')or (e_4.Text ='')or(cbb1.Text='')or(e_5.Text ='')or(cbb2.Text='')or(e_6.Text='')or(e_7.Text='')or(e_8.Text='')or(cbb3.Text='') then
begin
  ShowMessage('INPUTAN WAJIB DIISI!');
end else
if e_1.Text = zqry1.Fields[1].AsString then
begin
 ShowMessage('DATA TIDAK ADA PERUBAHAN');
 posisiawal;
end else
begin
 ShowMessage('DATA BERHASIL DIUPDATE!');
zqry1.SQL.Clear;
zqry1.SQL.Add('Update siswa set Nis= "'+e_1.Text+'",Nisn="'+e_2.Text+'",Nama_Siswa="'+e_3.Text+'",Nik="'+e_4.Text+'" where Id_Siswa="'+Id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from siswa');
zqry1.Open;

posisiawal;
end;
end;


procedure TForm1.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from siswa where Id_Siswa="'+Id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from siswa');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
 posisiawal;
end

end;

procedure TForm1.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.bersih;
begin
e_1.Clear;
e_2.Clear;
e_3.Clear;
e_4.Clear;
e_5.Clear;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
bersih;
b1.Enabled:=true;
b2.Enabled:=false;
b3.Enabled:=false;
b4.Enabled:=false;
b5.Enabled:=false;
b6.Enabled:=false;
e_1.Enabled:= false;
e_2.Enabled:= false;
e_3.Enabled:= false;
e_4.Enabled:= false;
dtp1.Enabled:= false;
cbb1.Enabled:= false;
e_5.Enabled:= false;
cbb2.Enabled:= false;
e_6.Enabled:= false;
e_7.Enabled:= false;
e_8.Enabled:= false;
cbb3.Enabled:= false;
end;

procedure TForm1.posisiawal;
begin
 bersih;
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
b5.Enabled:= False;
e_1.Enabled:= false;
e_2.Enabled:= false;
e_3.Enabled:= false;
e_4.Enabled:= false;
dtp1.Enabled:= false;
cbb1.Enabled:= false;
e_5.Enabled:= false;
cbb2.Enabled:= false;
e_6.Enabled:= false;
e_7.Enabled:= false;
e_8.Enabled:= false;
cbb3.Enabled:= false;
end;
procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
Id:= zqry1.Fields[0].AsString;
e_1.Text:= zqry1.Fields[1].AsString;
e_2.Text:= zqry1.Fields[2].AsString;
e_3.Text:= zqry1.Fields[3].AsString;
e_4.Text:= zqry1.Fields[4].AsString;
cbb1.Text:= zqry1.Fields[6].AsString;
e_5.Text:= zqry1.Fields[7].AsString;
cbb2.Text:= zqry1.Fields[8].AsString;
e_6.Text:= zqry1.Fields[9].AsString;
e_7.Text:= zqry1.Fields[10].AsString;
e_8.Text:= zqry1.Fields[11].AsString;
cbb3.Text:= zqry1.Fields[12].AsString;
e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
dtp1.Enabled:= True;
cbb1.Enabled:= True;
e_5.Enabled:= True;
cbb2.Enabled:= True;
e_6.Enabled:= True;
e_7.Enabled:= True;
e_8.Enabled:= True;
cbb3.Enabled:= True;

b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
end;

procedure TForm1.b6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;



end.
