object frmProdutos: TfrmProdutos
  Left = 398
  Top = 152
  Width = 592
  Height = 412
  Caption = 'Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 64
    Top = 80
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = dbedtPROCOD
  end
  object lbl2: TLabel
    Left = 64
    Top = 120
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = dbedtPRODESCRICAO
  end
  object lbl3: TLabel
    Left = 64
    Top = 160
    Width = 29
    Height = 13
    Caption = 'Grupo'
    FocusControl = dbedtPROGRUPO
  end
  object lbl4: TLabel
    Left = 64
    Top = 200
    Width = 30
    Height = 13
    Caption = 'Marca'
    FocusControl = dbedtPROMARCA
  end
  object lbl5: TLabel
    Left = 64
    Top = 240
    Width = 67
    Height = 13
    Caption = 'Departamento'
    FocusControl = dbedtPRODEPTO
  end
  object lblProdutos: TLabel
    Left = 232
    Top = 32
    Width = 137
    Height = 40
    Caption = 'Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -35
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbedtPROCOD: TDBEdit
    Left = 64
    Top = 96
    Width = 105
    Height = 21
    DataField = 'PROCOD'
    DataSource = dts1
    TabOrder = 0
  end
  object dbedtPRODESCRICAO: TDBEdit
    Left = 64
    Top = 136
    Width = 377
    Height = 21
    CharCase = ecUpperCase
    DataField = 'PRODESCRICAO'
    DataSource = dts1
    TabOrder = 1
  end
  object dbedtPROGRUPO: TDBEdit
    Left = 64
    Top = 176
    Width = 105
    Height = 21
    DataField = 'PROGRUPO'
    DataSource = dts1
    TabOrder = 2
    OnExit = dbedtPROGRUPOExit
  end
  object dbedtPROMARCA: TDBEdit
    Left = 64
    Top = 216
    Width = 105
    Height = 21
    DataField = 'PROMARCA'
    DataSource = dts1
    TabOrder = 3
    OnExit = dbedtPROMARCAExit
  end
  object dbedtPRODEPTO: TDBEdit
    Left = 64
    Top = 256
    Width = 105
    Height = 21
    DataField = 'PRODEPTO'
    DataSource = dts1
    TabOrder = 4
    OnExit = dbedtPRODEPTOExit
  end
  object dbnvgr1: TDBNavigator
    Left = 8
    Top = 344
    Width = 112
    Height = 25
    DataSource = dts1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 5
    OnClick = dbnvgr1Click
  end
  object btnAdicionar: TButton
    Left = 128
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 6
    OnClick = btnAdicionarClick
  end
  object btnAlterar: TButton
    Left = 208
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 7
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 288
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 8
    OnClick = btnExcluirClick
  end
  object btnSalvar: TButton
    Left = 392
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 9
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 472
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object dbedtGrupo: TDBEdit
    Left = 176
    Top = 176
    Width = 265
    Height = 21
    DataField = 'GRPNOME'
    DataSource = dtsGrupo
    TabOrder = 11
  end
  object dbedtMarca: TDBEdit
    Left = 176
    Top = 216
    Width = 265
    Height = 21
    DataField = 'MARNOME'
    DataSource = dtsMarca
    TabOrder = 12
  end
  object dbedtDepto: TDBEdit
    Left = 176
    Top = 256
    Width = 265
    Height = 21
    DataField = 'DEPNOME'
    DataSource = dtsDepto
    TabOrder = 13
  end
  object rgModoDeIncremento: TRadioGroup
    Left = 176
    Top = 80
    Width = 265
    Height = 41
    Caption = 'Modo de Incremento'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Autom'#225'tico'
      'Manual')
    TabOrder = 14
    OnClick = rgModoDeIncrementoClick
  end
  object tblProdutos: TTable
    Active = True
    DatabaseName = 'sisrech'
    TableName = 'TPRODUTOS'
    Left = 504
    Top = 16
    object strngfldProdutosPROCOD: TStringField
      FieldName = 'PROCOD'
      Required = True
    end
    object strngfldProdutosPRODESCRICAO: TStringField
      FieldName = 'PRODESCRICAO'
      Size = 200
    end
    object tblProdutosPROGRUPO: TSmallintField
      FieldName = 'PROGRUPO'
    end
    object tblProdutosPROMARCA: TSmallintField
      FieldName = 'PROMARCA'
    end
    object tblProdutosPRODEPTO: TSmallintField
      FieldName = 'PRODEPTO'
    end
  end
  object dts1: TDataSource
    DataSet = tblProdutos
    Left = 504
    Top = 56
  end
  object tblMarca: TTable
    Active = True
    DatabaseName = 'sisrech'
    TableName = 'TMARCA'
    Left = 528
    Top = 216
    object strngfldMarcaMARNOME: TStringField
      FieldName = 'MARNOME'
      Size = 30
    end
    object tblMarcaMARCOD: TSmallintField
      FieldName = 'MARCOD'
      Required = True
    end
  end
  object tblGrupo: TTable
    Active = True
    DatabaseName = 'sisrech'
    TableName = 'TGRUPO'
    Left = 528
    Top = 176
    object strngfldGrupoGRPNOME: TStringField
      FieldName = 'GRPNOME'
      Size = 30
    end
    object tblGrupoGRPCOD: TSmallintField
      FieldName = 'GRPCOD'
      Required = True
    end
  end
  object tblDepto: TTable
    Active = True
    DatabaseName = 'sisrech'
    TableName = 'TDEPARTAMENTO'
    Left = 528
    Top = 256
    object strngfldDeptoDEPNOME: TStringField
      FieldName = 'DEPNOME'
      Size = 30
    end
    object tblDeptoDEPCOD: TSmallintField
      FieldName = 'DEPCOD'
      Required = True
    end
  end
  object dtsGrupo: TDataSource
    DataSet = tblGrupo
    Left = 488
    Top = 176
  end
  object dtsMarca: TDataSource
    DataSet = tblMarca
    Left = 488
    Top = 216
  end
  object dtsDepto: TDataSource
    DataSet = tblDepto
    Left = 488
    Top = 256
  end
end
