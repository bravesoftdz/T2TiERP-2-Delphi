inherited FFinLancamentoReceber: TFFinLancamentoReceber
  Left = 318
  Top = 144
  Caption = 'Lan'#231'amentos a Receber'
  ClientHeight = 510
  ClientWidth = 988
  ExplicitWidth = 1004
  ExplicitHeight = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 988
    Height = 479
    ActivePage = PaginaEdits
    ExplicitWidth = 988
    ExplicitHeight = 479
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 980
      ExplicitHeight = 451
      inherited PanelGrid: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        inherited Grid: TJvDBUltimGrid
          Width = 980
          Height = 399
        end
        inherited PanelFiltroRapido: TPanel
          Top = 399
          Width = 980
          ExplicitTop = 399
          ExplicitWidth = 980
          inherited BotaoConsultar: TSpeedButton
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 679
            ExplicitWidth = 679
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 980
      ExplicitHeight = 451
      inherited PanelEdits: TPanel
        Width = 980
        Height = 451
        ExplicitWidth = 980
        ExplicitHeight = 451
        object PanelParcelas: TPanel
          Left = 4
          Top = 4
          Width = 972
          Height = 443
          Align = alClient
          TabOrder = 1
          DesignSize = (
            972
            443)
          object PageControlItensLancamento: TPageControl
            Left = 6
            Top = 227
            Width = 954
            Height = 207
            ActivePage = tsItens
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object tsItens: TTabSheet
              Caption = 'Parcelas'
              object PanelItensLancamento: TPanel
                Left = 0
                Top = 0
                Width = 946
                Height = 179
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GridParcelas: TJvDBUltimGrid
                  Left = 0
                  Top = 30
                  Width = 946
                  Height = 149
                  Align = alClient
                  DataSource = DSParcelaReceber
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnCellClick = GridParcelasCellClick
                  OnKeyDown = GridParcelasKeyDown
                  TitleButtons = True
                  AlternateRowColor = 15593713
                  TitleArrow = True
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  SortWith = swFields
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'NUMERO_PARCELA'
                      ReadOnly = True
                      Title.Caption = 'N'#250'mero'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATA_EMISSAO'
                      Title.Caption = 'Data Emiss'#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATA_VENCIMENTO'
                      Title.Caption = 'Data Vencimento'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCONTO_ATE'
                      Title.Caption = 'Desconto At'#233
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'EMITIU_BOLETO'
                      Title.Caption = 'Emitir Boleto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BOLETO_NOSSO_NUMERO'
                      Title.Caption = 'Nosso N'#250'mero'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR'
                      Title.Caption = 'Valor'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TAXA_JURO'
                      Title.Caption = 'Taxa Juros'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_JURO'
                      Title.Caption = 'Valor Juros'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TAXA_MULTA'
                      Title.Caption = 'Taxa Multa'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_MULTA'
                      Title.Caption = 'Valor Multa'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TAXA_DESCONTO'
                      Title.Caption = 'Taxa Desconto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_DESCONTO'
                      Title.Caption = 'Valor Desconto'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CONTA_CAIXA.NOME'
                      ReadOnly = True
                      Title.Caption = 'Conta Caixa'
                      Width = 200
                      Visible = True
                    end>
                end
                object ActionToolBarEdits: TActionToolBar
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 940
                  Height = 24
                  ActionManager = ActionManager
                  BiDiMode = bdRightToLeft
                  Caption = 'ActionToolBarEdits'
                  ColorMap.MenuColor = clMenu
                  ColorMap.BtnSelectedColor = clBtnFace
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
            object tsNaturezaFinanceira: TTabSheet
              Caption = 'Naturezas Financeiras Vinculadas'
              ImageIndex = 1
              object PanelNaturezaFinanceira: TPanel
                Left = 0
                Top = 0
                Width = 946
                Height = 179
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object JvDBUltimGrid1: TJvDBUltimGrid
                  Left = 0
                  Top = 0
                  Width = 946
                  Height = 179
                  Align = alClient
                  DataSource = DSLancamentoNaturezaFinanceira
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = JvDBUltimGrid1KeyDown
                  TitleButtons = True
                  AlternateRowColor = 15593713
                  TitleArrow = True
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  CanDelete = False
                  EditControls = <>
                  RowsHeight = 17
                  TitleRowHeight = 17
                  SortWith = swFields
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
                      ReadOnly = True
                      Title.Caption = 'Natureza Financeira - Classifica'#231#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NATUREZA_FINANCEIRA.DESCRICAO'
                      ReadOnly = True
                      Title.Caption = 'Natureza Financeira - Descri'#231#227'o'
                      Width = 300
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATA_INCLUSAO'
                      ReadOnly = True
                      Title.Caption = 'Data Inclus'#227'o'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR'
                      Title.Caption = 'Valor'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PERCENTUAL'
                      Title.Caption = 'Percentual'
                      Visible = True
                    end>
                end
              end
            end
          end
          object PanelContaCaixa: TPanel
            Left = 6
            Top = 164
            Width = 954
            Height = 55
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvLowered
            TabOrder = 1
            DesignSize = (
              954
              55)
            object EditIdContaCaixa: TLabeledCalcEdit
              Left = 9
              Top = 24
              Width = 61
              Height = 21
              DisplayFormat = '#'
              ShowButton = False
              TabOrder = 0
              DecimalPlacesAlwaysShown = False
              OnKeyUp = EditIdContaCaixaKeyUp
              CalcEditLabel.Width = 364
              CalcEditLabel.Height = 13
              CalcEditLabel.Caption = 
                'Conta/Caixa Prevista para Recebimento das Parcelas (Fluxo de Cai' +
                'xa) [F1]:'
            end
            object EditContaCaixa: TLabeledEdit
              Left = 70
              Top = 24
              Width = 873
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              EditLabel.Width = 6
              EditLabel.Height = 13
              EditLabel.Caption = '  '
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
        object PanelMestre: TPanel
          Left = 10
          Top = 12
          Width = 954
          Height = 149
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            954
            149)
          object EditIdCliente: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ParentShowHint = False
            ShowButton = False
            ShowHint = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdClienteKeyUp
            CalcEditLabel.Width = 60
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Cliente [F1]:'
          end
          object EditCliente: TLabeledEdit
            Left = 70
            Top = 24
            Width = 769
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 1
          end
          object EditIdDocumentoOrigem: TLabeledCalcEdit
            Left = 9
            Top = 73
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
            TabOrder = 2
            DecimalPlacesAlwaysShown = False
            OnKeyUp = EditIdDocumentoOrigemKeyUp
            CalcEditLabel.Width = 118
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Documento Origem [F1]:'
          end
          object EditDocumentoOrigem: TLabeledEdit
            Left = 70
            Top = 73
            Width = 424
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            EditLabel.Width = 6
            EditLabel.Height = 13
            EditLabel.Caption = '  '
            ReadOnly = True
            TabOrder = 3
          end
          object EditPrimeiroVencimento: TLabeledDateEdit
            Left = 822
            Top = 119
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 13
            DateEditLabel.Width = 100
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Primeiro Vencimento:'
          end
          object EditQuantidadeParcelas: TLabeledCalcEdit
            Left = 619
            Top = 119
            Width = 91
            Height = 21
            ShowButton = False
            TabOrder = 11
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 78
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Qt. de Parcelas:'
          end
          object EditValorAReceber: TLabeledCalcEdit
            Left = 245
            Top = 119
            Width = 114
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 8
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 80
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor a Receber:'
          end
          object EditValorTotal: TLabeledCalcEdit
            Left = 9
            Top = 119
            Width = 120
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 6
            DecimalPlacesAlwaysShown = False
            OnExit = EditValorTotalExit
            CalcEditLabel.Width = 55
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Total:'
          end
          object EditDataLancamento: TLabeledDateEdit
            Left = 822
            Top = 73
            Width = 121
            Height = 21
            Anchors = [akTop, akRight]
            ShowNullDate = False
            TabOrder = 5
            DateEditLabel.Width = 88
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Lan'#231'amento:'
          end
          object EditNumeroDocumento: TLabeledEdit
            Left = 500
            Top = 73
            Width = 316
            Height = 21
            Anchors = [akTop, akRight]
            EditLabel.Width = 113
            EditLabel.Height = 13
            EditLabel.Caption = 'N'#250'mero do Documento:'
            TabOrder = 4
          end
          object EditIntervalorEntreParcelas: TLabeledCalcEdit
            Left = 716
            Top = 119
            Width = 100
            Height = 21
            ShowButton = False
            TabOrder = 12
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 91
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Intervalo Parcelas:'
          end
          object EditTaxaComissao: TLabeledCalcEdit
            Left = 365
            Top = 119
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 9
            DecimalPlacesAlwaysShown = False
            OnExit = EditTaxaComissaoExit
            CalcEditLabel.Width = 72
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Comiss'#227'o'
          end
          object EditValorComissao: TLabeledCalcEdit
            Left = 492
            Top = 119
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 10
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 72
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Comiss'#227'o'
          end
          object EditDescontoConvenio: TLabeledCalcEdit
            Left = 135
            Top = 119
            Width = 104
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 7
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 97
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Desconto Conv'#234'nio:'
          end
          object EditTaxaConvenio: TLabeledCalcEdit
            Left = 839
            Top = 24
            Width = 104
            Height = 21
            Color = clInfoBk
            DisplayFormat = '###,###,##0.00'
            Anchors = [akTop, akRight]
            ReadOnly = True
            ShowButton = False
            TabOrder = 14
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 76
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Taxa Conv'#234'nio:'
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 988
    ExplicitWidth = 988
    inherited BotaoSair: TSpeedButton
      Left = 884
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 784
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 674
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 774
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 574
      ExplicitLeft = 639
    end
  end
  object ActionManager: TActionManager
    ActionBars.ShowHints = False
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = ActionGerarParcelas
            Caption = '&Gerar Parcelas'
            ImageIndex = 29
          end>
      end
      item
        Items = <
          item
            Action = ActionGerarParcelas
            Caption = '&Gerar Parcelas'
            ImageIndex = 29
          end>
      end
      item
        Items = <
          item
            Action = ActionEmitirBoleto
            Caption = '&Emitir Boletos'
            ImageIndex = 27
          end
          item
            Action = ActionGerarParcelas
            Caption = '&Gerar Parcelas'
            ImageIndex = 29
          end>
        ActionBar = ActionToolBarEdits
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 792
    Top = 352
    StyleName = 'Ribbon - Silver'
    object ActionGerarParcelas: TAction
      Category = 'ContasAReceber'
      Caption = 'Gerar Parcelas'
      ImageIndex = 29
      OnExecute = ActionGerarParcelasExecute
    end
    object ActionEmitirBoleto: TAction
      Category = 'ContasAReceber'
      Caption = 'Emitir Boletos'
      ImageIndex = 27
      OnExecute = ActionEmitirBoletoExecute
    end
  end
  object DSParcelaReceber: TDataSource
    DataSet = CDSParcelaReceber
    Left = 64
    Top = 360
  end
  object CDSParcelaReceber: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTA_CAIXA'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_LANCAMENTO_RECEBER'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_STATUS_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_EMISSAO'
        DataType = ftDate
      end
      item
        Name = 'DATA_VENCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DESCONTO_ATE'
        DataType = ftDate
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_JURO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_MULTA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TAXA_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_JURO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_MULTA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONTA_CAIXA.NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'EMITIU_BOLETO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BOLETO_NOSSO_NUMERO'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSParcelaReceberAfterEdit
    AfterPost = CDSParcelaReceberAfterPost
    BeforeDelete = CDSParcelaReceberBeforeDelete
    Left = 64
    Top = 408
    Data = {
      A50200009619E0BD020000001800000013000000000003000000A50202494404
      000100000000000E49445F434F4E54415F434149584104000100000000001949
      445F46494E5F4C414E43414D454E544F5F524543454245520400010000000000
      1549445F46494E5F5354415455535F50415243454C4104000100000000000E4E
      554D45524F5F50415243454C4104000100000000000C444154415F454D495353
      414F04000600000000000F444154415F56454E43494D454E544F040006000000
      00000C444553434F4E544F5F41544504000600000000000556414C4F520A0012
      000000020008444543494D414C53020002000600055749445448020002000F00
      09544158415F4A55524F0A0012000000020008444543494D414C530200020006
      00055749445448020002000F000A544158415F4D554C54410A00120000000200
      08444543494D414C53020002000600055749445448020002000F000D54415841
      5F444553434F4E544F0A0012000000020008444543494D414C53020002000600
      055749445448020002000F000A56414C4F525F4A55524F0A0012000000020008
      444543494D414C53020002000600055749445448020002000F000B56414C4F52
      5F4D554C54410A0012000000020008444543494D414C53020002000600055749
      445448020002000F000E56414C4F525F444553434F4E544F0A00120000000200
      08444543494D414C53020002000600055749445448020002000F000850455253
      49535445010049000000010005574944544802000200010010434F4E54415F43
      414958412E4E4F4D4501004900000001000557494454480200020064000D454D
      495449555F424F4C45544F010049000000010005574944544802000200010013
      424F4C45544F5F4E4F53534F5F4E554D45524F01004900000001000557494454
      480200020032000000}
    object CDSParcelaReceberID: TIntegerField
      FieldName = 'ID'
    end
    object CDSParcelaReceberID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object CDSParcelaReceberID_FIN_LANCAMENTO_RECEBER: TIntegerField
      FieldName = 'ID_FIN_LANCAMENTO_RECEBER'
    end
    object CDSParcelaReceberID_FIN_STATUS_PARCELA: TIntegerField
      FieldName = 'ID_FIN_STATUS_PARCELA'
    end
    object CDSParcelaReceberNUMERO_PARCELA: TIntegerField
      FieldName = 'NUMERO_PARCELA'
    end
    object CDSParcelaReceberDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object CDSParcelaReceberDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object CDSParcelaReceberDESCONTO_ATE: TDateField
      FieldName = 'DESCONTO_ATE'
    end
    object CDSParcelaReceberVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaReceberTAXA_JURO: TFMTBCDField
      FieldName = 'TAXA_JURO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaReceberTAXA_MULTA: TFMTBCDField
      FieldName = 'TAXA_MULTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaReceberTAXA_DESCONTO: TFMTBCDField
      FieldName = 'TAXA_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaReceberVALOR_JURO: TFMTBCDField
      FieldName = 'VALOR_JURO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaReceberVALOR_MULTA: TFMTBCDField
      FieldName = 'VALOR_MULTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaReceberVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 6
    end
    object CDSParcelaReceberPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSParcelaReceberCONTA_CAIXANOME: TStringField
      FieldName = 'CONTA_CAIXA.NOME'
      Size = 100
    end
    object CDSParcelaReceberEMITIU_BOLETO: TStringField
      FieldName = 'EMITIU_BOLETO'
      Size = 1
    end
    object CDSParcelaReceberBOLETO_NOSSO_NUMERO: TStringField
      FieldName = 'BOLETO_NOSSO_NUMERO'
      Size = 50
    end
  end
  object CDSLancamentoNaturezaFinanceira: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_FIN_LANCAMENTO_RECEBER'
        DataType = ftInteger
      end
      item
        Name = 'ID_CONTABIL_LANCAMENTO_DET'
        DataType = ftInteger
      end
      item
        Name = 'ID_NATUREZA_FINANCEIRA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_INCLUSAO'
        DataType = ftDate
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NATUREZA_FINANCEIRA.DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PERSISTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = CDSLancamentoNaturezaFinanceiraAfterEdit
    BeforePost = CDSLancamentoNaturezaFinanceiraBeforePost
    AfterPost = CDSLancamentoNaturezaFinanceiraAfterPost
    Left = 224
    Top = 408
    Data = {
      A90100009619E0BD02000000180000000A000000000003000000A90102494404
      000100000000001949445F46494E5F4C414E43414D454E544F5F524543454245
      5204000100000000001A49445F434F4E544142494C5F4C414E43414D454E544F
      5F44455404000100000000001649445F4E41545552455A415F46494E414E4345
      49524104000100000000000D444154415F494E434C5553414F04000600000000
      000556414C4F520A0012000000020008444543494D414C530200020006000557
      49445448020002000F001F4E41545552455A415F46494E414E43454952412E43
      4C4153534946494341430100490000000200055749445448020002001E000946
      49454C444E414D45220009804E41545552455A415F46494E414E43454952412E
      434C415353494649434143414F001D4E41545552455A415F46494E414E434549
      52412E44455343524943414F0100490000000100055749445448020002006400
      08504552534953544501004900000001000557494454480200020001000A5045
      5243454E5455414C0A0012000000020008444543494D414C5302000200060005
      5749445448020002000F000000}
    object CDSLancamentoNaturezaFinanceiraID: TIntegerField
      FieldName = 'ID'
    end
    object CDSLancamentoNaturezaFinanceiraID_FIN_LANCAMENTO_RECEBER: TIntegerField
      FieldName = 'ID_FIN_LANCAMENTO_RECEBER'
    end
    object CDSLancamentoNaturezaFinanceiraID_CONTABIL_LANCAMENTO_DET: TIntegerField
      FieldName = 'ID_CONTABIL_LANCAMENTO_DET'
    end
    object CDSLancamentoNaturezaFinanceiraID_NATUREZA_FINANCEIRA: TIntegerField
      FieldName = 'ID_NATUREZA_FINANCEIRA'
    end
    object CDSLancamentoNaturezaFinanceiraDATA_INCLUSAO: TDateField
      FieldName = 'DATA_INCLUSAO'
    end
    object CDSLancamentoNaturezaFinanceiraVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 6
    end
    object CDSLancamentoNaturezaFinanceiraNATUREZA_FINANCEIRACLASSIFICACAO: TStringField
      FieldName = 'NATUREZA_FINANCEIRA.CLASSIFICACAO'
      Size = 30
    end
    object CDSLancamentoNaturezaFinanceiraNATUREZA_FINANCEIRADESCRICAO: TStringField
      FieldName = 'NATUREZA_FINANCEIRA.DESCRICAO'
      Size = 100
    end
    object CDSLancamentoNaturezaFinanceiraPERSISTE: TStringField
      FieldName = 'PERSISTE'
      Size = 1
    end
    object CDSLancamentoNaturezaFinanceiraPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Precision = 15
      Size = 6
    end
  end
  object DSLancamentoNaturezaFinanceira: TDataSource
    DataSet = CDSLancamentoNaturezaFinanceira
    Left = 224
    Top = 360
  end
end
