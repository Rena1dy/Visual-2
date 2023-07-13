unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TForm5 = class(TForm)
    l2: TLabel;
    l3: TLabel;
    l6: TLabel;
    l5: TLabel;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    e_1: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    dbgrd1: TDBGrid;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure b1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure b2Click(Sender: TObject);
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
  Form5: TForm5;
    id:string;

implementation

{$R *.dfm}

procedure TForm5.b1Click(Sender: TObject);
begin
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
b6.Enabled:= True;

cbb1.Enabled:= True;
e_1.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TForm5.b2Click(Sender: TObject);
begin
  if cbb1.Text='' then
    begin
     ShowMessage('POIN BELUM DIISI DENGAN BENAR');
    end else
    if e_1.Text='' then
  begin
    ShowMessage('BOBOT POIN BELUM DIISI DENGAN BENAR');
    end else
    if cbb2.Text='' then
    begin
     ShowMessage('TIPE POIN BELUM DIISI DENGAN BENAR');
    end else
     if Form5.zqry1.Locate('Nama_poin',e_1.Text,[]) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end else
  begin

 zqry1.SQL.Clear;
 zqry1.SQL.Add('insert into poin values(null,"'+cbb1.Text+'","'+e_1.Text+'","'+cbb2.Text+'")');
 zqry1.ExecSQL ;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from poin');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
posisiawal;
end;
end;
procedure TForm5.b3Click(Sender: TObject);
begin
if (cbb1.Text='')or(e_1.Text ='')or(cbb2.Text='') then
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
zqry1.SQL.Add('Update poin set Bobot= "'+e_1.Text+'" where Id_poin="'+Id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from poin');
zqry1.Open;

posisiawal;
end;
end;

procedure TForm5.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from poin where Id_poin="'+Id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from poin');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
 posisiawal;
end;
end;

procedure TForm5.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.bersih;
begin
e_1.Clear;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
bersih;
b1.Enabled:=true;
b2.Enabled:=false;
b3.Enabled:=false;
b4.Enabled:=false;
b5.Enabled:=false;
b6.Enabled:=false;
cbb1.Enabled:= false;
e_1.Enabled:= false;
cbb2.Enabled:= false;
end;

procedure TForm5.posisiawal;
begin
 bersih;
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
b5.Enabled:= False;
cbb1.Enabled:= false;
e_1.Enabled:= false;
cbb2.Enabled:= false;
end;



procedure TForm5.dbgrd1CellClick(Column: TColumn);
begin
Id:= zqry1.Fields[0].AsString;
cbb1.Text:= zqry1.Fields[1].AsString;
e_1.Text:= zqry1.Fields[2].AsString;
cbb2.Text:= zqry1.Fields[3].AsString;

cbb1.Enabled:= True;
e_1.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TForm5.b6Click(Sender: TObject);
begin

frxReport1.ShowReport();
end;
end.
