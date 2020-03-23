unit conexion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  sqldb, IBConnection ;

const
DatabaseFile = 'prueba.fdb';

var
  Fire: TIBConnection;

IMPLEMENTATION

begin
  Fire:=TIBConnection.Create(nil);
  try
    Fire.HostName := '';
    Fire.DatabaseName := DatabaseFile;
    Fire.Username := 'SYSDBA';
    Fire.Password := 'masterkey';
    Fire.Charset := 'UTF8';
    Fire.Dialect := 3;
    Fire.Params.Add('PAGE_SIZE=16384');

    if (FileExists(DatabaseFile)=false) then
    begin
        writeln('Base de datos '+DatabaseFile+' no existe');
        writeln('Creando la base de datos');
        try
          Fire.CreateDB;
        except
          on E: Exception do
          begin
            writeln('Error creando la base de datos probablemente falten librerias embbed');
            writeln(E.ClassName+'/'+E.Message);
          end;
        end;
        Fire.Close;
    end;
  finally
    Fire.Free;
  end;
end.

