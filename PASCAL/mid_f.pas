unit mid_f;


interface

uses
  Classes, SysUtils;
  function ib_util_malloc(l: integer): pointer; cdecl; external 'ib_util.dll';
  function MID(cadena: PAnsiChar; var posicion,cantidad: integer):PAnsiChar; cdecl; export;
implementation
  function MID(cadena: PAnsiChar;var posicion,cantidad: integer):PAnsiChar; cdecl;
  var temporal,temporal2:String;
  resultado: PAnsiChar;
  begin
      temporal2:=string(cadena);
      temporal:=copy(temporal2,posicion,cantidad);
      resultado:=PAnsiChar(temporal);
      result := ib_util_malloc(length(resultado) + 1);
      strpcopy(result, ansistring(resultado));
  end;

end.

