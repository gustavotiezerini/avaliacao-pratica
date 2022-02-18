unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList;

type
  TFrmMain = class(TForm)
    PnlHeader: TPanel;
    PnlMain: TPanel;
    PnlMenu: TPanel;
    PnlWorkingArea: TPanel;
    LblTitle: TLabel;
    ActButtons: TActionList;
    ActClientForm: TAction;
    BtnClientForm: TButton;
    procedure ActClientFormExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FrmActiveForm: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  ClientForm;

procedure TFrmMain.ActClientFormExecute(Sender: TObject);
begin
  LoadForm(TFrmClientForm);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Self.FrmActiveForm);
end;

procedure TFrmMain.FormResize(Sender: TObject);
begin
  LblTitle.Left := Trunc(PnlHeader.Width / 2) - Trunc(LblTitle.Width / 2);
end;

procedure TFrmMain.LoadForm(AClass: TFormClass);
begin
  if Assigned(Self.FrmActiveForm) then
  begin
    Self.FrmActiveForm.Close;
    Self.FrmActiveForm.Free;
    Self.FrmActiveForm := nil;
  end;

  Self.FrmActiveForm             := AClass.Create(nil);
  Self.FrmActiveForm.Parent      := Self.PnlWorkingArea;
  Self.FrmActiveForm.BorderStyle := TFormBorderStyle.bsNone;

  Self.FrmActiveForm.Top   := 0;
  Self.FrmActiveForm.Left  := 0;
  Self.FrmActiveForm.Align := TAlign.alClient;

  Self.FrmActiveForm.Show;
end;

end.
