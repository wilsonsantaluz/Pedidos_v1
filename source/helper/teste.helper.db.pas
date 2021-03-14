unit teste.helper.db;

interface

uses
  SysUtils, Classes, db;

type
  TFieldHelper = class helper for TField
  public
    function AsDataInvertidaCorrigida: TDateTime;
    function AsStringSoNumeros(RemoverZerosEsquerda: Boolean = True): String;
    function AsStringSemAcentos: String;
    function AsInteiro(Defaul: Integer = 0): Integer;
  end;

implementation


function SoNumeros(Text: string): string;
var
  i: Integer;
begin
  result := '';
  if Text = '' then
    exit;
  for i := 0 to length(Text) do
  begin
    if Text[i] in ['0' .. '9'] then
      result := result + Text[i];
  end;
end;

function doRemoverZerosEsquerda(const Value: String): String;
var
  aux: String;
  i: Integer;
begin
  aux := Trim(Value);
  for i := 0 to length(aux) do
  begin
    if (length(aux) >= 1) then
      if aux[1] <> '0' then
        Break;

    aux := Copy(aux, 2, length(aux));
  end;
  result := aux;
end;

function RemoverAcentos(const Value: String): String;
const
  ComAcento = '‡ËÏÚ˘‚ÍÓÙ˚„ı·ÈÌÛ˙‰ÎÔˆ¸Á¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'aeiouaeiouaoaeiouaeioucAAEOUAOAEIOUCU';
var
  strAux: String;
  i, j: Integer;
begin;
  j := 0;
  strAux := Trim(Value);
  for i := 1 to length(strAux) do
  begin
    j := Pos(strAux[i], ComAcento);
    if j <> 0 then
      strAux[i] := SemAcento[j];
  end;
  result := strAux;
end;

{ TFieldHelper }

function TFieldHelper.AsDataInvertidaCorrigida: TDateTime;
var
  DataInvertida: String;
begin
  DataInvertida := AsString;
  result := StrToDateDef(Copy(DataInvertida, 9, 2) + '/' + Copy(DataInvertida,
    6, 2) + '/' + Copy(DataInvertida, 1, 4), StrToDate('01/01/1900'));
end;

function TFieldHelper.AsStringSemAcentos: String;
begin
  result := RemoverAcentos(AsString);
end;

function TFieldHelper.AsStringSoNumeros(RemoverZerosEsquerda: Boolean): String;
var
  strAux: String;
begin
  strAux := Trim(AsString);
  strAux := SoNumeros(strAux);
  if RemoverZerosEsquerda then
    strAux := doRemoverZerosEsquerda(strAux);
  result := strAux;
end;

function TFieldHelper.AsInteiro(Defaul: Integer): Integer;
begin
  result := StrToIntDef(AsString, Defaul);
end;

end.
