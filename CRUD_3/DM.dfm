object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 447
  Top = 165
  Height = 454
  Width = 564
  object dbSisRech: TDatabase
    Connected = True
    DatabaseName = 'sisrech'
    LoginPrompt = False
    Params.Strings = (
      'UserName=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252'
      'dialect=3'
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    Left = 240
    Top = 56
  end
end
