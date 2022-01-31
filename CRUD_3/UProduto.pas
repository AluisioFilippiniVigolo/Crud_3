unit UProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, Mask, DBTables;

type
  TfrmProdutos = class(TForm)
    tblProdutos: TTable;
    strngfldProdutosPROCOD: TStringField;
    strngfldProdutosPRODESCRICAO: TStringField;
    tblProdutosPROGRUPO: TSmallintField;
    tblProdutosPROMARCA: TSmallintField;
    tblProdutosPRODEPTO: TSmallintField;
    lbl1: TLabel;
    dbedtPROCOD: TDBEdit;
    dts1: TDataSource;
    lbl2: TLabel;
    dbedtPRODESCRICAO: TDBEdit;
    lbl3: TLabel;
    dbedtPROGRUPO: TDBEdit;
    lbl4: TLabel;
    dbedtPROMARCA: TDBEdit;
    lbl5: TLabel;
    dbedtPRODEPTO: TDBEdit;
    lblProdutos: TLabel;
    dbnvgr1: TDBNavigator;
    btnAdicionar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    tblMarca: TTable;
    tblGrupo: TTable;
    tblDepto: TTable;
    strngfldGrupoGRPNOME: TStringField;
    strngfldMarcaMARNOME: TStringField;
    strngfldDeptoDEPNOME: TStringField;
    tblGrupoGRPCOD: TSmallintField;
    tblMarcaMARCOD: TSmallintField;
    tblDeptoDEPCOD: TSmallintField;
    dtsGrupo: TDataSource;
    dtsMarca: TDataSource;
    dtsDepto: TDataSource;
    dbedtGrupo: TDBEdit;
    dbedtMarca: TDBEdit;
    dbedtDepto: TDBEdit;
    rgModoDeIncremento: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dbedtPROGRUPOExit(Sender: TObject);
    procedure dbedtPROMARCAExit(Sender: TObject);
    procedure dbedtPRODEPTOExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure rgModoDeIncrementoClick(Sender: TObject);
  private
    procedure PreencherNomeGrupo();
    procedure PreencherNomeMarca();
    procedure PreencherNomeDepto();
    procedure PreencherCampos();
    procedure HabilitarGrupoDeBotoesEsquerdo(AHabilitar: Boolean);
    procedure HabilitarFormulario(AHabilitar: Boolean);
    procedure LimparCamposGrupoMarcaDepto();
    function LocalizarUltimoCodigoNumerico(): Integer;
  public

  end;

var
  frmProdutos: TfrmProdutos;

const
  ORDEM_AUTOMATICA = Integer(0);
  ORDEM_MANUAL = Integer(1);

type
  IIncremento = interface
  ['{AFD9C574-C51E-4206-8152-0E1EB2226EFA}']
    procedure IncremenatarCodigoProduto();
  end;

implementation

{$R *.dfm}

type
  TAutomatico = class(TInterfacedObject, IIncremento)
  public
    procedure IncremenatarCodigoProduto();
  end;

  TManual = class(TInterfacedObject, IIncremento)
  public
    procedure IncremenatarCodigoProduto();
  end;

procedure TfrmProdutos.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
  PreencherCampos();
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  PreencherCampos();
  HabilitarGrupoDeBotoesEsquerdo(True);
  HabilitarFormulario(False);
end;

procedure TfrmProdutos.PreencherCampos();
begin
  PreencherNomeGrupo();
  PreencherNomeMarca();
  PreencherNomeDepto();
end;

procedure TfrmProdutos.PreencherNomeDepto();
begin
  if(IntToStr(tblProdutosPRODEPTO.AsInteger) = EmptyStr) then
    Exit;
  if(not tblDepto.Locate('DEPCOD' , tblProdutosPRODEPTO.AsInteger, [])) then
  begin
    raise Exception.CreateFmt('Departamento "%s" não localizado.', [dbedtPROGRUPO.Text]);
    dbedtPROGRUPO.SetFocus();
  end;
end;

procedure TfrmProdutos.PreencherNomeGrupo();
begin
  if(IntToStr(tblProdutosPROGRUPO.AsInteger) = EmptyStr) then
    Exit;
  if(not tblGrupo.Locate('GRPCOD', tblProdutosPROGRUPO.AsInteger, [])) then
  begin
    raise Exception.CreateFmt('Grupo "%s" não localizado.', [dbedtPROMARCA.Text]);
    dbedtPROMARCA.SetFocus();
  end;
end;

procedure TfrmProdutos.PreencherNomeMarca();
begin
  if(IntToStr(tblMarcaMARCOD.AsInteger) = EmptyStr) then
    Exit;
  if(not tblMarca.Locate('MARCOD', dbedtPROMARCA.Text, [])) then
  begin
    raise Exception.CreateFmt('Marca "%s" não localizada', [dbedtPROMARCA.Text]);
    dbedtPRODEPTO.SetFocus();
  end;
end;

procedure TfrmProdutos.dbedtPROGRUPOExit(Sender: TObject);
begin
  PreencherNomeGrupo();
end;

