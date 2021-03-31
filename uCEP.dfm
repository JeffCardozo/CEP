object FrmClient: TFrmClient
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 419
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 280
      Height = 39
      DataSource = DtsClient
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Align = alLeft
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 320
      Top = 1
      Width = 437
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Cadastro de Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 758
    Height = 378
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 38
      Width = 22
      Height = 13
      Caption = 'R.G.'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 29
      Height = 13
      Caption = 'C.P.F.'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 86
      Width = 49
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 109
      Width = 36
      Height = 13
      Caption = 'e-mail'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 2
      Top = 140
      Width = 754
      Height = 236
      Align = alBottom
      TabOrder = 5
      object Label11: TLabel
        Left = 8
        Top = 191
        Width = 38
        Height = 13
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 8
        Top = 215
        Width = 23
        Height = 13
        Caption = 'Pa'#237's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 167
        Width = 38
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 143
        Width = 34
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 119
        Width = 79
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 72
        Width = 65
        Height = 13
        Caption = 'Logradouro'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 36
        Width = 29
        Height = 13
        Caption = 'C.E.P.'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 95
        Width = 44
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 752
        Height = 27
        Align = alTop
        Caption = 'Endere'#231'o'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit12: TDBEdit
        Left = 100
        Top = 210
        Width = 500
        Height = 21
        DataField = 'NmPais'
        DataSource = DtsClient
        TabOrder = 7
      end
      object DBEdit11: TDBEdit
        Left = 100
        Top = 186
        Width = 30
        Height = 21
        DataField = 'UfEstado'
        DataSource = DtsClient
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 100
        Top = 163
        Width = 500
        Height = 21
        DataField = 'NmCidade'
        DataSource = DtsClient
        TabOrder = 5
      end
      object DBEdit9: TDBEdit
        Left = 100
        Top = 140
        Width = 500
        Height = 21
        DataField = 'NmBairro'
        DataSource = DtsClient
        TabOrder = 4
      end
      object DBEdit8: TDBEdit
        Left = 100
        Top = 117
        Width = 500
        Height = 21
        DataField = 'DsComple'
        DataSource = DtsClient
        TabOrder = 3
      end
      object DBEdit7: TDBEdit
        Left = 100
        Top = 71
        Width = 500
        Height = 21
        DataField = 'DsLograd'
        DataSource = DtsClient
        TabOrder = 1
      end
      object DBEdit6: TDBEdit
        Left = 100
        Top = 33
        Width = 108
        Height = 21
        DataField = 'NoCep'
        DataSource = DtsClient
        TabOrder = 0
        OnExit = DBEdit6Exit
      end
      object DBEdit13: TDBEdit
        Left = 98
        Top = 94
        Width = 134
        Height = 21
        DataField = 'NoLograd'
        DataSource = DtsClient
        TabOrder = 2
      end
    end
    object DBEdit1: TDBEdit
      Left = 100
      Top = 13
      Width = 500
      Height = 21
      DataField = 'NmClient'
      DataSource = DtsClient
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 100
      Top = 37
      Width = 264
      Height = 21
      DataField = 'RgClient'
      DataSource = DtsClient
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 100
      Top = 62
      Width = 264
      Height = 21
      DataField = 'NoCpf'
      DataSource = DtsClient
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 100
      Top = 86
      Width = 264
      Height = 21
      DataField = 'NoFone'
      DataSource = DtsClient
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 100
      Top = 111
      Width = 500
      Height = 21
      DataField = 'DsEmail'
      DataSource = DtsClient
      TabOrder = 4
    end
  end
  object CdsClient: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsClientAfterInsert
    BeforePost = CdsClientBeforePost
    AfterPost = CdsClientAfterPost
    Left = 640
    Top = 312
    object CdsClientNmClient: TStringField
      FieldName = 'NmClient'
      Size = 60
    end
    object CdsClientRgClient: TStringField
      FieldName = 'RgClient'
    end
    object CdsClientNoCPF: TStringField
      FieldName = 'NoCpf'
      EditMask = '000\.000\-000\-00;1;_'
    end
    object CdsClientNoFone: TStringField
      FieldName = 'NoFone'
      EditMask = '!\(99\)00000-0000;1;_'
    end
    object CdsClientDsEmail: TStringField
      FieldName = 'DsEmail'
      Size = 60
    end
    object CdsClientNoCep: TStringField
      FieldName = 'NoCep'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object CdsClientDsLograd: TStringField
      FieldName = 'DsLograd'
      Size = 60
    end
    object CdsClientDsComple: TStringField
      FieldName = 'DsComple'
      Size = 60
    end
    object CdsClientNmBairro: TStringField
      FieldName = 'NmBairro'
      Size = 60
    end
    object CdsClientNmCidade: TStringField
      FieldName = 'NmCidade'
      Size = 60
    end
    object CdsClientUfEstado: TStringField
      FieldName = 'UfEstado'
      Size = 2
    end
    object CdsClientNmPais: TStringField
      FieldName = 'NmPais'
      Size = 60
    end
    object CdsClientNoLograd: TStringField
      FieldName = 'NoLograd'
      Size = 10
    end
  end
  object DtsClient: TDataSource
    DataSet = CdsClient
    Left = 696
    Top = 312
  end
  object WwwConexa: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 664
    Top = 64
  end
end
