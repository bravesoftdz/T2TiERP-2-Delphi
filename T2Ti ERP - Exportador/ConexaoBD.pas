unit ConexaoBD;

interface

uses Classes, SQLExpr, WideStrings, DB, SysUtils, DBXMySql, DBXFirebird,
     DBXInterbase, DBXMsSQL, DBXOracle, DbxDb2, IWSystem;

type

  TDBExpress = class(TSQLConnection)
  private
    class var Banco: String;
    class var Conexao: TSQLConnection;
    class procedure ConfigurarConexao(var pConexao: TSQLConnection; pBD: String);
  public
    class var HostName: String;
    class var Database: String;
    class var User_Name: String;
    class var Password: String;
    class procedure Conectar(BD: String);
    class procedure Desconectar;
    class function getConexao: TSQLConnection;
    class function getBanco: String;
  end;

implementation

class procedure TDBExpress.Conectar(BD: String);
begin
  Conexao := TSQLConnection.Create(nil);
  ConfigurarConexao(Conexao, BD);
  Conexao.KeepConnection := True;
  Conexao.AutoClone := False;
  Conexao.Connected := True;
  Banco := BD;
end;

class procedure TDBExpress.Desconectar;
begin
  Conexao.Connected := False;
end;

class function TDBExpress.getBanco: String;
begin
  Result := Banco;
end;

class function TDBExpress.getConexao: TSQLConnection;
begin
  Result := Conexao;
end;

class procedure TDBExpress.ConfigurarConexao(var pConexao: TSQLConnection; pBD: String);
begin
  if pBD = 'Oracle' then
  begin
    Conexao.DriverName     := 'Oracle';
    Conexao.ConnectionName := 'OracleConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverORACLE';
    Conexao.LibraryName    := 'dbxora.dll';
    Conexao.VendorLib      := 'oci.dll';
  end
  else
  if pBD = 'MSSQL' then
  begin
    Conexao.DriverName     := 'MSSQL';
    Conexao.ConnectionName := 'MSSQLCONNECTION';
    Conexao.GetDriverFunc  := 'getSQLDriverMSSQL';
    Conexao.LibraryName    := 'dbxmss.dll';
    Conexao.VendorLib      := 'oledb';

    Conexao.Params.Values['HostName'] := HostName;
    Conexao.Params.Values['DataBase'] := Database;
  end
  else
  if pBD = 'Firebird' then
  begin
    Conexao.DriverName     := 'Firebird';
    Conexao.ConnectionName := 'FBConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverINTERBASE';
    Conexao.LibraryName    := 'dbxfb.dll';
    Conexao.VendorLib      := 'fbclient.dll';

    Conexao.Params.Values['DataBase'] := HostName + ':' + Database
  end
  else
  if pBD = 'Interbase' then
  begin
    Conexao.DriverName     := 'Interbase';
    Conexao.ConnectionName := 'IBConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverINTERBASE';
    Conexao.LibraryName    := 'dbxint.dll';
    Conexao.VendorLib      := 'gds32.dll';

    Conexao.Params.Values['DataBase'] := HostName + ':' + Database
  end
  else
  if pBD = 'MySQL' then
  begin
    Conexao.DriverName     := 'MySQL';
    Conexao.ConnectionName := 'MySQLConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverMYSQL';
    Conexao.LibraryName    := 'dbxmys.dll';
    Conexao.VendorLib      := 'libmysql.dll';

    Conexao.Params.Values['HostName'] := HostName;
    Conexao.Params.Values['DataBase'] := Database;
  end
  else
  if pBD = 'DB2' then
  begin
    Conexao.DriverName     := 'Db2';
    Conexao.ConnectionName := 'DB2Connection';
    Conexao.GetDriverFunc  := 'getSQLDriverDB2';
    Conexao.LibraryName    := 'dbxdb2.dll';
    Conexao.VendorLib      := 'db2cli.dll';

    Conexao.Params.Values['HostName'] := HostName;
    Conexao.Params.Values['DataBase'] := Database;
  end
  else
  if pBD = 'Postgres' then
  begin
    Conexao.DriverName     := 'DevartPostgreSQL';
    Conexao.ConnectionName := 'PostgreConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverPostgreSQL';
    Conexao.LibraryName    := 'dbexppgsql40.dll';
    Conexao.VendorLib      := 'not used';

    Conexao.Params.Values['HostName'] := HostName;
    Conexao.Params.Values['DataBase'] := Database;
  end;

  Conexao.Params.Values['User_Name'] := User_Name;
  Conexao.Params.Values['Password'] := Password;
  Conexao.LoginPrompt := False;
  Conexao.Name := 'Conexao';
end;

end.
