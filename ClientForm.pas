unit ClientForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, DataModule, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmClientForm = class(TForm)
    PnlFields: TPanel;
    PnlButtons: TPanel;
    LblName: TLabel;
    LblRG: TLabel;
    LblCPF: TLabel;
    LblTelefone: TLabel;
    LblEmail: TLabel;
    EdtName: TDBEdit;
    EdtRG: TDBEdit;
    EdtCPF: TDBEdit;
    EdtTelefone: TDBEdit;
    EdtEmail: TDBEdit;
    GrbAdress: TGroupBox;
    LblCep: TLabel;
    LblAdress: TLabel;
    LblNumber: TLabel;
    LblComplement: TLabel;
    LblDistrict: TLabel;
    LblCity: TLabel;
    LblState: TLabel;
    LblCOuntry: TLabel;
    EdtCep: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    BtnAdd: TButton;
    BtnEdit: TButton;
    BtnDelete: TButton;
    BtnPost: TButton;
    BtnCancel: TButton;
    BtnClose: TButton;
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnPostClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure EdtCepExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure FormAdjustment;
    procedure GetAdress;
    procedure SendEmail;
    procedure CreateXML;
    function ValidateData: Boolean;
    function ValidateCPF: Boolean;
  public
    { Public declarations }
  end;

var
  FrmClientForm: TFrmClientForm;

implementation

{$R *.dfm}

uses
  StrUtils,
  idHttp,
  IdSSLOpenSSL,
  System.JSON,
  IniFiles,
  IdMessage,
  IdText,
  IdSMTP,
  IdExplicitTLSClientServerBase,
  IdAttachmentFile,
  DBClient,
  System.RegularExpressions,
  XMLDoc;

procedure TFrmClientForm.BtnAddClick(Sender: TObject);
begin
  DtmClientForm.CdsClient.Append;
  EdtName.SetFocus;
end;

procedure TFrmClientForm.BtnCancelClick(Sender: TObject);
begin
  DtmClientForm.CdsClient.Cancel;
end;

procedure TFrmClientForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmClientForm.BtnDeleteClick(Sender: TObject);
begin
  if not(DtmClientForm.CdsClient.IsEmpty) then
  begin
    if Application.MessageBox('Deseja excluir o registro?', 'Exclus?o de registro', MB_YESNO + MB_ICONQUESTION) = id_yes then
      DtmClientForm.CdsClient.Delete;
  end;
end;

procedure TFrmClientForm.BtnEditClick(Sender: TObject);
begin
  if not(DtmClientForm.CdsClient.IsEmpty) then
    DtmClientForm.CdsClient.Edit;
end;

procedure TFrmClientForm.BtnPostClick(Sender: TObject);
begin
  if (DtmClientForm.CdsClient.State in dsEditModes) then
  begin
    if not(ValidateData) then
      Exit;

    DtmClientForm.CdsClient.Post;

    if Application.MessageBox('Deseja realizar o envio do e-mail?', 'E-Mail', MB_YESNO + MB_ICONQUESTION) = id_yes then
    begin
      CreateXML;
      SendEmail;
    end;
  end;
end;

procedure TFrmClientForm.CreateXML;
var
  dXMLDoc: TXMLDocument;
  I      : Integer;
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'dados.xml') then
    DeleteFile(ExtractFilePath(ParamStr(0)) + 'dados.xml');

  dXMLDoc        := TXMLDocument.Create(nil);
  dXMLDoc.Active := True;

  dXMLDoc.AddChild('Info');
  dXMLDoc.DocumentElement.AddChild('Cliente');

  for I := 0 to DtmClientForm.CdsClient.FieldCount - 1 do
    dXMLDoc.DocumentElement.ChildNodes['Cliente'].AddChild(DtmClientForm.CdsClient.Fields[I].DisplayLabel).NodeValue := DtmClientForm.CdsClient.Fields[I].Text;

  dXMLDoc.SaveToFile(ExtractFilePath(ParamStr(0)) + 'dados.xml');
end;

procedure TFrmClientForm.EdtCepExit(Sender: TObject);
begin
  if not(DtmClientForm.CdsClientCEP.IsNull) then
    GetAdress;
end;

