{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Configuração do boleto

The MIT License

Copyright: Copyright (C) 2016 T2Ti.COM

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

The author may be contacted at:
t2ti.com@gmail.com</p>

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
******************************************************************************* }
unit UFinConfiguracaoBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, FinConfiguracaoBoletoVO,
  FinConfiguracaoBoletoController, Tipos, Atributos, Constantes, LabeledCtrls, JvToolEdit,
  Mask, JvExMask, JvBaseEdits, Math, StrUtils, ActnList, Generics.Collections,
  RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ShellApi, ACBrBoleto,
  Controller;

type
  [TFormDescription(TConstantes.MODULO_CONTAS_RECEBER, 'Configurações do Boleto')]

  TFFinConfiguracaoBoleto = class(TFTelaCadastro)
    PanelParcelas: TPanel;
    PanelMestre: TPanel;
    EditInstrucao01: TLabeledEdit;
    EditTaxaMulta: TLabeledCalcEdit;
    EditIdContaCaixa: TLabeledCalcEdit;
    EditContaCaixa: TLabeledEdit;
    EditInstrucao02: TLabeledEdit;
    EditCaminhoArquivoRemessa: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    EditCaminhoArquivoRetorno: TLabeledEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    EditCaminhoArquivoLogotipoBanco: TLabeledEdit;
    SpeedButton4: TSpeedButton;
    EditCaminhoArquivoPdfBoleto: TLabeledEdit;
    MemoMensagem: TLabeledMemo;
    EditLocalPagamento: TLabeledEdit;
    ComboBoxLayoutRemessa: TLabeledComboBox;
    ComboBoxAceite: TLabeledComboBox;
    ComboBoxEspecie: TLabeledComboBox;
    EditCarteira: TLabeledEdit;
    EditCodigoConvenio: TLabeledEdit;
    EditCodigoCedente: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure EditIdContaCaixaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FFinConfiguracaoBoleto: TFFinConfiguracaoBoleto;

implementation

uses ULookup, Biblioteca, UDataModule, ContaCaixaVO, ContaCaixaController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFFinConfiguracaoBoleto.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TFinConfiguracaoBoletoVO;
  ObjetoController := TFinConfiguracaoBoletoController.Create;

  inherited;
end;

