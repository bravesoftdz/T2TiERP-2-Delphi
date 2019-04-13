{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Fechamentos para a Folha de Pagamento

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

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UFolhaFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, FolhaFechamentoVO,
  FolhaFechamentoController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils, Controller;

type
  [TFormDescription(TConstantes.MODULO_FOLHA_PAGAMENTO, 'Folha Fechamento')]

  TFFolhaFechamento = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditFechamentoAtual: TLabeledMaskEdit;
    EditProximoFechamento: TLabeledMaskEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
  FFolhaFechamento: TFFolhaFechamento;

implementation

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFFolhaFechamento.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TFolhaFechamentoVO;
  ObjetoController := TFolhaFechamentoController.Create;

  inherited;
end;

procedure TFFolhaFechamento.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFFolhaFechamento.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFFolhaFechamento.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditFechamentoAtual.SetFocus;
  end;
end;

function TFFolhaFechamento.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditFechamentoAtual.SetFocus;
  end;
end;

function TFFolhaFechamento.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('FolhaFechamentoController.TFolhaFechamentoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('FolhaFechamentoController.TFolhaFechamentoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFFolhaFechamento.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TFolhaFechamentoVO.Create;

      TFolhaFechamentoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id ;
      TFolhaFechamentoVO(ObjetoVO).FechamentoAtual := EditFechamentoAtual.Text;
      TFolhaFechamentoVO(ObjetoVO).ProximoFechamento := EditProximoFechamento.Text;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('FolhaFechamentoController.TFolhaFechamentoController', 'Insere', [TFolhaFechamentoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TFolhaFechamentoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
        TController.ExecutarMetodo('FolhaFechamentoController.TFolhaFechamentoController', 'Altera', [TFolhaFechamentoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFFolhaFechamento.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TFolhaFechamentoVO(TController.BuscarObjeto('FolhaFechamentoController.TFolhaFechamentoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin

    EditFechamentoAtual.Text := TFolhaFechamentoVO(ObjetoVO).FechamentoAtual;
    EditProximoFechamento.Text := TFolhaFechamentoVO(ObjetoVO).ProximoFechamento;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