procedure TfrmProdutos.dbedtPROMARCAExit(Sender: TObject);
begin
  PreencherNomeMarca();
end;

procedure TfrmProdutos.dbedtPRODEPTOExit(Sender: TObject);
begin
  PreencherNomeDepto();
end;

procedure TfrmProdutos.HabilitarGrupoDeBotoesEsquerdo(AHabilitar: Boolean);
begin
  btnAdicionar.Enabled := AHabilitar;
  btnAlterar.Enabled := AHabilitar;
  btnExcluir.Enabled := AHabilitar;
  btnSalvar.Enabled := not(AHabilitar);
  btnCancelar.Enabled := not(AHabilitar);
end;

procedure TfrmProdutos.HabilitarFormulario(AHabilitar: Boolean);
begin
  dbedtPROCOD.Enabled := False;
  dbedtPRODESCRICAO.Enabled := AHabilitar;
  dbedtPROGRUPO.Enabled := AHabilitar;
  dbedtGrupo.Enabled := False;
  dbedtPROMARCA.Enabled := AHabilitar;
  dbedtMarca.Enabled := False;
  dbedtPRODEPTO.Enabled := AHabilitar;
  dbedtDepto.Enabled := False;
end;

procedure TfrmProdutos.LimparCamposGrupoMarcaDepto;
begin
  dbedtGrupo.Clear();
  dbedtMarca.Clear();
  dbedtDepto.Clear();
end;

procedure TfrmProdutos.btnAdicionarClick(Sender: TObject);
var
   ultimoCodigoProduto: string;
begin
  //Configuração da form
  HabilitarGrupoDeBotoesEsquerdo(False);
  HabilitarFormulario(True);
  LimparCamposGrupoMarcaDepto();
  dbedtPROCOD.Enabled := True;
  //Operações com tabelas
  tblProdutos.Last();
  ultimoCodigoProduto := strngfldProdutosPROCOD.AsString;
  tblProdutos.Insert(); //Todos os campos são limpos
  dbedtPROCOD.Text := ultimoCodigoProduto;
  //liberar memoria
end;

procedure TfrmProdutos.btnAlterarClick(Sender: TObject);
begin
  HabilitarGrupoDeBotoesEsquerdo(False);
  HabilitarFormulario(True);
  tblProdutos.Edit();
  dbedtPRODESCRICAO.SetFocus();
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
  HabilitarGrupoDeBotoesEsquerdo(False);
end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
  HabilitarGrupoDeBotoesEsquerdo(True);
  if(dbedtPRODESCRICAO.Text = '') then
  begin
    messagedlg('Campo Descrição Obrigatório', mtError, [mbOk],0);
    dbedtPRODESCRICAO.SetFocus();
    HabilitarGrupoDeBotoesEsquerdo(False);
    Exit;;
  end;
  if(dbedtPROGRUPO.Text = '') then
  begin
    MessageDlg('Campo Grupo Obrigatório', mtError, [mbOK], 0);
    HabilitarGrupoDeBotoesEsquerdo(False);
    dbedtPROGRUPO.SetFocus();
    Exit;
  end;
  if(dbedtPROMARCA.Text = '') then
  begin
    MessageDlg('Campo Marca Obrigatório', mtError, [mbOK], 0);
    HabilitarGrupoDeBotoesEsquerdo(False);
    dbedtPROMARCA.SetFocus();
    Exit;
  end;
  if(dbedtPRODEPTO.Text = '') then
  begin
    MessageDlg('Campo Departamento Obrigatório', mtError, [mbOK], 0);
    HabilitarGrupoDeBotoesEsquerdo(False);
    dbedtPRODEPTO.SetFocus();
    Exit;
  end;
  tblProdutos.Post();
  HabilitarFormulario(False);
  HabilitarGrupoDeBotoesEsquerdo(True);
end;

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
  HabilitarFormulario(False);
  HabilitarGrupoDeBotoesEsquerdo(True);
end;

function TfrmProdutos.LocalizarUltimoCodigoNumerico: Integer;
begin
  Result := StrToInt(strngfldProdutosPROCOD.AsString) - 1;
end;

procedure TfrmProdutos.rgModoDeIncrementoClick(Sender: TObject);
begin
  case rgModoDeIncremento.ItemIndex of
    ORDEM_AUTOMATICA:
    begin
      dbedtPROCOD.Enabled := False;
      TAutomatico.Create().IncremenatarCodigoProduto;
    end;
    ORDEM_MANUAL:
      dbedtPROCOD.Enabled := True;
  end;
end;


{ TAutomatico }

procedure TAutomatico.IncremenatarCodigoProduto();
var
  codigoProduto: Integer;
begin
  codigoProduto := frmProdutos.LocalizarUltimoCodigoNumerico();   //codigoProduto := StrToInt(frmProdutos.strngfldProdutosPROCOD.AsString);
  Inc(codigoProduto);
  frmProdutos.strngfldProdutosPROCOD.AsString := IntToStr(codigoProduto);
end;

{ TManual }

procedure TManual.IncremenatarCodigoProduto();
var
  codigoProduto: Integer;
begin
  ShowMessage('Executei');
end;

end.