procedure TFrmClientForm.FormAdjustment;
begin
  EdtName.Left     := Trunc(PnlFields.Width / 2) - Trunc(EdtName.Width / 2);
  EdtRG.Left       := EdtName.Left;
  EdtCPF.Left      := EdtRG.Left + EdtRG.Width + 10;
  EdtTeleFone.Left := EdtName.Left;
  EdtEmail.Left    := EdtTeleFone.Left + EdtTeleFone.Width + 10;
  LblName.Left     := EdtName.Left;
  LblRG.Left       := EdtRG.Left;
  LblCPF.Left      := EdtCPF.Left;
  LblTelefone.Left := EdtTelefone.Left;
  LblEmail.Left    := EdtEmail.Left;
  GrbAdress.Left   := EdtName.Left;
  BtnAdd.Left      := GrbAdress.Left;
  BtnEdit.Left     := BtnAdd.Left + BtnAdd.Width + 10;
  BtnDelete.Left   := BtnEdit.Left + BtnEdit.Width + 10;
  BtnClose.Left    := GrbAdress.Left + GrbAdress.Width - 75;
  BtnCancel.Left   := BtnClose.Left - 85;
  BtnPost.Left     := BtnCancel.Left - 85;
end;

procedure TFrmClientForm.FormCreate(Sender: TObject);
begin
  DtmClientForm := TDtmClientForm.Create(nil);
end;

procedure TFrmClientForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DtmClientForm);
end;

procedure TFrmClientForm.FormResize(Sender: TObject);
begin
  FormAdjustment;
end;

procedure TFrmClientForm.GetAdress;
var
  iHTTP        : TIdHTTP;
  iIDSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sResponse    : TStringStream;
  oJsonObject  : TJSONObject;
begin
  sResponse     := TStringStream.Create('');
  iHTTP         := TIdHTTP.Create;
  iIDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;

  try
    iHTTP.IOHandler := iIDSSLHandler;

    iIDSSLHandler.SSLOptions.Method := sslvTLSv1_2;
    iIDSSLHandler.SSLOptions.Mode := sslmUnassigned;

    if Length(DtmClientForm.CdsClientCEP.AsString) <> 8 then
    begin
      EdtCep.SetFocus;
      raise Exception.Create('CEP inv?lido');
    end;

    iHTTP.Get('https://viacep.com.br/ws/' + DtmClientForm.CdsClientCEP.AsString + '/json', sResponse);

    if (iHTTP.ResponseCode = 200) and not (UTF8ToString(sResponse.DataString) = '{'#$A'  "erro": true'#$A'}') then
    begin
      oJsonObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(UTF8ToString(sResponse.DataString)), 0) as TJSONObject;

      if oJsonObject = nil then
      begin
        EdtCep.SetFocus;
        raise Exception.Create('CEP inv?lido ou n?o encontrado');
      end;

      DtmClientForm.CdsClientLOGRADOURO.AsString  := oJsonObject.Get('logradouro').JsonValue.Value;
      DtmClientForm.CdsClientCOMPLEMENTO.AsString := oJsonObject.Get('complemento').JsonValue.Value;
      DtmClientForm.CdsClientBAIRRO.AsString      := oJsonObject.Get('bairro').JsonValue.Value;
      DtmClientForm.CdsClientCIDADE.AsString      := oJsonObject.Get('localidade').JsonValue.Value;
      DtmClientForm.CdsClientESTADO.AsString      := oJsonObject.Get('uf').JsonValue.Value;
    end
    else
    begin
      EdtCep.SetFocus;
      raise Exception.Create('CEP inexistente!');
    end;
  finally
    FreeAndNil(iHTTP);
    FreeAndNil(iIDSSLHandler);
    sResponse.Destroy;
  end;
end;

procedure TFrmClientForm.SendEmail;
var
  IniFile             : TIniFile;
  sFrom               : String;
  sHost               : String;
  iPort               : Integer;
  sUserName           : String;
  sPassword           : String;
  sTexto              : String;
  I                   : Integer;
  idMsg               : TIdMessage;
  idText              : TIdText;
  idSMTP              : TIdSMTP;
  idSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
