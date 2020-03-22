/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tbd2proyecto3;

import java.sql.SQLException;
import org.sqlite.Function;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;
/**
 *
 * @author alberto jose lopez
 */
public class TBD2Proyecto3 {

    /**
     * @param args the command line arguments
     */
 public static void main(String[] args) throws Exception{
        Scanner sc = new Scanner(System.in);
        Connection c = null;
        try {
            Class.forName("org.sqlite.JDBC");
            c= DriverManager.getConnection("jdbc:sqlite:prueba.db");
            System.out.println("SQLite DB Connected");
            Statement statement = c.createStatement();
            statement.setQueryTimeout(5000);
            
            int opcion = 0;
            while(opcion!=13){
                System.out.println("1. MOD \n"
                    + "2. PV \n"
                    + "3. BIN2DEC \n"
                    + "4. DEC2BIN \n"
                    + "5. C2F \n"
                    + "6. F2C \n"
                    + "7. FACTORIAL \n"
                    + "8. HEX2DEC \n"
                    + "9. DEC2HEX \n"
                    + "10. COMPARESTRING \n"
                    + "11. TRIM \n"
                    + "12. MID \n"
                    + "13. SALIR");
            System.out.print("Ingrese una opcion");
            opcion = sc.nextInt();
                System.out.println("");
                switch(opcion){
                    case 1: 
                        Function.create(c, "MOD", new MOD());
                        statement.execute("select MOD(25,7)");
                        System.out.println("residuo de 25/7: " +statement.getResultSet().getDouble(1)+"\n");
                        break;
                    case 2:
                        Function.create(c, "PV", new PV());
                        statement.execute("select PV(500,5,5)");
                        System.out.println("PV(500,0.05,5): "+statement.getResultSet().getDouble(1)+"\n");
                        break;
                    case 3:
                        Function.create(c, "BIN2DEC", new BIN2DEC());
                        statement.execute("select BIN2DEC('11111111')");
                        System.out.println("Decimal de 11111111: "+statement.getResultSet().getInt(1)+"\n");
                        break;
                    case 4:
                        Function.create(c, "DEC2BIN", new DEC2BIN());
                        statement.execute("select DEC2BIN(255)");
                        System.out.println("Binario de 255: "+statement.getResultSet().getString(1)+"\n");
                        break;
                    case 5:
                        Function.create(c, "C2F", new C2F());
                        statement.execute("select C2F(30)");
                        System.out.println("Fahrenheit de 30° celsius: "+statement.getResultSet().getDouble(1)+"\n");
                        break;
                    case 6:
                        Function.create(c, "F2C", new F2C());
                        statement.execute("select F2C(86)");
                        System.out.println("Celsius de 86° fahrenheit: "+statement.getResultSet().getDouble(1)+"\n");
                        break;
                    case 7:
                        Function.create(c, "FACTORIAL", new FACTORIAL());
                        statement.execute("select FACTORIAL(5)");
                        System.out.println("Factorial de 5: "+statement.getResultSet().getLong(1)+"\n");
                        break;
                    case 8:
                        Function.create(c, "HEX2DEC", new HEX2DEC());
                        statement.execute("select HEX2DEC('FF')");
                        System.out.println("Decimal de Hexadecimal FF: "+statement.getResultSet().getInt(1)+"\n");
                        break;
                    case 9:
                        Function.create(c, "DEC2HEX", new DEC2HEX());
                        statement.execute("select DEC2HEX(255)");
                        System.out.println("Hexadecimal de decimal 255: "+statement.getResultSet().getString(1)+"\n");
                        break;
                    case 10:
                        Function.create(c, "COMPARESTRING", new COMPARESTRING());
                        statement.execute("select COMPARESTRING('HOLA','ADIOS')");
                        System.out.println("Comparacion de HOLA Y ADIOS: "+statement.getResultSet().getInt(1)+"\n");
                        break;
                    case 11: 
                        Function.create(c, "TRIM", new TRIM());
                        statement.execute("select TRIM('ASPALABRAAS','AS')");
                        System.out.println("TRIM(ASPALABRAAS,AS): "+statement.getResultSet().getString(1)+"\n");
                        break;
                    case 12:
                        Function.create(c, "MID", new MID());
                        statement.execute("select MID('prueba',2,3)");
                        System.out.println("MID('prueba',2,3): "+statement.getResultSet().getString(1)+"\n");
                        break;
              }
          }
            
        }catch (ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
    }
}
class MOD extends Function{
    @Override
    protected void xFunc() throws SQLException{
        try{
            double dividendo = value_double(0);
            double divisor = value_double(1);
            double res = dividendo%divisor;
            result(res);
        }catch(SQLException e){
            System.out.println(e);
        }          
    }
}


class PV extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            double monto = value_double(0);
            double porcentaje = value_double(1);
            double periodos = value_double(2);
            double resultado;
            resultado  = (1-((Math.pow((1 + (porcentaje/100.0)), -periodos))));
            resultado = resultado/(porcentaje/100);
            resultado = monto*resultado;
            result(resultado);
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}


