{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Para Emiss�o de NF-e

The MIT License

Copyright: Copyright (C) 2014 T2Ti.COM

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
t2ti.com@gmail.com

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Atributos, Constantes,
  ActnList, RibbonSilverStyleActnCtrls, ActnMan, JvExStdCtrls, JvEdit,
  JvValidateEdit, JvCombobox, Mask, JvExMask, JvToolEdit, ToolWin, pcnNFeRTXT,
  ActnCtrls, Generics.Collections, ACBrDFeUtil, pcnConversao, StrUtils,
  LabeledCtrls, DB, DBClient, JvBaseEdits, JvExExtCtrls, JvNetscapeSplitter,
  Biblioteca, Actions, Controller, EmpresaVO, pcnConversaoNFe,
  TributOperacaoFiscalVO, NfeNumeroVO, NfeConfiguracaoVO, NFeCalculoController,
  frxBarcode, frxClass;

type
  [TFormDescription(TConstantes.MODULO_NFE, 'Nota Fiscal Eletr�nica')]

  TFNFe = class(TFTelaCadastro)
    ActionManager: TActionManager;
    ScrollBox: TScrollBox;
    BevelEdits: TBevel;
    ActionToolBarEdits: TActionToolBar;
    PageControlEdits: TPageControl;
    TabSheetDadosNotaFiscal: TTabSheet;
    PanelDadosNotaFiscal: TPanel;
    EditNumeroNfe: TLabeledEdit;
    EditSerie: TLabeledEdit;
    EditNaturezaOperacao: TLabeledEdit;
    GroupBoxDestinatario: TGroupBox;
    EditDestinatarioCpfCnpj: TLabeledEdit;
    EditDestinatarioIE: TLabeledEdit;
    EditDestinatarioTelefone: TLabeledEdit;
    EditDestinatarioLogradouro: TLabeledEdit;
    EditDestinatarioNumero: TLabeledEdit;
    EditDestinatarioBairro: TLabeledEdit;
    EditDestinatarioCEP: TLabeledEdit;
    EditDestinatarioCidade: TLabeledEdit;
    EditDestinatarioUF: TLabeledEdit;
    EditDestinatarioComplemento: TLabeledEdit;
    EditDestinatarioRazao: TLabeledEdit;
    EditDestinatarioEmail: TLabeledEdit;
    TabSheetDocumentosReferenciados: TTabSheet;
    TabSheetEntregaRetirada: TTabSheet;
    PanelEntregaRetirada: TPanel;
    GroupBoxEntrega: TGroupBox;
    EditEntregaCpfCnpj: TLabeledEdit;
    EditEntregaLogradouro: TLabeledEdit;
    EditEntregaNumero: TLabeledEdit;
    EditEntregaBairro: TLabeledEdit;
    EditEntregaCidade: TLabeledEdit;
    EditEntregaUf: TLabeledEdit;
    EditEntregaComplemento: TLabeledEdit;
    GroupBoxRetirada: TGroupBox;
    EditRetiradaCpfCnpj: TLabeledEdit;
    EditRetiradaLogradouro: TLabeledEdit;
    EditRetiradaNumero: TLabeledEdit;
    EditRetiradaBairro: TLabeledEdit;
    EditRetiradaCidade: TLabeledEdit;
    EditRetiradaUf: TLabeledEdit;
    EditRetiradaComplemento: TLabeledEdit;
    TabSheetProdutos: TTabSheet;
    PanelDetalhes: TPanel;
    GridItens: TJvDBUltimGrid;
    TabSheetTransporte: TTabSheet;
    PanelTransporte: TPanel;
    GroupBoxTransportador: TGroupBox;
    EditTransportadorCpfCnpj: TLabeledEdit;
    EditTransportadorIE: TLabeledEdit;
    EditTransportadorLogradouro: TLabeledEdit;
    EditTransportadorCidade: TLabeledEdit;
    EditTransportadorUF: TLabeledEdit;
    EditTransportadorRazaoSocial: TLabeledEdit;
    GroupBoxTransporteRetencaoICMS: TGroupBox;
    EditRetencaoIcmsUf: TLabeledEdit;
    GroupBoxVeiculo: TGroupBox;
    EditVeiculoRntc: TLabeledEdit;
    EditVeiculoPlaca: TLabeledEdit;
    EditVeiculoUf: TLabeledEdit;
    GroupBoxReboque: TGroupBox;
    GroupBoxVolumes: TGroupBox;
    TabSheetInformacoesAdicionais: TTabSheet;
    TabSheetCobranca: TTabSheet;
    PanelCobranca: TPanel;
    PanelFatura: TPanel;
    GroupBoxFatura: TGroupBox;
    EditFaturaNumero: TLabeledEdit;
    TabSheetRespostaSefaz: TTabSheet;
    MemoRespostas: TMemo;
    EditDataHoraEmissao: TLabeledDateEdit;
    EditDataEntradaSaida: TLabeledDateEdit;
    EditHoraEntradaSaida: TLabeledMaskEdit;
    ComboTipoOperacao: TLabeledComboBox;
    ComboTipoEmissao: TLabeledComboBox;
    ComboFinalidadeEmissao: TLabeledComboBox;
    ComboFormaImpDanfe: TLabeledComboBox;
    ComboBoxFormaPagamento: TLabeledComboBox;
    EditChaveAcesso: TLabeledEdit;
    ComboModalidadeFrete: TLabeledComboBox;
    GroupBox1: TGroupBox;
    GridDuplicatas: TJvDBUltimGrid;
    EditFaturaValorOriginal: TLabeledCalcEdit;
    EditFaturaValorDesconto: TLabeledCalcEdit;
    EditFaturaValorLiquido: TLabeledCalcEdit;
    GridReboque: TJvDBUltimGrid;
    GridVolumes: TJvDBUltimGrid;
    EditCodigoNumerico: TLabeledEdit;
    EditDigitoChaveAcesso: TLabeledEdit;
    EditEntregaIbge: TLabeledCalcEdit;
    EditRetiradaIbge: TLabeledCalcEdit;
    EditRetencaoIcmsBaseCalculo: TLabeledCalcEdit;
    EditRetencaoIcmsAliquota: TLabeledCalcEdit;
    EditRetencaoIcmsValorServico: TLabeledCalcEdit;
    EditRetencaoIcmsIcmsRetido: TLabeledCalcEdit;
    EditRetencaoIcmsCidade: TLabeledCalcEdit;
    PageControlReferenciado: TPageControl;
    TabSheetReferenciadoNfe: TTabSheet;
    TabSheetReferenciadoNf: TTabSheet;
    TabSheetReferenciadoCte: TTabSheet;
    TabSheetReferenciadoRural: TTabSheet;
    TabSheetReferenciadoCupom: TTabSheet;
    GridNfeReferenciada: TJvDBUltimGrid;
    GridNfReferenciada: TJvDBUltimGrid;
    GridCteReferenciado: TJvDBUltimGrid;
    GridNfRuralReferenciada: TJvDBUltimGrid;
    GridCupomReferenciado: TJvDBUltimGrid;
    EditDestinatarioId: TLabeledCalcEdit;
    EditTransportadorId: TLabeledCalcEdit;
    EditTransporteVagao: TLabeledEdit;
    EditTransporteBalsa: TLabeledEdit;
    EditRetencaoIcmsCfop: TLabeledCalcEdit;
    ComboboxModeloNotaFiscal: TLabeledComboBox;
    PageControlTotais: TPageControl;
    tsTotaisGeral: TTabSheet;
    PanelTotais: TPanel;
    EditBCIcms: TLabeledCalcEdit;
    EditValorIcms: TLabeledCalcEdit;
    EditBCIcmsSt: TLabeledCalcEdit;
    EditValorIcmsSt: TLabeledCalcEdit;
    EditValorCOFINS: TLabeledCalcEdit;
    EditValorIPI: TLabeledCalcEdit;
    EditTotalProdutos: TLabeledCalcEdit;
    EditTotalImpostoImportacao: TLabeledCalcEdit;
    EditValorTotalNota: TLabeledCalcEdit;
    EditValorFrete: TLabeledCalcEdit;
    EditValorSeguro: TLabeledCalcEdit;
    EditValorOutrasDespesas: TLabeledCalcEdit;
    EditValorPIS: TLabeledCalcEdit;
    EditValorDesconto: TLabeledCalcEdit;
    tsOutrosTotais: TTabSheet;
    PanelOutrosTotais: TPanel;
    EditBaseCalculoIssqn: TLabeledCalcEdit;
    EditValorIssqn: TLabeledCalcEdit;
    EditValorPisIssqn: TLabeledCalcEdit;
    EditValorCofinsIssqn: TLabeledCalcEdit;
    EditValorRetidoPis: TLabeledCalcEdit;
    EditValorRetidoCofins: TLabeledCalcEdit;
    EditValorRetidoCsll: TLabeledCalcEdit;
    EditValorTotalServicos: TLabeledCalcEdit;
    EditBaseCalculoIrrf: TLabeledCalcEdit;
    EditValorRetidoIrrf: TLabeledCalcEdit;
    EditBaseCalculoPrevidencia: TLabeledCalcEdit;
    EditValorRetidoPrevidencia: TLabeledCalcEdit;
    PanelInformacoesAdicionais: TPanel;
    MemoInfComplementarFisco: TLabeledMemo;
    MemoInfComplementarContribuinte: TLabeledMemo;
    GroupBox2: TGroupBox;
    EditComexLocalEmbarque: TLabeledEdit;
    EditComexUfEmbarque: TLabeledEdit;
    GroupBox3: TGroupBox;
    EditCompraPedido: TLabeledEdit;
    EditCompraNotaEmpenho: TLabeledEdit;
    EditCompraContrato: TLabeledEdit;
    EditDestinatarioSuframa: TLabeledEdit;
    ActionToolBar1: TActionToolBar;
    PanelDetalhesAnexo: TPanel;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    GroupBoxLacres: TGroupBox;
    GridVolumesLacres: TJvDBUltimGrid;
    ActionIncluirItem: TAction;
    ActionExcluirItem: TAction;
    ActionExcluirDocumentosReferenciados: TAction;
    ActionToolBar2: TActionToolBar;
    ActionToolBar3: TActionToolBar;
    ActionExcluirEntregaRetirada: TAction;
    ActionToolBar4: TActionToolBar;
    ActionExcluirTransporte: TAction;
    ActionToolBar5: TActionToolBar;
    ActionExcluirCobranca: TAction;
    ActionSelecionarCertificado: TAction;
    ActionConsultarSefaz: TAction;
    ActionImprimirDanfe: TAction;
    ActionCancelarNfe: TAction;
    ActionEnviar: TAction;
    ActionAssinar: TAction;
    ActionValidar: TAction;
    EditIdOperacaoFiscal: TLabeledCalcEdit;
    EditOperacaoFiscal: TLabeledEdit;
    ActionAtualizarTotais: TAction;
    EditIdVenda: TLabeledCalcEdit;
    EditDestinatarioCodigoIbge: TLabeledEdit;
    ActionInutilizarNFe: TAction;
    ActionEtiqueta: TAction;
    frxReport1: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    ActionCCe: TAction;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure GridItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridItensDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ActionIncluirItemExecute(Sender: TObject);
    procedure ActionExcluirItemExecute(Sender: TObject);
    procedure ActionExcluirDocumentosReferenciadosExecute(Sender: TObject);
    procedure ActionExcluirEntregaRetiradaExecute(Sender: TObject);
    procedure ActionExcluirTransporteExecute(Sender: TObject);
    procedure ActionExcluirCobrancaExecute(Sender: TObject);
    procedure ActionSelecionarCertificadoExecute(Sender: TObject);
    procedure ActionConsultarSefazExecute(Sender: TObject);
    procedure ActionImprimirDanfeExecute(Sender: TObject);
    procedure ActionCancelarNfeExecute(Sender: TObject);
    procedure ActionEnviarExecute(Sender: TObject);
    procedure ActionAssinarExecute(Sender: TObject);
    procedure ActionValidarExecute(Sender: TObject);
    procedure CalcularItem;
    procedure ActionAtualizarTotaisExecute(Sender: TObject);
    procedure ActionGerarXmlExecute(Sender: TObject);
    procedure EditDestinatarioIdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditTransportadorIdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdOperacaoFiscalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdVendaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionInutilizarNFeExecute(Sender: TObject);
    procedure ActionEtiquetaExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure ActionCCeExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarNFe;
    procedure LimparCamposDestinatario;
    procedure LimparCamposTransportadora;
    procedure ExcluirDadosReferenciados;
    procedure ExcluirDadosEntregaRetirada;
    procedure ExcluirDadosTransporte;
    procedure ExcluirDadosCobranca;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure ConfigurarLayoutTela;
  end;

var
  FNFe: TFNFe;
  ObjetoNfeConfiguracaoVO: TNfeConfiguracaoVO;
  NfeNumeroVO: TNfeNumeroVO;
  TributOperacaoFiscalVO: TTributOperacaoFiscalVO;
  CalculoNFE: TCalculoNFE;
  SeqItem: Integer;
  Mensagem: String;

implementation

uses UDataModuleNFe, UDataModule, UNfeDetalheAnexo,
  NfeCabecalhoController, NFeNumeroController,
  NfeCabecalhoVO, NfeDuplicataVO,
  NfeReferenciadaVO, NfeCupomFiscalReferenciadoVO, NfeNfReferenciadaVO,
  NfeProdRuralReferenciadaVO, NfeCteReferenciadoVO,
  NfeTransporteVolumeVO, NfeTransporteVolumeLacreVO,
  ViewTributacaoIssVO, ViewTributacaoIcmsVO, ViewTributacaoPisVO,
  ViewTributacaoCofinsVO, ViewTributacaoIpiVO, ViewTributacaoIcmsCustomVO,
  NfeDetalheVO, NfeDetEspecificoArmamentoVO, NfeTransporteReboqueVO,
  NfeDeclaracaoImportacaoVO, NfeImportacaoDetalheVO, NfeDetEspecificoMedicamentoVO,
  ViewPessoaClienteVO, ViewPessoaClienteController,
  ViewPessoaTransportadoraVO, ViewPessoaTransportadoraController,
  ProdutoVO, ProdutoController, TributOperacaoFiscalController,
  VendaCabecalhoVO, VendaCabecalhoController, FinLancamentoReceberVO, FinParcelaReceberVO,
  FinLancamentoReceberController;

{$R *.dfm}
{ TFNFe }

{$REGION 'Infra'}
procedure TFNFe.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TNfeCabecalhoVO;
  ObjetoController := TNfeCabecalhoController.Create;
  inherited;

  FNFeDetalheAnexo := TFNFeDetalheAnexo.Create(PanelDetalhesAnexo);
  with FNFeDetalheAnexo do
  begin
    Align := alClient;
    BorderStyle := bsNone;
    Parent := PanelDetalhesAnexo;
  end;
  FNFeDetalheAnexo.Show;

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfeDetalheArmamento, TNfeDetEspecificoArmamentoVO);
  ConfiguraGridFromVO(FNFeDetalheAnexo.GridDetalheArmamento, TNfeDetEspecificoArmamentoVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfeDetalheMedicamento, TNfeDetEspecificoMedicamentoVO);
  ConfiguraGridFromVO(FNFeDetalheAnexo.GridDetalheMedicamento, TNfeDetEspecificoMedicamentoVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfeDeclaracaoImportacao, TNfeDeclaracaoImportacaoVO);
  ConfiguraGridFromVO(FNFeDetalheAnexo.GridDeclaracaoImportacao, TNfeDeclaracaoImportacaoVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfeImportacaoDetalhe, TNfeImportacaoDetalheVO);
  ConfiguraGridFromVO(FNFeDetalheAnexo.GridDeclaracaoImportacaoDetalhe, TNfeImportacaoDetalheVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfReferenciada, TNfeNfReferenciadaVO);
  ConfiguraGridFromVO(GridNfReferenciada, TNfeNfReferenciadaVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSCteReferenciado, TNfeCteReferenciadoVO);
  ConfiguraGridFromVO(GridCteReferenciado, TNfeCteReferenciadoVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfRuralReferenciada, TNfeProdRuralReferenciadaVO);
  ConfiguraGridFromVO(GridNfRuralReferenciada, TNfeProdRuralReferenciadaVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSCupomReferenciado, TNfeCupomFiscalReferenciadoVO);
  ConfiguraGridFromVO(GridCupomReferenciado, TNfeCupomFiscalReferenciadoVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfeReferenciada, TNfeReferenciadaVO);
  ConfiguraGridFromVO(GridNfeReferenciada, TNfeReferenciadaVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSNfeDetalhe, TNfeDetalheVO);
  ConfiguraGridFromVO(GridItens, TNfeDetalheVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSVolumes, TNfeTransporteVolumeVO);
  ConfiguraGridFromVO(GridVolumes, TNfeTransporteVolumeVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSDuplicata, TNfeDuplicataVO);
  ConfiguraGridFromVO(GridDuplicatas, TNfeDuplicataVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSReboque, TNfeTransporteReboqueVO);
  ConfiguraGridFromVO(GridReboque, TNfeTransporteReboqueVO);

  ConfiguraCDSFromVO(FDataModuleNfe.CDSVolumesLacres, TNfeTransporteVolumeLacreVO);
  ConfiguraGridFromVO(GridVolumesLacres, TNfeTransporteVolumeLacreVO);

  ObjetoNfeConfiguracaoVO := TNfeConfiguracaoVO(TController.BuscarObjeto('NfeConfiguracaoController.TNfeConfiguracaoController', 'ConsultaObjeto', ['ID=1'], 'GET'));

  FiltroComplementar := ' and TIPO_OPERACAO = 1';
end;

procedure TFNFe.LimparCampos;
begin
  inherited;
  SeqItem := 0;
  FDataModuleNFe.CDSNfeDetalhe.EmptyDataSet;
  FDataModuleNFe.CDSNfeReferenciada.EmptyDataSet;
  FDataModuleNFe.CDSCupomReferenciado.EmptyDataSet;
  FDataModuleNFe.CDSNfeDeclaracaoImportacao.EmptyDataSet;
  FDataModuleNFe.CDSNfeImportacaoDetalhe.EmptyDataSet;
  FDataModuleNFe.CDSNfRuralReferenciada.EmptyDataSet;
  FDataModuleNFe.CDSCteReferenciado.EmptyDataSet;
  FDataModuleNFe.CDSDuplicata.EmptyDataSet;
  FDataModuleNFe.CDSNfeDetalheVeiculo.EmptyDataSet;
  FDataModuleNFe.CDSNfeDetalheArmamento.EmptyDataSet;
  FDataModuleNFe.CDSVolumes.EmptyDataSet;
  FDataModuleNFe.CDSNfReferenciada.EmptyDataSet;
  FDataModuleNFe.CDSReboque.EmptyDataSet;
  FDataModuleNFe.CDSNfeDetalheCombustivel.EmptyDataSet;
  FDataModuleNFe.CDSNfeDetalheMedicamento.EmptyDataSet;
  FDataModuleNFe.CDSNfeImpostoCofins.EmptyDataSet;
  FDataModuleNFe.CDSNfeImpostoIcms.EmptyDataSet;
  FDataModuleNFe.CDSNfeImpostoImportacao.EmptyDataSet;
  FDataModuleNFe.CDSVolumesLacres.EmptyDataSet;
  FDataModuleNFe.CDSNfeImpostoIpi.EmptyDataSet;
  FDataModuleNFe.CDSNfeImpostoIssqn.EmptyDataSet;
  FDataModuleNFe.CDSNfeImpostoPis.EmptyDataSet;
  ConfigurarLayoutTela;
end;

procedure TFNFe.LimparCamposDestinatario;
begin
  EditDestinatarioCpfCnpj.Clear;
  EditDestinatarioRazao.Clear;
  EditDestinatarioLogradouro.Clear;
  EditDestinatarioNumero.Clear;
  EditDestinatarioComplemento.Clear;
  EditDestinatarioBairro.Clear;
  EditDestinatarioCodigoIbge.Clear;
  EditDestinatarioCidade.Clear;
  EditDestinatarioUF.Clear;
  EditDestinatarioCEP.Clear;
  EditDestinatarioTelefone.Clear;
  EditDestinatarioIE.Clear;
  EditDestinatarioSuframa.Clear;
  EditDestinatarioEmail.Clear;
