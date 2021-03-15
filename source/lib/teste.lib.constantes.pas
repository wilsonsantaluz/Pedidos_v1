unit teste.lib.constantes;

interface

uses
  IniFiles,

  SysUtils;

var
  _CT_DB_NAME: string;
  _CT_DB_HOST: string;
  _CT_DB_USER: string;
  _CT_DB_PASSWORD: string;
  _CT_DRIVER: string;

implementation

procedure checkFileConfig();
var
  iniConfig: Tinifile;
  oFile: string;
begin
  oFile := ExtractFilePath(GetModuleName(HInstance)) + 'testeApp.ini';

  iniConfig := Tinifile.Create(oFile);
  try
    _CT_DB_NAME := iniConfig.ReadString('DBCONFIG', 'DATABASENAME',
      'F5XCdPndlD');
    _CT_DB_HOST := iniConfig.ReadString('DBCONFIG', 'SERVERNAME',
      'remotemysql.com');
    _CT_DB_USER := iniConfig.ReadString('DBCONFIG', 'USERNAME', 'F5XCdPndlD');
    _CT_DB_PASSWORD := iniConfig.ReadString('DBCONFIG', 'PASSWORD',
      'jqtYtgIXhS');
    _CT_DRIVER := iniConfig.ReadString('DBCONFIG', 'DRIVER', 'MySQL');;
  finally
    FreeAndNil(iniConfig);
  end;

end;

initialization

checkFileConfig();

end.
