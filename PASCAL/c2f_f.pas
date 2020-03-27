unit c2f_f;

interface

uses
  Classes, SysUtils;

function c2f(var celsius : integer) : integer;cdecl; export;

implementation

function c2f(var celsius : integer) : integer;cdecl;
var
 temporal: integer;
begin
temporal:=0;
  temporal:= celsius*9;
	temporal:= temporal div 5;
  result:= temporal+32;
end;

end.
