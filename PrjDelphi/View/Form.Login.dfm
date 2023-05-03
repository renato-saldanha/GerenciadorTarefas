object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Login'
  ClientHeight = 129
  ClientWidth = 338
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 18
  object edtCodUsuario: TLabeledEdit
    Left = 16
    Top = 32
    Width = 57
    Height = 26
    EditLabel.Width = 58
    EditLabel.Height = 18
    EditLabel.Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0'
    OnKeyDown = edtCodUsuarioKeyDown
    OnKeyPress = edtCodUsuarioKeyPress
  end
  object btnEntrar: TButton
    Left = 126
    Top = 64
    Width = 96
    Height = 42
    Action = actEntrar
    TabOrder = 4
  end
  object edtSenha: TLabeledEdit
    Left = 16
    Top = 80
    Width = 97
    Height = 24
    EditLabel.Width = 46
    EditLabel.Height = 18
    EditLabel.Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
    OnKeyDown = edtSenhaKeyDown
  end
  object btnPesqUsu: TBitBtn
    Left = 79
    Top = 33
    Width = 25
    Height = 25
    Action = actBuscarUsu
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    TabOrder = 2
  end
  object edtNomeUsuario: TEdit
    Left = 110
    Top = 32
    Width = 204
    Height = 26
    TabStop = False
    Color = clScrollBar
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object btnSair: TButton
    Left = 228
    Top = 64
    Width = 91
    Height = 42
    Action = actSair
    TabOrder = 6
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 110
    Width = 338
    Height = 19
    Panels = <
      item
        Text = 'F2-Pesq. Usu'#225'rios'
        Width = 50
      end>
  end
  object ActionList1: TActionList
    Left = 240
    object actSair: TAction
      Caption = 'Sair-ESC'
      ShortCut = 27
      OnExecute = actSairExecute
    end
    object actBuscarUsu: TAction
      ShortCut = 113
      OnExecute = actBuscarUsuExecute
    end
    object actEntrar: TAction
      Caption = 'Entrar'
      OnExecute = actEntrarExecute
    end
  end
end
