{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Cadastro dos Tipos de Movimenta��o dos Bens - M�dulo Patrim�nio

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
unit UPatrimTipoMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits, Biblioteca, Controller;

type
  [TFormDescription(TConstantes.MODULO_PATRIMONIO, 'Tipo Movimenta��o Bem')]

  TFPatrimTipoMovimentacao = class(TFTelaCadastro)
    EditNome: TLabeledEdit;
    MemoDescricao: TLabeledMemo;
    BevelEdits: TBevel;
    EditTipo: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    procedure GridParaEdits; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FPatrimTipoMovimentacao: TFPatrimTipoMovimentacao;

implementation

uses PatrimTipoMovimentacaoController, PatrimTipoMovimentacaoVo, NotificationService;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFPatrimTipoMovimentacao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPatrimTipoMovimentacaoVO;
  ObjetoController := TPatrimTipoMovimentacaoController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFPatrimTipoMovimentacao.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditTipo.ReadOnly := False;
    EditNome.ReadOnly := False;
    EditTipo.SetFocus;
  end;
end;

function TFPatrimTipoMovimentacao.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    if VerificaInteiro(CDSGrid.FieldByName('TIPO').AsString) and (CDSGrid.FieldByName('TIPO').AsInteger in [1, 2, 3, 4, 5]) then
    begin
      EditTipo.ReadOnly := True;
      EditNome.ReadOnly := True;
    end
    else
    begin
      EditTipo.ReadOnly := False;
      EditNome.ReadOnly := False;
    end;
    EditTipo.SetFocus;
  end;
end;

function TFPatrimTipoMovimentacao.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    if VerificaInteiro(CDSGrid.FieldByName('TIPO').AsString) and (CDSGrid.FieldByName('TIPO').AsInteger in [1, 2, 3, 4, 5]) then
    begin
      Application.MessageBox('Esse registro n�o pode ser exclu�do.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      Exit(False);
    end;
    //
    try
      TController.ExecutarMetodo('PatrimTipoMovimentacaoController.TPatrimTipoMovimentacaoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('PatrimTipoMovimentacaoController.TPatrimTipoMovimentacaoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFPatrimTipoMovimentacao.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TPatrimTipoMovimentacaoVO.Create;

      TPatrimTipoMovimentacaoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TPatrimTipoMovimentacaoVO(ObjetoVO).Tipo := EditTipo.Text;
      TPatrimTipoMovimentacaoVO(ObjetoVO).Nome := EditNome.Text;
      TPatrimTipoMovimentacaoVO(ObjetoVO).Descricao := MemoDescricao.Text;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('PatrimTipoMovimentacaoController.TPatrimTipoMovimentacaoController', 'Insere', [TPatrimTipoMovimentacaoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TPatrimTipoMovimentacaoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('PatrimTipoMovimentacaoController.TPatrimTipoMovimentacaoController', 'Altera', [TPatrimTipoMovimentacaoVO(ObjetoVO)], 'POST', 'Boolean');
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

{$REGION 'Controle de Grid'}
procedure TFPatrimTipoMovimentacao.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TPatrimTipoMovimentacaoVO(TController.BuscarObjeto('PatrimTipoMovimentacaoController.TPatrimTipoMovimentacaoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditTipo.Text := TPatrimTipoMovimentacaoVO(ObjetoVO).Tipo;
    EditNome.Text := TPatrimTipoMovimentacaoVO(ObjetoVO).Nome;
    MemoDescricao.Text := TPatrimTipoMovimentacaoVO(ObjetoVO).Descricao;

    // Serializa o objeto para consultar posteriormente se houve altera��es
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
