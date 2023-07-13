unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls;

type
  TForm9 = class(TForm)
    mm1: TMainMenu;
    SISWA1: TMenuItem;
    WALIKELAS1: TMenuItem;
    ORANGTUA1: TMenuItem;
    KELAS1: TMenuItem;
    HUBUNGAN1: TMenuItem;
    CATATAN1: TMenuItem;
    USER1: TMenuItem;
    POIN1: TMenuItem;
    img1: TImage;
    procedure SISWA1Click(Sender: TObject);
    procedure WALIKELAS1Click(Sender: TObject);
    procedure ORANGTUA1Click(Sender: TObject);
    procedure KELAS1Click(Sender: TObject);
    procedure POIN1Click(Sender: TObject);
    procedure USER1Click(Sender: TObject);
    procedure HUBUNGAN1Click(Sender: TObject);
    procedure CATATAN1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses
  Unit1, Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8;

{$R *.dfm}

procedure TForm9.SISWA1Click(Sender: TObject);
begin
Form1.ShowModal;
end;

procedure TForm9.WALIKELAS1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm9.ORANGTUA1Click(Sender: TObject);
begin
Form3.ShowModal;
end;

procedure TForm9.KELAS1Click(Sender: TObject);
begin
 Form4.showmodal;
end;

procedure TForm9.POIN1Click(Sender: TObject);
begin
Form5.ShowModal;
end;

procedure TForm9.USER1Click(Sender: TObject);
begin
form6.showmodal;
end;

procedure TForm9.HUBUNGAN1Click(Sender: TObject);
begin
form7.ShowModal;
end;

procedure TForm9.CATATAN1Click(Sender: TObject);
begin
form8.showmodal;
end;

end.
