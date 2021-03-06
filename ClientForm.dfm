object FrmClientForm: TFrmClientForm
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 542
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PnlFields: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 377
    Align = alTop
    BevelInner = bvLowered
    Caption = 'PnlFields'
    ShowCaption = False
    TabOrder = 0
    object LblName: TLabel
      Left = 10
      Top = 10
      Width = 27
      Height = 13
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblRG: TLabel
      Left = 10
      Top = 55
      Width = 14
      Height = 13
      Caption = 'RG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblCPF: TLabel
      Left = 140
      Top = 55
      Width = 19
      Height = 13
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblTelefone: TLabel
      Left = 10
      Top = 100
      Width = 42
      Height = 13
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblEmail: TLabel
      Left = 140
      Top = 100
      Width = 28
      Height = 13
      Caption = 'E-Mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtName: TDBEdit
      Left = 10
      Top = 25
      Width = 700
      Height = 21
      DataField = 'NOME'
      DataSource = DtmClientForm.DsClient
      TabOrder = 0
    end
    object EdtRG: TDBEdit
      Left = 10
      Top = 70
      Width = 120
      Height = 21
      DataField = 'RG'
      DataSource = DtmClientForm.DsClient
      TabOrder = 1
    end
    object EdtCPF: TDBEdit
      Left = 140
      Top = 70
      Width = 120
      Height = 21
      DataField = 'CPF'
      DataSource = DtmClientForm.DsClient
      TabOrder = 2
    end
    object EdtTelefone: TDBEdit
      Left = 10
      Top = 115
      Width = 120
      Height = 21
      DataField = 'TELEFONE'
      DataSource = DtmClientForm.DsClient
      TabOrder = 3
    end
    object EdtEmail: TDBEdit
      Left = 140
      Top = 115
      Width = 570
      Height = 21
      DataField = 'EMAIL'
      DataSource = DtmClientForm.DsClient
      TabOrder = 4
    end
    object GrbAdress: TGroupBox
      Left = 10
      Top = 150
      Width = 700
      Height = 215
      Caption = 'Endere'#231'o'
      TabOrder = 5
      object LblCep: TLabel
        Left = 10
        Top = 25
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object LblAdress: TLabel
        Left = 10
        Top = 70
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object LblNumber: TLabel
        Left = 570
        Top = 70
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object LblComplement: TLabel
        Left = 10
        Top = 115
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object LblDistrict: TLabel
        Left = 320
        Top = 115
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object LblCity: TLabel
        Left = 10
        Top = 160
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object LblState: TLabel
        Left = 320
        Top = 160
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object LblCOuntry: TLabel
        Left = 390
        Top = 160
        Width = 19
        Height = 13
        Caption = 'Pa'#237's'
      end
      object EdtCep: TDBEdit
        Left = 10
        Top = 40
        Width = 120
        Height = 21
        DataField = 'CEP'
        DataSource = DtmClientForm.DsClient
        TabOrder = 0
        OnExit = EdtCepExit
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 85
        Width = 550
        Height = 21
        DataField = 'LOGRADOURO'
        DataSource = DtmClientForm.DsClient
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 570
        Top = 85
        Width = 120
        Height = 21
        DataField = 'NUMERO'
        DataSource = DtmClientForm.DsClient
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 10
        Top = 130
        Width = 300
        Height = 21
        DataField = 'COMPLEMENTO'
        DataSource = DtmClientForm.DsClient
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 320
        Top = 130
        Width = 370
        Height = 21
        DataField = 'BAIRRO'
        DataSource = DtmClientForm.DsClient
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 10
        Top = 175
        Width = 300
        Height = 21
        DataField = 'CIDADE'
        DataSource = DtmClientForm.DsClient
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 320
        Top = 175
        Width = 60
        Height = 21
        DataField = 'ESTADO'
        DataSource = DtmClientForm.DsClient
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 390
        Top = 175
        Width = 300
        Height = 21
        DataField = 'PAIS'
        DataSource = DtmClientForm.DsClient
        TabOrder = 7
      end
    end
  end
  object PnlButtons: TPanel
    Left = 0
    Top = 501
    Width = 720
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'PnlButtons'
    ShowCaption = False
    TabOrder = 1
    object BtnAdd: TButton
      Left = 10
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnAddClick
    end
    object BtnEdit: TButton
      Left = 95
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = BtnEditClick
    end
    object BtnDelete: TButton
      Left = 180
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnDeleteClick
    end
    object BtnPost: TButton
      Left = 460
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = BtnPostClick
    end
    object BtnCancel: TButton
      Left = 545
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BtnCancelClick
    end
    object BtnClose: TButton
      Left = 630
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 5
      OnClick = BtnCloseClick
    end
  end
  object PnlGrid: TPanel
    Left = 0
    Top = 377
    Width = 720
    Height = 124
    Align = alClient
    BevelInner = bvLowered
    Caption = 'PnlGrid'
    ShowCaption = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 716
      Height = 120
      Align = alClient
      DataSource = DtmClientForm.DsClient
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGRADOURO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAIS'
          Width = 64
          Visible = True
        end>
    end
  end
end
