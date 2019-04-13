{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Classificação da Jornada para o Ponto Eletrônico

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
unit UPontoClassificacaoJornada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, PontoClassificacaoJornadaVO,
  PontoClassificacaoJornadaController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils, Controller;

type
  [TFormDescription(TConstantes.MODULO_PONTO_ELETRONICO, 'Ponto Classificação Jornada')]

  TFPontoClassificacaoJornada = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditCodigo: TLabeledEdit;
    EditNome: TLabeledEdit;
    MemoDescricao: TLabeledMemo;
    ComboBoxDescontarHoras: TLabeledComboBox;
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
  FPontoClassificacaoJornada: TFPontoClassificacaoJornada;

implementation

{$R *.dfm}

{$REGION 'Infra'}
procedure TFPontoClassificacaoJornada.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPontoClassificacaoJornadaVO;
  ObjetoController := TPontoClassificacaoJornadaController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFPontoClassificacaoJornada.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditCodigo.SetFocus;
  end;
end;

function TFPontoClassificacaoJornada.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditCodigo.SetFocus;
  end;
end;

function TFPontoClassificacaoJornada.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('PontoClassificacaoJornadaController.TPontoClassificacaoJornadaController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('PontoClassificacaoJornadaController.TPontoClassificacaoJornadaController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFPontoClassificacaoJornada.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TPontoClassificacaoJornadaVO.Create;

      TPontoClassificacaoJornadaVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TPontoClassificacaoJornadaVO(ObjetoVO).Codigo := EditCodigo.Text;
      TPontoClassificacaoJornadaVO(ObjetoVO).Nome := EditNome.Text;
      TPontoClassificacaoJornadaVO(ObjetoVO).Descricao := MemoDescricao.Text;
      TPontoClassificacaoJornadaVO(ObjetoVO).DescontarHoras := IfThen(ComboBoxDescontarHoras.ItemIndex = 0, 'S', 'N');

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('PontoClassificacaoJornadaController.TPontoClassificacaoJornadaController', 'Insere', [TPontoClassificacaoJornadaVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TPontoClassificacaoJornadaVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('PontoClassificacaoJornadaController.TPontoClassificacaoJornadaController', 'Altera', [TPontoClassificacaoJornadaVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFPontoClassificacaoJornada.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TPontoClassificacaoJornadaVO(TController.BuscarObjeto('PontoClassificacaoJornadaController.TPontoClassificacaoJornadaController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditCodigo.Text := TPontoClassificacaoJornadaVO(ObjetoVO).Codigo;
    EditNome.Text := TPontoClassificacaoJornadaVO(ObjetoVO).Nome;
    MemoDescricao.Text := TPontoClassificacaoJornadaVO(ObjetoVO).Descricao;

    case AnsiIndexStr(TPontoClassificacaoJornadaVO(ObjetoVO).DescontarHoras, ['S', 'N']) of
      0:
        ComboBoxDescontarHoras.ItemIndex := 0;
      1:
        ComboBoxDescontarHoras.ItemIndex := 1;
    end;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
