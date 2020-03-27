unit factorial_f;

interface

uses
  Classes, SysUtils;

function factorial(var number : integer) : integer;cdecl; export;

implementation

function factorial(var number : integer) : integer;cdecl;
var
i,r : integer;
begin
  r := 1;
  for i := 1 to number do
  begin
    r := r*i;
  end;

  result := r;
end;

end.

