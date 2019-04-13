// Pesquisa = Compra
unit DatabaseDelayedSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, DB, uniBasicGrid, uniDBGrid, uniEdit,
  uniLabel, uniGUIBaseClasses, uniPanel, MainModule, ServerModule, DBClient,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, uniButton, uniBitBtn,
  uniSpeedButton, Main;

type
  TUniDatabaseDelayedSearch = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniDBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    SQLTable1: TSQLTable;
    SQLTable1ID: TIntegerField;
    SQLTable1ID_TRIBUT_ICMS_CUSTOM_CAB: TIntegerField;
    SQLTable1ID_UNIDADE_PRODUTO: TIntegerField;
    SQLTable1ID_ALMOXARIFADO: TIntegerField;
    SQLTable1ID_GRUPO_TRIBUTARIO: TIntegerField;
    SQLTable1ID_MARCA_PRODUTO: TIntegerField;
    SQLTable1ID_SUBGRUPO: TIntegerField;
    SQLTable1GTIN: TStringField;
    SQLTable1CODIGO_INTERNO: TStringField;
    SQLTable1NCM: TStringField;
    SQLTable1NOME: TStringField;
    SQLTable1DESCRICAO: TMemoField;
    SQLTable1DESCRICAO_PDV: TStringField;
    SQLTable1VALOR_COMPRA: TFMTBCDField;
    SQLTable1VALOR_VENDA: TFMTBCDField;
    SQLTable1PRECO_VENDA_MINIMO: TFMTBCDField;
    SQLTable1PRECO_SUGERIDO: TFMTBCDField;
    SQLTable1CUSTO_UNITARIO: TFMTBCDField;
    SQLTable1CUSTO_PRODUCAO: TFMTBCDField;
    SQLTable1CUSTO_MEDIO_LIQUIDO: TFMTBCDField;
    SQLTable1PRECO_LUCRO_ZERO: TFMTBCDField;
    SQLTable1PRECO_LUCRO_MINIMO: TFMTBCDField;
    SQLTable1PRECO_LUCRO_MAXIMO: TFMTBCDField;
    SQLTable1MARKUP: TFMTBCDField;
    SQLTable1QUANTIDADE_ESTOQUE: TFMTBCDField;
    SQLTable1QUANTIDADE_ESTOQUE_ANTERIOR: TFMTBCDField;
    SQLTable1ESTOQUE_MINIMO: TFMTBCDField;
    SQLTable1ESTOQUE_MAXIMO: TFMTBCDField;
    SQLTable1ESTOQUE_IDEAL: TFMTBCDField;
    SQLTable1EXCLUIDO: TStringField;
    SQLTable1INATIVO: TStringField;
    SQLTable1DATA_CADASTRO: TDateField;
    SQLTable1IMAGEM: TMemoField;
    SQLTable1EX_TIPI: TStringField;
    SQLTable1CODIGO_LST: TStringField;
    SQLTable1CLASSE_ABC: TStringField;
    SQLTable1IAT: TStringField;
    SQLTable1IPPT: TStringField;
    SQLTable1TIPO_ITEM_SPED: TStringField;
    SQLTable1PESO: TFMTBCDField;
    SQLTable1PORCENTO_COMISSAO: TFMTBCDField;
    SQLTable1PONTO_PEDIDO: TFMTBCDField;
    SQLTable1LOTE_ECONOMICO_COMPRA: TFMTBCDField;
    SQLTable1ALIQUOTA_ICMS_PAF: TFMTBCDField;
    SQLTable1ALIQUOTA_ISSQN_PAF: TFMTBCDField;
    SQLTable1TOTALIZADOR_PARCIAL: TStringField;
    SQLTable1CODIGO_BALANCA: TIntegerField;
    SQLTable1DATA_ALTERACAO: TDateField;
    SQLTable1TIPO: TStringField;
    SQLTable1SERVICO: TStringField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1ID_TRIBUT_ICMS_CUSTOM_CAB: TIntegerField;
    ClientDataSet1ID_UNIDADE_PRODUTO: TIntegerField;
    ClientDataSet1ID_ALMOXARIFADO: TIntegerField;
    ClientDataSet1ID_GRUPO_TRIBUTARIO: TIntegerField;
    ClientDataSet1ID_MARCA_PRODUTO: TIntegerField;
    ClientDataSet1ID_SUBGRUPO: TIntegerField;
    ClientDataSet1GTIN: TStringField;
    ClientDataSet1CODIGO_INTERNO: TStringField;
    ClientDataSet1NCM: TStringField;
    ClientDataSet1NOME: TStringField;
    ClientDataSet1DESCRICAO: TMemoField;
    ClientDataSet1DESCRICAO_PDV: TStringField;
    ClientDataSet1VALOR_COMPRA: TFMTBCDField;
    ClientDataSet1VALOR_VENDA: TFMTBCDField;
    ClientDataSet1PRECO_VENDA_MINIMO: TFMTBCDField;
    ClientDataSet1PRECO_SUGERIDO: TFMTBCDField;
    ClientDataSet1CUSTO_UNITARIO: TFMTBCDField;
    ClientDataSet1CUSTO_PRODUCAO: TFMTBCDField;
    ClientDataSet1CUSTO_MEDIO_LIQUIDO: TFMTBCDField;
    ClientDataSet1PRECO_LUCRO_ZERO: TFMTBCDField;
    ClientDataSet1PRECO_LUCRO_MINIMO: TFMTBCDField;
    ClientDataSet1PRECO_LUCRO_MAXIMO: TFMTBCDField;
    ClientDataSet1MARKUP: TFMTBCDField;
    ClientDataSet1QUANTIDADE_ESTOQUE: TFMTBCDField;
    ClientDataSet1QUANTIDADE_ESTOQUE_ANTERIOR: TFMTBCDField;
    ClientDataSet1ESTOQUE_MINIMO: TFMTBCDField;
    ClientDataSet1ESTOQUE_MAXIMO: TFMTBCDField;
    ClientDataSet1ESTOQUE_IDEAL: TFMTBCDField;
    ClientDataSet1EXCLUIDO: TStringField;
    ClientDataSet1INATIVO: TStringField;
    ClientDataSet1DATA_CADASTRO: TDateField;
    ClientDataSet1IMAGEM: TMemoField;
    ClientDataSet1EX_TIPI: TStringField;
    ClientDataSet1CODIGO_LST: TStringField;
    ClientDataSet1CLASSE_ABC: TStringField;
    ClientDataSet1IAT: TStringField;
    ClientDataSet1IPPT: TStringField;
    ClientDataSet1TIPO_ITEM_SPED: TStringField;
    ClientDataSet1PESO: TFMTBCDField;
    ClientDataSet1PORCENTO_COMISSAO: TFMTBCDField;
    ClientDataSet1PONTO_PEDIDO: TFMTBCDField;
    ClientDataSet1LOTE_ECONOMICO_COMPRA: TFMTBCDField;
    ClientDataSet1ALIQUOTA_ICMS_PAF: TFMTBCDField;
    ClientDataSet1ALIQUOTA_ISSQN_PAF: TFMTBCDField;
    ClientDataSet1TOTALIZADOR_PARCIAL: TStringField;
    ClientDataSet1CODIGO_BALANCA: TIntegerField;
    ClientDataSet1DATA_ALTERACAO: TDateField;
    ClientDataSet1TIPO: TStringField;
    ClientDataSet1SERVICO: TStringField;
    UniLabel2: TUniLabel;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    procedure UniEdit1Change(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIForm, umain,
  NavigationUnit1;

{$R *.dfm}

procedure TUniDatabaseDelayedSearch.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
  UniLabel2.Caption := 'R$ ' + formatfloat('###,###.00', ClientDataSet1.FieldByName('VALOR_VENDA').AsFloat);
end;

procedure TUniDatabaseDelayedSearch.UniEdit1Change(Sender: TObject);
begin
  ClientDataSet1.Filter:='NOME LIKE ''%'+UniEdit1.Text+'%'' or DESCRICAO LIKE ''%'+UniEdit1.Text+'%''';
end;

procedure TUniDatabaseDelayedSearch.UniFrameCreate(Sender: TObject);
begin
  SQLTable1.Active := True;
  ClientDataSet1.Active := True;

  ClientDataSet1.FilterOptions := [foCaseInsensitive];
  ClientDataSet1.Filtered := True;

  (OwnerForm as TUniForm).ActiveControl := UniEdit1;
end;

procedure TUniDatabaseDelayedSearch.UniSpeedButton1Click(Sender: TObject);
begin
  /// EXERCICIO
  ///  Caso o usu�rio selecione um item que j� est� no carrinho, incremente a quantidade
  inc(MainForm.Item);
  MainForm.CDSCarrinho.Append;
  MainForm.CDSCarrinho.FieldByName('ID').AsInteger := MainForm.Item;
  MainForm.CDSCarrinho.FieldByName('GTIN').AsString := ClientDataSet1.FieldByName('GTIN').AsString;
  MainForm.CDSCarrinho.FieldByName('NOME').AsString := ClientDataSet1.FieldByName('NOME').AsString;
  MainForm.CDSCarrinho.FieldByName('QUANTIDADE').AsFloat := 1;
  MainForm.CDSCarrinho.FieldByName('VALOR').AsFloat := ClientDataSet1.FieldByName('VALOR_VENDA').AsFloat;
  MainForm.CDSCarrinho.Post;
  ShowMessage('Item Adicionado ao Carrinho com Sucesso!');
end;

procedure TUniDatabaseDelayedSearch.UniSpeedButton2Click(Sender: TObject);
begin
  UniNavigationUnit1Form.Show();
end;

initialization
  RegisterClass(TUniDatabaseDelayedSearch);

end.
