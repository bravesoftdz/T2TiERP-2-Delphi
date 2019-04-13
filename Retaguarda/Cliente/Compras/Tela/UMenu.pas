{*******************************************************************************
Title: T2Ti ERP
Description: Unit vinculada � tela Menu da aplica��o

The MIT License

Copyright: Copyright (C) 2015 T2Ti.COM

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

@author Albert Eije (T2Ti.COM)
@version 2.0
*******************************************************************************}
unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, ImgList, JvExControls, JvComponent,
  JvPageList, JvTabBar, RibbonLunaStyleActnCtrls, Ribbon, ToolWin, ActnMan,
  ActnCtrls, ActnList, RibbonSilverStyleActnCtrls, JvExComCtrls, JvStatusBar,
  ActnMenus, RibbonActnMenus, JvOutlookBar, JvLookOut,  ScreenTips, WideStrings,
  DB, JvComponentBase, Atributos, Enter, XPMan, ShellApi, UBase, IndyPeerImpl,
  //
  ULogin, UCompraTipoRequisicao, UCompraRequisicao, UCompraTipoPedido,
  UCompraPedido, UCompraCotacao, UCompraConfirmaCotacao, UCompraMapaComparativo,
  UCriterioCompraSugerida, System.Actions;

type
  [TFormDescription('Menu','Menu')]
  TFMenu = class(TFBase)
    //actions
    (*
    OBS: O nome da Action deve ser igual ao nome do formul�rio sem o "TF".
    Exemplos:
              TFUnidadeProduto = ActionUnidadeProduto
              TFBanco = ActionBanco

    Deve ser dessa forma por conta do Controle de Acessos.
    *)
    [TComponentDescription('Acessar Janela',TFCompraTipoRequisicao)]
    ActionCompaTipoRequisicao: TAction;
    [TComponentDescription('Acessar Janela',TFCompraRequisicao)]
    ActionCompraRequisicao: TAction;
    [TComponentDescription('Acessar Janela',TFCompraCotacao)]
    ActionCompraCotacao: TAction;
    [TComponentDescription('Acessar Janela',TFCompraMapaComparativo)]
    ActionCompraMapaComparativo: TAction;
    [TComponentDescription('Acessar Janela',TFCriterioCompraSugerida)]
    ActionCriterioCompraSugerida: TAction;
    [TComponentDescription('Acessar Janela',TFCompraConfirmaCotacao)]
    ActionCompraConfirmaCotacao: TAction;
    [TComponentDescription('Acessar Janela',TFCompraPedido)]
    ActionCompraPedido: TAction;
    [TComponentDescription('Acessar Janela',TFCompraTipoPedido)]
    ActionCompraTipoPedido: TAction;
    ActionSair: TAction;
    //
    PopupMenu: TPopupMenu;
    menuFechar: TMenuItem;
    menuFecharTodasExcetoEssa: TMenuItem;
    menuSepararAba: TMenuItem;
    N2: TMenuItem;
    JvTabBar: TJvTabBar;
    JvModernTabBarPainter: TJvModernTabBarPainter;
    JvPageList: TJvPageList;
    Ribbon: TRibbon;
    RibbonPageSuprimentos: TRibbonPage;
    ActionManager: TActionManager;
    JvStatusBar1: TJvStatusBar;
    RibbonGrupoDiversos: TRibbonGroup;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    ScreenTipsManager1: TScreenTipsManager;
    MREnter: TMREnter;
    Image32: TImageList;
    Image16: TImageList;
    Image48: TImageList;
    RibbonGroupCompras: TRibbonGroup;
    procedure menuFecharClick(Sender: TObject);
    procedure menuFecharTodasExcetoEssaClick(Sender: TObject);
    procedure menuSepararAbaClick(Sender: TObject);
    procedure JvPageListChange(Sender: TObject);
    procedure JvTabBarTabClosing(Sender: TObject; Item: TJvTabBarItem; var AllowClose: Boolean);
    procedure ActionSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure JvTabBarTabMoved(Sender: TObject; Item: TJvTabBarItem);
    procedure JvTabBarTabSelected(Sender: TObject; Item: TJvTabBarItem);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    function doLogin: Boolean;

    function PodeAbrirFormulario(ClasseForm: TFormClass; var Pagina: TJvCustomPage): Boolean;
    function TotalFormsAbertos(ClasseForm: TFormClass): Integer;
    procedure AjustarCaptionAbas(ClasseForm: TFormClass);
    function ObterAba(Pagina: TJvCustomPage): TJvTabBarItem;
    function ObterPagina(Aba: TJvTabBarItem): TJvCustomPage;
    procedure ActionCompaTipoRequisicaoExecute(Sender: TObject);
    procedure ActionCompraRequisicaoExecute(Sender: TObject);
    procedure ActionCompraTipoPedidoExecute(Sender: TObject);
    procedure ActionCompraPedidoExecute(Sender: TObject);
    procedure ActionCompraCotacaoExecute(Sender: TObject);
    procedure ActionCompraConfirmaCotacaoExecute(Sender: TObject);
    procedure ActionCompraMapaComparativoExecute(Sender: TObject);
    procedure ActionCriterioCompraSugeridaExecute(Sender: TObject);
   public
    procedure NovaPagina(ClasseForm: TFormClass; IndiceImagem: Integer);
    function FecharPagina(Pagina: TJvCustomPage): Boolean; overload;
    function FecharPagina(Pagina: TJvCustomPage; TodasExcetoEssa: Boolean): Boolean; overload;
    function FecharPaginas: Boolean;
    procedure SepararAba(Pagina: TJvCustomPage);

  end;

