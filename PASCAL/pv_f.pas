unit pv_f;

interface

uses
  Classes, SysUtils,math;
  function PV(var monto,porcentaje,periodos : integer): integer;cdecl; export;
implementation

  function PV(var monto,porcentaje, periodos : integer) : integer;cdecl;
  var resultado: Double;
  begin
        resultado:= (1-((power((1 + (porcentaje/100)), -periodos))));
        resultado:= resultado/(porcentaje/100);
        resultado:= monto*resultado;
        result:= Trunc(resultado);
  end;

end.
