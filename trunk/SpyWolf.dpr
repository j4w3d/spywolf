program SpyWolf;

uses
  Forms,
  main in 'main.pas' {MainForm},
  ABOUT in 'ABOUT.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.HelpFile := 'C:\Project\Delphi\SpyWolf\Help\Help.txt';
  Application.Title := 'SpyWolf';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