var
  FMenu: TFMenu;
  FormAtivo: String;

implementation

uses SessaoUsuario;

{$R *.dfm}

var
  IdxTabSelected: Integer = -1;

{$Region 'Infra'}
procedure TFMenu.NovaPagina(ClasseForm: TFormClass;  IndiceImagem: Integer);
var
  Aba    : TJvTabBarItem;
  Pagina : TJvCustomPage;
  Form   : TForm;
begin

  //verifica se pode abrir o form
  if not PodeAbrirFormulario(ClasseForm, Pagina) then
  begin
    JvPageList.ActivePage := Pagina;
    Exit;
  end;

  //cria uma nova aba
  Aba := JvTabBar.AddTab('');

  //instancia uma p�gina padr�o
  Pagina := TJvStandardPage.Create(Self);

  //seta a PageList da nova p�gina para aquela que j� est� no form principal
  Pagina.PageList := JvPageList;

  //cria um form passando a p�gina para o seu construtor, que recebe um TComponent
  Form := ClasseForm.Create(Pagina);

  //Propriedades do Form
  with Form do
  begin
    Align       := alClient;
    BorderStyle := bsNone;
    Parent      := Pagina;
  end;

  //Propriedades da Aba
  with Aba do
  begin
    Caption := Form.Caption;
    ImageIndex := IndiceImagem;
    PopupMenu := Self.PopupMenu;
  end;

  //ajusta o t�tulo (caption) das abas
  AjustarCaptionAbas(ClasseForm);

  //ativa a p�gina
  JvPageList.ActivePage := Pagina;

  FormAtivo := Form.Name;

  //exibe o formul�rio
  Form.Show;
end;

function TFMenu.PodeAbrirFormulario(ClasseForm: TFormClass; var Pagina: TJvCustomPage): Boolean;
var
  I: Integer;
begin
  Result := True;
  //varre a JvPageList para saber se j� existe um Form aberto
  for I := 0 to JvPageList.PageCount - 1 do
    //se achou um form
    if JvPageList.Pages[I].Components[0].ClassType = ClasseForm then
    begin
      Pagina := JvPageList.Pages[I];
      //permite abrir o form novamente caso a Tag tenha o valor zero
      Result := (Pagina.Components[0] as TForm).Tag = 0;
      Break;
    end;
end;

//verifica o total de formul�rios abertos
function TFMenu.TotalFormsAbertos(ClasseForm: TFormClass): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to JvPageList.PageCount - 1 do
  begin
    if JvPageList.Pages[I].Components[0].ClassType = ClasseForm then
      Inc(Result);
  end;
end;

//ajusta o t�tulo (caption) das abas
procedure TFMenu.AjustarCaptionAbas(ClasseForm: TFormClass);
var
  I, Indice, TotalForms: Integer;
  NovoCaption: string;
begin
  TotalForms := TotalFormsAbertos(ClasseForm);

  if TotalForms > 1 then
  begin
    Indice := 1;
    for I := 0 to JvPageList.PageCount - 1 do
    begin
      with JvPageList do
      begin
        if Pages[I].Components[0].ClassType = ClasseForm then
        begin
          NovoCaption := (Pages[I].Components[0] as TForm).Caption + ' (' + IntToStr(Indice) + ')';
          (Pages[I] as TJvStandardPage).Caption := NovoCaption;
          ObterAba(Pages[I]).Caption := NovoCaption;
          Inc(Indice);
        end;
      end;
    end;
  end;
end;

function TFMenu.doLogin: Boolean;
var
  FormLogin: TFLogin;
begin
  FormLogin := TFLogin.Create(Self);
  try
    FormLogin.ShowModal;
    Result := FormLogin.Logado;
  finally
    FormLogin.Free;
  end;
end;

//controla o fechamento da p�gina
function TFMenu.FecharPagina(Pagina: TJvCustomPage): Boolean;
var
  Form: TForm;
  PaginaEsquerda: TJvCustomPage;
begin
  PaginaEsquerda := nil;
  Form := Pagina.Components[0] as TForm;

  Result := Form.CloseQuery;

  if Result then
  begin
    if Pagina.PageIndex > 0 then
    begin
      PaginaEsquerda := JvPageList.Pages[Pagina.PageIndex - 1];
    end;

    Form.Close;
    ObterAba(Pagina).Free;
    Pagina.Free;

    JvPageList.ActivePage := PaginaEsquerda;
  end;
end;

//controla o fechamento da p�gina - todas exceto a selecionada
function TFMenu.FecharPagina(Pagina: TJvCustomPage; TodasExcetoEssa: Boolean): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := JvPageList.PageCount - 1 downto 0 do
    if JvPageList.Pages[I] <> Pagina then
    begin
      Result := FecharPagina(JvPageList.Pages[I]);
      if not Result then
        Exit;
    end;
