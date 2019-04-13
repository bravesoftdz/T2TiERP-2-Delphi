inherited FOSAbertura: TFOSAbertura
  Left = 313
  Top = 96
  Caption = 'Abertura OS'
  ClientHeight = 581
  ExplicitWidth = 1008
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 550
    ActivePage = PaginaEdits
    ExplicitHeight = 550
    inherited PaginaGrid: TTabSheet
      ExplicitHeight = 522
      inherited PanelGrid: TPanel
        Height = 522
        ExplicitHeight = 522
        inherited Grid: TJvDBUltimGrid
          Height = 470
        end
        inherited PanelFiltroRapido: TPanel
          Top = 470
          ExplicitTop = 470
          inherited BotaoConsultar: TSpeedButton
            Left = 852
            ExplicitLeft = 857
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 683
            ExplicitWidth = 683
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 984
      ExplicitHeight = 522
      inherited PanelEdits: TPanel
        Height = 522
        ExplicitHeight = 522
        object ScrollBox: TScrollBox
          Left = 4
          Top = 4
          Width = 976
          Height = 514
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          DesignSize = (
            976
            514)
          object BevelEdits: TBevel
            Left = 7
            Top = 8
            Width = 959
            Height = 57
            Anchors = [akLeft, akTop, akRight]
            Constraints.MinWidth = 753
          end
          object PageControlDadosOSAbertura: TPageControl
            Left = 7
            Top = 80
            Width = 959
            Height = 426
            ActivePage = tsDadosComplementares
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 6
            object tsDadosComplementares: TTabSheet
              Caption = 'Dados Complementares'
              object PanelDadosComplementares: TPanel
                Left = 0
                Top = 0
                Width = 951
                Height = 398
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  951
                  398)
                object EditDataInicio: TLabeledDateEdit
                  Left = 175
                  Top = 23
                  Width = 90
                  Height = 21
                  ShowNullDate = False
                  TabOrder = 0
                  DateEditLabel.Width = 55
                  DateEditLabel.Height = 13
                  DateEditLabel.Caption = 'Data In'#237'cio:'
                end
                object EditDataPrevisao: TLabeledDateEdit
                  Left = 335
                  Top = 23
                  Width = 90
                  Height = 21
                  ShowNullDate = False
                  TabOrder = 1
                  DateEditLabel.Width = 71
                  DateEditLabel.Height = 13
                  DateEditLabel.Caption = 'Data Previs'#227'o:'
                end
                object EditDataFim: TLabeledDateEdit
                  Left = 521
                  Top = 23
                  Width = 90
                  Height = 21
                  ShowNullDate = False
                  TabOrder = 2
                  DateEditLabel.Width = 46
                  DateEditLabel.Height = 13
                  DateEditLabel.Caption = 'Data Fim:'
                end
                object MemoObservacaoCliente: TLabeledMemo
                  Left = 5
                  Top = 111
                  Width = 940
                  Height = 111
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 5
                  MemoLabel.Width = 98
                  MemoLabel.Height = 13
                  MemoLabel.Caption = 'Observa'#231#227'o Cliente:'
                end
                object EditNumero: TLabeledEdit
                  Left = 5
                  Top = 23
                  Width = 164
                  Height = 21
                  EditLabel.Width = 41
                  EditLabel.Height = 13
                  EditLabel.Caption = 'N'#250'mero:'
                  MaxLength = 50
                  TabOrder = 3
                end
                object EditNomeContato: TLabeledEdit
                  Left = 5
                  Top = 66
                  Width = 820
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  EditLabel.Width = 73
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Nome Contato:'
                  MaxLength = 44
                  TabOrder = 4
                end
                object EditHoraInicio: TLabeledMaskEdit
                  Left = 271
                  Top = 23
                  Width = 58
                  Height = 21
                  EditLabel.Width = 55
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Hora In'#237'cio:'
                  MaxLength = 8
                  TabOrder = 6
                  Text = '  :::: : :'
                  Required = False
                  EditMask = '##:##:##;1;_'
                  MaskState = [msMasked]
                end
                object EditHoraPrevisao: TLabeledMaskEdit
                  Left = 431
                  Top = 23
                  Width = 84
                  Height = 21
                  EditLabel.Width = 71
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Hora Previs'#227'o:'
                  MaxLength = 8
                  TabOrder = 7
                  Text = '  :: : :'
                  Required = False
                  EditMask = '##:##:##;1;_'
                  MaskState = [msMasked]
                end
                object EditHoraFim: TLabeledMaskEdit
                  Left = 617
                  Top = 23
                  Width = 59
                  Height = 21
                  EditLabel.Width = 46
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Hora Fim:'
                  MaxLength = 8
                  TabOrder = 8
                  Text = '  :::: : :'
                  Required = False
                  EditMask = '##:##:##;1;_'
                  MaskState = [msMasked]
                end
                object EditFoneContato: TLabeledMaskEdit
                  Left = 831
                  Top = 66
                  Width = 111
                  Height = 21
                  Anchors = [akTop]
                  EditLabel.Width = 70
                  EditLabel.Height = 13
                  EditLabel.Caption = 'Fone Contato:'
                  MaxLength = 14
                  TabOrder = 9
                  Text = '((() ) ) -  -  -'
                  Required = False
                  EditMask = '(##)#####-####;0;_'
                  MaskState = [msMasked]
                end
                object MemoObservacaoAbertura: TLabeledMemo
                  Left = 5
                  Top = 247
                  Width = 940
                  Height = 130
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 10
                  MemoLabel.Width = 108
                  MemoLabel.Height = 13
                  MemoLabel.Caption = 'Observa'#231#227'o Abertura:'
                end
              end
            end
            object tsProdutoServico: TTabSheet
              Caption = 'Produto / Servi'#231'o'
              ImageIndex = 2
              object PanelDocumentacao: TPanel
                Left = 0
                Top = 0
                Width = 951
                Height = 398
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridProdutoServico: TJvDBUltimGrid
                  Left = 0
                  Top = 26
                  Width = 951
                  Height = 372
                  Align = alClient
                  DataSource = DSOSProdutoServico
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = GridProdutoServicoKeyDown
                  AlternateRowColor = 15593713
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                end
                object ActionToolBar1: TActionToolBar
                  Left = 0
                  Top = 0
                  Width = 951
                  Height = 26
                  ActionManager = ActionManagerBem
                  Caption = 'ActionToolBar1'
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object tsEquipamento: TTabSheet
              Caption = 'Equipamento'
              ImageIndex = 2
              object PanelDepreciacao: TPanel
                Left = 0
                Top = 0
                Width = 951
                Height = 398
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridEquipamentos: TJvDBUltimGrid
                  Left = 0
                  Top = 26
                  Width = 951
                  Height = 372
                  Align = alClient
                  DataSource = DSOSAberturaEquipamento
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = GridEquipamentosKeyDown
                  AlternateRowColor = 15593713
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                end
                object ActionToolBarDepreciacao: TActionToolBar
                  Left = 0
                  Top = 0
                  Width = 951
                  Height = 26
                  ActionManager = ActionManagerBem
                  BiDiMode = bdRightToLeft
                  Color = clMenuBar
                  ColorMap.DisabledFontColor = 7171437
                  ColorMap.HighlightColor = clWhite
                  ColorMap.BtnSelectedFont = clBlack
                  ColorMap.UnusedColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Orientation = boRightToLeft
                  ParentBiDiMode = False
                  ParentFont = False
                  Spacing = 0
                end
              end
            end
            object tsEvolucao: TTabSheet
              Caption = 'Evolu'#231#227'o'
              ImageIndex = 3
              object PanelMovimentacao: TPanel
                Left = 0
                Top = 0
                Width = 951
                Height = 398
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridEvolucao: TJvDBUltimGrid
                  Left = 0
                  Top = 0
                  Width = 951
                  Height = 398
                  Align = alClient
                  DataSource = DSOSEvolucao
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = GridEvolucaoKeyDown
                  AlternateRowColor = 15593713
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                end
              end
            end
          end
          object EditIdStatusOS: TLabeledCalcEdit
            Left = 16
            Top = 30
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdStatusOSKeyUp
            CalcEditLabel.Width = 58
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Status [F1]:'
          end
          object EditStatusNome: TLabeledEdit
            Left = 77
            Top = 30
            Width = 212
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 1
          end
          object EditIdColaborador: TLabeledCalcEdit
            Left = 295
            Top = 30
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdColaboradorKeyUp
            CalcEditLabel.Width = 86
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Colaborador [F1]:'
          end
          object EditColaboradorNome: TLabeledEdit
            Left = 356
            Top = 30
            Width = 218
            Height = 21
            TabStop = False
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 3
          end
          object EditIdCliente: TLabeledCalcEdit
            Left = 580
            Top = 30
            Width = 61
            Height = 21
            ShowButton = False
            TabOrder = 4
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdClienteKeyUp
            CalcEditLabel.Width = 60
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Cliente [F1]:'
          end
          object EditClienteNome: TLabeledEdit
            Left = 641
            Top = 30
            Width = 314
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    inherited BotaoSair: TSpeedButton
      ExplicitLeft = 913
    end
    inherited BotaoExportar: TSpeedButton
      ExplicitLeft = 823
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 678
      ExplicitLeft = 743
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 778
      ExplicitLeft = 903
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 578
      ExplicitLeft = 663
    end
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Top = 23
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 720
    Top = 24
  end
  object CDSOSProdutoServico: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PATRIM_BEM'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'IMAGEM'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 88
    Top = 507
  end
  object DSOSProdutoServico: TDataSource
    DataSet = CDSOSProdutoServico
    Left = 93
    Top = 456
  end
  object CDSOSEvolucao: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PATRIM_BEM'
        DataType = ftInteger
      end
      item
        Name = 'DATA_DEPRECIACAO'
        DataType = ftDate
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end
      item
        Name = 'TAXA'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'INDICE'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'DEPRECIACAO_ACUMULADA'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 224
    Top = 507
  end
  object DSOSEvolucao: TDataSource
    DataSet = CDSOSEvolucao
    Left = 229
    Top = 456
  end
  object CDSOSAberturaEquipamento: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_PATRIM_BEM'
        DataType = ftInteger
      end
      item
        Name = 'ID_PATRIM_TIPO_MOVIMENTACAO'
        DataType = ftInteger
      end
      item
        Name = 'PATRIM_TIPO_MOVIMENTACAO.NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DATA_MOVIMENTACAO'
        DataType = ftDate
      end
      item
        Name = 'RESPONSAVEL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ControlaPersistencia
    Left = 376
    Top = 507
  end
  object DSOSAberturaEquipamento: TDataSource
    DataSet = CDSOSAberturaEquipamento
    Left = 381
    Top = 456
  end
  object ActionManagerBem: TActionManager
    ActionBars = <
      item
        ActionBar = ActionToolBarDepreciacao
      end
      item
        ActionBar = ActionToolBar1
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 740
    Top = 489
    StyleName = 'Platform Default'
  end
end
