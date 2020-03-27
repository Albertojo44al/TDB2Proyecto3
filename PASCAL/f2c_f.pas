unit f2c_f;

interface

uses
  Classes, SysUtils;

function f2c(var fahrenheit : integer) : integer;cdecl; export;

implementation

function f2c(var fahrenheit : integer) : integer;cdecl;
var
  temporal: integer;
begin
temporal:=0;
  	temporal:= fahrenheit -32;
	  temporal:= temporal * 5;
	  result:= temporal div 9;
end;

end.

