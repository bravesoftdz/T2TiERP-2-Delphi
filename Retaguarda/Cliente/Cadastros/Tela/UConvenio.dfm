inherited FConvenio: TFConvenio
  Tag = 1
  Left = 318
  Top = 203
  Caption = 'Conv'#234'nio'
  ClientHeight = 475
  ClientWidth = 990
  ExplicitWidth = 1006
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 990
    Height = 444
    ActivePage = PaginaEdits
    ExplicitWidth = 990
    ExplicitHeight = 444
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 982
      ExplicitHeight = 416
      inherited PanelGrid: TPanel
        Width = 982
        Height = 416
        ExplicitWidth = 982
        ExplicitHeight = 416
        inherited Grid: TJvDBUltimGrid
          Width = 982
          Height = 364
        end
        inherited PanelFiltroRapido: TPanel
          Top = 364
          Width = 982
          ExplicitTop = 364
          ExplicitWidth = 982
          inherited BotaoConsultar: TSpeedButton
            Left = 850
            ExplicitLeft = 825
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 681
            ExplicitWidth = 681
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 982
      ExplicitHeight = 416
      inherited PanelEdits: TPanel
        Width = 982
        Height = 416
        ExplicitWidth = 982
        ExplicitHeight = 416
        object BevelEdits: TBevel
          Left = 10
          Top = 11
          Width = 958
          Height = 388
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditLogradouro: TLabeledEdit
          Left = 352
          Top = 80
          Width = 608
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Logradouro:'
          TabOrder = 5
        end
        object EditContato: TLabeledEdit
          Left = 183
          Top = 177
          Width = 540
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Contato:'
          TabOrder = 11
        end
        object EditBairro: TLabeledEdit
          Left = 129
          Top = 129
          Width = 471
          Height = 21
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro:'
          TabOrder = 7
        end
        object EditDesconto: TLabeledCalcEdit
          Left = 18
          Top = 80
          Width = 105
          Height = 21
          DisplayFormat = ',0.00'
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = True
          CalcEditLabel.Width = 49
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Desconto:'
        end
        object EditVencimento: TLabeledDateEdit
          Left = 129
          Top = 80
          Width = 120
          Height = 21
          ShowNullDate = False
          TabOrder = 3
          DateEditLabel.Width = 59
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Vencimento:'
        end
        object EditUf: TLabeledEdit
          Left = 143
          Top = 177
          Width = 34
          Height = 21
          EditLabel.Width = 15
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Uf:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 10
        end
        object EditTelefone: TLabeledMaskEdit
          Left = 729
          Top = 177
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          Color = clWhite
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone:'
          MaxLength = 13
          TabOrder = 12
          Text = '((()()()-()-()-()-()-()-()- )- )-  -  -'
          Required = False
          EditMask = '(##)####-####;0;_'
          MaskState = [msMasked]
        end
        object EditDataCadastro: TLabeledDateEdit
          Left = 840
          Top = 177
          Width = 120
          Height = 21
          Anchors = [akTop, akRight]
          ShowNullDate = False
          TabOrder = 13
          DateEditLabel.Width = 74
          DateEditLabel.Height = 13
          DateEditLabel.Caption = 'Data Cadastro:'
        end
        object MemoDescricao: TLabeledMemo
          Left = 18
          Top = 221
          Width = 942
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 14
          MemoLabel.Width = 50
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Descri'#231#227'o:'
        end
        object EditNumero: TLabeledEdit
          Left = 18
          Top = 129
          Width = 105
          Height = 21
          Constraints.MinWidth = 90
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'N'#250'mero:'
          EditLabel.ParentBiDiMode = False
          TabOrder = 6
        end
        object EditMunicipioIbge: TLabeledCalcEdit
          Left = 18
          Top = 177
          Width = 119
          Height = 21
          ShowButton = False
          TabOrder = 9
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 73
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Munic'#237'pio IBGE:'
        end
        object EditNome: TLabeledEdit
          Left = 19
          Top = 35
          Width = 809
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          MaxLength = 150
          TabOrder = 0
        end
        object EditCNPJ: TLabeledMaskEdit
          Left = 834
          Top = 35
          Width = 126
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 29
          EditLabel.Height = 13
          EditLabel.Caption = 'CNPJ:'
          MaxLength = 18
          TabOrder = 1
          Text = 
            '  ......../../.-./.-./.-./.-./.-./.-./.-./.-./.-./.-./.-./.-./.-' +
            './.-./.-./.-./.-./.-./.-./.-./.-./.-./.-./.- /.- /.- /.- / - / -' +
            '   -'
          Required = False
          EditMask = '##.###.###/####-##;0;_'
          MaskState = []
        end
        object EditEmail: TLabeledEdit
          Left = 481
          Top = 321
          Width = 479
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail:'
          TabOrder = 16
        end
        object EditSite: TLabeledEdit
          Left = 19
          Top = 364
          Width = 941
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Site:'
          TabOrder = 17
        end
        object EditClassificacaoContabilConta: TLabeledEdit
          Left = 17
          Top = 321
          Width = 458
          Height = 21
          EditLabel.Width = 177
          EditLabel.Height = 13
          EditLabel.Caption = 'Classifica'#231#227'o da Conta Cont'#225'bil [F1]:'
          MaxLength = 30
          TabOrder = 15
          OnKeyUp = EditClassificacaoContabilContaKeyUp
        end
        object EditCidade: TLabeledEdit
          Left = 606
          Top = 129
          Width = 354
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 37
          EditLabel.Height = 13
          EditLabel.Caption = 'Cidade:'
          TabOrder = 8
        end
        object EditCep: TLabeledMaskEdit
          Left = 255
          Top = 80
          Width = 91
          Height = 21
          Color = clWhite
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Cep [F1]:'
          MaxLength = 9
          TabOrder = 4
          Text = '     ----------'
          OnKeyUp = EditCepKeyUp
          Required = False
          EditMask = '#####-###;0;_'
          MaskState = [msMasked]
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
    inherited BotaoFiltrar: TSpeedButton
      Left = 576
      ExplicitLeft = 639
    end
  end
end