end;

procedure TFNFe.LimparCamposTransportadora;
begin
  EditTransportadorCpfCnpj.Clear;
  EditTransportadorRazaoSocial.Clear;
  EditTransportadorIE.Clear;
  EditTransportadorLogradouro.Clear;
  EditTransportadorCidade.Clear;
  EditTransportadorUF.Clear;
end;

procedure TFNFe.ConfigurarLayoutTela;
begin
  PageControlEdits.ActivePageIndex := 0;
end;

procedure TFNFe.ConfigurarNFe;
begin
  if ObjetoNfeConfiguracaoVO.SalvarXml = 'S' then
    FDataModule.ACBrNFe.Configuracoes.Geral.Salvar := True
  else
    FDataModule.ACBrNFe.Configuracoes.Geral.Salvar := False;

  FDataModule.ACBrNFe.Configuracoes.WebServices.Uf := ObjetoNfeConfiguracaoVO.WebserviceUf;

  if ObjetoNfeConfiguracaoVO.WebserviceAmbiente = 0 then
    FDataModule.ACBrNFe.Configuracoes.WebServices.Ambiente := taProducao
  else
    FDataModule.ACBrNFe.Configuracoes.WebServices.Ambiente := taHomologacao;

  if ObjetoNfeConfiguracaoVO.WebserviceVisualizar = 'S' then
    FDataModule.ACBrNFe.Configuracoes.WebServices.Visualizar := True
  else
    FDataModule.ACBrNFe.Configuracoes.WebServices.Visualizar := False;

  FDataModule.ACBrNFe.Configuracoes.Arquivos.PathSalvar := ObjetoNfeConfiguracaoVO.CaminhoSalvarXml;
  FDataModule.ACBrNFe.Configuracoes.Arquivos.PathSchemas := ObjetoNfeConfiguracaoVO.CaminhoSchemas;
  FDataModule.ACBrNFeDanfeFR.FastFile := ObjetoNfeConfiguracaoVO.CaminhoArquivoDanfe;
  FDataModule.ACBrNFeDanfeFR.PathPDF := ObjetoNfeConfiguracaoVO.CaminhoSalvarPdf;

  FDataModule.ACBrNFe.Configuracoes.Certificados.NumeroSerie := ObjetoNfeConfiguracaoVO.CertificadoDigitalSerie;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFNFe.DoInserir: Boolean;
begin
  try
    Result := inherited DoInserir;

    if Result then
    begin
      ConfigurarNFe;

      //Pega um n�mero
      NfeNumeroVO := TNfeNumeroVO(TController.BuscarObjeto('NfeNumeroController.TNfeNumeroController', 'ConsultaObjeto', ['1=1'], 'GET'));

      //Persiste a nota com o status "0 - Em Edi��o"
      EditDataHoraEmissao.Date := Now;
      EditDataEntradaSaida.Date := Now;
      EditHoraEntradaSaida.Text := FormatDateTime('hh:MM:ss', Now);
      EditSerie.Text := NfeNumeroVO.Serie;
      EditNumeroNfe.Text := StringOfChar('0', 9 - Length(IntToStr(NfeNumeroVO.Numero))) + IntToStr(NfeNumeroVO.Numero);
      EditCodigoNumerico.Text := StringOfChar('0', 8 - Length(IntToStr(NfeNumeroVO.Numero))) + IntToStr(NfeNumeroVO.Numero);
      EditChaveAcesso.Text :=   IntToStr(Sessao.Empresa.CodigoIbgeUf) +
                                FormatDateTime('yy', EditDataHoraEmissao.Date) +
                                FormatDateTime('mm', EditDataHoraEmissao.Date) +
                                Sessao.Empresa.Cnpj +
                                '55' +
                                EditSerie.Text +
                                EditNumeroNfe.Text +
                                '1' +
                                EditCodigoNumerico.Text;
      EditDigitoChaveAcesso.Text := Modulo11(EditChaveAcesso.Text);
      EditChaveAcesso.Text := EditChaveAcesso.Text + EditDigitoChaveAcesso.Text;

      BotaoSalvar.Click;
      BotaoAlterar.Click;
    end;
  finally
    FreeAndNil(NfeNumeroVO);
  end;
end;

function TFNFe.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    ConfigurarNFe;
    StatusTela := stEditando;
    SeqItem := FDataModuleNFe.CDSNfeDetalhe.RecordCount;
    EditIdOperacaoFiscal.SetFocus;
  end;
end;

function TFNFe.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFNFe.DoSalvar: Boolean;
var
  NfeDetalhe: TNfeDetalheVO;
  NfeDeclaracaoImportacao: TNfeDeclaracaoImportacaoVO;
  NfeImportacaoDetalhe: TNfeImportacaoDetalheVO;
  NfeDetalheMedicamento: TNfeDetEspecificoMedicamentoVO;
  NfeDetalheArmamento: TNfeDetEspecificoArmamentoVO;