begin
  sFrom     := EmptyStr;
  sHost     := EmptyStr;
  iPort     := 0;
  sUserName := EmptyStr;
  sPassword := EmptyStr;

  if Trim(DtmClientForm.CdsClientEMAIL.AsString) = EmptyStr then
  begin
    ShowMessage('E-mail do cliente n?o informado');
    Exit;
  end;

  try
    IniFile   := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'email.ini');
    sFrom     := IniFile.ReadString('Email' , 'From'     , sFrom);
    sHost     := IniFile.ReadString('Email' , 'Host'     , sHost);
    iPort     := IniFile.ReadInteger('Email', 'Port'     , iPort);
    sUserName := IniFile.ReadString('Email' , 'UserName' , sUserName);
    sPassword := IniFile.ReadString('Email' , 'Password' , sPassword);

    if (Trim(sFrom)     = EmptyStr) or
       (Trim(sHost)     = EmptyStr) or
       (Trim(sFrom)     = EmptyStr) or
       (iPort           = 0)        or
       (Trim(sPassword) = EmptyStr) then
      raise Exception.Create('Problemas na configura??o. Verifique o arquivo de configura??o email.ini');

    IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

    idMsg                           := TIdMessage.Create(Self);
    idMsg.CharSet                   := 'utf-8';
    idMsg.Encoding                  := meMIME;
    idMsg.From.Name                 := 'Avalia??o Pr?tica';
    idMsg.From.Address              := sFrom;
    idMsg.Priority                  := mpNormal;
    idMsg.Subject                   := 'Assunto Teste';
    idMsg.Recipients.Add;
    idMsg.Recipients.EMailAddresses := Trim(DtmClientForm.CdsClientEMAIL.AsString);

    idText := TIdText.Create(idMsg.MessageParts);

    for I := 0 to DtmClientForm.CdsClient.FieldCount - 1 do
        idText.Body.Add(DtmClientForm.CdsClient.Fields[I].DisplayLabel + ': ' + DtmClientForm.CdsClient.Fields[I].Text + '<br>');

    idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';
    idSMTP           := TIdSMTP.Create(Self);
    idSMTP.IOHandler := IdSSLIOHandlerSocket;
    idSMTP.UseTLS    := utUseImplicitTLS;
    idSMTP.AuthType  := satDefault;
    idSMTP.Host      := sHost;
    idSMTP.AuthType  := satDefault;
    idSMTP.Port      := iPort;
    idSMTP.Username  := sUserName;
    idSMTP.Password  := sPassword;
    idSMTP.Connect;
    idSMTP.Authenticate;

    if FileExists(ExtractFilePath(ParamStr(0)) + 'dados.xml') then
      TIdAttachmentFile.Create(idMsg.MessageParts, ExtractFilePath(ParamStr(0)) + 'dados.xml');

    if idSMTP.Connected then
    begin
      try
        IdSMTP.Send(idMsg);
      except on E:Exception do
        begin
          ShowMessage('Erro ao tentar enviar: ' + E.Message);
        end;
      end;
    end;

    if idSMTP.Connected then
      idSMTP.Disconnect;

    ShowMessage('E-mail enviado com sucesso');
 finally
    UnLoadOpenSSLLibrary;
    FreeAndNil(IniFile);
    FreeAndNil(idMsg);
    FreeAndNil(idSSLIOHandlerSocket);
    FreeAndNil(idSMTP);
  end;
end;

function TFrmClientForm.ValidateCPF: Boolean;
var
  sCPF    : String;
  I       : Integer;
  iSoma   : Integer;
  iPeso   : Integer;
  iDigito1: Integer;
  iDigito2: Integer;
begin
  Result := False;

  if (DtmClientForm.CdsClientCPF.AsString = StringOfChar('0', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('1', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('2', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('3', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('4', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('5', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('6', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('7', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('8', 11)) or
     (DtmClientForm.CdsClientCPF.AsString = StringOfChar('9', 11)) or
     (Length(DtmClientForm.CdsClientCPF.AsString) <> 11)           then
    Exit;

  sCPF  := DtmClientForm.CdsClientCPF.AsString;
  iSoma :=  0;
  iPeso := 10;

  for I := 1 to 9 do
  begin
    iSoma := iSoma + (StrToInt(sCPF[I]) * iPeso);
    iPeso := iPeso - 1;

    iDigito1 := 11 - (iSoma mod 11);

    if iDigito1 in [10, 11] then
      iDigito1 := 0;
  end;

  iSoma :=  0;
  iPeso := 11;

  for I := 1 to 10 do
  begin
    iSoma := iSoma + (StrToInt(sCPF[I]) * iPeso);
    iPeso := iPeso - 1;

    iDigito2 := 11 - (iSoma mod 11);

    if iDigito2 in [10, 11] then
      iDigito2 := 0;
  end;

  Result := (IntToStr(iDigito1) = sCPF[10]) and (IntToStr(iDigito2) = sCPF[11]);
end;

function TFrmClientForm.ValidateData: Boolean;
var
  rRegex: TRegEx;
begin
  Result := not(DtmClientForm.CdsClientNOME.IsNull);

  if not(Result) then
  begin
    ShowMessage('Campo NOME ? obrigat?rio');
    EdtName.SetFocus;
    Exit;
  end;

  Result := ValidateCPF;

  if not(Result) then
  begin
    if DtmClientForm.CdsClientCPF.IsNull then
      ShowMessage('Campo CPF ? obrigat?rio')
    else
      ShowMessage('CPF inv?lido');

    EdtCPF.SetFocus;
    Exit;
  end;

  Result := rRegex.IsMatch(DtmClientForm.CdsClientEMAIL.AsString, '^[^@]+@[^.]+\.[^.]');

  if not(Result) then
  begin
    if DtmClientForm.CdsClientEMAIL.IsNull then
      ShowMessage('Campo E-MAIL ? obrigat?rio')
    else
      ShowMessage('E-MAIL inv?lido');

    EdtEmail.SetFocus;
    Exit;
  end;
end;

end.
