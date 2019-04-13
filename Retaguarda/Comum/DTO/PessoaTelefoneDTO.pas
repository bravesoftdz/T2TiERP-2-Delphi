unit PessoaTelefoneDTO;

interface

uses
  Atributos,

  SynCommons,
  mORMot;

type
  TPessoa_Telefone = class(TSQLRecord)
  private
    FID_PESSOA: TID;
    FTIPO: Integer;
    FNUMERO: RawUTF8;
    FOBSERVACAO: RawUTF8;

    //Usado no lado cliente para controlar quais registros ser�o persistidos
    FPersiste: String;

  public
    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  published
    [TColumn('ID_PESSOA', 'Id Pessoa', 80, [], False)]
    property Id_Pessoa: TID  read FID_PESSOA write FID_PESSOA;
    [TColumn('TIPO', 'Tipo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: Integer  read FTIPO write FTIPO;
    [TColumn('NUMERO', 'Numero', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: RawUTF8  read FNUMERO write FNUMERO;
    [TColumn('OBSERVACAO', 'Observacao', 500, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: RawUTF8  read FOBSERVACAO write FOBSERVACAO;
  end;

implementation

end.