begin
  if StatusTela = stEditando then
  begin
    if EditIdOperacaoFiscal.AsInteger <= 0 then
    begin
      Application.MessageBox('� necess�rio informar a opera��o fiscal.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      Exit(False);
    end;

    if (Trim(EditNumeroNfe.Text) = '') or (Trim(EditChaveAcesso.Text) = '') then
    begin
      Application.MessageBox('N�mero da nota ou chave de acesso n�o podem ficar em branco.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      Exit(False);
    end;

    ActionAtualizarTotais.Execute;
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TNfeCabecalhoVO.Create;

      TNfeCabecalhoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TNfeCabecalhoVO(ObjetoVO).EmpresaVO := TEmpresaVO(TController.BuscarObjeto('EmpresaController.TEmpresaController', 'ConsultaObjeto', ['ID=' + Sessao.Empresa.Id.ToString], 'GET'));;

      TNfeCabecalhoVO(ObjetoVO).IdCliente := EditDestinatarioId.AsInteger;
      TNfeCabecalhoVO(ObjetoVO).IdTributOperacaoFiscal := EditIdOperacaoFiscal.AsInteger;
      TNfeCabecalhoVO(ObjetoVO).UfEmitente := UFToInt(Sessao.Empresa.EnderecoPrincipal.Uf);
      TNfeCabecalhoVO(ObjetoVO).CodigoNumerico := EditCodigoNumerico.Text;
      TNfeCabecalhoVO(ObjetoVO).NaturezaOperacao := EditNaturezaOperacao.Text;
      TNfeCabecalhoVO(ObjetoVO).IndicadorFormaPagamento := ComboBoxFormaPagamento.ItemIndex;
      TNfeCabecalhoVO(ObjetoVO).CodigoModelo := Copy(ComboboxModeloNotaFiscal.Text, 1, 2);
      TNfeCabecalhoVO(ObjetoVO).Serie := EditSerie.Text;
      TNfeCabecalhoVO(ObjetoVO).Numero := EditNumeroNfe.Text;
      TNfeCabecalhoVO(ObjetoVO).DataHoraEmissao := EditDataHoraEmissao.Date;
      TNfeCabecalhoVO(ObjetoVO).DataHoraEntradaSaida := EditDataEntradaSaida.Date;
      TNfeCabecalhoVO(ObjetoVO).TipoOperacao := ComboTipoOperacao.ItemIndex;
      if Trim(EditDestinatarioCodigoIbge.Text) <> '' then
        TNfeCabecalhoVO(ObjetoVO).CodigoMunicipio := StrToInt(EditDestinatarioCodigoIbge.Text);
      TNfeCabecalhoVO(ObjetoVO).FormatoImpressaoDanfe := ComboFormaImpDanfe.ItemIndex;
      TNfeCabecalhoVO(ObjetoVO).TipoEmissao := ComboTipoEmissao.ItemIndex;
      TNfeCabecalhoVO(ObjetoVO).ChaveAcesso := EditChaveAcesso.Text;
      TNfeCabecalhoVO(ObjetoVO).DigitoChaveAcesso := EditDigitoChaveAcesso.Text;
      TNfeCabecalhoVO(ObjetoVO).Ambiente := ObjetoNfeConfiguracaoVO.WebserviceAmbiente;
      TNfeCabecalhoVO(ObjetoVO).FinalidadeEmissao := ComboFinalidadeEmissao.ItemIndex;
      TNfeCabecalhoVO(ObjetoVO).ProcessoEmissao := ObjetoNfeConfiguracaoVO.ProcessoEmissao;
      TNfeCabecalhoVO(ObjetoVO).VersaoProcessoEmissao := ObjetoNfeConfiguracaoVO.VersaoProcessoEmissao;
      TNfeCabecalhoVO(ObjetoVO).BaseCalculoIcms := EditBCIcms.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorIcms := EditValorIcms.Value;
      TNfeCabecalhoVO(ObjetoVO).BaseCalculoIcmsSt := EditBCIcmsSt.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorIcmsSt := EditValorIcmsSt.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorTotalProdutos := EditTotalProdutos.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorFrete := EditValorFrete.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorSeguro := EditValorSeguro.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorDesconto := EditValorDesconto.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorImpostoImportacao := EditTotalImpostoImportacao.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorIpi := EditValorIPI.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorPis := EditValorPIS.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorCofins := EditValorCOFINS.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorDespesasAcessorias := EditValorOutrasDespesas.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorTotal := EditValorTotalNota.Value;

      TNfeCabecalhoVO(ObjetoVO).ValorServicos := EditValorTotalServicos.Value;
      TNfeCabecalhoVO(ObjetoVO).BaseCalculoIssqn := EditBaseCalculoIssqn.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorIssqn := EditValorIssqn.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorPisIssqn := EditValorPisIssqn.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorCofinsIssqn := EditValorCofinsIssqn.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorRetidoPis := EditValorRetidoPis.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorRetidoCofins := EditValorRetidoCofins.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorRetidoCsll := EditValorRetidoCsll.Value;
      TNfeCabecalhoVO(ObjetoVO).BaseCalculoIrrf := EditBaseCalculoIrrf.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorRetidoIrrf := EditValorRetidoIrrf.Value;
      TNfeCabecalhoVO(ObjetoVO).BaseCalculoPrevidencia := EditBaseCalculoPrevidencia.Value;
      TNfeCabecalhoVO(ObjetoVO).ValorRetidoPrevidencia := EditValorRetidoPrevidencia.Value;
      TNfeCabecalhoVO(ObjetoVO).ComexUfEmbarque := EditComexUfEmbarque.Text;
      TNfeCabecalhoVO(ObjetoVO).ComexLocalEmbarque := EditComexLocalEmbarque.Text;
      TNfeCabecalhoVO(ObjetoVO).CompraNotaEmpenho := EditCompraNotaEmpenho.Text;
      TNfeCabecalhoVO(ObjetoVO).CompraPedido := EditCompraPedido.Text;
      TNfeCabecalhoVO(ObjetoVO).CompraContrato := EditCompraContrato.Text;

      TNfeCabecalhoVO(ObjetoVO).InformacoesAddFisco := MemoInfComplementarFisco.Text;
      TNfeCabecalhoVO(ObjetoVO).InformacoesAddContribuinte := MemoInfComplementarContribuinte.Text;

      // a nota s� fica em modo de inser��o no in�cio para pegar seu n�mero, logo depois
      // ela fica sempre em modo de edi��o
      if StatusTela = stEditando then
      begin
        TNfeCabecalhoVO(ObjetoVO).Id := IdRegistroSelecionado;

        { Destinatario }
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.IdNfeCabecalho := TNfeCabecalhoVO(ObjetoVO).Id;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.CpfCnpj := EditDestinatarioCpfCnpj.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Nome := EditDestinatarioRazao.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Logradouro := EditDestinatarioLogradouro.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Numero := EditDestinatarioNumero.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Complemento := EditDestinatarioComplemento.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Bairro := EditDestinatarioBairro.Text;
        if Trim(EditDestinatarioCodigoIbge.Text) <> '' then
          TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.CodigoMunicipio := StrToInt(EditDestinatarioCodigoIbge.Text);
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.NomeMunicipio := EditDestinatarioCidade.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Uf := EditDestinatarioUF.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Cep := EditDestinatarioCEP.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.CodigoPais := 1058;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.NomePais := 'Brazil';
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Telefone := EditDestinatarioTelefone.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.InscricaoEstadual := EditDestinatarioIE.Text;
        if Trim(EditDestinatarioSuframa.Text) <> '' then
          TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Suframa := StrToInt(EditDestinatarioSuframa.Text);
        TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Email := EditDestinatarioEmail.Text;

        { NfeDetalhe }
        //FDataModuleNFe.CDSNfeDetalhe.DisableControls; - se for habilitado dever� filtrar os dados dos detalhes em anexo
        FDataModuleNFe.CDSNfeDetalhe.First;
        while not FDataModuleNFe.CDSNfeDetalhe.Eof do
        begin
          NfeDetalhe := TNfeDetalheVO.Create;
          NfeDetalhe.IdNfeCabecalho := TNfeCabecalhoVO(ObjetoVO).Id;
          if FDataModuleNFe.CDSNfeDetalhe.FieldByName('PERSISTE').AsString  = 'I' then
            NfeDetalhe.Id := 0
          else
            NfeDetalhe.Id := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
          NfeDetalhe.IdProduto := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID_PRODUTO').AsInteger;
          NfeDetalhe.NumeroItem := FDataModuleNFe.CDSNfeDetalhe.FieldByName('NUMERO_ITEM').AsInteger;
          NfeDetalhe.CodigoProduto := FDataModuleNFe.CDSNfeDetalhe.FieldByName('CODIGO_PRODUTO').AsString;
          NfeDetalhe.Gtin := FDataModuleNFe.CDSNfeDetalhe.FieldByName('GTIN').AsString;
          NfeDetalhe.NomeProduto := FDataModuleNFe.CDSNfeDetalhe.FieldByName('NOME_PRODUTO').AsString;
          NfeDetalhe.Ncm := FDataModuleNFe.CDSNfeDetalhe.FieldByName('NCM').AsString;
          NfeDetalhe.ExTipi := FDataModuleNFe.CDSNfeDetalhe.FieldByName('EX_TIPI').AsInteger;
          NfeDetalhe.Cfop := FDataModuleNFe.CDSNfeDetalhe.FieldByName('CFOP').AsInteger;
          NfeDetalhe.UnidadeComercial := FDataModuleNFe.CDSNfeDetalhe.FieldByName('UNIDADE_COMERCIAL').AsString;
          NfeDetalhe.QuantidadeComercial := FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_COMERCIAL').AsExtended;
          NfeDetalhe.ValorUnitarioComercial := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_COMERCIAL').AsExtended;
          NfeDetalhe.ValorBrutoProduto := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended;
          NfeDetalhe.GtinUnidadeTributavel := FDataModuleNFe.CDSNfeDetalhe.FieldByName('GTIN_UNIDADE_TRIBUTAVEL').AsString; ;
          NfeDetalhe.UnidadeTributavel := FDataModuleNFe.CDSNfeDetalhe.FieldByName('UNIDADE_TRIBUTAVEL').AsString;
          NfeDetalhe.QuantidadeTributavel := FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_TRIBUTAVEL').AsExtended;
          NfeDetalhe.ValorUnitarioTributavel := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_TRIBUTAVEL').AsExtended;
          NfeDetalhe.ValorFrete := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_FRETE').AsExtended;
          NfeDetalhe.ValorSeguro := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_SEGURO').AsExtended;
          NfeDetalhe.ValorDesconto := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_DESCONTO').AsExtended;
          NfeDetalhe.ValorOutrasDespesas := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_OUTRAS_DESPESAS').AsExtended;
          NfeDetalhe.EntraTotal := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ENTRA_TOTAL').AsInteger;
          NfeDetalhe.ValorSubtotal := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_SUBTOTAL').AsExtended;
          NfeDetalhe.ValorTotal := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL').AsExtended;
          NfeDetalhe.InformacoesAdicionais := FDataModuleNFe.CDSNfeDetalhe.FieldByName('INFORMACOES_ADICIONAIS').AsString;

          { NfeDetalhe - Imposto - ICMS }
          if FDataModuleNFe.CDSNfeImpostoIcms.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeImpostoIcms.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetalheImpostoIcmsVO.Id := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.OrigemMercadoria := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ORIGEM_MERCADORIA').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.CstIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CST_ICMS').AsString;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.Csosn := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CSOSN').AsString;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ModalidadeBcIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.TaxaReducaoBcIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('TAXA_REDUCAO_BC_ICMS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.BaseCalculoIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.AliquotaIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.MotivoDesoneracaoIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MOTIVO_DESONERACAO_ICMS').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS_ST').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_MVA_ICMS_ST').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_REDUCAO_BC_ICMS_ST').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BASE_CALCULO_ICMS_ST').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.AliquotaIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_ST').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorBcIcmsStRetido := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BC_ICMS_ST_RETIDO').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorIcmsStRetido := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST_RETIDO').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorBcIcmsStDestino := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BC_ICMS_ST_DESTINO').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorIcmsStDestino := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST_DESTINO').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.AliquotaCreditoIcmsSn := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_CREDITO_ICMS_SN').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.ValorCreditoIcmsSn := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_CREDITO_ICMS_SN').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.PercentualBcOperacaoPropria := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_BC_OPERACAO_PROPRIA').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIcmsVO.UfSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('UF_ST').AsString;
            end;
          end;

          { NfeDetalhe - Imposto - ISSQN }
          if FDataModuleNFe.CDSNfeImpostoIssqn.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeImpostoIssqn.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetalheImpostoIssqnVO.Id := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIssqnVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIssqnVO.BaseCalculoIssqn := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('BASE_CALCULO_ISSQN').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIssqnVO.AliquotaIssqn := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ALIQUOTA_ISSQN').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIssqnVO.ValorIssqn := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('VALOR_ISSQN').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIssqnVO.MunicipioIssqn := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('MUNICIPIO_ISSQN').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIssqnVO.ItemListaServicos := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ITEM_LISTA_SERVICOS').AsInteger;
            end;
          end;

          { NfeDetalhe - Imposto - IPI }
          if FDataModuleNFe.CDSNfeImpostoIpi.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeImpostoIpi.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetalheImpostoIpiVO.Id := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIpiVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIpiVO.EnquadramentoIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ENQUADRAMENTO_IPI').AsString;
              NfeDetalhe.NfeDetalheImpostoIpiVO.CnpjProdutor := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CNPJ_PRODUTOR').AsString;
              NfeDetalhe.NfeDetalheImpostoIpiVO.CodigoSeloIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CODIGO_SELO_IPI').AsString;
              NfeDetalhe.NfeDetalheImpostoIpiVO.QuantidadeSeloIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('QUANTIDADE_SELO_IPI').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIpiVO.EnquadramentoLegalIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ENQUADRAMENTO_LEGAL_IPI').AsString;
              NfeDetalhe.NfeDetalheImpostoIpiVO.CstIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CST_IPI').AsString;
              NfeDetalhe.NfeDetalheImpostoIpiVO.ValorBaseCalculoIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_BASE_CALCULO_IPI').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIpiVO.AliquotaIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ALIQUOTA_IPI').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIpiVO.QuantidadeUnidadeTributavel := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('QUANTIDADE_UNIDADE_TRIBUTAVEL').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIpiVO.ValorUnidadeTributavel := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_UNIDADE_TRIBUTAVEL').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIpiVO.ValorIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_IPI').AsExtended;
            end;
          end;

          { NfeDetalhe - Imposto - II }
          if FDataModuleNFe.CDSNfeImpostoImportacao.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeImpostoImportacao.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetalheImpostoIiVO.Id := FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIiVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetalheImpostoIiVO.ValorBcIi := FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_BC_II').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIiVO.ValorDespesasAduaneiras := FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_DESPESAS_ADUANEIRAS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIiVO.ValorImpostoImportacao := FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_IMPOSTO_IMPORTACAO').AsExtended;
              NfeDetalhe.NfeDetalheImpostoIiVO.ValorIof := FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_IOF').AsExtended;
            end;
          end;

          { NfeDetalhe - Imposto - PIS }
          if FDataModuleNFe.CDSNfeImpostoPis.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeImpostoPis.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetalheImpostoPisVO.Id := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetalheImpostoPisVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetalheImpostoPisVO.CstPis := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('CST_PIS').AsString;
              NfeDetalhe.NfeDetalheImpostoPisVO.QuantidadeVendida := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('QUANTIDADE_VENDIDA').AsExtended;
              NfeDetalhe.NfeDetalheImpostoPisVO.ValorBaseCalculoPis := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_BASE_CALCULO_PIS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoPisVO.AliquotaPisPercentual := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_PERCENTUAL').AsExtended;
              NfeDetalhe.NfeDetalheImpostoPisVO.AliquotaPisReais := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_REAIS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoPisVO.ValorPis := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_PIS').AsExtended;
            end;
          end;

          { NfeDetalhe - Imposto - COFINS }
          if FDataModuleNFe.CDSNfeImpostoCofins.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeImpostoCofins.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetalheImpostoCofinsVO.Id := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetalheImpostoCofinsVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetalheImpostoCofinsVO.CstCofins := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('CST_COFINS').AsString;
              NfeDetalhe.NfeDetalheImpostoCofinsVO.QuantidadeVendida := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('QUANTIDADE_VENDIDA').AsExtended;
              NfeDetalhe.NfeDetalheImpostoCofinsVO.BaseCalculoCofins := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('BASE_CALCULO_COFINS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoCofinsVO.AliquotaCofinsPercentual := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_PERCENTUAL').AsExtended;
              NfeDetalhe.NfeDetalheImpostoCofinsVO.AliquotaCofinsReais := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_REAIS').AsExtended;
              NfeDetalhe.NfeDetalheImpostoCofinsVO.ValorCofins := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('VALOR_COFINS').AsExtended;
            end;
          end;

          { NfeDetalhe - Declara��o Importa��o }
          if FDataModuleNFe.CDSNfeDeclaracaoImportacao.RecordCount > 0 then
          begin
            FDataModuleNFe.CDSNfeDeclaracaoImportacao.DisableControls;
            FDataModuleNFe.CDSNfeDeclaracaoImportacao.First;
            while not FDataModuleNFe.CDSNfeDeclaracaoImportacao.Eof do
            begin
              NfeDeclaracaoImportacao := TNfeDeclaracaoImportacaoVO.Create;

              NfeDeclaracaoImportacao.Id := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('ID').AsInteger;
              NfeDeclaracaoImportacao.IdNfeDetalhe := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDeclaracaoImportacao.NumeroDocumento := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('NUMERO_DOCUMENTO').AsString;
              NfeDeclaracaoImportacao.DataRegistro := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('DATA_REGISTRO').AsDateTime;
              NfeDeclaracaoImportacao.LocalDesembaraco := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('LOCAL_DESEMBARACO').AsString;
              NfeDeclaracaoImportacao.UfDesembaraco := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('UF_DESEMBARACO').AsString;
              NfeDeclaracaoImportacao.DataDesembaraco := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('DATA_DESEMBARACO').AsDateTime;
              NfeDeclaracaoImportacao.UfDesembaraco := FDataModuleNFe.CDSNfeDeclaracaoImportacao.FieldByName('UF_DESEMBARACO').AsString;

              { NfeDetalhe - Declara��o Importa��o - Adi��es }
              if FDataModuleNFe.CDSNfeImportacaoDetalhe.RecordCount > 0 then
              begin
                FDataModuleNFe.CDSNfeImportacaoDetalhe.DisableControls;
                FDataModuleNFe.CDSNfeImportacaoDetalhe.First;
                while not FDataModuleNFe.CDSNfeImportacaoDetalhe.Eof do
                begin
                  NfeImportacaoDetalhe := TNfeImportacaoDetalheVO.Create;

                  NfeImportacaoDetalhe.Id := FDataModuleNFe.CDSNfeImportacaoDetalhe.FieldByName('ID').AsInteger;
                  NfeImportacaoDetalhe.IdNfeDeclaracaoImportacao := FDataModuleNFe.CDSNfeImportacaoDetalhe.FieldByName('ID_NFE_DECLARACAO_IMPORTACAO').AsInteger;
                  NfeImportacaoDetalhe.NumeroAdicao := FDataModuleNFe.CDSNfeImportacaoDetalhe.FieldByName('NUMERO_ADICAO').AsInteger;
                  NfeImportacaoDetalhe.NumeroSequencial := FDataModuleNFe.CDSNfeImportacaoDetalhe.FieldByName('NUMERO_SEQUENCIAL').AsInteger;
                  NfeImportacaoDetalhe.CodigoFabricanteEstrangeiro := FDataModuleNFe.CDSNfeImportacaoDetalhe.FieldByName('CODIGO_FABRICANTE_ESTRANGEIRO').AsString;
                  NfeImportacaoDetalhe.ValorDesconto := FDataModuleNFe.CDSNfeImportacaoDetalhe.FieldByName('VALOR_DESCONTO').AsExtended;

                  NfeDeclaracaoImportacao.ListaNfeImportacaoDetalheVO.Add(NfeImportacaoDetalhe);
                  FDataModuleNFe.CDSNfeImportacaoDetalhe.Next;
                end;
              end;

              NfeDetalhe.ListaNfeDeclaracaoImportacaoVO.Add(NfeDeclaracaoImportacao);
              FDataModuleNFe.CDSNfeDeclaracaoImportacao.Next;
            end;
            FDataModuleNFe.CDSNfeDeclaracaoImportacao.First;
            FDataModuleNFe.CDSNfeDeclaracaoImportacao.EnableControls;
          end;

          { NfeDetalhe - Espec�fico - Ve�culo }
          if FDataModuleNFe.CDSNfeDetalheVeiculo.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeDetalheVeiculo.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetEspecificoVeiculoVO.Id := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.TipoOperacao := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_OPERACAO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.Chassi := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CHASSI').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.Cor := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('COR').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.DescricaoCor := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('DESCRICAO_COR').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.PotenciaMotor := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('POTENCIA_MOTOR').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.Cilindradas := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CILINDRADAS').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.PesoLiquido := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('PESO_LIQUIDO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.PesoBruto := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('PESO_BRUTO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.NumeroSerie := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('NUMERO_SERIE').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.TipoCombustivel := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_COMBUSTIVEL').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.NumeroMotor := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('NUMERO_MOTOR').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.CapacidadeMaximaTracao := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CAPACIDADE_MAXIMA_TRACAO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.DistanciaEixos := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('DISTANCIA_EIXOS').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.AnoModelo := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ANO_MODELO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.AnoFabricacao := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ANO_FABRICACAO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.TipoPintura := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_PINTURA').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.TipoVeiculo := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_VEICULO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.EspecieVeiculo := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ESPECIE_VEICULO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.CondicaoVin := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CONDICAO_VIN').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.CondicaoVeiculo := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CONDICAO_VEICULO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.CodigoMarcaModelo := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CODIGO_MARCA_MODELO').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.CodigoCor := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CODIGO_COR').AsString;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.Lotacao := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('LOTACAO').AsInteger;
              NfeDetalhe.NfeDetEspecificoVeiculoVO.Restricao := FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('RESTRICAO').AsString;
            end;
          end;

          { NfeDetalhe - Espec�fico - Combust�vel }
          if FDataModuleNFe.CDSNfeDetalheCombustivel.RecordCount > 0 then
          begin
            if FDataModuleNFe.CDSNfeDetalheCombustivel.Locate('ID_NFE_DETALHE', FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger, [loPartialKey]) then
            begin
              NfeDetalhe.NfeDetEspecificoCombustivelVO.Id := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('ID').AsInteger;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.IdNfeDetalhe := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.CodigoAnp := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('CODIGO_ANP').AsInteger;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.Codif := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('CODIF').AsString;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.QuantidadeTempAmbiente := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('QUANTIDADE_TEMP_AMBIENTE').AsExtended;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.UfConsumo := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('UF_CONSUMO').AsString;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.BaseCalculoCide := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('BASE_CALCULO_CIDE').AsExtended;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.AliquotaCide := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('ALIQUOTA_CIDE').AsExtended;
              NfeDetalhe.NfeDetEspecificoCombustivelVO.ValorCide := FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('VALOR_CIDE').AsExtended;
            end;
          end;

          { NfeDetalhe - Espec�fico - Medicamento }
          if FDataModuleNFe.CDSNfeDetalheMedicamento.RecordCount > 0 then
          begin
            FDataModuleNFe.CDSNfeDetalheMedicamento.DisableControls;
            FDataModuleNFe.CDSNfeDetalheMedicamento.First;
            while not FDataModuleNFe.CDSNfeDetalheMedicamento.Eof do
            begin
              NfeDetalheMedicamento := TNfeDetEspecificoMedicamentoVO.Create;

              NfeDetalheMedicamento.Id := FDataModuleNFe.CDSNfeDetalheMedicamento.FieldByName('ID').AsInteger;
              NfeDetalheMedicamento.IdNfeDetalhe := FDataModuleNFe.CDSNfeDetalheMedicamento.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalheMedicamento.NumeroLote := FDataModuleNFe.CDSNfeDetalheMedicamento.FieldByName('NUMERO_LOTE').AsString;
              NfeDetalheMedicamento.QuantidadeLote := FDataModuleNFe.CDSNfeDetalheMedicamento.FieldByName('QUANTIDADE_LOTE').AsExtended;
              NfeDetalheMedicamento.DataFabricacao := FDataModuleNFe.CDSNfeDetalheMedicamento.FieldByName('DATA_FABRICACAO').AsDateTime;
              NfeDetalheMedicamento.DataValidade := FDataModuleNFe.CDSNfeDetalheMedicamento.FieldByName('DATA_VALIDADE').AsDateTime;
              NfeDetalheMedicamento.PrecoMaximoConsumidor := FDataModuleNFe.CDSNfeDetalheMedicamento.FieldByName('PRECO_MAXIMO_CONSUMIDOR').AsExtended;

              NfeDetalhe.ListaNfeDetEspecificoMedicamentoVO.Add(NfeDetalheMedicamento);
              FDataModuleNFe.CDSNfeDetalheMedicamento.Next;
            end;
            FDataModuleNFe.CDSNfeDetalheMedicamento.First;
            FDataModuleNFe.CDSNfeDetalheMedicamento.EnableControls;
          end;

          { NfeDetalhe - Espec�fico - Armamento }
          if FDataModuleNFe.CDSNfeDetalheArmamento.RecordCount > 0 then
          begin
            FDataModuleNFe.CDSNfeDetalheArmamento.DisableControls;
            FDataModuleNFe.CDSNfeDetalheArmamento.First;
            while not FDataModuleNFe.CDSNfeDetalheArmamento.Eof do
            begin
              NfeDetalheArmamento := TNfeDetEspecificoArmamentoVO.Create;

              NfeDetalheArmamento.Id := FDataModuleNFe.CDSNfeDetalheArmamento.FieldByName('ID').AsInteger;
              NfeDetalheArmamento.IdNfeDetalhe := FDataModuleNFe.CDSNfeDetalheArmamento.FieldByName('ID_NFE_DETALHE').AsInteger;
              NfeDetalheArmamento.TipoArma := FDataModuleNFe.CDSNfeDetalheArmamento.FieldByName('TIPO_ARMA').AsInteger;
              NfeDetalheArmamento.NumeroSerieArma := FDataModuleNFe.CDSNfeDetalheArmamento.FieldByName('NUMERO_SERIE_ARMA').AsString;
              NfeDetalheArmamento.NumeroSerieCano := FDataModuleNFe.CDSNfeDetalheArmamento.FieldByName('NUMERO_SERIE_CANO').AsString;
              NfeDetalheArmamento.Descricao := FDataModuleNFe.CDSNfeDetalheArmamento.FieldByName('DESCRICAO').AsString;

              NfeDetalhe.ListaNfeDetEspecificoArmamentoVO.Add(NfeDetalheArmamento);
              FDataModuleNFe.CDSNfeDetalheArmamento.Next;
            end;
            FDataModuleNFe.CDSNfeDetalheArmamento.First;
            FDataModuleNFe.CDSNfeDetalheArmamento.EnableControls;
          end;

          TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Add(NfeDetalhe);
          FDataModuleNFe.CDSNfeDetalhe.Next;
        end;
        FDataModuleNFe.CDSNfeDetalhe.First;
        FDataModuleNFe.CDSNfeDetalhe.EnableControls;

        (* Grupo de informa��o dos documentos referenciados *)

        { NF-e Referenciada }
        if FDataModuleNFe.CDSNfeReferenciada.RecordCount > 0 then
          TController.PreencherObjectListFromCDS<TNfeReferenciadaVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeReferenciadaVO, FDataModuleNFe.CDSNfeReferenciada);

        { NF 1/1A Referenciada }
        if FDataModuleNFe.CDSNfReferenciada.RecordCount > 0 then
          TController.PreencherObjectListFromCDS<TNfeNfReferenciadaVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO, FDataModuleNFe.CDSNfReferenciada);

        { NF Rural Referenciada }
        if FDataModuleNFe.CDSNfRuralReferenciada.RecordCount > 0 then
          TController.PreencherObjectListFromCDS<TNfeProdRuralReferenciadaVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO, FDataModuleNFe.CDSNfRuralReferenciada);

        { CT-e Referenciado }
        if FDataModuleNFe.CDSCteReferenciado.RecordCount > 0 then
          TController.PreencherObjectListFromCDS<TNfeCteReferenciadoVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeCteReferenciadoVO, FDataModuleNFe.CDSCteReferenciado);

        { Cupom Fiscal Referenciado }
        if FDataModuleNFe.CDSCupomReferenciado.RecordCount > 0 then
          TController.PreencherObjectListFromCDS<TNfeCupomFiscalReferenciadoVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeCupomFiscalReferenciadoVO, FDataModuleNFe.CDSCupomReferenciado);

        { Local Entrega }
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.IdNfeCabecalho := TNfeCabecalhoVO(ObjetoVO).Id;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.CpfCnpj := EditEntregaCpfCnpj.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Logradouro := EditEntregaLogradouro.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Numero := EditEntregaNumero.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Complemento := EditEntregaComplemento.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Bairro := EditEntregaBairro.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.CodigoMunicipio := EditEntregaIbge.AsInteger;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.NomeMunicipio := EditEntregaCidade.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Uf := EditEntregaUf.Text;

        { Local Retirada }
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.IdNfeCabecalho := TNfeCabecalhoVO(ObjetoVO).Id;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.CpfCnpj := EditRetiradaCpfCnpj.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Logradouro := EditRetiradaLogradouro.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Numero := EditRetiradaNumero.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Complemento := EditRetiradaComplemento.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Bairro := EditRetiradaBairro.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.CodigoMunicipio := EditRetiradaIbge.AsInteger;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.NomeMunicipio := EditRetiradaCidade.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Uf := EditRetiradaUf.Text;

        (* Grupo de Transporte *)

        { Transporte }
        if EditTransportadorId.AsInteger > 0 then
        begin
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.IdNfeCabecalho := TNfeCabecalhoVO(ObjetoVO).Id;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.IdTransportadora := EditTransportadorId.AsInteger;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ModalidadeFrete := StrToInt(Copy(ComboModalidadeFrete.Text, 1, 1));
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.CpfCnpj := EditTransportadorCpfCnpj.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Nome := EditTransportadorRazaoSocial.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.InscricaoEstadual := EditTransportadorIE.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.EmpresaEndereco := EditTransportadorLogradouro.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.NomeMunicipio := EditTransportadorCidade.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Uf := EditTransportadorUF.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ValorServico := EditRetencaoIcmsValorServico.Value;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ValorBcRetencaoIcms := EditRetencaoIcmsBaseCalculo.Value;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.AliquotaRetencaoIcms := EditRetencaoIcmsAliquota.Value;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ValorIcmsRetido := EditRetencaoIcmsIcmsRetido.Value;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Cfop := EditRetencaoIcmsCfop.AsInteger;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Municipio := StrToInt(EditTransportadorCidade.Text);
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.PlacaVeiculo := EditVeiculoPlaca.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.UfVeiculo := EditVeiculoUf.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.RntcVeiculo := EditVeiculoRntc.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Vagao := EditTransporteVagao.Text;
          TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Balsa := EditTransporteBalsa.Text;

          { Tranporte - Reboque }
          if FDataModuleNFe.CDSReboque.RecordCount > 0 then
            TController.PreencherObjectListFromCDS<TNfeTransporteReboqueVO>(TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ListaNfeTransporteReboqueVO, FDataModuleNFe.CDSReboque);

          { Tranporte - Volumes }
          if FDataModuleNFe.CDSVolumes.RecordCount > 0 then
            TController.PreencherObjectListFromCDS<TNfeTransporteVolumeVO>(TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ListaNfeTransporteVolumeVO, FDataModuleNFe.CDSVolumes);
        end;

        (* Grupo de Cobran�a *)

        { Cobran�a - Fatura }
        TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.IdNfeCabecalho := TNfeCabecalhoVO(ObjetoVO).Id;
        TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.Numero := EditFaturaNumero.Text;
        TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorOriginal := EditFaturaValorOriginal.Value;
        TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorDesconto := EditFaturaValorDesconto.Value;
        TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorLiquido := EditFaturaValorLiquido.Value;

        { Cobran�a - Duplicatas }
        if FDataModuleNFe.CDSDuplicata.RecordCount > 0 then
          TController.PreencherObjectListFromCDS<TNfeDuplicataVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeDuplicataVO, FDataModuleNFe.CDSDuplicata);
      end;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'Insere', [TNfeCabecalhoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TNfeCabecalhoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'Altera', [TNfeCabecalhoVO(ObjetoVO)], 'POST', 'Boolean');
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

{$REGION 'Controle de Grids e ClientDataSets'}
procedure TFNFe.GridItensDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if FDataModuleNFe.CDSNfeDetalhe.FieldByName('CADASTRADO').AsString = 'N' then
    GridItens.Canvas.Brush.Color := $00C6C6FF;
  GridItens.DefaultDrawDataCell(Rect, GridItens.columns[datacol].field, State);
end;

procedure TFNFe.GridItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    ActionIncluirItem.Execute;
  end;
  //
  if (Key = VK_DOWN) or (Key = VK_UP) then
  begin
    if FDataModuleNfe.CDSNfeDetalhe.State in [dsEdit, dsInsert] then
    begin
      FDataModuleNfe.CDSNfeDetalhe.FieldByName('QUANTIDADE_TRIBUTAVEL').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_COMERCIAL').AsExtended;
      FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_COMERCIAL').AsExtended * FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_COMERCIAL').AsExtended;
      FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended := ArredondaTruncaValor('A', FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended, 2);
      FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_SUBTOTAL').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended;
      FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_SUBTOTAL').AsExtended - FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_DESCONTO').AsExtended;
      //
      CalcularItem;
      //
      if FDataModuleNFe.CDSNfeDetalhe.FieldByName('NUMERO_ITEM').AsString = '' then
        FDataModuleNFe.CDSNfeDetalhe.Delete;
    end;
  end;
end;

