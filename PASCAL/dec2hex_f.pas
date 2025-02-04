unit dec2hex_f;

interface

uses
  Classes, SysUtils;

  function ib_util_malloc(l: integer): pointer; cdecl; external 'ib_util.dll';

  function dec2hex(var dec : integer) : PAnsiChar;cdecl; export;

implementation

  function dec2hex(var dec : integer) : PAnsiChar;cdecl;
  var
      h : integer;
      hexes, hex : string;
  begin
       hexes := '0123456789ABCDEF';
       hex := '';

       repeat
         h := dec mod 16;
         dec := dec div 16;
         hex := concat(hexes[h+1], hex);
       until dec < 1;

       result := ib_util_malloc(length(hex) + 1);
       strpcopy(result, ansistring(hex));
  end;

end.