class BIN2DEC extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
             String numeroBinario = value_text(0);
             int longitud = numeroBinario.length();
            int resultado = 0;
            int potencia = longitud - 1;
            for(int i = 0;i < longitud;i++){
                if(numeroBinario.charAt(i) == '1'){
                    resultado += Math.pow(2,potencia);
                }
                potencia --;
            }
            result(resultado);
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}

class DEC2BIN extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            int numeroDecimal = value_int(0);
            int temp = numeroDecimal;
        String resultado = "";
        while (temp != 0){
            if(temp % 2 == 0){
                resultado = "0" + resultado;
            }else{
                resultado = "1" + resultado;
            }
            temp = temp / 2;
        }
       result(resultado);
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}

class C2F extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            double celsius = value_double(0);
            double fahrenheit;
            fahrenheit = celsius*1.8;
            fahrenheit+=32;
            result(fahrenheit);
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}
class F2C extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            double fahrenheit = value_double(0);
            double celsius;
            celsius= fahrenheit-32;
            celsius = celsius / 1.8;
            result(celsius);
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}
class FACTORIAL extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            int f = value_int(0);
            long res = this.factorialRecursive(f);
            result(res);
        }catch (SQLException e){
            System.out.println(e);
        }
    }

    long factorialRecursive( long n )
    {
        return n==0 ? 1 : n * factorialRecursive( n-1 );
    }
}

class HEX2DEC extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            String hex = value_text(0);
            result(hex2Decimal(hex));
        }catch (SQLException e){
            System.out.println(e);
        }
    }
    Long hex2Decimal(String s) {
        String digits = "0123456789ABCDEF";
        s = s.toUpperCase();
        Long sixteen = new Long("16");
        Long bigVal = new Long("0");
        //  int val = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            int d = digits.indexOf(c);
            Long bigD = new Long(String.valueOf(d));
            bigVal = (bigVal*16) + bigD;
//            bigVal = (bigVal.multiply(sixteen)).add(bigD);
            //  val = 16 * val + d;
        }
        // return val;
        return bigVal;
    }
}

class DEC2HEX extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            int f = value_int(0);
            result(Integer.toHexString(f));
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}

class COMPARESTRING extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            String p1 = value_text(0);
            String p2 = value_text(1);
             if(p1.compareTo(p2) ==0)
            result(0);
        else if(p1.compareTo(p2) < 0)
             result(1);
        else
             result(-1);
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}
class TRIM extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            String s1 = value_text(0);
            String s2 = value_text(1);
            result(s1.replaceAll(s2 + "+$|^" + s2 + "+",""));
        }catch (SQLException e){
            System.out.println(e);
        }
    }
}
class MID extends Function{
    @Override
    protected void xFunc() throws SQLException {
        try {
            String nuevaPalabra="";
            String palabra = value_text(0);
            int inicio = value_int(1);
            int cantidad = value_int(2);
            for(int i = inicio ; i < palabra.length() ; i++){
                 if((i-inicio) == cantidad)
                   break;
               nuevaPalabra+= palabra.charAt(i); 
            }
            result(nuevaPalabra);
        }catch (SQLException e){
            System.out.println(e);
        }
    }
    
    
}