end;

function TFMenu.FecharPaginas: Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := JvPageList.PageCount - 1 downto 0 do
  begin
    Result := FecharPagina(JvPageList.Pages[I]);
    if not Result then
      Exit;
  end;
end;

procedure TFMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja Realmente Sair?', 'Sair do Sistema', MB_YesNo + MB_IconQuestion) <> IdYes then
    Application.Run;

  Sessao.Free;

  FecharPaginas;
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
  if not doLogin then
    Application.Terminate
  else
    inherited;
end;

procedure TFMenu.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (shift=[ssCtrl]) and (key=VK_TAB) then
  begin
    JvPageList.NextPage;
  end;

  if (shift=[ssShift]) and (key=VK_TAB) then
  begin
    JvPageList.PrevPage;
  end;
end;

//separa a aba (formul�rio)
procedure TFMenu.SepararAba(Pagina: TJvCustomPage);
begin
  with Pagina.Components[0] as TForm do
  begin
    Align       := alNone;
    BorderStyle := bsSizeable;
    Left := (((JvPageList.Width )- Width) div 2)+JvPageList.Left;
    Top := (((JvPageList.ClientHeight)-Height) div 2 )+(JvPageList.Top)-18;
    Parent      := nil;
  end;
  ObterAba(Pagina).Visible := False;
end;

function TFMenu.ObterAba(Pagina: TJvCustomPage): TJvTabBarItem;
var
  Form: TForm;
begin
  Result := nil;

  Form := Pagina.Components[0] as TForm;

  FormAtivo := Form.Name;

  if Assigned(Pagina) then
    Result := JvTabBar.Tabs[Pagina.PageIndex];

  //for�a o foco no form
  Form.Hide;
  Form.Show;
end;

procedure TFMenu.JvPageListChange(Sender: TObject);
begin
  ObterAba(JvPageList.ActivePage).Selected := True;
end;

procedure TFMenu.JvTabBarTabClosing(Sender: TObject; Item: TJvTabBarItem;
  var AllowClose: Boolean);
begin
  AllowClose := FecharPagina(ObterPagina(Item));
end;

procedure TFMenu.JvTabBarTabMoved(Sender: TObject; Item: TJvTabBarItem);
begin
  if IdxTabSelected >= 0 then
  begin
    JvPageList.Pages[IdxTabSelected].PageIndex := Item.Index;
  end;
end;

procedure TFMenu.JvTabBarTabSelected(Sender: TObject; Item: TJvTabBarItem);
begin
  if Assigned(Item) then
    IdxTabSelected := Item.Index
  else
    IdxTabSelected := -1;
end;

function TFMenu.ObterPagina(Aba: TJvTabBarItem): TJvCustomPage;
begin
  Result := JvPageList.Pages[Aba.Index];
end;
{$EndRegion}

{$Region 'Actions'}
procedure TFMenu.ActionCriterioCompraSugeridaExecute(Sender: TObject);
begin
  Application.CreateForm(TFCriterioCompraSugerida, FCriterioCompraSugerida);
  FCriterioCompraSugerida.ShowModal;
end;

procedure TFMenu.ActionCompraTipoPedidoExecute(Sender: TObject);
begin
  NovaPagina(TFCompraTipoPedido, (Sender as TAction).ImageIndex);
end;

procedure TFMenu.ActionCompraConfirmaCotacaoExecute(Sender: TObject);
begin
  NovaPagina(TFCompraConfirmaCotacao, (Sender as TAction).ImageIndex);
end;

procedure TFMenu.ActionCompraCotacaoExecute(Sender: TObject);
begin
  NovaPagina(TFCompraCotacao, (Sender as TAction).ImageIndex);
end;

procedure TFMenu.ActionCompraMapaComparativoExecute(Sender: TObject);
begin
  NovaPagina(TFCompraMapaComparativo, (Sender as TAction).ImageIndex);
end;

procedure TFMenu.ActionCompraPedidoExecute(Sender: TObject);
begin
  NovaPagina(TFCompraPedido, (Sender as TAction).ImageIndex);
end;

procedure TFMenu.ActionCompraRequisicaoExecute(Sender: TObject);
begin
  NovaPagina(TFCompraRequisicao, (Sender as TAction).ImageIndex);
end;

procedure TFMenu.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMenu.ActionCompaTipoRequisicaoExecute(Sender: TObject);
begin
  NovaPagina(TFCompraTipoRequisicao, (Sender as TAction).ImageIndex);
end;

{$EndRegion}

{$Region 'PopupMenu'}
procedure TFMenu.menuFecharClick(Sender: TObject);
begin
  FecharPagina(JvPageList.ActivePage);
end;

procedure TFMenu.menuFecharTodasExcetoEssaClick(Sender: TObject);
begin
  FecharPagina(JvPageList.ActivePage, True);
end;

procedure TFMenu.menuSepararAbaClick(Sender: TObject);
begin
  SepararAba(JvPageList.ActivePage);
end;
{$EndRegion}

end.
