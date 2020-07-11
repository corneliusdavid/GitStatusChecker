program GitStatus;

uses
  Vcl.Forms,
  ufrmGitStatusMain in 'ufrmGitStatusMain.pas' {frmGitStatusMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGitStatusMain, frmGitStatusMain);
  Application.Run;
end.