procedure TFFinConfiguracaoBoleto.SpeedButton1Click(Sender: TObject);
begin
  FDataModule.Folder.Execute;
  EditCaminhoArquivoRemessa.Text := StringReplace(FDataModule.Folder.Directory,'\','/',[rfReplaceAll]) + '/';
end;

procedure TFFinConfiguracaoBoleto.SpeedButton2Click(Sender: TObject);
begin
  FDataModule.Folder.Execute;
  EditCaminhoArquivoRetorno.Text := StringReplace(FDataModule.Folder.Directory,'\','/',[rfReplaceAll]) + '/';
end;

procedure TFFinConfiguracaoBoleto.SpeedButton3Click(Sender: TObject);
begin
  FDataModule.Folder.Execute;
  EditCaminhoArquivoLogotipoBanco.Text := StringReplace(FDataModule.Folder.Directory,'\','/',[rfReplaceAll]) + '/';
end;

procedure TFFinConfiguracaoBoleto.SpeedButton4Click(Sender: TObject);
begin
  FDataModule.Folder.Execute;
  EditCaminhoArquivoPdfBoleto.Text := StringReplace(FDataModule.Folder.Directory,'\','/',[rfReplaceAll]) + '/';
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFFinConfiguracaoBoleto.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdContaCaixa.SetFocus;
  end;
end;

function TFFinConfiguracaoBoleto.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdContaCaixa.SetFocus;
  end;
end;

function TFFinConfiguracaoBoleto.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('FinConfiguracaoBoletoController.TFinConfiguracaoBoletoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      Result := TController.RetornoBoolean;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TController.ExecutarMetodo('FinConfiguracaoBoletoController.TFinConfiguracaoBoletoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFFinConfiguracaoBoleto.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TFinConfiguracaoBoletoVO.Create;

      TFinConfiguracaoBoletoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TFinConfiguracaoBoletoVO(ObjetoVO).IdContaCaixa := EditIdContaCaixa.AsInteger;
      TFinConfiguracaoBoletoVO(ObjetoVO).ContaCaixaNome := EditContaCaixa.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).Instrucao01 := EditInstrucao01.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).Instrucao02 := EditInstrucao02.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoRemessa := EditCaminhoArquivoRemessa.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoRetorno := EditCaminhoArquivoRetorno.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoLogotipo := EditCaminhoArquivoLogotipoBanco.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoPdf := EditCaminhoArquivoPdfBoleto.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).Mensagem := MemoMensagem.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).LocalPagamento := EditLocalPagamento.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).LayoutRemessa := ComboBoxLayoutRemessa.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).Aceite := IfThen(ComboBoxAceite.ItemIndex = 0, 'S', 'N');
      TFinConfiguracaoBoletoVO(ObjetoVO).Especie := Copy(ComboBoxEspecie.Text, 1, 2);
      TFinConfiguracaoBoletoVO(ObjetoVO).Carteira := EditCarteira.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).CodigoConvenio := EditCodigoConvenio.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).CodigoCedente := EditCodigoCedente.Text;
      TFinConfiguracaoBoletoVO(ObjetoVO).TaxaMulta := EditTaxaMulta.Value;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('FinConfiguracaoBoletoController.TFinConfiguracaoBoletoController', 'Insere', [TFinConfiguracaoBoletoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TFinConfiguracaoBoletoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('FinConfiguracaoBoletoController.TFinConfiguracaoBoletoController', 'Altera', [TFinConfiguracaoBoletoVO(ObjetoVO)], 'POST', 'Boolean');
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      end;
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFFinConfiguracaoBoleto.EditIdContaCaixaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdContaCaixa.Value <> 0 then
      Filtro := 'ID = ' + EditIdContaCaixa.Text
    else
      Filtro := 'ID=0';

    try
      EditIdContaCaixa.Clear;
      EditContaCaixa.Clear;
      if not PopulaCamposTransientes(Filtro, TContaCaixaVO, TContaCaixaController) then
        PopulaCamposTransientesLookup(TContaCaixaVO, TContaCaixaController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdContaCaixa.Text := CDSTransiente.FieldByName('ID').AsString;
        EditContaCaixa.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditInstrucao01.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFFinConfiguracaoBoleto.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TFinConfiguracaoBoletoVO(TController.BuscarObjeto('FinConfiguracaoBoletoController.TFinConfiguracaoBoletoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdContaCaixa.AsInteger := TFinConfiguracaoBoletoVO(ObjetoVO).IdContaCaixa;
    EditContaCaixa.Text := TFinConfiguracaoBoletoVO(ObjetoVO).ContaCaixaNome;
    EditInstrucao01.Text := TFinConfiguracaoBoletoVO(ObjetoVO).Instrucao01;
    EditInstrucao02.Text := TFinConfiguracaoBoletoVO(ObjetoVO).Instrucao02;
    EditCaminhoArquivoRemessa.Text := TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoRemessa;
    EditCaminhoArquivoRetorno.Text := TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoRetorno;
    EditCaminhoArquivoLogotipoBanco.Text := TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoLogotipo;
    EditCaminhoArquivoPdfBoleto.Text := TFinConfiguracaoBoletoVO(ObjetoVO).CaminhoArquivoPdf;
    MemoMensagem.Text := TFinConfiguracaoBoletoVO(ObjetoVO).Mensagem;
    EditLocalPagamento.Text := TFinConfiguracaoBoletoVO(ObjetoVO).LocalPagamento;
    ComboBoxLayoutRemessa.Text := TFinConfiguracaoBoletoVO(ObjetoVO).LayoutRemessa;
    ComboBoxAceite.ItemIndex := AnsiIndexStr(TFinConfiguracaoBoletoVO(ObjetoVO).Aceite, ['S', 'N']);
    ComboBoxEspecie.ItemIndex := AnsiIndexStr(TFinConfiguracaoBoletoVO(ObjetoVO).Especie, ['DM', 'DS', 'RC', 'NP']);
    EditCarteira.Text := TFinConfiguracaoBoletoVO(ObjetoVO).Carteira;
    EditCodigoConvenio.Text := TFinConfiguracaoBoletoVO(ObjetoVO).CodigoConvenio;
    EditCodigoCedente.Text := TFinConfiguracaoBoletoVO(ObjetoVO).CodigoCedente;
    EditTaxaMulta.Value := TFinConfiguracaoBoletoVO(ObjetoVO).TaxaMulta;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.

