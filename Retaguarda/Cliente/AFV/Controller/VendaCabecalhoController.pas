{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado � tabela [VENDA_CABECALHO] 
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit VendaCabecalhoController;

interface

uses
  Classes, FMX.Dialogs, SysUtils, DBClient, DB,  Windows, FMX.Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, VendaCabecalhoVO;

type
  TVendaCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TVendaCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TVendaCabecalhoVO;

    class procedure Insere(pObjeto: TVendaCabecalhoVO);
    class function Altera(pObjeto: TVendaCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses VendaDetalheVO, VendaComissaoVO;

class procedure TVendaCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TVendaCabecalhoVO>;
begin
  try
//    Retorno := TT2TiORM.Consultar<TVendaCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TVendaCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TVendaCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TVendaCabecalhoVO>;
begin
  try
//    Result := TT2TiORM.Consultar<TVendaCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TVendaCabecalhoController.ConsultaObjeto(pFiltro: String): TVendaCabecalhoVO;
begin
  try
//    Result := TT2TiORM.ConsultarUmObjeto<TVendaCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TVendaCabecalhoController.Insere(pObjeto: TVendaCabecalhoVO);
var
  UltimoID: Integer;
  VendaDetalheEnumerator: TEnumerator<TVendaDetalheVO>;
  VendaComissaoVO: TVendaComissaoVO;
begin
  try
//    UltimoID := TT2TiORM.Inserir(pObjeto);

   // Comiss�o
    VendaComissaoVO := TVendaComissaoVO.Create;
    VendaComissaoVO.IdVendaCabecalho := UltimoID;
    VendaComissaoVO.IdVendedor := pObjeto.IdVendedor;
    VendaComissaoVO.ValorVenda := pObjeto.ValorSubtotal - pObjeto.ValorDesconto;
    VendaComissaoVO.TipoContabil := 'C';
    VendaComissaoVO.ValorComissao := pObjeto.ValorComissao;
    VendaComissaoVO.Situacao := 'A';
    VendaComissaoVO.DataLancamento := now;
//    TT2TiORM.Inserir(VendaComissaoVO);

    // Lista Venda Detalhe
    VendaDetalheEnumerator := pObjeto.ListaVendaDetalheVO.GetEnumerator;
    try
      with VendaDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdVendaCabecalho := UltimoID;
//          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(VendaDetalheEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TVendaCabecalhoController.Altera(pObjeto: TVendaCabecalhoVO): Boolean;
var
  VendaDetalheEnumerator: TEnumerator<TVendaDetalheVO>;
begin
  try
//    Result := TT2TiORM.Alterar(pObjeto);

    // Comiss�o
    pObjeto.VendaComissaoVO.IdVendaCabecalho := pObjeto.Id;
    pObjeto.VendaComissaoVO.IdVendedor := pObjeto.IdVendedor;
    pObjeto.VendaComissaoVO.ValorVenda := pObjeto.ValorSubtotal - pObjeto.ValorDesconto;
    pObjeto.VendaComissaoVO.TipoContabil := 'C';
    pObjeto.VendaComissaoVO.ValorComissao := pObjeto.ValorComissao;
    pObjeto.VendaComissaoVO.Situacao := 'A';
    pObjeto.VendaComissaoVO.DataLancamento := now;
    if pObjeto.VendaComissaoVO.Id > 0 then
//      TT2TiORM.Alterar(pObjeto.VendaComissaoVO)
    else
//      TT2TiORM.Inserir(pObjeto.VendaComissaoVO);

    // Lista Or�amento Pedido Detalhe
    try
      VendaDetalheEnumerator := pObjeto.ListaVendaDetalheVO.GetEnumerator;
      with VendaDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
//            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdVendaCabecalho := pObjeto.Id;
//            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(VendaDetalheEnumerator);
    end;

  finally
  end;
end;

class function TVendaCabecalhoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TVendaCabecalhoVO;
begin
  try
    ObjetoLocal := TVendaCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
//    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TVendaCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TVendaCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TVendaCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TVendaCabecalhoVO>(TObjectList<TVendaCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TVendaCabecalhoController);

finalization
  Classes.UnRegisterClass(TVendaCabecalhoController);

end.
