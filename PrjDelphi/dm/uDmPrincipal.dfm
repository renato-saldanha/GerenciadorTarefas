object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 265
  Width = 384
  object qryConsTarefas: TSQLQuery
    Params = <>
    Left = 128
    Top = 8
  end
  object cdsConsTarefas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsTarefas'
    Left = 128
    Top = 112
  end
  object dspConsTarefas: TDataSetProvider
    DataSet = qryConsTarefas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 135
    Top = 62
  end
  object qryAux: TSQLQuery
    Params = <>
    Left = 232
    Top = 104
  end
end
