inherited FFinMesclaRecebimento: TFFinMesclaRecebimento
  Tag = 1
  Left = 324
  Top = 157
  Caption = 'Mesclagem'
  ClientHeight = 503
  ClientWidth = 990
  ExplicitWidth = 1006
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 990
    Height = 472
    ActivePage = PaginaEdits
    ExplicitWidth = 990
    ExplicitHeight = 472
    inherited PaginaGrid: TTabSheet
      ExplicitWidth = 982
      ExplicitHeight = 444
      inherited PanelGrid: TPanel
        Width = 982
        Height = 444
        ExplicitWidth = 982
        ExplicitHeight = 444
        inherited Grid: TJvDBUltimGrid
          Width = 982
          Height = 392
          OnCellClick = GridCellClick
          OnDrawColumnCell = GridDrawColumnCell
        end
        inherited PanelFiltroRapido: TPanel
          Top = 392
          Width = 982
          ExplicitTop = 392
          ExplicitWidth = 982
          inherited BotaoConsultar: TSpeedButton
            Left = 850
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 686
            ExplicitWidth = 654
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 982
      ExplicitHeight = 444
      inherited PanelEdits: TPanel
        Width = 982
        Height = 444
        ExplicitWidth = 982
        ExplicitHeight = 444
        object BevelEdits: TBevel
          Left = 9
          Top = 12
          Width = 963
          Height = 423
          Anchors = [akLeft, akTop, akRight, akBottom]
          Constraints.MinWidth = 753
        end
        object PanelMestre: TPanel
          Left = 15
          Top = 19
          Width = 950
          Height = 149
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            950
            149)
          object EditIdCliente: TLabeledCalcEdit
            Left = 9
            Top = 24
            Width = 61
            Height = 21
            DisplayFormat = '#'
            ShowButton = False
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
            Width = 869
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
            Width = 420
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
          object ComboBoxRecebimentoCompartilhado: TLabeledComboBox
            Left = 801
            Top = 73
            Width = 138
            Height = 21
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ItemIndex = 0
            TabOrder = 5
            Text = 'Sim'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ComboBoxLabel.Width = 139
            ComboBoxLabel.Height = 13
            ComboBoxLabel.Caption = 'Recebimento Compartilhado?'
          end
          object EditImagemDocumento: TLabeledEdit
            Left = 720
            Top = 119
            Width = 219
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 114
            EditLabel.Height = 13
            EditLabel.Caption = 'Imagem do Documento:'
            ReadOnly = True
            TabOrder = 12
          end
          object EditPrimeiroVencimento: TLabeledDateEdit
            Left = 593
            Top = 119
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 11
            DateEditLabel.Width = 100
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Primeiro Vencimento:'
          end
          object EditQuantidadeParcelas: TLabeledCalcEdit
            Left = 390
            Top = 119
            Width = 91
            Height = 21
            ShowButton = False
            TabOrder = 9
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 78
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Qt. de Parcelas:'
          end
          object EditValorAReceber: TLabeledCalcEdit
            Left = 263
            Top = 119
            Width = 121
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
            Left = 136
            Top = 119
            Width = 121
            Height = 21
            DisplayFormat = '###,###,##0.00'
            ShowButton = False
            TabOrder = 7
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 55
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Valor Total:'
          end
          object EditDataLancamento: TLabeledDateEdit
            Left = 9
            Top = 119
            Width = 121
            Height = 21
            ShowNullDate = False
            TabOrder = 6
            DateEditLabel.Width = 88
            DateEditLabel.Height = 13
            DateEditLabel.Caption = 'Data Lan'#231'amento:'
          end
          object EditNumeroDocumento: TLabeledEdit
            Left = 496
            Top = 73
            Width = 299
            Height = 21
            Anchors = [akTop, akRight]
            EditLabel.Width = 113
            EditLabel.Height = 13
            EditLabel.Caption = 'N'#250'mero do Documento:'
            TabOrder = 4
          end
          object EditIntervalorEntreParcelas: TLabeledCalcEdit
            Left = 487
            Top = 119
            Width = 100
            Height = 21
            ShowButton = False
            TabOrder = 10
            DecimalPlacesAlwaysShown = False
            CalcEditLabel.Width = 91
            CalcEditLabel.Height = 13
            CalcEditLabel.Caption = 'Intervalo Parcelas:'
          end
        end
        object PageControlItensLancamento: TPageControl
          Left = 15
          Top = 176
          Width = 950
          Height = 254
          ActivePage = tsLancamentos
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object tsLancamentos: TTabSheet
            Caption = 'Lan'#231'amentos Selecionados'
            object PanelItensLancamento: TPanel
              Left = 0
              Top = 0
              Width = 942
              Height = 226
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GridItens: TJvDBUltimGrid
                Left = 0
                Top = 0
                Width = 942
                Height = 200
                Align = alClient
                DataSource = DSLancamentoSelecionado
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
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
              end
              object PanelTotais: TPanel
                Left = 0
                Top = 200
                Width = 942
                Height = 26
                Align = alBottom
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
          end
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 990
    ExplicitWidth = 990
    inherited BotaoSair: TSpeedButton
      Left = 886
      ExplicitLeft = 889
    end
    inherited BotaoExportar: TSpeedButton
      Left = 786
      ExplicitLeft = 799
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 676
      ExplicitLeft = 719
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 776
      ExplicitLeft = 895
      ExplicitTop = -4
    end
    inherited BotaoInserir: TSpeedButton
      ExplicitLeft = 337
    end
    inherited BotaoAlterar: TSpeedButton
      ExplicitLeft = 437
    end
    inherited BotaoExcluir: TSpeedButton
      ExplicitLeft = 537
    end
    inherited BotaoCancelar: TSpeedButton
      ExplicitLeft = 637
    end
    inherited BotaoSalvar: TSpeedButton
      ExplicitLeft = 737
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 576
      ExplicitLeft = 639
    end
  end
  inherited PopupMenuExportar: TPopupMenu
    Left = 424
  end
  inherited PopupMenuAtalhosBotoesTela: TPopupMenu
    Left = 556
  end
  inherited PopupMenuAtalhosBotoesTelaCadastro: TPopupMenu
    Left = 272
  end
  object DSLancamentoSelecionado: TDataSource
    DataSet = CDSLancamentoSelecionado
    Left = 524
    Top = 247
  end
  object CDSLancamentoSelecionado: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 356
    Top = 247
  end
end
