object frmGitStatusMain: TfrmGitStatusMain
  Left = 274
  Top = 231
  Caption = 'Simple Git Status'
  ClientHeight = 418
  ClientWidth = 679
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbPaths: TListBox
    Left = 0
    Top = 53
    Width = 249
    Height = 300
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
    ExplicitTop = 59
    ExplicitHeight = 431
  end
  object lbOutput: TListBox
    Left = 249
    Top = 53
    Width = 430
    Height = 300
    Align = alClient
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 335
    ExplicitTop = 91
    ExplicitWidth = 289
    ExplicitHeight = 393
  end
  object pnlGitConfig: TPanel
    Left = 0
    Top = 353
    Width = 679
    Height = 65
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 48
    ExplicitTop = 426
    ExplicitWidth = 502
    DesignSize = (
      679
      65)
    object edtGitCmd: TLabeledEdit
      Left = 16
      Top = 32
      Width = 643
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 258
      EditLabel.Height = 13
      EditLabel.Caption = 'Git Command (choose "git.exe" from the "cmd" folder)'
      TabOrder = 0
      OnExit = edtGitCmdExit
      ExplicitWidth = 673
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 53
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    ExplicitWidth = 709
    object btnAddPath: TBitBtn
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Add Path'
      TabOrder = 0
      OnClick = btnAddPathClick
    end
    object btnGitStatus: TBitBtn
      Left = 105
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Check Status'
      TabOrder = 1
      OnClick = btnGitStatusClick
    end
  end
  object DosCommand: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnNewLine = DosCommandNewLine
    Left = 288
    Top = 128
  end
  object ccRegistryLayoutSaver: TccRegistryLayoutSaver
    Left = 104
    Top = 176
  end
end
