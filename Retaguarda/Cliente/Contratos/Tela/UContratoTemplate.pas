{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Cadastro dos Templates de Contrato - M�dulo Gest�o de Contratos

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
t2ti.com@gmail.com

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UContratoTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits, PlatformDefaultStyleActnCtrls,
  ActnList, ActnMan, ToolWin, ActnCtrls, OleCtnrs, System.Actions, Controller;

type
  [TFormDescription(TConstantes.MODULO_CONTRATOS, 'Templates')]

  TFContratoTemplate = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditNome: TLabeledEdit;
    MemoDescricao: TLabeledMemo;
    ActionManager1: TActionManager;
    ActionToolBar1: TActionToolBar;
    ActionEditarArquivo: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionEditarArquivoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure DeletarArquivoTemporario;
    procedure UploadArquivo;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
    procedure ControlaPopupMenu; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FContratoTemplate: TFContratoTemplate;

implementation

uses ContratoTemplateController, ContratoTemplateVo, NotificationService,
  UDataModule, UDocumentoWord;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFContratoTemplate.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContratoTemplateVO;
  ObjetoController := TContratoTemplateController.Create;
  DeletarArquivoTemporario;
  inherited;
end;

procedure TFContratoTemplate.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFContratoTemplate.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContratoTemplate.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    DeletarArquivoTemporario;
    EditNome.SetFocus;
  end;
end;

function TFContratoTemplate.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFContratoTemplate.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('ContratoTemplateController.TContratoTemplateController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('ContratoTemplateController.TContratoTemplateController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFContratoTemplate.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TContratoTemplateVO.Create;

      TContratoTemplateVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TContratoTemplateVO(ObjetoVO).Nome := EditNome.Text;
      TContratoTemplateVO(ObjetoVO).Descricao := MemoDescricao.Text;

      UploadArquivo;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('ContratoTemplateController.TContratoTemplateController', 'Insere', [TContratoTemplateVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
        if TContratoTemplateVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('ContratoTemplateController.TContratoTemplateController', 'Altera', [TContratoTemplateVO(ObjetoVO)], 'POST', 'Boolean');
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    except
      Result := False;
    end;
  end;
  DeletarArquivoTemporario;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFContratoTemplate.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TContratoTemplateVO(TController.BuscarObjeto('ContratoTemplateController.TContratoTemplateController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNome.Text := TContratoTemplateVO(ObjetoVO).Nome;
    MemoDescricao.Text := TContratoTemplateVO(ObjetoVO).Descricao;

    // Serializa o objeto para consultar posteriormente se houve altera��es
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFContratoTemplate.ActionEditarArquivoExecute(Sender: TObject);
var
  Arquivo, Filtro: String;
begin
  // Se o usu�rio estiver editando um Template, verifica se j� existe um arquivo no servidor
  if StatusTela = stEditando then
  begin
    Filtro := IntToStr(TContratoTemplateVO(ObjetoVO).Id) + '.doc';
    Arquivo := TController.BuscarArquivo('ContratoTemplateController.TContratoTemplateController', 'BaixarArquivo', [Filtro], 'GET');
  end;
  //
  Application.CreateForm(TFDocumentoWord, FDocumentoWord);
  if FileExists(Arquivo) then
  begin
    FDocumentoWord.Operacao := 'Alterar';
    FDocumentoWord.NomeArquivo := Arquivo;
  end
  else
    FDocumentoWord.Operacao := 'Inserir';
  FDocumentoWord.ShowModal;
end;

procedure TFContratoTemplate.DeletarArquivoTemporario;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'temp.doc') then
    DeleteFile(ExtractFilePath(Application.ExeName)+'temp.doc');
end;

procedure TFContratoTemplate.UploadArquivo;
var
  ArquivoStream: TStringStream;
  ArquivoBytesString: String;
  i: Integer;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'temp.doc') then
  begin
    try
      try
        ArquivoBytesString := '';
        ArquivoStream := TStringStream.Create;
        ArquivoStream.LoadFromFile(ExtractFilePath(Application.ExeName)+'temp.doc');
        for i := 0 to ArquivoStream.Size - 1 do
        begin
          ArquivoBytesString := ArquivoBytesString + IntToStr(ArquivoStream.Bytes[i]) + ', ';
        end;
        // Tira a ultima virgula
        Delete(ArquivoBytesString, Length(ArquivoBytesString) - 1, 2);
        TContratoTemplateVO(ObjetoVO).Arquivo := ArquivoBytesString;
        TContratoTemplateVO(ObjetoVO).TipoArquivo := '.doc';
      except
        Application.MessageBox('Arquivo de imagem com formato inv�lido.', 'Erro do sistema.', MB_OK + MB_ICONERROR);
      end;
    finally
      ArquivoStream.Free;
    end;
  end;
end;
{$ENDREGION}

end.
