unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, acPNG, ExtCtrls, ImgList, Menus;

type
  TMainForm = class(TForm)
    Start: TImage;
    Stop: TImage;
    PicList: TImageList;
    MainMenu: TMainMenu;
    M_Action: TMenuItem;
    M_Close: TMenuItem;
    M_Help: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure M_CloseClick(Sender: TObject);
    procedure M_AboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses About;

{$R *.dfm}

var
  work: bool;
  Ch: Word;

procedure TMainForm.M_AboutClick(Sender: TObject);
begin
  AboutBox.Show;
end;

procedure TMainForm.M_CloseClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  PicList.GetBitmap(0, Start.Picture.Bitmap);
  PicList.GetBitmap(2, Stop.Picture.Bitmap);
  work := False;
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if work = true then
    Ch := ord(Key);
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if work = true then
    ShowMessage('Key press - "'+Chr(Ch)+'"');
end;

procedure TMainForm.StartClick(Sender: TObject);
begin
  if work = false then
  begin
    Start.Hide;
    PicList.GetBitmap(1, Start.Picture.Bitmap);
    Start.Show;
    Stop.Hide;
    PicList.GetBitmap(2, Stop.Picture.Bitmap);
    Stop.Show;
    work := true;
  end;

end;

procedure TMainForm.StopClick(Sender: TObject);
begin
  if work = true then
  begin
    Stop.Hide;
    PicList.GetBitmap(3, Stop.Picture.Bitmap);
    Stop.Show;
    Start.Hide;
    PicList.GetBitmap(0, Start.Picture.Bitmap);
    Start.Show;
    work := false;
  end;
end;

end.
