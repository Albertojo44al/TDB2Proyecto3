unit hex2dec_f;


interface

uses
  Classes, SysUtils, math;

  function ib_util_malloc(l: integer): pointer; cdecl; external 'ib_util.dll';

  function hex2dec(const hex_input : PAnsiChar) : integer; cdecl; export;

implementation

  function hex2dec(const hex_input : PAnsiChar) : integer;cdecl;
  var
    hex : string;
    dec : double;
    err : boolean;
    c1, c2 : longint;
    resultado:integer;

  begin
    err := false;
    hex := (string(hex_input));
    c1 := 1;
    c2 := 0;
    dec := 0;

    for c1 := 1 to length(hex) do
      begin
        c2 := length(hex) - c1;
        case hex[c1] of
          '0' : dec := dec + 0;
          '1' : dec := dec + power(16, c2);
          '2' : dec := dec + 2 * power(16, c2);
          '3' : dec := dec + 3 * power(16, c2);
          '4' : dec := dec + 4 * power(16, c2);
          '5' : dec := dec + 5 * power(16, c2);
          '6' : dec := dec + 6 * power(16, c2);
          '7' : dec := dec + 7 * power(16, c2);
          '8' : dec := dec + 8 * power(16, c2);
          '9' : dec := dec + 9 * power(16, c2);
          'a', 'A' : dec := dec + 10 * power(16, c2);
          'b', 'B' : dec := dec + 11 * power(16, c2);
          'c', 'C' : dec := dec + 12 * power(16, c2);
          'd', 'D' : dec := dec + 13 * power(16, c2);
          'e', 'E' : dec := dec + 14 * power(16, c2);
          'f', 'F' : dec := dec + 15 * power(16, c2);
          else
            err := true;
          end;
        end;
    resultado := trunc(dec);
    if err then resultado := 0;
    result := resultado;
      end;
end.
