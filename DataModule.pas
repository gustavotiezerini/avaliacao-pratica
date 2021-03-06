unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDtmClientForm = class(TDataModule)
    CdsClient: TClientDataSet;
    DsClient: TDataSource;
    CdsClientNOME: TStringField;
    CdsClientRG: TStringField;
    CdsClientCPF: TStringField;
    CdsClientTELEFONE: TStringField;
    CdsClientEMAIL: TStringField;
    CdsClientCEP: TStringField;
    CdsClientLOGRADOURO: TStringField;
    CdsClientNUMERO: TStringField;
    CdsClientCOMPLEMENTO: TStringField;
    CdsClientBAIRRO: TStringField;
    CdsClientCIDADE: TStringField;
    CdsClientESTADO: TStringField;
    CdsClientPAIS: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmClientForm: TDtmClientForm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDtmClientForm.DataModuleCreate(Sender: TObject);
begin
  CdsClient.CreateDataSet;
  CdsClient.Open;
end;

procedure TDtmClientForm.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(CdsClient);
end;

end.
