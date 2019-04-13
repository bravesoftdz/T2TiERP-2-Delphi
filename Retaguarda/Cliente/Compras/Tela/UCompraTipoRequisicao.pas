{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro dos tipos de requisi��o de compra

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

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UCompraTipoRequisicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, CompraTipoRequisicaoVO,
  CompraTipoRequisicaoController, Tipos, Atributos, Constantes, LabeledCtrls,
  Controller;

type
  [TFormDescription(TConstantes.MODULO_COMPRAS, 'Tipo Requisi��o')]

  TFCompraTipoRequisicao = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditCodigo: TLabeledEdit;
    EditNome: TLabeledEdit;
    MemoDescricao: TLabeledMemo;
    procedure FormCreate(Sender: TObject);
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
  FCompraTipoRequisicao: TFCompraTipoRequisicao;

implementation

{$R *.dfm}

{$REGION 'Infra'}
procedure TFCompraTipoRequisicao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCompraTipoRequisicaoVO;
  ObjetoController := TCompraTipoRequisicaoController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFCompraTipoRequisicao.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditCodigo.SetFocus;
  end;
end;

function TFCompraTipoRequisicao.DoEditar: Boolean;
begin
  if IdRegistroSelecionado in [1, 2] then
  begin
    Application.MessageBox('Esse registro n�o pode ser alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    Exit(False);
  end;

  Result := inherited DoEditar;

  if Result then
  begin
    EditCodigo.SetFocus;
  end;
end;

function TFCompraTipoRequisicao.DoExcluir: Boolean;
begin
  if IdRegistroSelecionado in [1, 2] then
  begin
    Application.MessageBox('Esse registro n�o pode ser exclu�do.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    Exit(False);
  end;

  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('CompraTipoRequisicaoController.TCompraTipoRequisicaoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('CompraTipoRequisicaoController.TCompraTipoRequisicaoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFCompraTipoRequisicao.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TCompraTipoRequisicaoVO.Create;

      TCompraTipoRequisicaoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TCompraTipoRequisicaoVO(ObjetoVO).Codigo := EditCodigo.Text;
      TCompraTipoRequisicaoVO(ObjetoVO).Nome := EditNome.Text;
      TCompraTipoRequisicaoVO(ObjetoVO).Descricao := MemoDescricao.Text;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('CompraTipoRequisicaoController.TCompraTipoRequisicaoController', 'Insere', [TCompraTipoRequisicaoController(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
        if TCompraTipoRequisicaoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('CompraTipoRequisicaoController.TCompraTipoRequisicaoController', 'Altera', [TCompraTipoRequisicaoController(ObjetoVO)], 'POST', 'Boolean');
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFCompraTipoRequisicao.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TCompraTipoRequisicaoVO(TController.BuscarObjeto('CompraTipoRequisicaoController.TCompraTipoRequisicaoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditCodigo.Text := TCompraTipoRequisicaoVO(ObjetoVO).Codigo;
    EditNome.Text := TCompraTipoRequisicaoVO(ObjetoVO).Nome;
    MemoDescricao.Text := TCompraTipoRequisicaoVO(ObjetoVO).Descricao;

    // Serializa o objeto para consultar posteriormente se houve altera��es
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
