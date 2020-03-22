program TBD2Proyecto3;

{------------------------------------------------------}
function funcionMod (dividendo,divisor:integer):integer;
var
residuo: integer;
begin
	residuo:= dividendo mod divisor;
	funcionMod:= residuo;
end;

{------------------------------------------------------}
function potencias(base:double ;exponente: integer):Double;
var potencia:Double;
begin
      potencia:=1;
      while(exponente>0) do begin
        potencia:=potencia*base;
        exponente:=exponente-1;
      end;
        potencias:= potencia;
end;

function PV(f :integer;r:Double;n:integer):Double;
var resultado:Double;
porcentaje:Double;
begin
      porcentaje:=r / 100;
      resultado:= potencias((1+(porcentaje)),n);
      resultado:= f / resultado;
      PV:=resultado;
end;
{------------------------------------------------------}
function funcionBIN2DEC(numero:string):integer;
var
  i, longitud,bit: byte;
  acumulador:Double =0;
begin
  longitud:= length(numero);
  for i:=longitud downto 1 do begin
	  val(numero[i],bit);
	  acumulador+= bit*potencias(2,longitud-i);
  end;
  funcionBIN2DEC:=Trunc(acumulador);
end;
{------------------------------------------------------}
function funcionDEC2BIN(numero:integer):string;
var
resto:string;
begin
	funcionDEC2BIN:='';
	while numero >= 2 do begin
		str(numero mod 2, resto);
		funcionDEC2BIN:=resto + funcionDEC2BIN;
		numero:= numero div 2;
	end;
	str(numero,resto);
	funcionDEC2BIN:= resto + funcionDEC2BIN;
end;
{------------------------------------------------------}
function C2F(celsius: integer):integer;
var
temporal: integer =0;
begin
	temporal:= celsius*9;
	temporal:= temporal div 5;
	C2F:= temporal+32;
end;

{------------------------------------------------------}
function F2C(fahrenheit: integer):integer;
var
temporal: integer =0;
begin
	temporal:= fahrenheit -32;
	temporal:= temporal * 5;
	F2C:= temporal div 9;
end;

{------------------------------------------------------}
var
opcion: integer;
resultado: integer;
resultadoString: String;
begin
{test_odbc_dsnless('prueba de conexion','Server=localhost', 'User=SYSDBA', 'Password=masterkey', 'Database=C:\Users\alberto jose lopez\Desktop\uni\tri 9\Teoria de base de datos 2\segundo parcial\lazarus Proyecto en pascal\FBDB.GDB');    }
opcion:=0;
while(opcion<>13)do
	begin
	writeln();writeln();
	writeln('1. MOD');
	writeln('2. PV');
	writeln('3. BIN2DEC');
	writeln('4. DEC2BIN');
	writeln('5. C2F');
	writeln('6. F2C');
	writeln('13. Salir');
	writeln('Ingrese una opcion: ');
	readln(opcion);
		case opcion of
			1: begin
				writeln();
				resultado:=funcionMod(18,5);
				writeln('el residuo es:',resultado);
				end;
			2: begin
				writeln();
                                resultado:=Trunc(PV(500,0.05,5));
                                writeln();
				writeln('el resultado es: ',resultado);
				end;
			3: begin
				writeln();
				resultado:=funcionBIN2DEC('111110');
				writeln();
				writeln('el numero decimal es: ',resultado);
				end;
			4: begin
				writeln();
				resultadoString:= funcionDEC2BIN(48);
				writeln();
				writeln('el numero binario es: ',resultadoString);
				end;
			5: begin
				writeln();
				resultado:=C2F(30);
				writeln();
				writeln('En grados Fahrenheit: ',resultado,' F');
				end;
			6: begin
				writeln();
				resultado:=F2C(86);
				writeln();
				writeln('En grados Celsius: ',resultado,' C');
				end;
			else
				begin
				writeln('opcion incorrecta');
				end;
			end;
	end;
end.

