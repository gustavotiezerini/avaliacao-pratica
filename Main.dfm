object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Info Sistemas'
  ClientHeight = 661
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 80
    Align = alTop
    BevelInner = bvLowered
    Caption = 'PnlHeader'
    Color = clTeal
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object LblTitle: TLabel
      Left = 340
      Top = 25
      Width = 205
      Height = 29
      Caption = 'Avalia'#231#227'o Pr'#225'tica'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PnlMain: TPanel
    Left = 0
    Top = 80
    Width = 884
    Height = 581
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PnlMain'
    ShowCaption = False
    TabOrder = 1
    object PnlMenu: TPanel
      Left = 0
      Top = 0
      Width = 150
      Height = 581
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'PnlMenu'
      Color = clSilver
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object BtnClientForm: TButton
        Left = 10
        Top = 10
        Width = 130
        Height = 130
        Action = ActClientForm
        Caption = 'Cadastro de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        WordWrap = True
      end
    end
    object PnlWorkingArea: TPanel
      Left = 150
      Top = 0
      Width = 734
      Height = 581
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PnlWorkingArea'
      Color = clGray
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
    end
  end
  object ActButtons: TActionList
    Left = 816
    Top = 16
    object ActClientForm: TAction
      Caption = 'ActCadastroClientes'
      OnExecute = ActClientFormExecute
    end
  end
end