procedure TFNFe.GridParaEdits;
var
  NfeDetalheEnumerator: TEnumerator<TNfeDetalheVO>;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TNfeCabecalhoVO(TController.BuscarObjeto('NfeCabecalhoController.TNfeCabecalhoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    { NF-e Cabe�alho }
    EditIdOperacaoFiscal.AsInteger := TNfeCabecalhoVO(ObjetoVO).IdTributOperacaoFiscal;
    if Assigned(TNfeCabecalhoVO(ObjetoVO).TributOperacaoFiscalVO) then
    begin
      EditOperacaoFiscal.Text := TNfeCabecalhoVO(ObjetoVO).TributOperacaoFiscalVO.Descricao;
      TributOperacaoFiscalVO := TNfeCabecalhoVO(ObjetoVO).TributOperacaoFiscalVO;
    end;
    EditCodigoNumerico.Text := TNfeCabecalhoVO(ObjetoVO).CodigoNumerico;
    EditNaturezaOperacao.Text := TNfeCabecalhoVO(ObjetoVO).NaturezaOperacao;
    ComboBoxFormaPagamento.ItemIndex := TNfeCabecalhoVO(ObjetoVO).IndicadorFormaPagamento;
    ComboboxModeloNotaFiscal.ItemIndex := AnsiIndexStr(TNfeCabecalhoVO(ObjetoVO).CodigoModelo, ['01', '55']);
    EditSerie.Text := TNfeCabecalhoVO(ObjetoVO).Serie;
    EditNumeroNfe.Text := TNfeCabecalhoVO(ObjetoVO).Numero;
    EditDataHoraEmissao.Date := TNfeCabecalhoVO(ObjetoVO).DataHoraEmissao;
    EditDataEntradaSaida.Date := TNfeCabecalhoVO(ObjetoVO).DataHoraEntradaSaida;
    EditHoraEntradaSaida.Text := FormatDateTime('hh:mm:ss', TNfeCabecalhoVO(ObjetoVO).DataHoraEmissao);
    ComboTipoOperacao.ItemIndex := TNfeCabecalhoVO(ObjetoVO).TipoOperacao;
    EditDestinatarioCodigoIbge.Text := TNfeCabecalhoVO(ObjetoVO).CodigoMunicipio.ToString;
    ComboFormaImpDanfe.ItemIndex := TNfeCabecalhoVO(ObjetoVO).FormatoImpressaoDanfe;
    ComboTipoEmissao.ItemIndex := TNfeCabecalhoVO(ObjetoVO).TipoEmissao;
    EditChaveAcesso.Text := TNfeCabecalhoVO(ObjetoVO).ChaveAcesso;
    EditDigitoChaveAcesso.Text := TNfeCabecalhoVO(ObjetoVO).DigitoChaveAcesso;
    ComboFinalidadeEmissao.ItemIndex := TNfeCabecalhoVO(ObjetoVO).FinalidadeEmissao;
    EditBCIcms.Value := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIcms;
    EditValorIcms.Value := TNfeCabecalhoVO(ObjetoVO).ValorIcms;
    EditBCIcmsSt.Value := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIcmsSt;
    EditValorIcmsSt.Value := TNfeCabecalhoVO(ObjetoVO).ValorIcmsSt;
    EditTotalProdutos.Value := TNfeCabecalhoVO(ObjetoVO).ValorTotalProdutos;
    EditValorFrete.Value := TNfeCabecalhoVO(ObjetoVO).ValorFrete;
    EditValorSeguro.Value := TNfeCabecalhoVO(ObjetoVO).ValorSeguro;
    EditValorDesconto.Value := TNfeCabecalhoVO(ObjetoVO).ValorDesconto;
    EditTotalImpostoImportacao.Value := TNfeCabecalhoVO(ObjetoVO).ValorImpostoImportacao;
    EditValorIPI.Value := TNfeCabecalhoVO(ObjetoVO).ValorIpi;
    EditValorPIS.Value := TNfeCabecalhoVO(ObjetoVO).ValorPis;
    EditValorCOFINS.Value := TNfeCabecalhoVO(ObjetoVO).ValorCofins;
    EditValorOutrasDespesas.Value := TNfeCabecalhoVO(ObjetoVO).ValorDespesasAcessorias;
    EditValorTotalNota.Value := TNfeCabecalhoVO(ObjetoVO).ValorTotal;

    EditValorTotalServicos.Value := TNfeCabecalhoVO(ObjetoVO).ValorServicos;
    EditBaseCalculoIssqn.Value := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIssqn;
    EditValorIssqn.Value := TNfeCabecalhoVO(ObjetoVO).ValorIssqn;
    EditValorPisIssqn.Value := TNfeCabecalhoVO(ObjetoVO).ValorPisIssqn;
    EditValorCofinsIssqn.Value := TNfeCabecalhoVO(ObjetoVO).ValorCofinsIssqn;
    EditValorRetidoPis.Value := TNfeCabecalhoVO(ObjetoVO).ValorRetidoPis;
    EditValorRetidoCofins.Value := TNfeCabecalhoVO(ObjetoVO).ValorRetidoCofins;
    EditValorRetidoCsll.Value := TNfeCabecalhoVO(ObjetoVO).ValorRetidoCsll;
    EditBaseCalculoIrrf.Value := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIrrf;
    EditValorRetidoIrrf.Value := TNfeCabecalhoVO(ObjetoVO).ValorRetidoIrrf;
    EditBaseCalculoPrevidencia.Value := TNfeCabecalhoVO(ObjetoVO).BaseCalculoPrevidencia;
    EditValorRetidoPrevidencia.Value := TNfeCabecalhoVO(ObjetoVO).ValorRetidoPrevidencia;

    EditComexUfEmbarque.Text := TNfeCabecalhoVO(ObjetoVO).ComexUfEmbarque;
    EditComexLocalEmbarque.Text := TNfeCabecalhoVO(ObjetoVO).ComexLocalEmbarque;
    EditCompraNotaEmpenho.Text := TNfeCabecalhoVO(ObjetoVO).CompraNotaEmpenho;
    EditCompraPedido.Text := TNfeCabecalhoVO(ObjetoVO).CompraPedido;
    EditCompraContrato.Text := TNfeCabecalhoVO(ObjetoVO).CompraContrato;

    MemoInfComplementarFisco.Text := TNfeCabecalhoVO(ObjetoVO).InformacoesAddFisco;
    MemoInfComplementarContribuinte.Text := TNfeCabecalhoVO(ObjetoVO).InformacoesAddContribuinte;

    { Destinatario }
    if TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Id > 0 then
    begin
      EditDestinatarioId.AsInteger := TNfeCabecalhoVO(ObjetoVO).IdCliente;
      EditDestinatarioUF.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Uf;
      EditDestinatarioCpfCnpj.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.CpfCnpj;
      EditDestinatarioRazao.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Nome;
      EditDestinatarioLogradouro.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Logradouro;
      EditDestinatarioNumero.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Numero;
      EditDestinatarioComplemento.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Complemento;
      EditDestinatarioBairro.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Bairro;
      EditDestinatarioCodigoIbge.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.CodigoMunicipio.ToString;
      EditDestinatarioCidade.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.NomeMunicipio;
      EditDestinatarioUF.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Uf;
      EditDestinatarioCEP.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Cep;
      EditDestinatarioTelefone.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Telefone;
      EditDestinatarioIE.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.InscricaoEstadual;
      EditDestinatarioEmail.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Email;
      EditDestinatarioSuframa.Text := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Suframa.ToString;
    end;

    { Local Entrega }
    if TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Id > 0 then
    begin
      EditEntregaCpfCnpj.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.CpfCnpj;
      EditEntregaLogradouro.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Logradouro;
      EditEntregaNumero.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Numero;
      EditEntregaComplemento.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Complemento;
      EditEntregaBairro.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Bairro;
      EditEntregaIbge.Text := IntToStr(TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.CodigoMunicipio);
      EditEntregaCidade.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.NomeMunicipio;
      EditEntregaUf.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalEntregaVO.Uf;
    end;

    { Local Retirada }
    if TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Id > 0 then
    begin
      EditRetiradaCpfCnpj.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.CpfCnpj;
      EditRetiradaLogradouro.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Logradouro;
      EditRetiradaNumero.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Numero;
      EditRetiradaComplemento.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Complemento;
      EditRetiradaBairro.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Bairro;
      EditRetiradaIbge.Text := IntToStr(TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.CodigoMunicipio);
      EditRetiradaCidade.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.NomeMunicipio;
      EditRetiradaUf.Text := TNfeCabecalhoVO(ObjetoVO).NfeLocalRetiradaVO.Uf;
    end;

    { NF-e Referenciada }
    TController.TratarRetorno<TNfeReferenciadaVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeReferenciadaVO, True, True, FDataModuleNFe.CDSNfeReferenciada);
    { NF Referenciada }
    TController.TratarRetorno<TNfeNfReferenciadaVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO, True, True, FDataModuleNFe.CDSNfReferenciada);
    { NF Rural Referenciada }
    TController.TratarRetorno<TNfeProdRuralReferenciadaVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO, True, True, FDataModuleNFe.CDSNfeReferenciada);
    { CTF-e Referenciado }
    TController.TratarRetorno<TNfeCteReferenciadoVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeCteReferenciadoVO, True, True, FDataModuleNFe.CDSCteReferenciado);
    { Cupom Fiscal Referenciado }
    TController.TratarRetorno<TNfeCupomFiscalReferenciadoVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeCupomFiscalReferenciadoVO, True, True, FDataModuleNFe.CDSCupomReferenciado);

    (* Grupo de Transporte *)
    { Transporte }
    if TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Id > 0 then
    begin
      EditTransportadorId.AsInteger := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.IdTransportadora;
      ComboModalidadeFrete.ItemIndex := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ModalidadeFrete;
      EditTransportadorCpfCnpj.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.CpfCnpj;
      EditTransportadorRazaoSocial.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Nome;
      EditTransportadorIE.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.InscricaoEstadual;
      EditTransportadorLogradouro.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.EmpresaEndereco;
      EditTransportadorCidade.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.NomeMunicipio;
      EditTransportadorUF.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Uf;
      EditRetencaoIcmsValorServico.Value := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ValorServico;
      EditRetencaoIcmsBaseCalculo.Value := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ValorBcRetencaoIcms;
      EditRetencaoIcmsAliquota.Value := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.AliquotaRetencaoIcms;
      EditRetencaoIcmsIcmsRetido.Value := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ValorIcmsRetido;
      EditRetencaoIcmsCfop.AsInteger := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Cfop;
      EditRetencaoIcmsCidade.AsInteger := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Municipio;
      EditVeiculoPlaca.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.PlacaVeiculo;
      EditVeiculoUf.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.UfVeiculo;
      EditVeiculoRntc.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.RntcVeiculo;
      EditRetencaoIcmsUf.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Uf;
      EditTransporteVagao.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Vagao;
      EditTransporteBalsa.Text := TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.Balsa;

      { Tranporte - Reboque }
      TController.TratarRetorno<TNfeTransporteReboqueVO>(TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ListaNfeTransporteReboqueVO, True, True, FDataModuleNFe.CDSReboque);
      { Tranporte - Volume }
      TController.TratarRetorno<TNfeTransporteVolumeVO>(TNfeCabecalhoVO(ObjetoVO).NfeTransporteVO.ListaNfeTransporteVolumeVO, True, True, FDataModuleNFe.CDSVolumes);
    end;
    (* Fim Grupo de Transporte *)

    (* Grupo de Cobran�a *)
    { Cobran�a - Fatura }
    if TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.Id > 0 then
    begin
      EditFaturaNumero.Text := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.Numero;
      EditFaturaValorOriginal.Value := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorOriginal;
      EditFaturaValorDesconto.Value := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorDesconto;
      EditFaturaValorLiquido.Value := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorLiquido;
    end;

    { Cobran�a - Duplicatas }
    TController.TratarRetorno<TNfeDuplicataVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeDuplicataVO, True, True, FDataModuleNFe.CDSDuplicata);
    (* Fim Grupo de Cobran�a *)

    (* Grupo de Detalhe *)
    // Detalhe
    TController.TratarRetorno<TNfeDetalheVO>(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO, True, True, FDataModuleNFe.CDSNfeDetalhe);

    NfeDetalheEnumerator := TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.GetEnumerator;
    try
      with NfeDetalheEnumerator do
      begin
        while MoveNext do
        begin
          { NfeDetalhe - Imposto - ICMS }
          if Current.NfeDetalheImpostoIcmsVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeImpostoIcms.Append;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ID').AsInteger := Current.NfeDetalheImpostoIcmsVO.Id;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetalheImpostoIcmsVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ORIGEM_MERCADORIA').AsInteger := Current.NfeDetalheImpostoIcmsVO.OrigemMercadoria;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CST_ICMS').AsString := Current.NfeDetalheImpostoIcmsVO.CstIcms;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CSOSN').AsString := Current.NfeDetalheImpostoIcmsVO.Csosn;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS').AsInteger := Current.NfeDetalheImpostoIcmsVO.ModalidadeBcIcms;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('TAXA_REDUCAO_BC_ICMS').AsExtended := Current.NfeDetalheImpostoIcmsVO.TaxaReducaoBcIcms;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS').AsExtended := Current.NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS').AsExtended := Current.NfeDetalheImpostoIcmsVO.AliquotaIcms;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorIcms;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MOTIVO_DESONERACAO_ICMS').AsInteger := Current.NfeDetalheImpostoIcmsVO.MotivoDesoneracaoIcms;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS_ST').AsInteger := Current.NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_MVA_ICMS_ST').AsExtended := Current.NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_REDUCAO_BC_ICMS_ST').AsExtended := Current.NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BASE_CALCULO_ICMS_ST').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_ST').AsExtended := Current.NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorIcmsSt;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BC_ICMS_ST_RETIDO').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorBcIcmsStRetido;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST_RETIDO').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorIcmsStRetido;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BC_ICMS_ST_DESTINO').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorBcIcmsStDestino;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST_DESTINO').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorIcmsStDestino;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_CREDITO_ICMS_SN').AsExtended := Current.NfeDetalheImpostoIcmsVO.AliquotaCreditoIcmsSn;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_CREDITO_ICMS_SN').AsExtended := Current.NfeDetalheImpostoIcmsVO.ValorCreditoIcmsSn;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_BC_OPERACAO_PROPRIA').AsExtended := Current.NfeDetalheImpostoIcmsVO.PercentualBcOperacaoPropria;
            FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('UF_ST').AsString := Current.NfeDetalheImpostoIcmsVO.UfSt;
            FDataModuleNFe.CDSNfeImpostoIcms.Post;
          end;

          { NfeDetalhe - Imposto - ISSQN }
          if Current.NfeDetalheImpostoIssqnVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeImpostoIssqn.Append;
            FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ID').AsInteger := Current.NfeDetalheImpostoIssqnVO.Id;
            FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetalheImpostoIssqnVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('BASE_CALCULO_ISSQN').AsExtended := Current.NfeDetalheImpostoIssqnVO.BaseCalculoIssqn;
            FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ALIQUOTA_ISSQN').AsExtended := Current.NfeDetalheImpostoIssqnVO.AliquotaIssqn;
            FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('VALOR_ISSQN').AsExtended := Current.NfeDetalheImpostoIssqnVO.ValorIssqn;
            FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('MUNICIPIO_ISSQN').AsInteger := Current.NfeDetalheImpostoIssqnVO.MunicipioIssqn;
            FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ITEM_LISTA_SERVICOS').AsInteger := Current.NfeDetalheImpostoIssqnVO.ItemListaServicos;
            FDataModuleNFe.CDSNfeImpostoIssqn.Post;
          end;

          { NfeDetalhe - Imposto - IPI }
          if Current.NfeDetalheImpostoIpiVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeImpostoIpi.Append;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ID').AsInteger := Current.NfeDetalheImpostoIpiVO.Id;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetalheImpostoIpiVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ENQUADRAMENTO_IPI').AsString := Current.NfeDetalheImpostoIpiVO.EnquadramentoIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CNPJ_PRODUTOR').AsString := Current.NfeDetalheImpostoIpiVO.CnpjProdutor;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CODIGO_SELO_IPI').AsString := Current.NfeDetalheImpostoIpiVO.CodigoSeloIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('QUANTIDADE_SELO_IPI').AsInteger := Current.NfeDetalheImpostoIpiVO.QuantidadeSeloIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ENQUADRAMENTO_LEGAL_IPI').AsString := Current.NfeDetalheImpostoIpiVO.EnquadramentoLegalIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CST_IPI').AsString := Current.NfeDetalheImpostoIpiVO.CstIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_BASE_CALCULO_IPI').AsExtended := Current.NfeDetalheImpostoIpiVO.ValorBaseCalculoIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ALIQUOTA_IPI').AsExtended := Current.NfeDetalheImpostoIpiVO.AliquotaIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('QUANTIDADE_UNIDADE_TRIBUTAVEL').AsExtended := Current.NfeDetalheImpostoIpiVO.QuantidadeUnidadeTributavel;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_UNIDADE_TRIBUTAVEL').AsExtended := Current.NfeDetalheImpostoIpiVO.ValorUnidadeTributavel;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_IPI').AsExtended := Current.NfeDetalheImpostoIpiVO.ValorIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.Post;
          end;

          { NfeDetalhe - Imposto - II }
          if Current.NfeDetalheImpostoIiVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeImpostoImportacao.Append;
            FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('ID').AsInteger := Current.NfeDetalheImpostoIiVO.Id;
            FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetalheImpostoIiVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_BC_II').AsExtended := Current.NfeDetalheImpostoIiVO.ValorBcIi;
            FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_DESPESAS_ADUANEIRAS').AsExtended := Current.NfeDetalheImpostoIiVO.ValorDespesasAduaneiras;
            FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_IMPOSTO_IMPORTACAO').AsExtended := Current.NfeDetalheImpostoIiVO.ValorImpostoImportacao;
            FDataModuleNFe.CDSNfeImpostoImportacao.FieldByName('VALOR_IOF').AsExtended := Current.NfeDetalheImpostoIiVO.ValorIof;
            FDataModuleNFe.CDSNfeImpostoImportacao.Post;
          end;

          { NfeDetalhe - Imposto - PIS }
          if Current.NfeDetalheImpostoPisVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeImpostoPis.Append;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ID').AsInteger := Current.NfeDetalheImpostoPisVO.Id;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetalheImpostoPisVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('CST_PIS').AsString := Current.NfeDetalheImpostoPisVO.CstPis;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('QUANTIDADE_VENDIDA').AsExtended := Current.NfeDetalheImpostoPisVO.QuantidadeVendida;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_BASE_CALCULO_PIS').AsExtended := Current.NfeDetalheImpostoPisVO.ValorBaseCalculoPis;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_PERCENTUAL').AsExtended := Current.NfeDetalheImpostoPisVO.AliquotaPisPercentual;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_REAIS').AsExtended := Current.NfeDetalheImpostoPisVO.AliquotaPisReais;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_PIS').AsExtended := Current.NfeDetalheImpostoPisVO.ValorPis;
            FDataModuleNFe.CDSNfeImpostoPis.Post;
          end;

          { NfeDetalhe - Imposto - COFINS }
          if Current.NfeDetalheImpostoCofinsVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeImpostoCofins.Append;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ID').AsInteger := Current.NfeDetalheImpostoCofinsVO.Id;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetalheImpostoCofinsVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('CST_COFINS').AsString := Current.NfeDetalheImpostoCofinsVO.CstCofins;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('QUANTIDADE_VENDIDA').AsExtended := Current.NfeDetalheImpostoCofinsVO.QuantidadeVendida;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('BASE_CALCULO_COFINS').AsExtended := Current.NfeDetalheImpostoCofinsVO.BaseCalculoCofins;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_PERCENTUAL').AsExtended := Current.NfeDetalheImpostoCofinsVO.AliquotaCofinsPercentual;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_REAIS').AsExtended := Current.NfeDetalheImpostoCofinsVO.AliquotaCofinsReais;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('VALOR_COFINS').AsExtended := Current.NfeDetalheImpostoCofinsVO.ValorCofins;
            FDataModuleNFe.CDSNfeImpostoCofins.Post;
          end;

          { NfeDetalhe - Declara��o Importa��o }
          TController.TratarRetorno<TNfeDeclaracaoImportacaoVO>(Current.ListaNfeDeclaracaoImportacaoVO, True, True, FDataModuleNFe.CDSNfeDeclaracaoImportacao);

          { NfeDetalhe - Espec�fico - Ve�culo }
          if Current.NfeDetEspecificoVeiculoVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeDetalheVeiculo.Append;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ID').AsInteger := Current.NfeDetEspecificoVeiculoVO.Id;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetEspecificoVeiculoVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_OPERACAO').AsString := Current.NfeDetEspecificoVeiculoVO.TipoOperacao;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CHASSI').AsString := Current.NfeDetEspecificoVeiculoVO.Chassi;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('COR').AsString := Current.NfeDetEspecificoVeiculoVO.Cor;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('DESCRICAO_COR').AsString := Current.NfeDetEspecificoVeiculoVO.DescricaoCor;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('POTENCIA_MOTOR').AsString := Current.NfeDetEspecificoVeiculoVO.PotenciaMotor;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CILINDRADAS').AsString := Current.NfeDetEspecificoVeiculoVO.Cilindradas;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('PESO_LIQUIDO').AsString := Current.NfeDetEspecificoVeiculoVO.PesoLiquido;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('PESO_BRUTO').AsString := Current.NfeDetEspecificoVeiculoVO.PesoBruto;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('NUMERO_SERIE').AsString := Current.NfeDetEspecificoVeiculoVO.NumeroSerie;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_COMBUSTIVEL').AsString := Current.NfeDetEspecificoVeiculoVO.TipoCombustivel;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('NUMERO_MOTOR').AsString := Current.NfeDetEspecificoVeiculoVO.NumeroMotor;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CAPACIDADE_MAXIMA_TRACAO').AsString := Current.NfeDetEspecificoVeiculoVO.CapacidadeMaximaTracao;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('DISTANCIA_EIXOS').AsString := Current.NfeDetEspecificoVeiculoVO.DistanciaEixos;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ANO_MODELO').AsString := Current.NfeDetEspecificoVeiculoVO.AnoModelo;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ANO_FABRICACAO').AsString := Current.NfeDetEspecificoVeiculoVO.AnoFabricacao;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_PINTURA').AsString := Current.NfeDetEspecificoVeiculoVO.TipoPintura;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('TIPO_VEICULO').AsString := Current.NfeDetEspecificoVeiculoVO.TipoVeiculo;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('ESPECIE_VEICULO').AsString := Current.NfeDetEspecificoVeiculoVO.EspecieVeiculo;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CONDICAO_VIN').AsString := Current.NfeDetEspecificoVeiculoVO.CondicaoVin;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CONDICAO_VEICULO').AsString := Current.NfeDetEspecificoVeiculoVO.CondicaoVeiculo;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CODIGO_MARCA_MODELO').AsString := Current.NfeDetEspecificoVeiculoVO.CodigoMarcaModelo;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('CODIGO_COR').AsString := Current.NfeDetEspecificoVeiculoVO.CodigoCor;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('LOTACAO').AsInteger := Current.NfeDetEspecificoVeiculoVO.Lotacao;
            FDataModuleNFe.CDSNfeDetalheVeiculo.FieldByName('RESTRICAO').AsString := Current.NfeDetEspecificoVeiculoVO.Restricao;
            FDataModuleNFe.CDSNfeDetalheVeiculo.Post;
          end;

          { NfeDetalhe - Espec�fico - Combust�vel }
          if Current.NfeDetEspecificoCombustivelVO.Id > 0 then
          begin
            FDataModuleNFe.CDSNfeDetalheCombustivel.Append;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('ID').AsInteger := Current.NfeDetEspecificoCombustivelVO.Id;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('ID_NFE_DETALHE').AsInteger := Current.NfeDetEspecificoCombustivelVO.IdNfeDetalhe;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('CODIGO_ANP').AsInteger := Current.NfeDetEspecificoCombustivelVO.CodigoAnp;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('CODIF').AsString := Current.NfeDetEspecificoCombustivelVO.Codif;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('QUANTIDADE_TEMP_AMBIENTE').AsExtended := Current.NfeDetEspecificoCombustivelVO.QuantidadeTempAmbiente;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('UF_CONSUMO').AsString := Current.NfeDetEspecificoCombustivelVO.UfConsumo;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('BASE_CALCULO_CIDE').AsExtended := Current.NfeDetEspecificoCombustivelVO.BaseCalculoCide;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('ALIQUOTA_CIDE').AsExtended := Current.NfeDetEspecificoCombustivelVO.AliquotaCide;
            FDataModuleNFe.CDSNfeDetalheCombustivel.FieldByName('VALOR_CIDE').AsExtended := Current.NfeDetEspecificoCombustivelVO.ValorCide;
            FDataModuleNFe.CDSNfeDetalheCombustivel.Post;
          end;

          { NfeDetalhe - Espec�fico - Medicamento }
          TController.TratarRetorno<TNfeDetEspecificoMedicamentoVO>(Current.ListaNfeDetEspecificoMedicamentoVO, True, True, FDataModuleNFe.CDSNfeDetalheMedicamento);

          { NfeDetalhe - Espec�fico - Armamento }
          TController.TratarRetorno<TNfeDetEspecificoArmamentoVO>(Current.ListaNfeDetEspecificoArmamentoVO, True, True, FDataModuleNFe.CDSNfeDetalheArmamento);
        end;
      end;
    finally
      NfeDetalheEnumerator.Free;
    end;
    (* Fim do Grupo de Detalhe *)
  end;
