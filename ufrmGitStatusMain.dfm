object frmGitStatusMain: TfrmGitStatusMain
  Left = 274
  Top = 231
  Caption = 'Simple Git Status'
  ClientHeight = 836
  ClientWidth = 1358
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -22
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 192
  TextHeight = 27
  object lbPaths: TListBox
    Left = 0
    Top = 106
    Width = 498
    Height = 600
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alLeft
    ItemHeight = 27
    TabOrder = 0
  end
  object lbOutput: TListBox
    Left = 498
    Top = 106
    Width = 860
    Height = 600
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -26
    Font.Name = 'Consolas'
    Font.Style = []
    ItemHeight = 31
    ParentFont = False
    TabOrder = 1
  end
  object pnlGitConfig: TPanel
    Left = 0
    Top = 706
    Width = 1358
    Height = 130
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      1358
      130)
    object edtGitCmd: TLabeledEdit
      Left = 32
      Top = 64
      Width = 1286
      Height = 35
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 531
      EditLabel.Height = 27
      EditLabel.Margins.Left = 6
      EditLabel.Margins.Top = 6
      EditLabel.Margins.Right = 6
      EditLabel.Margins.Bottom = 6
      EditLabel.Caption = 'Git Command (choose "git.exe" from the "cmd" folder)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = ''
      TextHint = 'C:\Program Files\Git\cmd\git.exe'
      OnExit = edtGitCmdExit
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 1358
    Height = 106
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    object btnAddPath: TBitBtn
      Left = 32
      Top = 20
      Width = 150
      Height = 50
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Add Path'
      TabOrder = 0
      OnClick = btnAddPathClick
    end
    object btnGitStatusSingle: TBitBtn
      Left = 210
      Top = 20
      Width = 239
      Height = 50
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Action = actCheckOneGit
      Caption = 'Check Status - One'
      TabOrder = 1
    end
    object btnGitStatusAll: TBitBtn
      Left = 461
      Top = 20
      Width = 239
      Height = 50
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Action = actCheckAllGit
      Caption = 'Check Status - All'
      TabOrder = 2
    end
  end
  object DosCommand: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnNewLine = DosCommandNewLine
    OnTerminated = DosCommandTerminated
    Left = 288
    Top = 128
  end
  object ccRegistryLayoutSaver: TccRegistryLayoutSaver
    Left = 104
    Top = 176
  end
  object aclGitStatus: TActionList
    Left = 144
    Top = 392
    object actCheckOneGit: TAction
      Caption = 'Check Status - One'
      OnExecute = actCheckOneGitExecute
    end
    object actCheckAllGit: TAction
      Caption = 'Check Status - All'
      OnExecute = actCheckAllGitExecute
    end
  end
end
