  
unit bin2dec_f;

interface

uses
  Classes, SysUtils, math;

  function bin2dec(var bin : integer) : integer;stdcall;

implementation

function bin2dec(var bin : integer) : integer;stdcall;
var
  bin_string : string;
  i, len : byte;
  cont : double;
  r : integer;
  float : Extended;
  errorPos : Integer;
begin
  cont:=0;
  bin_string := IntToStr(bin);
  len := Length(bin_string);

  for i := len downto 1 do
  begin
    Val(bin_string[i],float, errorPos);
    cont:= cont+(float*power(2,(len - i)));
  end;
  r := StrToInt(FloatToStr(cont));
  result := r;
end;

end.
