// Carrinho = Compra
unit CompraCarrinho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, DB, uniBasicGrid, uniDBGrid, uniEdit,
  uniLabel, uniGUIBaseClasses, uniPanel, MainModule, ServerModule, DBClient,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, uniButton, uniBitBtn,
  uniSpeedButton, uniDBNavigator, uniDBText, uniThreadTimer, uniTimer, uniImage,
  Main, Vcl.Imaging.pngimage, CloudBase, CloudBaseWin, CloudCustomPayPal,
  CloudPayPal;

type
  TUniCompraCarrinho = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    UniLabel2: TUniLabel;
    UniDBNavigator1: TUniDBNavigator;
    UniTimer1: TUniTimer;
    AdvPayPal1: TAdvPayPal;
    UniSpeedButton1: TUniSpeedButton;
    procedure UniTimer1Timer(Sender: TObject);
    procedure AdvPayPal1PaymentCancelled(Sender: TObject);
    procedure AdvPayPal1PaymentFailed(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIForm;

{$R *.dfm}
{$I APPIDS.INC}

procedure TUniCompraCarrinho.AdvPayPal1PaymentCancelled(Sender: TObject);
begin
  ShowMessage('Pagamento Cancelado pelo Usu�rio.');
end;

procedure TUniCompraCarrinho.AdvPayPal1PaymentFailed(Sender: TObject);
begin
  ShowMessage('Erro no Processamento: ' + #13 + AdvPayPal1.PaymentError.ErrorMessage);
end;

procedure TUniCompraCarrinho.UniFrameCreate(Sender: TObject);
begin
  AdvPayPal1.App.Key := PayPalAppKey;
  AdvPayPal1.App.Secret := PayPalAppSecret;
end;

procedure TUniCompraCarrinho.UniTimer1Timer(Sender: TObject);
begin
  UniLabel2.Caption := 'R$ ' + MainForm.CDSCarrinho.FieldByName('TOTAL').AsString;
end;

procedure TUniCompraCarrinho.UniSpeedButton1Click(Sender: TObject);
var
  pi: TPayPalItem;
begin
  Screen.Cursor := crHourGlass;

  // Moeda selecionada
  AdvPayPal1.Transaction.Currency := pcBRL;

  // Valor do seguro
  AdvPayPal1.Transaction.Insurance := 5;

  // Valor do frete
  AdvPayPal1.Transaction.Shipping := 5;

  AdvPayPal1.Transaction.Items.Clear;

  MainForm.CDSCarrinho.DisableControls;
  MainForm.CDSCarrinho.First;
  while not MainForm.CDSCarrinho.Eof do
  begin
    pi := AdvPayPal1.Transaction.Items.Add;
    pi.Price := MainForm.CDSCarrinho.FieldByName('VALOR').AsFloat;
    pi.Name := MainForm.CDSCarrinho.FieldByName('NOME').AsString;
    pi.Description := MainForm.CDSCarrinho.FieldByName('NOME').AsString;
    pi.Quantity := MainForm.CDSCarrinho.FieldByName('QUANTIDADE').AsInteger;

    MainForm.CDSCarrinho.Next;
  end;
  MainForm.CDSCarrinho.First;
  MainForm.CDSCarrinho.EnableControls;

  AdvPayPal1.DoPayment;
end;

initialization
  RegisterClass(TUniCompraCarrinho);

end.
