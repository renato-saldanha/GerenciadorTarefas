object frmCadUsuarios: TfrmCadUsuarios
  Left = 0
  Top = 0
  Caption = 'Cadastro de usu'#225'rios'
  ClientHeight = 215
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 49
    Width = 36
    Height = 13
    Caption = 'Direitos'
  end
  object Label3: TLabel
    Left = 10
    Top = 99
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object cmbDireitos: TComboBox
    Left = 10
    Top = 68
    Width = 96
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'Operador'
      'Supervisor')
  end
  object edtCodUsuario: TLabeledEdit
    Left = 10
    Top = 25
    Width = 65
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Usu'#225'rio'
    TabOrder = 0
    Text = '0'
    OnExit = edtCodUsuarioExit
    OnKeyDown = edtCodUsuarioKeyDown
    OnKeyPress = edtCodUsuarioKeyPress
  end
  object btnPesqUsu: TBitBtn
    Left = 81
    Top = 23
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
    TabOrder = 1
    TabStop = False
  end
  object edtNomeUsuario: TEdit
    Left = 112
    Top = 25
    Width = 249
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edtSenha: TEdit
    Left = 10
    Top = 118
    Width = 96
    Height = 21
    TabOrder = 4
  end
  object edtConfirmaSenha: TEdit
    Left = 112
    Top = 118
    Width = 105
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 8
    Top = 152
    Width = 73
    Height = 33
    Action = actSalvar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object Button2: TButton
    Left = 98
    Top = 152
    Width = 73
    Height = 33
    Action = actExcluir
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object Button3: TButton
    Left = 188
    Top = 152
    Width = 73
    Height = 33
    Action = actLimpar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object Button4: TButton
    Left = 278
    Top = 152
    Width = 73
    Height = 33
    Action = actSair
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 196
    Width = 367
    Height = 19
    Panels = <
      item
        Text = 'F2-Pesq.Usu'#225'rios'
        Width = 100
      end
      item
        Text = 'Alt+S-Salvar'
        Width = 72
      end
      item
        Text = 'Alt+X-Excluir'
        Width = 79
      end
      item
        Text = 'Alt+L - Limpar'
        Width = 50
      end>
  end
  object ActionList1: TActionList
    Left = 272
    Top = 64
    object actBuscarUsu: TAction
      ShortCut = 113
      OnExecute = actBuscarUsuExecute
    end
    object actSair: TAction
      Caption = 'Sai&r-ESC'
      ShortCut = 27
    end
    object actLimpar: TAction
      Caption = '&Limpar'
      OnExecute = actLimparExecute
    end
    object actExcluir: TAction
      Caption = 'E&xcluir'
      OnExecute = actExcluirExecute
    end
    object actSalvar: TAction
      Caption = '&Salvar'
      OnExecute = actSalvarExecute
    end
  end
end
