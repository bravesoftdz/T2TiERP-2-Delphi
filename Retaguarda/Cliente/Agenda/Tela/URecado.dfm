inherited FRecado: TFRecado
  Left = 342
  Top = 220
  Caption = 'Recados'
  ClientWidth = 933
  ExplicitWidth = 949
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 933
    ActivePage = PaginaEdits
    ExplicitWidth = 933
    inherited PaginaGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 925
      ExplicitHeight = 407
      inherited PanelGrid: TPanel
        Width = 925
        ExplicitWidth = 925
        inherited Grid: TJvDBUltimGrid
          Width = 925
        end
        inherited PanelFiltroRapido: TPanel
          Width = 925
          ExplicitWidth = 925
          inherited BotaoConsultar: TSpeedButton
            Left = 793
            ExplicitLeft = 790
          end
          inherited EditCriterioRapido: TLabeledMaskEdit
            Width = 624
            ExplicitWidth = 624
          end
        end
      end
    end
    inherited PaginaEdits: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 925
      ExplicitHeight = 407
      inherited PanelEdits: TPanel
        Width = 925
        ExplicitWidth = 925
        object BevelEdits: TBevel
          Left = 10
          Top = 12
          Width = 905
          Height = 381
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 753
        end
        object EditIdColaborador: TLabeledCalcEdit
          Left = 18
          Top = 37
          Width = 61
          Height = 21
          DisplayFormat = '#'
          ParentShowHint = False
          ShowButton = False
          ShowHint = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnKeyUp = EditIdColaboradorKeyUp
          CalcEditLabel.Width = 85
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Destinat'#225'rio [F1]:'
        end
        object EditColaborador: TLabeledEdit
          Left = 79
          Top = 37
          Width = 827
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
        object EditAssunto: TLabeledEdit
          Left = 18
          Top = 80
          Width = 888
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Assunto:'
          TabOrder = 2
        end
        object MemoTexto: TLabeledMemo
          Left = 18
          Top = 121
          Width = 888
          Height = 264
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 3
          MemoLabel.Width = 32
          MemoLabel.Height = 13
          MemoLabel.Caption = 'Texto:'
        end
      end
    end
  end
  inherited PanelToolBar: TPanel
    Width = 933
    ExplicitWidth = 933
    inherited BotaoSair: TSpeedButton
      Left = 829
      ExplicitLeft = 826
    end
    inherited BotaoExportar: TSpeedButton
      Left = 729
      ExplicitLeft = 726
    end
    inherited BotaoImprimir: TSpeedButton
      Left = 629
      ExplicitLeft = 626
    end
    inherited BotaoSeparador1: TSpeedButton
      Left = 519
      ExplicitLeft = 516
    end
    inherited BotaoFiltrar: TSpeedButton
      Left = 529
      ExplicitLeft = 526
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
            Caption = '-'
          end>
      end
      item
      end
      item
        Items = <
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
            Action = ActionExcluirItem
            Caption = '&Excluir Item'
            ImageIndex = 10
          end
          item
            Action = ActionIncluirItem
            Caption = '&Incluir Item'
            ImageIndex = 31
          end>
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    DisabledImages = FDataModule.ImagensCadastrosD
    Images = FDataModule.ImagensCadastros
    Left = 307
    Top = 120
    StyleName = 'Ribbon - Silver'
    object ActionIncluirItem: TAction
      Category = 'Opcoes'
      Caption = 'Incluir Item'
      ImageIndex = 31
    end
    object ActionExcluirItem: TAction
      Category = 'Opcoes'
      Caption = 'Excluir Item'
      ImageIndex = 10
    end
    object ActionAtualizarTotais: TAction
      Category = 'Opcoes'
      Caption = 'Atualizar Totais'
      ImageIndex = 30
    end
  end
end
