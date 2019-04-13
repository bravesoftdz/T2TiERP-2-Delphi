{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado � tabela [NFCE_CONFIGURACAO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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

@author Albert Eije (t2ti.com@gmail.com)
@version 1.0
*******************************************************************************}
unit NfceConfiguracaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, NfceResolucaoVO,
  NfceCaixaVO, EmpresaVO, NfceConfiguracaoBalancaVO,
  NfceConfiguracaoLeitorSerVO,


  Biblioteca;

type
  [TEntity]
  [TTable('NFCE_CONFIGURACAO')]
  TNfceConfiguracaoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_NFCE_CAIXA: Integer;
    FID_NFCE_RESOLUCAO: Integer;
    FMENSAGEM_CUPOM: String;
    FTITULO_TELA_CAIXA: String;
    FCAMINHO_IMAGENS_PRODUTOS: String;
    FCAMINHO_IMAGENS_MARKETING: String;
    FCAMINHO_IMAGENS_LAYOUT: String;
    FCOR_JANELAS_INTERNAS: String;
    FMARKETING_ATIVO: String;
    FCFOP: Integer;
    FDECIMAIS_QUANTIDADE: Integer;
    FDECIMAIS_VALOR: Integer;
    FQUANTIDADE_MAXIMA_PARCELA: Integer;
    FIMPRIME_PARCELA: String;

    FNfceResolucaoVO: TNfceResolucaoVO;
    FNfceCaixaVO: TNfceCaixaVO;
    FEmpresaVO: TEmpresaVO;
    FNfceConfiguracaoBalancaVO: TNfceConfiguracaoBalancaVO;
    FNfceConfiguracaoLeitorSerVO: TNfceConfiguracaoLeitorSerVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_NFCE_CAIXA', 'Id Nfce Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfceCaixa: Integer  read FID_NFCE_CAIXA write FID_NFCE_CAIXA;
    [TColumn('ID_NFCE_RESOLUCAO', 'Id Nfce Resolucao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfceResolucao: Integer  read FID_NFCE_RESOLUCAO write FID_NFCE_RESOLUCAO;
    [TColumn('MENSAGEM_CUPOM', 'Mensagem Cupom', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property MensagemCupom: String  read FMENSAGEM_CUPOM write FMENSAGEM_CUPOM;
    [TColumn('TITULO_TELA_CAIXA', 'Titulo Tela Caixa', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property TituloTelaCaixa: String  read FTITULO_TELA_CAIXA write FTITULO_TELA_CAIXA;
    [TColumn('CAMINHO_IMAGENS_PRODUTOS', 'Caminho Imagens Produtos', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoImagensProdutos: String  read FCAMINHO_IMAGENS_PRODUTOS write FCAMINHO_IMAGENS_PRODUTOS;
    [TColumn('CAMINHO_IMAGENS_MARKETING', 'Caminho Imagens Marketing', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoImagensMarketing: String  read FCAMINHO_IMAGENS_MARKETING write FCAMINHO_IMAGENS_MARKETING;
    [TColumn('CAMINHO_IMAGENS_LAYOUT', 'Caminho Imagens Layout', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoImagensLayout: String  read FCAMINHO_IMAGENS_LAYOUT write FCAMINHO_IMAGENS_LAYOUT;
    [TColumn('COR_JANELAS_INTERNAS', 'Cor Janelas Internas', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property CorJanelasInternas: String  read FCOR_JANELAS_INTERNAS write FCOR_JANELAS_INTERNAS;
    [TColumn('MARKETING_ATIVO', 'Marketing Ativo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property MarketingAtivo: String  read FMARKETING_ATIVO write FMARKETING_ATIVO;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('DECIMAIS_QUANTIDADE', 'Decimais Quantidade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DecimaisQuantidade: Integer  read FDECIMAIS_QUANTIDADE write FDECIMAIS_QUANTIDADE;
    [TColumn('DECIMAIS_VALOR', 'Decimais Valor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DecimaisValor: Integer  read FDECIMAIS_VALOR write FDECIMAIS_VALOR;
    [TColumn('QUANTIDADE_MAXIMA_PARCELA', 'Quantidade Maxima Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeMaximaParcela: Integer  read FQUANTIDADE_MAXIMA_PARCELA write FQUANTIDADE_MAXIMA_PARCELA;
    [TColumn('IMPRIME_PARCELA', 'Imprime Parcela', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ImprimeParcela: String  read FIMPRIME_PARCELA write FIMPRIME_PARCELA;

    [TAssociation('ID', 'ID_NFCE_RESOLUCAO')]
    property NfceResolucaoVO: TNfceResolucaoVO read FNfceResolucaoVO write FNfceResolucaoVO;

    [TAssociation('ID', 'ID_NFCE_CAIXA')]
    property NfceCaixaVO: TNfceCaixaVO read FNfceCaixaVO write FNfceCaixaVO;

    [TAssociation('ID', 'ID_EMPRESA')]
    property EmpresaVO: TEmpresaVO read FEmpresaVO write FEmpresaVO;

    [TAssociation('ID_NFCE_CONFIGURACAO', 'ID')]
    property NfceConfiguracaoBalancaVO: TNfceConfiguracaoBalancaVO read FNfceConfiguracaoBalancaVO write FNfceConfiguracaoBalancaVO;

    [TAssociation('ID_NFCE_CONFIGURACAO', 'ID')]
    property NfceConfiguracaoLeitorSerVO: TNfceConfiguracaoLeitorSerVO read FNfceConfiguracaoLeitorSerVO write FNfceConfiguracaoLeitorSerVO;

  end;

implementation

constructor TNfceConfiguracaoVO.Create;
begin
  inherited;

  FNfceResolucaoVO := TNfceResolucaoVO.Create;
  FNfceCaixaVO := TNfceCaixaVO.Create;
  FEmpresaVO := TEmpresaVO.Create;
  FNfceConfiguracaoBalancaVO := TNfceConfiguracaoBalancaVO.Create;
  FNfceConfiguracaoLeitorSerVO := TNfceConfiguracaoLeitorSerVO.Create;
end;

destructor TNfceConfiguracaoVO.Destroy;
begin
  FreeAndNil(FNfceResolucaoVO);
  FreeAndNil(FNfceCaixaVO);
  FreeAndNil(FEmpresaVO);
  FreeAndNil(FNfceConfiguracaoBalancaVO);
  FreeAndNil(FNfceConfiguracaoLeitorSerVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TNfceConfiguracaoVO);

finalization
  Classes.UnRegisterClass(TNfceConfiguracaoVO);


end.
