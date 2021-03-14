unit teste.lib.util;

interface

uses
  system.sysutils,
  system.classes

    ;

type
  Tutil = class
  private
  public
    class function isvalInteger(value: string): Boolean;
    class function isvalFloat(value: string): Boolean;
    class function SoNumeros(Text: string): string;
  end;

implementation

{ Tutil }
class function Tutil.SoNumeros(Text: string): string;
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

{ ---------------------------------------------------------------------------- }
class function Tutil.isvalFloat(value: string): Boolean;
var
  ov: double;
begin
  result := false;
  if Tutil.SoNumeros(value) = '' then
    exit;
  result := TryStrToFloat(value, ov)
end;

{ ---------------------------------------------------------------------------- }
class function Tutil.isvalInteger(value: string): Boolean;
var
  i: Integer;
begin
  result := false;
  if Tutil.SoNumeros(value) = '' then
    exit;
  result := TryStrToInt(value, i)
end;

end.
