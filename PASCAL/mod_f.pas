unit mod_f;

interface
   function Modulo(var i, j: Integer): Integer; cdecl; export;
implementation
     function Modulo(var i, j: Integer): Integer; cdecl;
begin
if (j = 0) then
result := -1 // just check the boundary condition, and
// return a reasonably uninteresting answer.
else
result := i mod j;
end;
              
end.
 