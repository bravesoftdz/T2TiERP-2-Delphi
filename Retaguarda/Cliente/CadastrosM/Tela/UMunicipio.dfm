inherited FMunicipio: TFMunicipio
  Tag = 1
  Left = 393
  Top = 219
  Caption = 'Munic'#237'pios'
  ClientWidth = 842
  ExplicitWidth = 858
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 842
    ActivePage = PaginaEdits
    ExplicitWidth = 842
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 834
      ExplicitHeight = 407
      inherited PanelGrid: TPanel
        Width = 834
        ExplicitWidth = 834
        inherited Grid: TJvDBUltimGrid
          Width = 834
        end
        inherited PanelFiltroRapido: TPanel
          Width = 834
          ExplicitWidth = 834
          inherited BotaoConsultar: TSpeedButton
            Left = 702
            ExplicitLeft = 702
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 533
            ExplicitWidth = 533
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 834
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 834
        ExplicitWidth = 834
        object BevelEdits: TBevel
          Left = 10
          Top = 12
          Width = 811
          Height = 109
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditUfSigla: TLabeledEdit
          Left = 742
          Top = 37
          Width = 70
          Height = 21
          Anchors = [akTop, akRight]
          EditLabel.Width = 17
          EditLabel.Height = 13
          EditLabel.Caption = 'UF:'
          TabOrder = 1
        end
        object EditNome: TLabeledEdit
          Left = 19
          Top = 37
          Width = 717
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome:'
          TabOrder = 0
        end
        object EditCodigoIbge: TLabeledCalcEdit
          Left = 18
          Top = 84
          Width = 111
          Height = 21
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 63
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'C'#243'digo IBGE:'
        end
        object EditCodigoEstadual: TLabeledCalcEdit
          Left = 135
          Top = 84
          Width = 111
          Height = 21
          ShowButton = False
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 81
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'C'#243'digo Estadual:'
        end
        object EditCodigoReceitaFederal: TLabeledCalcEdit
          Left = 252
          Top = 84
          Width = 130
          Height = 21
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 115
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'C'#243'digo Receita Federal:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 842
    ExplicitWidth = 842
    inherited BotaoSair: TSpeedButton
      Left = 738
      ExplicitLeft = 738
    end
    inherited BotaoExportar: TSpeedButton
      Left = 638
      ExplicitLeft = 638
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 538
      ExplicitLeft = 538
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 428
      ExplicitLeft = 428
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 438
      ExplicitLeft = 438
    end
  end
end
