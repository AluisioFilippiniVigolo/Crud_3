program CRUD;

uses
  Forms,
  DM in 'DM.pas' {DataModule1: TDataModule},
  UProduto in 'UProduto.pas' {frmProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.Run;
end.
