object FTabelaSelecionada: TFTabelaSelecionada
  Left = 333
  Top = 208
  Caption = 'Tabela Selecionada'
  ClientHeight = 394
  ClientWidth = 940
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridTabelaSelecionada: TDBGrid
    Left = 0
    Top = 26
    Width = 940
    Height = 368
    Align = alClient
    DataSource = DSTabelaSelecionada
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 940
    Height = 26
    ActionManager = ActionManager1
    BiDiMode = bdRightToLeft
    Caption = 'ActionMainMenuBar1'
    ColorMap.HighlightColor = 15660791
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    Spacing = 0
    ExplicitHeight = 29
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionFechar
            Caption = '&Fechar'
            ImageIndex = 2
          end>
        ActionBar = ActionMainMenuBar1
      end>
    DisabledImages = FPrincipal.ImageListBotaoDesabilitado
    Images = FPrincipal.ImageListBotaoNormal
    Left = 72
    Top = 32
    StyleName = 'Platform Default'
    object ActionFechar: TAction
      Caption = 'Fechar'
      ImageIndex = 2
      OnExecute = ActionFecharExecute
    end
  end
  object DSTabelaSelecionada: TDataSource
    DataSet = CDSTabelaSelecionada
    Left = 600
    Top = 40
  end
  object CDSTabelaSelecionada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTabelaSelecionada'
    Left = 480
    Top = 40
  end
  object DSPTabelaSelecionada: TDataSetProvider
    Left = 360
    Top = 40
  end
end