end;
{$ENDREGION}

{$REGION 'Exclus�es Internas'}
procedure TFNFe.ActionExcluirCobrancaExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover os dados de cobran�a?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      ExcluirDadosCobranca
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'ExcluiCobranca', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        ExcluirDadosCobranca;
    end;
  end;
end;

procedure TFNFe.ExcluirDadosCobranca;
begin
  FDataModuleNFe.CDSDuplicata.EmptyDataSet;
  //
  EditFaturaNumero.Clear;
  EditFaturaValorOriginal.Clear;
  EditFaturaValorDesconto.Clear;
  EditFaturaValorLiquido.Clear;
end;

procedure TFNFe.ActionExcluirDocumentosReferenciadosExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover os documentos referenciados?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      ExcluirDadosReferenciados
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'ExcluiReferenciado', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        ExcluirDadosReferenciados;
    end;
  end;
end;

procedure TFNFe.ExcluirDadosReferenciados;
begin
  FDataModuleNFe.CDSNfeReferenciada.EmptyDataSet;
  FDataModuleNFe.CDSNfReferenciada.EmptyDataSet;
  FDataModuleNFe.CDSCupomReferenciado.EmptyDataSet;
  FDataModuleNFe.CDSNfRuralReferenciada.EmptyDataSet;
  FDataModuleNFe.CDSCteReferenciado.EmptyDataSet;
end;

procedure TFNFe.ActionExcluirEntregaRetiradaExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover os dados de entrega/retirada?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      ExcluirDadosEntregaRetirada
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'ExcluiEntregaRetirada', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        ExcluirDadosEntregaRetirada;
    end;
  end;
end;

procedure TFNFe.ExcluirDadosEntregaRetirada;
begin
  { Local Entrega }
  EditEntregaCpfCnpj.Clear;
  EditEntregaLogradouro.Clear;
  EditEntregaNumero.Clear;
  EditEntregaComplemento.Clear;
  EditEntregaBairro.Clear;
  EditEntregaIbge.Clear;
  EditEntregaCidade.Clear;
  EditEntregaUf.Clear;

  { Local Retirada }
  EditRetiradaCpfCnpj.Clear;
  EditRetiradaLogradouro.Clear;
  EditRetiradaNumero.Clear;
  EditRetiradaComplemento.Clear;
  EditRetiradaBairro.Clear;
  EditRetiradaIbge.Clear;
  EditRetiradaCidade.Clear;
  EditRetiradaUf.Clear;
end;

procedure TFNFe.ActionExcluirTransporteExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover os dados de transporte?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      ExcluirDadosTransporte
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'ExcluiTransporte', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        ExcluirDadosTransporte;
    end;
  end;
end;

procedure TFNFe.ExcluirDadosTransporte;
begin
  FDataModuleNFe.CDSReboque.EmptyDataSet;
  FDataModuleNFe.CDSVolumes.EmptyDataSet;
  FDataModuleNFe.CDSVolumesLacres.EmptyDataSet;
  //
  EditTransportadorId.Clear;
  ComboModalidadeFrete.ItemIndex := 0;
  EditTransportadorCpfCnpj.Clear;
  EditTransportadorRazaoSocial.Clear;
  EditTransportadorIE.Clear;
  EditTransportadorLogradouro.Clear;
  EditTransportadorCidade.Clear;
  EditTransportadorUF.Clear;
  EditRetencaoIcmsValorServico.Clear;
  EditRetencaoIcmsBaseCalculo.Clear;
  EditRetencaoIcmsAliquota.Clear;
  EditRetencaoIcmsIcmsRetido.Clear;
  EditRetencaoIcmsCfop.Clear;
  EditRetencaoIcmsCidade.Clear;
  EditVeiculoPlaca.Clear;
  EditVeiculoUf.Clear;
  EditVeiculoRntc.Clear;
  EditRetencaoIcmsUf.Clear;
  EditTransporteVagao.Clear;
  EditTransporteBalsa.Clear;
end;

