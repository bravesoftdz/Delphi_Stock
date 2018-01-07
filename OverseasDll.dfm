object DLLSocketForm: TDLLSocketForm
  Left = 250
  Top = 0
  Caption = 'DLL Socket Demo '
  ClientHeight = 684
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#32048#26126#39636
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 104
    Width = 48
    Height = 12
    Caption = #34892#24773#34920#65306
  end
  object Label6: TLabel
    Left = 180
    Top = 640
    Width = 90
    Height = 12
    Caption = 'Server'#36899#32218#29376#24907#65306
  end
  object Label10: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 12
    Caption = #34892#24773'Head'#65306
  end
  object Label11: TLabel
    Left = 8
    Top = 224
    Width = 36
    Height = 12
    Caption = #20116#27284#65306
  end
  object Label12: TLabel
    Left = 8
    Top = 320
    Width = 60
    Height = 12
    Caption = #25104#20132#26126#32048#65306
  end
  object Label13: TLabel
    Left = 67
    Top = 422
    Width = 96
    Height = 16
    Caption = #36523#20221#35388#23383#34399#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26032#32048#26126#39636
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 67
    Top = 448
    Width = 96
    Height = 16
    Caption = #23494'            '#30908#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26032#32048#26126#39636
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 67
    Top = 473
    Width = 96
    Height = 16
    Caption = #22577' '#20729'  '#20358' '#28304#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26032#32048#26126#39636
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 376
    Top = 414
    Width = 156
    Height = 12
    Caption = #35330#38321#22577#20729#21830#21697'(QuoteList.Txt)'#65306
  end
  object Memo1: TMemo
    Left = 2
    Top = 116
    Width = 639
    Height = 93
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button9: TButton
    Left = 169
    Top = 536
    Width = 110
    Height = 25
    Caption = #19979#36617#21830#21697#28165#21934
    TabOrder = 1
    OnClick = Button9Click
  end
  object Memo4: TMemo
    Left = 2
    Top = 20
    Width = 639
    Height = 77
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Memo5: TMemo
    Left = 2
    Top = 236
    Width = 639
    Height = 77
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Memo6: TMemo
    Left = 2
    Top = 332
    Width = 639
    Height = 77
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Button10: TButton
    Left = 169
    Top = 568
    Width = 110
    Height = 25
    Caption = #35330#38321#22577#20729
    TabOrder = 5
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 169
    Top = 600
    Width = 110
    Height = 25
    Caption = #20116#27284#12289#25104#20132#26126#32048
    TabOrder = 6
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 168
    Top = 505
    Width = 110
    Height = 25
    Caption = 'API'#27402#38480#35469#35657
    TabOrder = 7
    OnClick = Button12Click
  end
  object Edit7: TEdit
    Left = 168
    Top = 420
    Width = 120
    Height = 20
    TabOrder = 8
  end
  object Edit8: TEdit
    Left = 168
    Top = 448
    Width = 120
    Height = 20
    PasswordChar = '*'
    TabOrder = 9
  end
  object ComboBox1: TComboBox
    Left = 168
    Top = 472
    Width = 121
    Height = 20
    ItemHeight = 12
    TabOrder = 10
    Text = 'COMSTOCK'
    Items.Strings = (
      'COMSTOCK'
      'PATS')
  end
  object Memo7: TMemo
    Left = 344
    Top = 432
    Width = 233
    Height = 225
    ScrollBars = ssBoth
    TabOrder = 11
  end
end
