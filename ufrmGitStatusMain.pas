unit ufrmGitStatusMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, DosCommand, LayoutSaver, Vcl.ExtCtrls;

type
  TfrmGitStatusMain = class(TForm)
    DosCommand: TDosCommand;
    lbPaths: TListBox;
    lbOutput: TListBox;
    pnlGitConfig: TPanel;
    edtGitCmd: TLabeledEdit;
    ccRegistryLayoutSaver: TccRegistryLayoutSaver;
    pnlButtons: TPanel;
    btnAddPath: TBitBtn;
    btnGitStatus: TBitBtn;
    procedure btnAddPathClick(Sender: TObject);
    procedure btnGitStatusClick(Sender: TObject);
    procedure DosCommandNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure edtGitCmdExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    const
      GitPathSection = 'GitPaths';
    function  IniFilename: string;
    procedure AddGitPath(const NewGitPath: string);
    procedure CheckGitStatusForFolder(const GitPath: string);
  end;

var
  frmGitStatusMain: TfrmGitStatusMain;

implementation

{$R *.dfm}

uses
  IOUtils, IniFiles;

procedure TfrmGitStatusMain.AddGitPath(const NewGitPath: string);
var
  IniFile: TIniFile;
begin
  if lbPaths.Items.IndexOf(NewGitPath) >= 0 then
    ShowMessage('This path has already been added.')
  else begin
    lbPaths.Items.Add(NewGitPath);

    IniFile := TIniFile.Create(IniFilename);
    try
      IniFile.WriteString(GitPathSection, 'GitPath' + IntToStr(lbPaths.Items.Count), NewGitPath);
    finally
      IniFile.Free;
    end;
  end;
end;

procedure TfrmGitStatusMain.btnAddPathClick(Sender: TObject);
var
  LNewPath: string;
begin
  if InputQuery('Add Path', 'Enter a folder name containing a Git repository: ', LNewPath) then
    AddGitPath(LNewPath);
end;

procedure TfrmGitStatusMain.btnGitStatusClick(Sender: TObject);
begin
  if lbPaths.ItemIndex >= 0 then
    CheckGitStatusForFolder(lbPaths.Items[lbPaths.ItemIndex]);
end;

procedure TfrmGitStatusMain.CheckGitStatusForFolder(const GitPath: string);
begin
  lbOutput.Items.Clear;

  DosCommand.CurrentDir := GitPath;
  DosCommand.CommandLine := '"' + edtGitCmd.Text + '" status';
  DosCommand.Execute;
end;

procedure TfrmGitStatusMain.DosCommandNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  lbOutput.Items.Add(ANewLine);
end;

procedure TfrmGitStatusMain.edtGitCmdExit(Sender: TObject);
begin
  ccRegistryLayoutSaver.SaveStrValue('GitCmd', edtGitCmd.Text);
end;

procedure TfrmGitStatusMain.FormCreate(Sender: TObject);
var
  i: Integer;
  IniFile: TIniFile;
begin
  edtGitCmd.Text := ccRegistryLayoutSaver.RestoreStrValue('GitCmd');

  IniFile := TIniFile.Create(IniFilename);
  try
    IniFile.ReadSectionValues(GitPathSection, lbPaths.Items);

    for i := 0 to lbPaths.Items.Count - 1 do
      lbPaths.Items[i] := lbPaths.Items.ValueFromIndex[i];
  finally
    IniFile.Free;
  end;
end;

function TfrmGitStatusMain.IniFilename: string;
begin
  Result := TPath.Combine(TPath.Combine(TPath.GetPublicPath, ExtractFileName(Application.ExeName)),
                                           ChangeFileExt(Application.ExeName, '.ini'));
end;

end.