procedure TFNFe.ActionExcluirItemExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover o item da nota fiscal?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      FDataModuleNFe.CDSNfeDetalhe.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'ExcluiItem', [FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        FDataModuleNFe.CDSNfeDetalhe.Delete;
    end;
  end;
end;
{$EndREGION 'Exclus�es Internas'}

{$REGION 'Actions'}
procedure TFNFe.ActionIncluirItemExecute(Sender: TObject);
var
  ViewTributacaoIssVO: TViewTributacaoIssVO;
  ViewTributacaoIcmsVO: TViewTributacaoIcmsVO;
  ViewTributacaoPisVO: TViewTributacaoPisVO;
  ViewTributacaoCofinsVO: TViewTributacaoCofinsVO;
  ViewTributacaoIpiVO: TViewTributacaoIpiVO;
  ViewTributacaoIcmsCustomVO: TViewTributacaoIcmsCustomVO;
  FiltroLocal: String;
begin
  if EditIdOperacaoFiscal.AsInteger <= 0 then
  begin
    Application.MessageBox('� necess�rio informar a opera��o fiscal.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  try
    try
      PopulaCamposTransientesLookup(TProdutoVO, TProdutoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        inc(SeqItem);
        FDataModuleNFe.CDSNfeDetalhe.Append;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger := SeqItem;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID_PRODUTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID_NFE_CABECALHO').AsInteger := 0;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('NUMERO_ITEM').AsInteger := SeqItem;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('CADASTRADO').AsString := 'S';
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('CODIGO_PRODUTO').AsString := CDSTransiente.FieldByName('GTIN').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('GTIN').AsString := CDSTransiente.FieldByName('GTIN').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('NOME_PRODUTO').AsString := CDSTransiente.FieldByName('NOME').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('NCM').AsString := CDSTransiente.FieldByName('NCM').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('EX_TIPI').AsString := CDSTransiente.FieldByName('EX_TIPI').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('UNIDADE_COMERCIAL').AsString := CDSTransiente.FieldByName('UNIDADE_PRODUTO.SIGLA').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_COMERCIAL').AsExtended := 1;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_COMERCIAL').AsExtended := CDSTransiente.FieldByName('VALOR_VENDA').AsExtended;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('GTIN_UNIDADE_TRIBUTAVEL').AsString := CDSTransiente.FieldByName('GTIN').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('UNIDADE_TRIBUTAVEL').AsString := CDSTransiente.FieldByName('UNIDADE_PRODUTO.SIGLA').AsString;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_TRIBUTAVEL').AsExtended := 1;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_TRIBUTAVEL').AsExtended := CDSTransiente.FieldByName('VALOR_VENDA').AsExtended;
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('ENTRA_TOTAL').AsString := '0';
        FDataModuleNFe.CDSNfeDetalhe.FieldByName('PERSISTE').AsString := 'I';

        // Se houver CFOP cadastrado na Opera��o Fiscal, a nota � de servi�os
        if TributOperacaoFiscalVO.Cfop > 0 then
        begin
          FDataModuleNFe.CDSNfeDetalhe.FieldByName('CFOP').AsInteger := TributOperacaoFiscalVO.Cfop;
          //
          { ISSQN }
          ViewTributacaoIssVO := TViewTributacaoIssVO(TController.BuscarObjeto('ViewTributacaoIssController.TViewTributacaoIssController', 'ConsultaObjeto', ['ID=' + TributOperacaoFiscalVO.Id.ToString], 'GET'));
          FDataModuleNFe.CDSNfeImpostoIssqn.Append;
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('BASE_CALCULO_ISSQN').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_COMERCIAL').AsExtended;
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ALIQUOTA_ISSQN').AsExtended := ViewTributacaoIssVO.AliquotaPorcento;
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('VALOR_ISSQN').AsExtended := FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('BASE_CALCULO_ISSQN').AsExtended * ViewTributacaoIssVO.AliquotaPorcento / 100;
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('VALOR_ISSQN').AsExtended := ArredondaTruncaValor('A', FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('VALOR_ISSQN').AsExtended, 2);
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('MUNICIPIO_ISSQN').AsInteger := Sessao.Empresa.CodigoIbgeCidade;
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('ITEM_LISTA_SERVICOS').AsInteger := ViewTributacaoIssVO.ItemListaServico;
          FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('TRIBUTACAO_ISSQN').AsString := ViewTributacaoIssVO.CodigoTributacao;
          FDataModuleNFe.CDSNfeImpostoIssqn.Post;

          { PIS ISSQN }
          FDataModuleNFe.CDSNfeImpostoPis.Append;
          FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
          FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_PERCENTUAL').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_REAIS').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_BASE_CALCULO_PIS').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_PIS').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoPis.Post;

          { COFINS ISSQN }
          FDataModuleNFe.CDSNfeImpostoCofins.Append;
          FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
          FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_PERCENTUAL').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_REAIS').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('BASE_CALCULO_COFINS').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('VALOR_COFINS').AsExtended := 0;
          FDataModuleNFe.CDSNfeImpostoCofins.Post;
        end
        else
        begin
          { ICMS }
          //Se o Produto estiver vinculado a uma configura��o de Opera��o Fiscal + Grupo Tribut�rio, carrega esses dados
          if CDSTransiente.FieldByName('ID_GRUPO_TRIBUTARIO').AsInteger > 0 then
          begin
            FiltroLocal := 'ID_TRIBUT_OPERACAO_FISCAL=' + TributOperacaoFiscalVO.Id.ToString +
                           ' and ID_TRIBUT_GRUPO_TRIBUTARIO=' + CDSTransiente.FieldByName('ID_GRUPO_TRIBUTARIO').AsString +
                           ' and UF_DESTINO=' + QuotedStr(EditDestinatarioUF.Text);
            ViewTributacaoIcmsVO := TViewTributacaoIcmsVO(TController.BuscarObjeto('ViewTributacaoIcmsController.TViewTributacaoIcmsController', 'ConsultaObjeto', [FiltroLocal], 'GET'));
            if Assigned(ViewTributacaoIcmsVO) then
            begin
              FDataModuleNFe.CDSNfeDetalhe.FieldByName('CFOP').AsInteger := ViewTributacaoIcmsVO.Cfop;

              FDataModuleNFe.CDSNfeImpostoIcms.Append;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ORIGEM_MERCADORIA').AsString := ViewTributacaoIcmsVO.OrigemMercadoria;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CST_ICMS').AsString := ViewTributacaoIcmsVO.CstB;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CSOSN').AsString := ViewTributacaoIcmsVO.CsosnB;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS').AsString := ViewTributacaoIcmsVO.ModalidadeBc;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('TAXA_REDUCAO_BC_ICMS').AsExtended := ViewTributacaoIcmsVO.PorcentoBc;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS').AsExtended := ViewTributacaoIcmsVO.Aliquota;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS_ST').AsString := ViewTributacaoIcmsVO.ModalidadeBcSt;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_MVA_ICMS_ST').AsExtended := ViewTributacaoIcmsVO.Mva;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_REDUCAO_BC_ICMS_ST').AsExtended := ViewTributacaoIcmsVO.PorcentoBcSt;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_ST').AsExtended := ViewTributacaoIcmsVO.AliquotaIcmsSt;
              FDataModuleNFe.CDSNfeImpostoIcms.Post;
            end
            else
            begin
              Application.MessageBox('N�o existe tributa��o de ICMS definida para os par�metros informados. Opera��o n�o realizada.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
              FDataModuleNFe.CDSNfeDetalhe.Cancel;
              Exit;
            end;
          end
          //Sen�o pega do ICMS Customizado
          else
          begin
            FiltroLocal := 'ID_TRIBUT_ICMS_CUSTOM_CAB=' + CDSTransiente.FieldByName('ID_TRIBUT_ICMS_CUSTOM_CAB').AsString +
                           ' and UF_DESTINO=' + QuotedStr(EditDestinatarioUF.Text);
            ViewTributacaoIcmsCustomVO := TViewTributacaoIcmsCustomVO(TController.BuscarObjeto('ViewTributacaoIcmsCustomController.TViewTributacaoIcmsCustomController', 'ConsultaObjeto', [FiltroLocal], 'GET'));
            if Assigned(ViewTributacaoIcmsCustomVO) then
            begin
              FDataModuleNFe.CDSNfeDetalhe.FieldByName('CFOP').AsInteger := ViewTributacaoIcmsCustomVO.Cfop;

              FDataModuleNFe.CDSNfeImpostoIcms.Append;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ORIGEM_MERCADORIA').AsString := ViewTributacaoIcmsCustomVO.OrigemMercadoria;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CST_ICMS').AsString := ViewTributacaoIcmsCustomVO.CstB;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CSOSN').AsString := ViewTributacaoIcmsCustomVO.CsosnB;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS').AsString := ViewTributacaoIcmsCustomVO.ModalidadeBc;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('TAXA_REDUCAO_BC_ICMS').AsExtended := ViewTributacaoIcmsCustomVO.PorcentoBc;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS').AsExtended := ViewTributacaoIcmsCustomVO.Aliquota;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS_ST').AsString := ViewTributacaoIcmsCustomVO.ModalidadeBcSt;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_MVA_ICMS_ST').AsExtended := ViewTributacaoIcmsCustomVO.Mva;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_REDUCAO_BC_ICMS_ST').AsExtended := ViewTributacaoIcmsCustomVO.PorcentoBcSt;
              FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_ST').AsExtended := ViewTributacaoIcmsCustomVO.AliquotaIcmsSt;
              FDataModuleNFe.CDSNfeImpostoIcms.Post;
            end
            else
            begin
              Application.MessageBox('N�o existe tributa��o de ICMS definida para os par�metros informados. Opera��o n�o realizada.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
              FDataModuleNFe.CDSNfeDetalhe.Cancel;
              Exit;
            end;
          end;

          { IPI }
          FiltroLocal := 'ID_TRIBUT_OPERACAO_FISCAL=' + TributOperacaoFiscalVO.Id.ToString +
                         ' and ID_TRIBUT_GRUPO_TRIBUTARIO=' + CDSTransiente.FieldByName('ID_GRUPO_TRIBUTARIO').AsString;
          ViewTributacaoIpiVO := TViewTributacaoIpiVO(TController.BuscarObjeto('ViewTributacaoIpiController.TViewTributacaoIpiController', 'ConsultaObjeto', [FiltroLocal], 'GET'));
          if Assigned(ViewTributacaoIpiVO) then
          begin
            FDataModuleNFe.CDSNfeImpostoIpi.Append;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CST_IPI').AsString := ViewTributacaoIpiVO.CstIpi;
            FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ALIQUOTA_IPI').AsExtended := ViewTributacaoIpiVO.AliquotaPorcento;
            FDataModuleNFe.CDSNfeImpostoIpi.Post;
          end;

          { PIS ICMS }
          FiltroLocal := 'ID_TRIBUT_OPERACAO_FISCAL=' + TributOperacaoFiscalVO.Id.ToString +
                         ' and ID_TRIBUT_GRUPO_TRIBUTARIO=' + CDSTransiente.FieldByName('ID_GRUPO_TRIBUTARIO').AsString;
          ViewTributacaoPisVO := TViewTributacaoPisVO(TController.BuscarObjeto('ViewTributacaoPisController.TViewTributacaoPisController', 'ConsultaObjeto', [FiltroLocal], 'GET'));
          if Assigned(ViewTributacaoPisVO) then
          begin
            FDataModuleNFe.CDSNfeImpostoPis.Append;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('CST_PIS').AsString := ViewTributacaoPisVO.CstPis;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_PERCENTUAL').AsExtended := ViewTributacaoPisVO.AliquotaPorcento;
            FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_REAIS').AsExtended := ViewTributacaoPisVO.AliquotaUnidade;
            FDataModuleNFe.CDSNfeImpostoPis.Post;
          end;

          { COFINS ICMS }
          FiltroLocal := 'ID_TRIBUT_OPERACAO_FISCAL=' + TributOperacaoFiscalVO.Id.ToString +
                         ' and ID_TRIBUT_GRUPO_TRIBUTARIO=' + CDSTransiente.FieldByName('ID_GRUPO_TRIBUTARIO').AsString;
          ViewTributacaoCofinsVO := TViewTributacaoCofinsVO(TController.BuscarObjeto('ViewTributacaoCofinsController.TViewTributacaoCofinsController', 'ConsultaObjeto', [FiltroLocal], 'GET'));
          if Assigned(ViewTributacaoCofinsVO) then
          begin
            FDataModuleNFe.CDSNfeImpostoCofins.Append;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ID_NFE_DETALHE').AsInteger := FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('CST_COFINS').AsString := ViewTributacaoCofinsVO.CstCofins;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_PERCENTUAL').AsExtended := ViewTributacaoCofinsVO.AliquotaPorcento;
            FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_REAIS').AsExtended := ViewTributacaoCofinsVO.AliquotaUnidade;
            FDataModuleNFe.CDSNfeImpostoCofins.Post;
          end;
        end;

        FDataModuleNfe.CDSNfeDetalhe.FieldByName('QUANTIDADE_TRIBUTAVEL').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_COMERCIAL').AsExtended;
        FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('QUANTIDADE_COMERCIAL').AsExtended * FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_COMERCIAL').AsExtended;
        FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended := ArredondaTruncaValor('A', FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended, 2);
        FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_SUBTOTAL').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended;
        FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL').AsExtended := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_SUBTOTAL').AsExtended - FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_DESCONTO').AsExtended;

        FDataModuleNFe.CDSNfeDetalhe.Post;
      end;
    except
      on E: Exception do
      begin
        FDataModuleNFe.CDSNfeDetalhe.Cancel;
        Application.MessageBox(PChar('Ocorreu um erro ao tentar inserir um item.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
      end;
    end;
  finally
    FreeAndNil(ViewTributacaoIssVO);
    FreeAndNil(ViewTributacaoIcmsVO);
    FreeAndNil(ViewTributacaoPisVO);
    FreeAndNil(ViewTributacaoCofinsVO);
    FreeAndNil(ViewTributacaoIpiVO);
    FreeAndNil(ViewTributacaoIcmsCustomVO);
    CDSTransiente.Close;
  end;
end;

procedure TFNFe.CalcularItem;
begin
  try
    //Se n�o for uma nota de servi�os
    if TributOperacaoFiscalVO.Cfop <= 0 then
    begin
      { C�lculo }
      CalculoNFE := TCalculoNFE.Create;
      if Sessao.Empresa.Crt <> '' then
        CalculoNFE.CrtEmissor := StrToInt(Sessao.Empresa.Crt);
      CalculoNFE.UFemissor := Sessao.Empresa.CodigoIbgeUf;
      CalculoNFE.TipoCliente := IfThen(Length(EditDestinatarioCpfCnpj.Text) > 11, 'J', 'F');
      CalculoNFE.UFCliente := EditDestinatarioUF.Text;
      CalculoNFE.ValorBrutoProdutos := FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended;
      CalculoNFE.ValorFrete := FDataModuleNFe.CDSNFeDetalhe.FieldByName('VALOR_FRETE').AsExtended;
      CalculoNFE.ValorSeguro := FDataModuleNFe.CDSNFeDetalhe.FieldByName('VALOR_SEGURO').AsExtended;
      CalculoNFE.ValorOutrasDespesas := FDataModuleNFe.CDSNFeDetalhe.FieldByName('VALOR_OUTRAS_DESPESAS').AsExtended;
      CalculoNFE.ValorDesconto := FDataModuleNFe.CDSNFeDetalhe.FieldByName('VALOR_DESCONTO').AsExtended;
      CalculoNFE.CstIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CST_ICMS').AsString;
      CalculoNFE.Csosn := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('CSOSN').AsString;
      CalculoNFE.ModalidadeBcIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS').AsString;
      CalculoNFE.TaxaReducaoBcIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('TAXA_REDUCAO_BC_ICMS').AsExtended;
      CalculoNFE.AliquotaIcms := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS').AsExtended;
      CalculoNFE.AliquotaIcmsInter := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS').AsExtended;
      CalculoNFE.ModalidadeBcIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS_ST').AsString;
      CalculoNFE.PercentualMvaIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_MVA_ICMS_ST').AsExtended;
      CalculoNFE.ReducaoBcIcmsSt :=  FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_REDUCAO_BC_ICMS_ST').AsExtended;
      CalculoNFE.AliquotaIcmsSt := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_ST').AsExtended;
      CalculoNFE.AliquotaCreditoIcmsSn := FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_CREDITO_ICMS_SN').AsExtended;
      CalculoNFE.CstIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('CST_IPI').AsString;
      CalculoNFE.AliquotaIpi := FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('ALIQUOTA_IPI').AsExtended;
      CalculoNFE.CstPis := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('CST_PIS').AsString;
      CalculoNFE.AliquotaPis := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_PERCENTUAL').AsExtended;
      CalculoNFE.AliquotaPisReais := FDataModuleNFe.CDSNfeImpostoPis.FieldByName('ALIQUOTA_PIS_REAIS').AsExtended;
      CalculoNFE.CstCofins := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('CST_COFINS').AsString;
      CalculoNFE.AliquotaCofins := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_PERCENTUAL').AsExtended;
      CalculoNFE.AliquotaCofinsReais := FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('ALIQUOTA_COFINS_REAIS').AsExtended;

      CalculoNFE := TNFeCalculoController.Calculo(CalculoNFE);

      { Valores ICMS }
      FDataModuleNFe.CDSNfeImpostoIcms.Edit;
      FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS').AsExtended := CalculoNFE.BaseCalculoIcms;
      FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_REDUCAO_BC_ICMS_ST').AsExtended := CalculoNFE.ReducaoBcIcmsSt;
      FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS').AsExtended := CalculoNFE.ValorIcms;
      // valores de icms st
      FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BASE_CALCULO_ICMS_ST').AsExtended := CalculoNFE.BaseCalculoIcmsSt;
      FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST').AsExtended := CalculoNFE.ValorIcmsSt;
      // credito de icmssn
      FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_CREDITO_ICMS_SN').AsExtended := CalculoNFE.ValorCreditoIcmsSn;
      FDataModuleNFe.CDSNfeImpostoIcms.Post;

      { Valores IPI }
      FDataModuleNFe.CDSNfeImpostoIpi.Edit;
      FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_BASE_CALCULO_IPI').AsExtended := CalculoNFE.BaseCalculoIpi;
      FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_IPI').AsExtended := CalculoNFE.ValorIpi;
      FDataModuleNFe.CDSNfeImpostoIpi.Post;

      { Valores PIS }
      FDataModuleNFe.CDSNfeImpostoPis.Edit;
      FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_BASE_CALCULO_PIS').AsExtended := CalculoNFE.BaseCalculoPis;
      FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_PIS').AsExtended := CalculoNFE.ValorPis;
      FDataModuleNFe.CDSNfeImpostoPis.Post;

      { Valores COFINS }
      FDataModuleNFe.CDSNfeImpostoCofins.Edit;
      FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('BASE_CALCULO_COFINS').AsExtended := CalculoNFE.BaseCalculoCofins;
      FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('VALOR_COFINS').AsExtended := CalculoNFE.ValorCofins;
      FDataModuleNFe.CDSNfeImpostoCofins.Post;
    end;
  finally
    FreeAndNil(CalculoNFE);
  end;
end;

procedure TFNFe.ActionAtualizarTotaisExecute(Sender: TObject);
var
  TotalProdutos, ValorFrete, ValorSeguro, ValorOutrasDespesas, Desconto, BaseCalculoIcms, ValorIcms, BaseCalculoIcmsSt, ValorIcmsSt, ValorIpi, ValorPis, ValorCofins, ValorNotaFiscal: Double;
  TotalServicos, BaseCalculoIssqn, ValorIssqn, ValorPisIssqn, ValorCofinsIssqn: Double;
begin
  TotalProdutos := 0;
  ValorFrete := 0;
  ValorSeguro := 0;
  ValorOutrasDespesas := 0;
  Desconto := 0;
  BaseCalculoIcms := 0;
  ValorIcms := 0;
  BaseCalculoIcmsSt := 0;
  ValorIcmsSt := 0;
  ValorIpi := 0;
  ValorPis := 0;
  ValorCofins := 0;
  //
  TotalServicos := 0;
  BaseCalculoIssqn := 0;
  ValorIssqn := 0;
  ValorPisIssqn := 0;
  ValorCofinsIssqn := 0;

  // Se houver CFOP cadastrado na Opera��o Fiscal, a nota � de servi�os
  if TributOperacaoFiscalVO.Cfop > 0 then
  begin
    FDataModuleNFe.CDSNfeDetalhe.First;
    while not FDataModuleNFe.CDSNfeDetalhe.Eof do
    begin
      TotalServicos := TotalServicos + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL').AsExtended;
      ValorFrete := ValorFrete + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_FRETE').AsExtended;
      ValorSeguro := ValorSeguro + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_SEGURO').AsExtended;
      ValorOutrasDespesas := ValorOutrasDespesas + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_OUTRAS_DESPESAS').AsExtended;
      Desconto := Desconto + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_DESCONTO').AsExtended;
      BaseCalculoIssqn := BaseCalculoIssqn + FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('BASE_CALCULO_ISSQN').AsExtended;
      ValorIssqn := ValorIssqn + FDataModuleNFe.CDSNfeImpostoIssqn.FieldByName('VALOR_ISSQN').AsExtended;
      ValorPisIssqn := ValorPisIssqn + FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_PIS').AsExtended;
      ValorCofinsIssqn := ValorCofinsIssqn + FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('VALOR_COFINS').AsExtended;
      FDataModuleNFe.CDSNfeDetalhe.Next;
    end;
    FDataModuleNFe.CDSNfeDetalhe.First;
    //
    ValorNotaFiscal := TotalServicos + ValorPis + ValorCofins + EditValorOutrasDespesas.Value - Desconto;
    EditValorTotalServicos.Value := TotalServicos;
  end
  else
  begin
    FDataModuleNFe.CDSNfeDetalhe.First;
    while not FDataModuleNFe.CDSNfeDetalhe.Eof do
    begin
      TotalProdutos := TotalProdutos + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL').AsExtended;
      ValorFrete := ValorFrete + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_FRETE').AsExtended;
      ValorSeguro := ValorSeguro + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_SEGURO').AsExtended;
      ValorOutrasDespesas := ValorOutrasDespesas + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_OUTRAS_DESPESAS').AsExtended;
      Desconto := Desconto + FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_DESCONTO').AsExtended;
      BaseCalculoIcms := BaseCalculoIcms + FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS').AsExtended;
      ValorIcms := ValorIcms + FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS').AsExtended;
      BaseCalculoIcmsSt := BaseCalculoIcmsSt + FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_BASE_CALCULO_ICMS_ST').AsExtended;
      ValorIcmsSt := ValorIcmsSt + FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST').AsExtended;
      ValorIpi := ValorIpi + FDataModuleNFe.CDSNfeImpostoIpi.FieldByName('VALOR_IPI').AsExtended;
      ValorPis := ValorPis + FDataModuleNFe.CDSNfeImpostoPis.FieldByName('VALOR_PIS').AsExtended;
      ValorCofins := ValorCofins + FDataModuleNFe.CDSNfeImpostoCofins.FieldByName('VALOR_COFINS').AsExtended;
      FDataModuleNFe.CDSNfeDetalhe.Next;
    end;
    FDataModuleNFe.CDSNfeDetalhe.First;
    //
    ValorNotaFiscal := TotalProdutos + ValorIcmsSt + ValorPis + ValorCofins + ValorIpi + EditValorOutrasDespesas.Value - Desconto;
  end;

  EditTotalProdutos.Value := TotalProdutos;
  EditValorFrete.Value := ValorFrete;
  EditValorSeguro.Value := ValorSeguro;
  EditValorOutrasDespesas.Value := ValorOutrasDespesas;
  EditValorDesconto.Value := Desconto;
  EditBCIcms.Value := BaseCalculoIcms;
  EditValorIcms.Value := ValorIcms;
  EditBCIcmsSt.Value := BaseCalculoIcmsSt;
  EditValorIcmsSt.Value := ValorIcmsSt;
  EditValorIPI.Value := ValorIpi;
  EditValorPIS.Value := ValorPis;
  EditValorCOFINS.Value := ValorCofins;
  //
  EditBaseCalculoIssqn.Value := BaseCalculoIssqn;
  EditValorIssqn.Value := ValorIssqn;
  EditValorPisIssqn.Value := ValorPisIssqn;
  EditValorCofinsIssqn.Value := ValorCofinsIssqn;
  //
  EditValorTotalNota.Value := ValorNotaFiscal;
end;

procedure TFNFe.Button1Click(Sender: TObject);
var
  LancamentoReceber: TFinLancamentoReceberVO;
  ParcelaReceber: TFinParcelaReceberVO;
  i: integer;
begin
  /// EXERCICIO: implemente esse m�todo de acordo com a necessidade do seu cliente
  ///  01-Pergunte se ele quer lan�ar no contas a receber ap�s a emiss�o da nota
  ///  02-Deixe uma op��o na tela para mandar os dados para o financeiro
  ///  03-Deixe a op��o de capturar esses dados no financeiro apenas
  ///  04-Realize o lan�amento sem que o usu�rio da NF-e saiba o que est� ocorrendo e deixe o restante a cargo do profissional do setor financeiro
  ///
  ///  Corrija as informa��es est�ticas que est�o no c�digo.

  if Application.MessageBox('Deseja gerar os lan�amentos para o contas a Receber?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    LancamentoReceber := TFinLancamentoReceberVO.Create;

    LancamentoReceber.IdCliente := EditDestinatarioId.AsInteger;
    LancamentoReceber.IdFinDocumentoOrigem := 32; // Carregue os dados do AdmParametroVO
    LancamentoReceber.QuantidadeParcela := 1;
    LancamentoReceber.ValorTotal := EditValorTotalNota.Value;
    LancamentoReceber.ValorAReceber := EditValorTotalNota.Value;
    LancamentoReceber.DataLancamento := now;
    LancamentoReceber.NumeroDocumento := 'NF-e: ' + EditNumeroNfe.text;
    LancamentoReceber.PrimeiroVencimento := now;
    LancamentoReceber.IntervaloEntreParcelas := 30;

    LancamentoReceber.ListaParcelaReceberVO := TObjectList<TFinParcelaReceberVO>.Create;
    for i := 0 to LancamentoReceber.QuantidadeParcela - 1 do
    begin
      ParcelaReceber := TFinParcelaReceberVO.Create;
      ParcelaReceber.NumeroParcela := i+1;
      ParcelaReceber.IdContaCaixa := 1; // Carregue os dados do AdmParametroVO
      ParcelaReceber.IdFinStatusParcela := 1;
      ParcelaReceber.DataEmissao := now;
      ParcelaReceber.DataVencimento := LancamentoReceber.PrimeiroVencimento + (LancamentoReceber.IntervaloEntreParcelas * i);
      ParcelaReceber.Valor := ArredondaTruncaValor('A', LancamentoReceber.ValorAReceber / LancamentoReceber.QuantidadeParcela, Constantes.TConstantes.DECIMAIS_VALOR);

      LancamentoReceber.ListaParcelaReceberVO.Add(ParcelaReceber);
    end;
    TController.ExecutarMetodo('FinLancamentoReceberController.TFinLancamentoReceberController', 'Insere', [TFinLancamentoReceberVO(LancamentoReceber)], 'PUT', 'Lista');
  end;
end;


{$REGION 'Actions NF-e'}
procedure TFNFe.ActionSelecionarCertificadoExecute(Sender: TObject);
begin
  try
    ObjetoNfeConfiguracaoVO.CertificadoDigitalSerie := FDataModule.ACBrNFe.SSL.SelecionarCertificado;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro ao tentar selecionar o certificado.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

// EXERCICIO: refine o processo e imprima a etiqueta de acordo com a sua necessidade
// OBS: veremos mais sobre isso no m�dulo Gerador de Etiquetas
procedure TFNFe.ActionEtiquetaExecute(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

procedure TFNFe.frxReport1GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'XEmitente' then
    value := Sessao.Empresa.NomeFantasia;
  if VarName = 'XCodigo' then
    value := EditChaveAcesso.Text;
  if VarName = 'XDescricao' then
    value := 'Produtos Diversos';

  // EXERCICIO: pesquise sobre o SSCC e como ele deve ser implementado nessa rotina
  if VarName = 'XSSCC' then
    value := '123456789123456789';

  if VarName = 'XConteudo' then
    value := EditNumeroNfe.Text;

  // EXERCICIO: calcule a quantidade de itens para ser informada aqui
  if VarName = 'XQuantidade' then
    value := '10';
end;

// EXERCICIO: selecione um local apropriado para inutilizar notas.
procedure TFNFe.ActionInutilizarNFeExecute(Sender: TObject);
var
  Modelo, Serie, Ano, NumeroInicial, NumeroFinal, Justificativa : String;
begin
  if not(InputQuery('Inutiliza��o de NF-e', 'Ano',    Ano)) then
    exit;
  if not(InputQuery('Inutiliza��o de NF-e', 'Modelo', Modelo)) then
    exit;
  if not(InputQuery('Inutiliza��o de NF-e', 'Serie',  Serie)) then
    exit;
  if not(InputQuery('Inutiliza��o de NF-e', 'N�mero Inicial', NumeroInicial)) then
    exit;
  if not(InputQuery('Inutiliza��o de NF-e', 'N�mero Final', NumeroFinal)) then
    exit;
  if not(InputQuery('Inutiliza��o de NF-e', 'Justificativa', Justificativa)) then
    exit;
  //
  FDataModule.ACBrNFe.WebServices.Inutiliza(Sessao.Empresa.Cnpj, Justificativa, StrToInt(Ano), StrToInt(Modelo), StrToInt(Serie), StrToInt(NumeroInicial), StrToInt(NumeroFinal));
  MemoRespostas.Lines.Text := FDataModule.ACBrNFe.WebServices.Inutilizacao.RetWS;
end;

// EXERCICIO: Fa�a as devidas adapta��es na CC-e de acordo com sua necessidade
procedure TFNFe.ActionCCeExecute(Sender: TObject);
var
  idLote, nSeqEvento, Correcao: String;
begin
  idLote := '1';
  if not(InputQuery('WebServices Eventos: Carta de Corre��o', 'Identificador de controle do Lote de envio do Evento', idLote)) then
     exit;

  nSeqEvento := '1';
  if not(InputQuery('WebServices Eventos: Carta de Corre��o', 'Sequencial do evento para o mesmo tipo de evento', nSeqEvento)) then
     exit;

  Correcao := 'TEXTO CAPTURADO DO EXEMPLO DO ACBR - Corre��o a ser considerada, texto livre. A corre��o mais recente substitui as anteriores.';
  if not(InputQuery('WebServices Eventos: Carta de Corre��o', 'Corre��o a ser considerada', Correcao)) then
     exit;

  FDataModule.ACBrNFe.EventoNFe.Evento.Clear;
  with FDataModule.ACBrNFe.EventoNFe.Evento.Add do
   begin
     infEvento.chNFe := EditChaveAcesso.Text;
     infEvento.CNPJ   := Sessao.Empresa.Cnpj;
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCCe;
     infEvento.nSeqEvento := StrToInt(nSeqEvento);
     infEvento.detEvento.xCorrecao := Correcao;
   end;
  FDataModule.ACBrNFe.EnviarEvento(StrToInt(idLote));
  MemoRespostas.Lines.Text := FDataModule.ACBrNFe.WebServices.EnvEvento.RetWS;
end;

procedure TFNFe.ActionConsultarSefazExecute(Sender: TObject);
begin
  try
    FDataModule.ACBrNFe.WebServices.Consulta.NFeChave := EditChaveAcesso.Text;
    FDataModule.ACBrNFe.WebServices.Consulta.Executar;
    MemoRespostas.Lines.Text := UTF8Encode(FDataModule.ACBrNFe.WebServices.Consulta.RetWS);
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFNFe.ActionImprimirDanfeExecute(Sender: TObject);
var
  Justificativa: String;
begin
  // EXERCICIO: Fa�a com que a justificativa apare�a no DANFE reimpresso.
  // EXERCICIO: Implemente um relat�rio com as estat�sticas de reimpress�es na sua suite preferida
  // EXERCICIO: Verifique se existem problemas no procedimento a seguir e corrija-os

  try
    if not(InputQuery('Cancelamento NF-e', 'Justificativa', Justificativa)) then
      Exit;

    FDataModule.ACBrNFe.NotasFiscais.LoadFromFile(ObjetoNfeConfiguracaoVO.CaminhoSalvarXml + TNfeCabecalhoVO(ObjetoVO).ChaveAcesso + '-NFe.xml');
    if Assigned(FDataModule.ACBrNFe.NotasFiscais.Items[0]) then
    begin
      TNfeCabecalhoVO(ObjetoVO).QuantidadeImpressaoDanfe := TNfeCabecalhoVO(ObjetoVO).QuantidadeImpressaoDanfe + 1;
      TNfeCabecalhoVO(ObjetoVO).InformacoesAddContribuinte := 'DANFE impresso pela ' + TNfeCabecalhoVO(ObjetoVO).QuantidadeImpressaoDanfe.ToString() + '� vez. Justificativa: ' + Justificativa + '.';
      TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'Altera', [TNfeCabecalhoVO(ObjetoVO)], 'POST', 'Boolean');

      FDataModule.ACBrNFe.NotasFiscais.Imprimir;
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro ao tentar imprimir o DANFE.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFNFe.ActionCancelarNfeExecute(Sender: TObject);
var
  Chave, Lote, Justificativa: String;
begin
  try
    Lote := '1';
    if not(InputQuery('Cancelamento NF-e', 'Identificador de Controle do Lote', Lote)) then
      Exit;
    if not(InputQuery('Cancelamento NF-e', 'Justificativa', Justificativa)) then
      Exit;

    FDataModule.ACBrNFe.EventoNFe.Evento.Clear;
    FDataModule.ACBrNFe.EventoNFe.idLote := StrToInt(Lote);
    with FDataModule.ACBrNFe.EventoNFe.Evento.Add do
    begin
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := Justificativa;
    end;
    FDataModule.ACBrNFe.EnviarEvento(StrToInt(Lote));

    MemoRespostas.Lines.Text := FDataModule.ACBrNFe.WebServices.EnvEvento.RetWS;

    TNfeCabecalhoVO(ObjetoVO).InformacoesAddContribuinte := 'NOTA FISCAL CANCELADA. LOTE: ' + Lote + '. JUSTIFICATIVA: ' + Justificativa;
    TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'Altera', [TNfeCabecalhoVO(ObjetoVO)], 'POST', 'Boolean');
    BotaoCancelar.Click;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro ao tentar imprimir o DANFE.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFNFe.ActionEnviarExecute(Sender: TObject);
begin
  try
    // EXERCICIO: trate os retornos da Sefaz e armazene o status da nota de acordo
    TNfeCabecalhoVO(ObjetoVO).StatusNota := 4;
    TController.ExecutarMetodo('NfeCabecalhoController.TNfeCabecalhoController', 'Altera', [TNfeCabecalhoVO(ObjetoVO)], 'POST', 'Boolean');

    FDataModule.ACBrNFe.Enviar(1, true);
    FDataModule.ACBrNFe.NotasFiscais.ImprimirPDF;

    MemoRespostas.Lines.Text := UTF8Encode(FDataModule.ACBrNFe.WebServices.Retorno.RetWS);
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro ao tentar enviar a NF-e.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFNFe.ActionAssinarExecute(Sender: TObject);
begin
  try
    FDataModule.ACBrNFe.NotasFiscais.LoadFromFile(ObjetoNfeConfiguracaoVO.CaminhoSalvarXml + EditChaveAcesso.Text + '-NFe.xml');
    if Assigned(FDataModule.ACBrNFe.NotasFiscais.Items[0]) then
    begin
      FDataModule.ACBrNFe.NotasFiscais.Assinar;
      Application.MessageBox('Nota fiscal assinada!', 'Informa��o do Sistema', MB_OK + MB_ICONEXCLAMATION);
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro ao tentar assinar a NF-e.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFNFe.ActionValidarExecute(Sender: TObject);
begin
  try
    FDataModule.ACBrNFe.NotasFiscais.LoadFromFile(ObjetoNfeConfiguracaoVO.CaminhoSalvarXml + TNfeCabecalhoVO(ObjetoVO).ChaveAcesso + '-NFe.xml');
    if Assigned(FDataModule.ACBrNFe.NotasFiscais.Items[0]) then
    begin
      FDataModule.ACBrNFe.NotasFiscais.Validar;
      Application.MessageBox('Nota fiscal v�lida!', 'Informa��o do Sistema', MB_OK + MB_ICONEXCLAMATION);
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro ao tentar validar a NF-e.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFNFe.ActionGerarXmlExecute(Sender: TObject);
var
  i, j: Integer;
  OK: Boolean;
  NfeTransporteVolumeVO: TNfeTransporteVolumeVO;
  NfeTransporteVolumeLacreVO: TNfeTransporteVolumeLacreVO;
begin
  try
    if FDataModule.ACBrNFe.Configuracoes.Certificados.NumeroSerie = '' then
    begin
      ObjetoNfeConfiguracaoVO.CertificadoDigitalSerie := FDataModule.ACBrNFe.SSL.SelecionarCertificado;
    end;

    FDataModule.ACBrNFe.NotasFiscais.Clear;
    with FDataModule.ACBrNFe.NotasFiscais.Add.NFe do
    begin
      { NFe Cabe�alho }
      Ide.cUF := Sessao.Empresa.CodigoIbgeUf;
      Ide.cNF := StrToInt(TNfeCabecalhoVO(ObjetoVO).CodigoNumerico);
      Ide.natOp := TNfeCabecalhoVO(ObjetoVO).NaturezaOperacao;
      Ide.indPag := TpcnIndicadorPagamento(TNfeCabecalhoVO(ObjetoVO).IndicadorFormaPagamento); // ['0', '1', '2'][ipVista, ipPrazo, ipOutras]
      Ide.Modelo := StrToInt(TNfeCabecalhoVO(ObjetoVO).CodigoModelo);
      Ide.Serie := StrToInt(TNfeCabecalhoVO(ObjetoVO).Serie);
      Ide.nNF := StrToInt(TNfeCabecalhoVO(ObjetoVO).Numero);
      Ide.dEmi := EditDataHoraEmissao.Date;
      Ide.dSaiEnt := EditDataEntradaSaida.Date;
      Ide.hSaiEnt := StrToTime(EditHoraEntradaSaida.Text);
      Ide.tpNF := TpcnTipoNfe(TNfeCabecalhoVO(ObjetoVO).TipoOperacao); // ['0', '1'][tnEntrada, tnSaida]
      Ide.cMunFG := TNfeCabecalhoVO(ObjetoVO).CodigoMunicipio;
      Ide.tpImp := TpcnTipoImpressao(TNfeCabecalhoVO(ObjetoVO).FormatoImpressaoDanfe); // ['1', '2'] [tiRetrato, tiPaisagem]  ver se vamos usar como parametro
      Ide.tpEmis := TpcnTipoEmissao(TNfeCabecalhoVO(ObjetoVO).TipoEmissao); // ['1', '2', '3', '4', '5', '7', '8'][teNormal, teContingencia, teSCAN, teDPEC, teFSDA, teSVCRS, teSVCSP]
      Ide.tpAmb := TpcnTipoAmbiente(TNfeCabecalhoVO(ObjetoVO).Ambiente); // ['1', '2'] [taProducao, taHomologacao]  ver se vamos usar como parametro
      Ide.finNFe := TpcnFinalidadeNfe(TNfeCabecalhoVO(ObjetoVO).FinalidadeEmissao); // ['1', '2', '3'][fnNormal, fnComplementar, fnAjuste]
      Ide.procEmi := TpcnProcessoEmissao(TNfeCabecalhoVO(ObjetoVO).ProcessoEmissao); // ['0', '1', '2', '3'][peAplicativoContribuinte, peAvulsaFisco, peAvulsaContribuinte, peContribuinteAplicativoFisco]
      Ide.verProc := TNfeCabecalhoVO(ObjetoVO).VersaoProcessoEmissao; // versao do processo de emissao


      // EXERCICIO: implemente a conting�ncia de acordo com sua necessidade
      // Ide.dhCont := date;
      // Ide.xJust  := 'Justificativa Contingencia';


      { NFe Cabe�alho -- Totais }
      Total.ICMSTot.vBC := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIcms;
      Total.ICMSTot.vICMS := TNfeCabecalhoVO(ObjetoVO).ValorIcms;
      Total.ICMSTot.vBCST := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIcmsSt;
      Total.ICMSTot.vST := TNfeCabecalhoVO(ObjetoVO).ValorIcmsSt;
      Total.ICMSTot.vProd := TNfeCabecalhoVO(ObjetoVO).ValorTotalProdutos;
      Total.ICMSTot.vFrete := TNfeCabecalhoVO(ObjetoVO).ValorFrete;
      Total.ICMSTot.vSeg := TNfeCabecalhoVO(ObjetoVO).ValorSeguro;
      Total.ICMSTot.vDesc := TNfeCabecalhoVO(ObjetoVO).ValorDesconto;
      Total.ICMSTot.vII := TNfeCabecalhoVO(ObjetoVO).ValorImpostoImportacao;
      Total.ICMSTot.vIPI := TNfeCabecalhoVO(ObjetoVO).ValorIpi;
      Total.ICMSTot.vPIS := TNfeCabecalhoVO(ObjetoVO).ValorPis;
      Total.ICMSTot.vCOFINS := TNfeCabecalhoVO(ObjetoVO).ValorCofins;
      Total.ICMSTot.vOutro := TNfeCabecalhoVO(ObjetoVO).ValorDespesasAcessorias;
      Total.ICMSTot.vNF := TNfeCabecalhoVO(ObjetoVO).ValorTotal;

      Total.ISSQNtot.vServ := TNfeCabecalhoVO(ObjetoVO).ValorServicos;
      Total.ISSQNtot.vBC := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIssqn;
      Total.ISSQNtot.vISS := TNfeCabecalhoVO(ObjetoVO).ValorIssqn;
      Total.ISSQNtot.vPIS := TNfeCabecalhoVO(ObjetoVO).ValorPisIssqn;
      Total.ISSQNtot.vCOFINS := TNfeCabecalhoVO(ObjetoVO).ValorCofinsIssqn;

      Total.retTrib.vRetPIS := TNfeCabecalhoVO(ObjetoVO).ValorRetidoPis;
      Total.retTrib.vRetCOFINS := TNfeCabecalhoVO(ObjetoVO).ValorRetidoCofins;
      Total.retTrib.vRetCSLL := TNfeCabecalhoVO(ObjetoVO).ValorRetidoCsll;
      Total.retTrib.vBCIRRF := TNfeCabecalhoVO(ObjetoVO).BaseCalculoIrrf;
      Total.retTrib.vIRRF := TNfeCabecalhoVO(ObjetoVO).ValorRetidoIrrf;
      Total.retTrib.vBCRetPrev := TNfeCabecalhoVO(ObjetoVO).BaseCalculoPrevidencia;
      Total.retTrib.vRetPrev := TNfeCabecalhoVO(ObjetoVO).ValorRetidoPrevidencia;

      { NFe Cabe�alho -- Informa��es Adicionais }
      exporta.UFembarq := TNfeCabecalhoVO(ObjetoVO).ComexUfEmbarque;
      exporta.xLocEmbarq := TNfeCabecalhoVO(ObjetoVO).ComexLocalEmbarque;
      compra.xNEmp := TNfeCabecalhoVO(ObjetoVO).CompraNotaEmpenho;
      compra.xPed := TNfeCabecalhoVO(ObjetoVO).CompraPedido;
      compra.xCont := TNfeCabecalhoVO(ObjetoVO).CompraContrato;
      infAdic.infCpl := TNfeCabecalhoVO(ObjetoVO).InformacoesAddContribuinte;

      { Emitente }
      Emit.CNPJCPF := Sessao.Empresa.Cnpj;
      Emit.xNome := Sessao.Empresa.RazaoSocial;
      Emit.xFant := Sessao.Empresa.NomeFantasia;
      Emit.EnderEmit.xLgr := Sessao.Empresa.EnderecoPrincipal.Logradouro;
      Emit.EnderEmit.nro := Sessao.Empresa.EnderecoPrincipal.Numero;
      Emit.EnderEmit.xCpl := Sessao.Empresa.EnderecoPrincipal.Complemento;
      Emit.EnderEmit.xBairro := Sessao.Empresa.EnderecoPrincipal.Bairro;
      Emit.EnderEmit.cMun := Sessao.Empresa.CodigoIbgeCidade;
      Emit.EnderEmit.xMun := Sessao.Empresa.EnderecoPrincipal.Cidade;
      Emit.EnderEmit.Uf := Sessao.Empresa.EnderecoPrincipal.Uf;
      Emit.EnderEmit.Cep := StrToInt(Sessao.Empresa.EnderecoPrincipal.Cep);
      Emit.EnderEmit.cPais := 1058;
      Emit.EnderEmit.xPais := 'BRASIL';
      Emit.EnderEmit.Fone := Sessao.Empresa.EnderecoPrincipal.Fone;
      Emit.Ie := Sessao.Empresa.InscricaoEstadual;
      Emit.IM := Sessao.Empresa.InscricaoMunicipal;
      Emit.Crt := StrToCRT(OK, Sessao.Empresa.Crt);
      Emit.CNAE := Sessao.Empresa.CodigoCnaePrincipal;

      { Destinatario }
      Dest.CNPJCPF := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.CpfCnpj;
      Dest.xNome := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Nome;
      Dest.EnderDest.xLgr := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Logradouro;
      Dest.EnderDest.nro := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Numero;
      Dest.EnderDest.xCpl := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Complemento;
      Dest.EnderDest.xBairro := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Bairro;
      Dest.EnderDest.cMun := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.CodigoMunicipio;
      Dest.EnderDest.xMun := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.NomeMunicipio;
      Dest.EnderDest.Uf := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Uf;
      Dest.EnderDest.Cep := StrToInt(TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Cep);
      Dest.EnderDest.cPais := 1058;
      Dest.EnderDest.xPais := 'BRASIL';
      Dest.EnderDest.Fone := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Telefone;
      Dest.Ie := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.InscricaoEstadual;
      //Dest.ISUF := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Suframa.ToString;
      Dest.Email := TNfeCabecalhoVO(ObjetoVO).NfeDestinatarioVO.Email;


      { Grupo de informa��o das NF/NF-e referenciadas }

      { NF-e Referenciadas }
      if TNfeCabecalhoVO(ObjetoVO).ListaNfeReferenciadaVO.Count > 0 then
      begin
        for i := 0 to TNfeCabecalhoVO(ObjetoVO).ListaNfeReferenciadaVO.Count - 1 do
        begin
          Ide.NFref.Add;
          Ide.NFref.Items[i].refNFe := TNfeReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeReferenciadaVO.Items[i]).ChaveAcesso
        end;
      end;

      { NF 1/1A Referenciadas }
      if TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Count > 0 then
      begin
        for i := 0 to TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Count - 1 do
        begin
          Ide.NFref.Add;
          Ide.NFref.Items[i].RefNF.cUF := TNfeNfReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Items[i]).CodigoUf;
          Ide.NFref.Items[i].RefNF.AAMM := TNfeNfReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Items[i]).AnoMes;
          Ide.NFref.Items[i].RefNF.Cnpj := TNfeNfReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Items[i]).Cnpj;
          Ide.NFref.Items[i].RefNF.Modelo := StrToInt(TNfeNfReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Items[i]).Modelo);
          Ide.NFref.Items[i].RefNF.Serie := StrToInt(TNfeNfReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Items[i]).Serie);
          Ide.NFref.Items[i].RefNF.nNF := TNfeNfReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeNfReferenciadaVO.Items[i]).NumeroNf;
        end;
      end;

      { NF de produtor rural referenciada }
      if TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Count > 0 then
      begin
        for i := 0 to TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Count - 1 do
        begin
          Ide.NFref.Add;
          Ide.NFref.Items[i].refNFP.cUF := TNfeProdRuralReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Items[i]).CodigoUf;
          ide.NFref.Items[i].refNFP.AAMM := TNfeProdRuralReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Items[i]).AnoMes;
          ide.NFref.Items[i].refNFP.CNPJCPF := TNfeProdRuralReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Items[i]).Cnpj;
          ide.NFref.Items[i].refNFP.IE := TNfeProdRuralReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Items[i]).InscricaoEstadual;
          ide.NFref.Items[i].refNFP.modelo := TNfeProdRuralReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Items[i]).Modelo;
          ide.NFref.Items[i].refNFP.serie := StrToInt(TNfeProdRuralReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Items[i]).Serie);
          ide.NFref.Items[i].refNFP.nNF := TNfeProdRuralReferenciadaVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeProdRuralReferenciadaVO.Items[i]).NumeroNf;
        end;
      end;

      { CTF-e Referenciados }
      if TNfeCabecalhoVO(ObjetoVO).ListaNfeCteReferenciadoVO.Count > 0 then
      begin
        for i := 0 to TNfeCabecalhoVO(ObjetoVO).ListaNfeCteReferenciadoVO.Count - 1 do
        begin
          Ide.NFref.Add;
          Ide.NFref.Items[i].refCTe := TNfeCteReferenciadoVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeCteReferenciadoVO.Items[i]).ChaveAcesso
        end;
      end;

      { Cupom Fiscal Referenciados }
      if TNfeCabecalhoVO(ObjetoVO).ListaNfeCupomFiscalReferenciadoVO.Count > 0 then
      begin
        for i := 0 to TNfeCabecalhoVO(ObjetoVO).ListaNfeCupomFiscalReferenciadoVO.Count - 1 do
        begin
          Ide.NFref.Add;
          Ide.NFref.Items[i].RefECF.Modelo := StrToECFModRef(OK, TNfeCupomFiscalReferenciadoVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeCupomFiscalReferenciadoVO.Items[i]).ModeloDocumentoFiscal); // ['', '2B', '2C','2D'],[ECFModRefVazio, ECFModRef2B,ECFModRef2C,ECFModRef2D]
          Ide.NFref.Items[i].RefECF.nECF := IntToStr(TNfeCupomFiscalReferenciadoVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeCupomFiscalReferenciadoVO.Items[i]).NumeroOrdemEcf);
          Ide.NFref.Items[i].RefECF.nCOO := IntToStr(TNfeCupomFiscalReferenciadoVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeCupomFiscalReferenciadoVO.Items[i]).Coo);
        end;
      end;


      { Local Entrega }
      Entrega.CNPJCPF := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.CpfCnpj;
      Entrega.xLgr := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.Logradouro;
      Entrega.nro := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.Numero;
      Entrega.xCpl := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.Complemento;
      Entrega.xBairro := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.Bairro;
      Entrega.cMun := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.CodigoMunicipio;
      Entrega.xMun := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.NomeMunicipio;
      Entrega.Uf := TNfeCabecalhoVO(ObjetoVO).NFeLocalEntregaVO.Uf;


      { Local Retirada }
      Retirada.CNPJCPF := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.CpfCnpj;
      Retirada.xLgr := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.Logradouro;
      Retirada.nro := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.Numero;
      Retirada.xCpl := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.Complemento;
      Retirada.xBairro := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.Bairro;
      Retirada.cMun := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.CodigoMunicipio;
      Retirada.xMun := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.NomeMunicipio;
      Retirada.Uf := TNfeCabecalhoVO(ObjetoVO).NFeLocalRetiradaVO.Uf;

      { Transporte }
      if EditTransportadorId.Value > 0 then
      begin
        Transp.modFrete := TpcnModalidadeFrete(TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ModalidadeFrete); // ['0', '1', '2', '9'][mfContaEmitente, mfContaDestinatario, mfContaTerceiros, mfSemFrete]
        Transp.Transporta.CNPJCPF := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.CpfCnpj;
        Transp.Transporta.xNome := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.Nome;
        Transp.Transporta.Ie := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.InscricaoEstadual;
        Transp.Transporta.xEnder := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.EmpresaEndereco;
        Transp.Transporta.xMun := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.NomeMunicipio;
        Transp.Transporta.Uf := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.Uf;
        Transp.retTransp.vServ := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ValorServico;
        Transp.retTransp.vBCRet := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ValorBcRetencaoIcms;
        Transp.retTransp.pICMSRet := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.AliquotaRetencaoIcms;
        Transp.retTransp.vICMSRet := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ValorIcmsRetido;
        Transp.retTransp.Cfop := IntToStr(TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.Cfop);
        Transp.retTransp.cMunFG := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.Municipio;
        Transp.veicTransp.placa := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.PlacaVeiculo;
        Transp.veicTransp.Uf := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.UfVeiculo;
        Transp.veicTransp.RNTC := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.RntcVeiculo;
        Transp.vagao := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.Vagao;
        Transp.balsa := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.Balsa;

        for i := 0 to TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ListaNfeTransporteReboqueVO.Count - 1 do
        begin
          Transp.Reboque.Add;
          Transp.Reboque.Items[i].placa := TNfeTransporteReboqueVO(TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ListaNfeTransporteReboqueVO.Items[i]).Placa;
          Transp.Reboque.Items[i].Uf := TNfeTransporteReboqueVO(TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ListaNfeTransporteReboqueVO.Items[i]).Uf;
          Transp.Reboque.Items[i].RNTC := TNfeTransporteReboqueVO(TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ListaNfeTransporteReboqueVO.Items[i]).Rntc;
        end;

        for i := 0 to TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ListaNfeTransporteVolumeVO.Count - 1 do
        begin
          NfeTransporteVolumeVO := TNfeCabecalhoVO(ObjetoVO).NFeTransporteVO.ListaNfeTransporteVolumeVO.Items[i];
          Transp.Vol.Add;
          Transp.Vol.Items[i].qVol := NfeTransporteVolumeVO.Quantidade;
          Transp.Vol.Items[i].esp := NfeTransporteVolumeVO.Especie;
          Transp.Vol.Items[i].Marca := NfeTransporteVolumeVO.Marca;
          Transp.Vol.Items[i].nVol := NfeTransporteVolumeVO.Numeracao;
          Transp.Vol.Items[i].pesoL := NfeTransporteVolumeVO.PesoLiquido;
          Transp.Vol.Items[i].pesoB := NfeTransporteVolumeVO.PesoBruto;
          for j := 0 to NfeTransporteVolumeVO.ListaNfeTransporteVolumeLacreVO.Count - 1 do
          begin
            NfeTransporteVolumeLacreVO := NfeTransporteVolumeVO.ListaNfeTransporteVolumeLacreVO.Items[j];
            Transp.Vol.Items[i].Lacres.Add;
            Transp.Vol.Items[i].Lacres.Items[j].nLacre := NfeTransporteVolumeLacreVO.Numero;
          end;
        end;
      end;

      { Fatura }
      Cobr.Fat.nFat := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.Numero;
      Cobr.Fat.vOrig := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorOriginal;
      Cobr.Fat.vDesc := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorDesconto;
      Cobr.Fat.vLiq := TNfeCabecalhoVO(ObjetoVO).NfeFaturaVO.ValorLiquido;

      { Duplicatas }
      if TNfeCabecalhoVO(ObjetoVO).ListaNfeDuplicataVO.Count > 0 then
      begin
        for i := 0 to TNfeCabecalhoVO(ObjetoVO).ListaNfeDuplicataVO.Count - 1 do
        begin
          Cobr.Dup.Add;
          Cobr.Dup.Items[i].nDup := TNfeDuplicataVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDuplicataVO.Items[i]).Numero;
          Cobr.Dup.Items[i].dVenc := TNfeDuplicataVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDuplicataVO.Items[i]).DataVencimento;
          Cobr.Dup.Items[i].vDup := TNfeDuplicataVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDuplicataVO.Items[i]).Valor;
        end;
      end;


      { NFe Detalhe }
      for i := 0 to TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Count - 1 do
      begin
        with Det.Add do
        begin
          Prod.nItem := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NumeroItem;
          Prod.cProd := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).Gtin;
          Prod.cEAN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).Gtin;
          Prod.xProd := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NomeProduto;
          Prod.Ncm := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).Ncm;
          Prod.Cfop := IntToStr(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).Cfop);
          Prod.uCom := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).UnidadeComercial;
          Prod.qCom := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).QuantidadeComercial;
          Prod.vUnCom := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).ValorUnitarioComercial;
          Prod.vProd := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).ValorTotal;
          Prod.cEANTrib := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).GtinUnidadeTributavel;
          Prod.uTrib := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).UnidadeTributavel;
          Prod.qTrib := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).QuantidadeTributavel;
          Prod.vUnTrib := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).ValorUnitarioTributavel;
          Prod.vFrete := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).ValorFrete;
          Prod.vSeg := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).ValorSeguro;
          Prod.vDesc := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).ValorDesconto;
          Prod.vOutro := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).ValorOutrasDespesas;
          Prod.IndTot := TpcnIndicadorTotal(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).EntraTotal); // ['0', '1'], [itNaoSomaTotalNFe, itSomaTotalNFe]
          infAdProd := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).InformacoesAdicionais; // definir se vira do cadastro de produtos ou se sera digitada, por exemplo informa�ao de lotes

          { Detalhes -- Impostos }
          with Imposto do
          begin
            // Se houver CFOP cadastrado na Opera��o Fiscal, a nota � de servi�os
            if TributOperacaoFiscalVO.Cfop > 0 then
            begin
              with ISSQN do
              begin
                vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIssqnVO.BaseCalculoIssqn;
                vAliq := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIssqnVO.AliquotaIssqn;
                vISSQN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIssqnVO.ValorIssqn;
                cMunFG := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIssqnVO.MunicipioIssqn;
                //cListServ := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIssqnVO.ItemListaServicos;
                //cSitTrib := StrToISSQNcSitTrib(OK, TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIssqnVO.TributacaoIssqn);
              end;
            end
            else
            begin
              with ICMS do
              begin
                if Emit.Crt = crtSimplesNacional then
                begin
                  Csosn := StrToCSOSNIcms(OK, TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn);

                  // csosn 101
                  if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '101' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    pCredSN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaCreditoIcmsSn;
                    vCredICMSSN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorCreditoIcmsSn;
                  end

                  // csosn 102, 103, 300, 400
                  else if (TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '102')
                       or (TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '103')
                       or (TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '300')
                       or (TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '400') then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                  end

                  // csosn 201
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '201' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBCST := TpcnDeterminacaoBaseIcmsSt(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt); // (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta)
                    pMVAST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
                    pRedBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
                    vBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
                    pICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
                    vICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsSt;
                    pCredSN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaCreditoIcmsSn;
                    vCredICMSSN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorCreditoIcmsSn;
                  end

                  // csosn 202, 203
                  else if (TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '202')
                       or (TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '203') then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBCST := TpcnDeterminacaoBaseIcmsSt(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt); // (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta)
                    pMVAST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
                    pRedBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
                    vBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
                    pICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
                    vICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsSt;
                  end

                  // csosn 500
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '500' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    vBCSTRet := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBcIcmsStRetido;
                    vICMSSTRet := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsStRetido;
                  end

                  // csosn 900
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.Csosn = '900' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBC := TpcnDeterminacaoBaseIcms(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcms); // (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao)
                    vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
                    pRedBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.TaxaReducaoBcIcms;
                    pICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcms;
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                    modBCST := TpcnDeterminacaoBaseIcmsSt(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt); // (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta)
                    pMVAST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
                    pRedBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
                    vBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
                    pICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
                    vICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsSt;
                    pCredSN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaCreditoIcmsSn;
                    vCredICMSSN := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorCreditoIcmsSn;
                  end;
                end

                else
                begin
                  CST := StrToCSTIcms(OK, TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms);

                  // 00 Tributada integralmente
                  if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '00' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBC := TpcnDeterminacaoBaseIcms(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcms); // (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao)
                    vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
                    pICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcms;
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                  end

                  // 10 Tributada e com cobranca do ICMS por ST
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '10' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBC := TpcnDeterminacaoBaseIcms(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcms); // (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao)
                    vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
                    pICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcms;
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                    modBCST := TpcnDeterminacaoBaseIcmsSt(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt); // (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta)
                    pMVAST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
                    pRedBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
                    vBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
                    pICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
                    vICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsSt;
                  end

                  // 20 Tributada com reducao de base de calculo
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '20' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBC := TpcnDeterminacaoBaseIcms(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcms); // (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao)
                    pRedBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.TaxaReducaoBcIcms;
                    vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
                    pICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcms;
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                  end

                  // 30 Isenta ou nao tributada e com cobranca do ICMS por ST
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '30' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBCST := TpcnDeterminacaoBaseIcmsSt(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt); // (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta)
                    pMVAST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
                    pRedBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
                    vBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
                    pICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
                    vICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsSt;
                  end

                  // 40 Isenta
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '40' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                    motDesICMS:= mdiOutros;//(mdiTaxi, mdiDeficienteFisico, mdiProdutorAgropecuario, mdiFrotistaLocadora, mdiDiplomaticoConsular, mdiAmazoniaLivreComercio, mdiSuframa, mdiVendaOrgaosPublicos, mdiOutros )
                  end

                  // 41 Nao tributada
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '41' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    vICMS := TNFeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNFeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                    motDesICMS := mdiOutros;//(mdiTaxi, mdiDeficienteFisico, mdiProdutorAgropecuario, mdiFrotistaLocadora, mdiDiplomaticoConsular, mdiAmazoniaLivreComercio, mdiSuframa, mdiVendaOrgaosPublicos, mdiOutros )
                  end

                  // 50 Suspencao
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '50' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    vICMS := TNFeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNFeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                    motDesICMS:= mdiOutros;//(mdiTaxi, mdiDeficienteFisico, mdiProdutorAgropecuario, mdiFrotistaLocadora, mdiDiplomaticoConsular, mdiAmazoniaLivreComercio, mdiSuframa, mdiVendaOrgaosPublicos, mdiOutros )
                  end

                  // 51 Diferimento preenchimento do ICMS depende da UF
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '51' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBC := TpcnDeterminacaoBaseIcms(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcms); // (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao)
                    pRedBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.TaxaReducaoBcIcms;
                    vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
                    pICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcms;
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                  end

                  // 60 ICMS cobrado anteriormente por ST
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '60' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    vBCSTRet := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBcIcmsStRetido;
                    vICMSSTRet := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsStRetido;
                  end

                  // 70 ICMS com reducao de base de calculo e cobranca de ICMS por ST
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '70' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBC := TpcnDeterminacaoBaseIcms(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcms); // (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao)
                    pRedBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.TaxaReducaoBcIcms;
                    vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
                    pICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcms;
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                    modBCST := TpcnDeterminacaoBaseIcmsSt(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt); // (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta)
                    pMVAST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
                    pRedBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
                    vBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
                    pICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
                    vICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsSt;
                  end

                  // 90 Outros
                  else if TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.CstIcms = '90' then
                  begin
                    orig := TpcnOrigemMercadoria(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.OrigemMercadoria); // (oeNacional, oeEstrangeiraImportacaoDireta, oeEstrangeiraAdquiridaBrasil)
                    modBC := TpcnDeterminacaoBaseIcms(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcms); // (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao)
                    vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.BaseCalculoIcms;
                    pRedBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.TaxaReducaoBcIcms;
                    pICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcms;
                    vICMS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcms;
                    modBCST := TpcnDeterminacaoBaseIcmsSt(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ModalidadeBcIcmsSt); // (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta)
                    pMVAST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualMvaIcmsSt;
                    pRedBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.PercentualReducaoBcIcmsSt;
                    vBCST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorBaseCalculoIcmsSt;
                    pICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.AliquotaIcmsSt;
                    vICMSST := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIcmsVO.ValorIcmsSt;
                  end;
                  (*
                    Cabe a cada participante implementar o seguinte:
                    ICMSPart partilha do ICMS entre a UF de Origem e UF de Destino..
                    ICMSST Repasse de ICMS ST retido anteriormente em ope. interestadual...
                  *)
                end;
              end; // with ICMS do

              with IPI do
              begin
                CST := StrToCSTIPI(OK, TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIpiVO.CstIpi);
                vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIpiVO.ValorBaseCalculoIpi;
                pIPI := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIpiVO.AliquotaIpi;
                vIPI := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIpiVO.ValorIpi;
              end; // with IPI do

              with II do
              begin
                if Assigned(TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIiVO) then
                begin
                  vBc := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIiVO.ValorBcIi;
                  vDespAdu := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIiVO.ValorDespesasAduaneiras;
                  vII := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIiVO.ValorImpostoImportacao;
                  vIOF := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoIiVO.ValorIof;
                end;
              end;

              with PIS do
              begin
                CST := StrToCSTPIS(OK, TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoPisVO.CstPis);
                vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoPisVO.ValorBaseCalculoPis;
                if CST = pis01 then
                  pPIS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoPisVO.AliquotaPisPercentual;
                if CST = pis02 then
                  pPIS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoPisVO.AliquotaPisReais;
                vPIS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoPisVO.ValorPis;
              end; // with PIS do

              with COFINS do
              begin
                CST := StrToCSTCOFINS(OK, TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoCofinsVO.CstCofins);
                vBC := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoCofinsVO.BaseCalculoCofins;
                if CST = cof01 then
                  pCOFINS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoCofinsVO.AliquotaCofinsPercentual;
                if CST = cof02 then
                  pCOFINS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoCofinsVO.AliquotaCofinsReais;
                vCOFINS := TNfeDetalheVO(TNfeCabecalhoVO(ObjetoVO).ListaNfeDetalheVO.Items[i]).NfeDetalheImpostoCofinsVO.ValorCofins;
              end; // with COFINS do
            end; // if else sevi�o
          end; // with Imposto do
        end; // with Det.Add do
      end; // for i := 0 to ListaNFeDetalhe.Count - 1 do }
    end;

    try
      FDataModule.ACBrNFe.NotasFiscais.Assinar;
    except
      on E: Exception do
        Application.MessageBox(PChar('Ocorreu um erro ao tentar assinar a NF-e.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
    end;

    try
      FDataModule.ACBrNFe.NotasFiscais.Items[0].GravarXML;
      Mensagem := 'Arquivo gerado em: ' + FDataModule.ACBrNFe.NotasFiscais.Items[0].NomeArq;
      Application.MessageBox(PChar(Mensagem), 'Informa��o do Sistema', MB_OK + MB_ICONEXCLAMATION);
    except
      on E: Exception do
        Application.MessageBox(PChar('Ocorreu um erro ao salvar o arquivo XML da NF-e.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro ao gerar o arquivo XML da NF-e.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;
{$ENDREGION}

{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFNFe.EditDestinatarioIdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditDestinatarioId.Value <> 0 then
      Filtro := 'ID = ' + EditDestinatarioId.Text
    else
      Filtro := 'ID=0';

    try
      LimparCamposDestinatario;
      if not PopulaCamposTransientes(Filtro, TViewPessoaClienteVO, TViewPessoaClienteController) then
        PopulaCamposTransientesLookup(TViewPessoaClienteVO, TViewPessoaClienteController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditDestinatarioId.Text := CDSTransiente.FieldByName('ID').AsString;
        EditDestinatarioCpfCnpj.Text := CDSTransiente.FieldByName('CPF_CNPJ').AsString;
        EditDestinatarioRazao.Text := CDSTransiente.FieldByName('NOME').AsString;
        EditDestinatarioLogradouro.Text := CDSTransiente.FieldByName('LOGRADOURO').AsString;
        EditDestinatarioNumero.Text := CDSTransiente.FieldByName('NUMERO').AsString;
        EditDestinatarioComplemento.Text := CDSTransiente.FieldByName('COMPLEMENTO').AsString;
        EditDestinatarioBairro.Text := CDSTransiente.FieldByName('BAIRRO').AsString;
        EditDestinatarioCodigoIbge.Text := CDSTransiente.FieldByName('MUNICIPIO_IBGE').AsString;
        EditDestinatarioCidade.Text := CDSTransiente.FieldByName('CIDADE').AsString;
        EditDestinatarioUF.Text := CDSTransiente.FieldByName('UF').AsString;
        EditDestinatarioCEP.Text := CDSTransiente.FieldByName('CEP').AsString;
        EditDestinatarioTelefone.Text := CDSTransiente.FieldByName('FONE').AsString;
        EditDestinatarioEmail.Text := CDSTransiente.FieldByName('EMAIL').AsString;
        EditDestinatarioIE.Text := CDSTransiente.FieldByName('RG_IE').AsString;
      end
      else
      begin
        Exit;
        EditDestinatarioId.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFNFe.EditTransportadorIdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditTransportadorId.Value <> 0 then
      Filtro := 'ID = ' + EditTransportadorId.Text
    else
      Filtro := 'ID=0';

    try
      LimparCamposTransportadora;
      if not PopulaCamposTransientes(Filtro, TViewPessoaTransportadoraVO, TViewPessoaTransportadoraController) then
        PopulaCamposTransientesLookup(TViewPessoaTransportadoraVO, TViewPessoaTransportadoraController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditTransportadorId.Text := CDSTransiente.FieldByName('ID').AsString;
        EditTransportadorCpfCnpj.Text := CDSTransiente.FieldByName('CPF_CNPJ').AsString;
        EditTransportadorRazaoSocial.Text := CDSTransiente.FieldByName('NOME').AsString;
        EditTransportadorLogradouro.Text := CDSTransiente.FieldByName('LOGRADOURO').AsString;
        EditTransportadorCidade.Text := CDSTransiente.FieldByName('MUNICIPIO_IBGE').AsString;
        EditTransportadorUF.Text := CDSTransiente.FieldByName('UF').AsString;
      end
      else
      begin
        Exit;
        EditTransportadorId.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFNFe.EditIdOperacaoFiscalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdOperacaoFiscal.Value <> 0 then
      Filtro := 'ID = ' + EditIdOperacaoFiscal.Text
    else
      Filtro := 'ID=0';

    try
      EditIdOperacaoFiscal.Clear;
      EditOperacaoFiscal.Clear;
      if not PopulaCamposTransientes(Filtro, TTributOperacaoFiscalVO, TTributOperacaoFiscalController) then
        PopulaCamposTransientesLookup(TTributOperacaoFiscalVO, TTributOperacaoFiscalController);

      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdOperacaoFiscal.Text := CDSTransiente.FieldByName('ID').AsString;
        EditOperacaoFiscal.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
        EditNaturezaOperacao.Text := CDSTransiente.FieldByName('DESCRICAO_NA_NF').AsString;
        //
        TributOperacaoFiscalVO := TTributOperacaoFiscalVO.Create;
        TributOperacaoFiscalVO.Id := CDSTransiente.FieldByName('ID').AsInteger;
        TributOperacaoFiscalVO.Descricao := CDSTransiente.FieldByName('DESCRICAO').AsString;
        TributOperacaoFiscalVO.DescricaoNaNf := CDSTransiente.FieldByName('DESCRICAO_NA_NF').AsString;
        TributOperacaoFiscalVO.Cfop := CDSTransiente.FieldByName('CFOP').AsInteger;
        TributOperacaoFiscalVO.Observacao := CDSTransiente.FieldByName('OBSERVACAO').AsString;
      end
      else
      begin
        Exit;
        EditIdOperacaoFiscal.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFNFe.EditIdVendaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdVenda.Value <> 0 then
      Filtro := 'ID = ' + EditIdVenda.Text
    else
      Filtro := 'ID=0';

    try
      EditIdVenda.Clear;
      if not PopulaCamposTransientes(Filtro, TVendaCabecalhoVO, TVendaCabecalhoController) then
        PopulaCamposTransientesLookup(TVendaCabecalhoVO, TVendaCabecalhoController);

      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdVenda.Text := CDSTransiente.FieldByName('ID').AsString;
      end
      else
      begin
        Exit;
        EditIdVenda.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

end.
