object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de Tarelas'
  ClientHeight = 372
  ClientWidth = 450
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 57
    Width = 41
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object btnPesqUsuario: TBitBtn
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
    TabOrder = 0
  end
  object edtNomeUsuario: TEdit
    Left = 112
    Top = 25
    Width = 329
    Height = 21
    TabStop = False
    Color = clScrollBar
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object cmbSituacao: TComboBox
    Left = 10
    Top = 76
    Width = 96
    Height = 21
    TabOrder = 2
    OnKeyDown = cmbSituacaoKeyDown
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 52
    Width = 113
    Height = 45
    Action = actBuscarTarefas
    Caption = '&Buscar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    TabOrder = 3
  end
  object dbgTarefas: TDBGrid
    AlignWithMargins = True
    Left = 10
    Top = 106
    Width = 430
    Height = 179
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alBottom
    DataSource = dsTarefas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAREFA'
        Title.Caption = 'Tarefa'
        Width = 237
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 105
        Visible = True
      end>
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 295
    Width = 430
    Height = 48
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      430
      48)
    object btnIncluir: TBitBtn
      Left = 131
      Top = 4
      Width = 94
      Height = 40
      Action = actIncluir
      Anchors = [akTop, akRight]
      Caption = '&Incluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnLimpar: TBitBtn
      Left = 231
      Top = 4
      Width = 94
      Height = 40
      Action = actLimpar
      Anchors = [akTop, akRight]
      Caption = '&Limpar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnSair: TBitBtn
      Left = 331
      Top = 4
      Width = 94
      Height = 40
      Action = actSair
      Anchors = [akTop, akRight]
      Caption = 'Sai&r-ESC'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object edtCodUsuario: TLabeledEdit
    Left = 10
    Top = 25
    Width = 65
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Usu'#225'rio'
    TabOrder = 6
    Text = '0'
    OnExit = edtCodUsuarioExit
    OnKeyDown = edtCodUsuarioKeyDown
    OnKeyPress = edtCodUsuarioKeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 353
    Width = 450
    Height = 19
    Panels = <
      item
        Text = 'F2 - Pesquisar Usu'#225'rios'
        Width = 130
      end
      item
        Text = 'Alt+I - Incluir'
        Width = 80
      end
      item
        Text = 'Alt+L - Limpar'
        Width = 90
      end>
  end
  object ActionList1: TActionList
    Left = 248
    Top = 56
    object actSair: TAction
      Caption = 'Sai&r-ESC'
      OnExecute = actSairExecute
    end
    object actCadastrarUsuario: TAction
      Caption = 'Cadastrar Usu'#225'rio'
      OnExecute = actCadastrarUsuarioExecute
    end
    object actConsultarUsuario: TAction
      Caption = 'Consultar Usu'#225'rio'
      OnExecute = actConsultarUsuarioExecute
    end
    object actLimpar: TAction
      Caption = '&Limpar'
      OnExecute = actLimparExecute
    end
    object actBuscarTarefas: TAction
      Caption = '&Buscar'
      OnExecute = actBuscarTarefasExecute
    end
    object actBuscarUsu: TAction
      ShortCut = 113
      OnExecute = actBuscarUsuExecute
    end
    object actIncluir: TAction
      Caption = '&Incluir'
      OnExecute = actIncluirExecute
    end
  end
  object dsTarefas: TDataSource
    DataSet = dmPrincipal.cdsConsTarefas
    Left = 232
    Top = 200
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 56
    object Usurio1: TMenuItem
      Caption = 'Usu'#225'rio'
      object Cadastrodeusurio1: TMenuItem
        Action = actCadastrarUsuario
      end
      object ConsultarUsurio1: TMenuItem
        Action = actConsultarUsuario
      end
    end
  end
end
