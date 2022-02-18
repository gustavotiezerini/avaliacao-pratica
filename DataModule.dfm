object DtmClientForm: TDtmClientForm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 177
  Width = 382
  object CdsClient: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 16
    object CdsClientNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 40
    end
    object CdsClientRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object CdsClientCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object CdsClientTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      EditMask = '(99)99999-9999;0;_'
      Size = 11
    end
    object CdsClientEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 40
    end
    object CdsClientCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object CdsClientLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object CdsClientNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsClientCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 40
    end
    object CdsClientBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 40
    end
    object CdsClientCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 40
    end
    object CdsClientESTADO: TStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Size = 2
    end
    object CdsClientPAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 40
    end
  end
  object DsClient: TDataSource
    AutoEdit = False
    DataSet = CdsClient
    Left = 144
    Top = 16
  end
end
