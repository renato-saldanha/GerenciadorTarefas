object FrmConsultaGenerica: TFrmConsultaGenerica
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 224
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object dbgConsulta: TDBGrid
    Left = 0
    Top = 0
    Width = 475
    Height = 166
    Align = alClient
    DataSource = dsConsulta
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgConsultaDblClick
    OnKeyDown = dbgConsultaKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 166
    Width = 475
    Height = 39
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 165
    ExplicitWidth = 471
    DesignSize = (
      475
      39)
    object btnSair: TBitBtn
      Left = 377
      Top = 3
      Width = 94
      Height = 32
      Action = actSair
      Anchors = [akRight, akBottom]
      Caption = 'Sai&r'
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
      TabOrder = 1
      ExplicitLeft = 373
    end
    object btnSelecionar: TBitBtn
      Left = 277
      Top = 3
      Width = 94
      Height = 32
      Action = actSelecionar
      Anchors = [akRight, akBottom]
      Caption = '&Selecionar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 273
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 205
    Width = 475
    Height = 19
    Panels = <
      item
        Text = 'ENTER-Selecionar Usu'#225'rio'
        Width = 50
      end>
    ExplicitTop = 204
    ExplicitWidth = 471
  end
  object dsConsulta: TDataSource
    Left = 232
    Top = 120
  end
  object ActionList1: TActionList
    Left = 328
    Top = 64
    object actSelecionar: TAction
      Caption = '&Selecionar'
      OnExecute = actSelecionarExecute
    end
    object actSair: TAction
      Caption = 'Sai&r'
      OnExecute = actSairExecute
    end
  end
end
