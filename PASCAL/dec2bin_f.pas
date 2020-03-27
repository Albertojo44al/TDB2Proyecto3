
unit dec2bin_f;

interface

uses
Classes, SysUtils;

function dec2bin(var dec : integer) : integer;cdecl; export;

implementation

function dec2bin(var dec : integer) : integer;cdecl;
var
i, d : integer;
r_str : String;
str : String;
st : String;
begin
 r_str :='';
str :='';
st :='';
while dec > 0 do
begin
  d := dec mod 2;
  dec := dec div 2;
  st := IntToStr(d);
  str := str + st;
end;

for i := 0 to (Length(str) - 1) do
begin
  r_str:= r_str+Copy(str, Length(str) - i, 1);
end;

result := StrToInt(r_str);
end;
end.
