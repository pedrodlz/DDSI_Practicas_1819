package ddsi_practica_final;
import java.sql.*;
import java.sql.SQLException.*;
import oracle.jdbc.driver.*;
import java.util.Scanner;

public class pedro_aniadir_canciones_a_lista 
{
Connection conn;
Statement stmt;
PreparedStatement pstmt;

    public pedro_aniadir_canciones_a_lista() {
        super();
    }
    public void initialize() throws Exception
    {
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@oracle0.ugr.es:1521/practbd.oracle0.ugr.es",
			"x7151952","x7151952");
        
        conn.setAutoCommit (false);
        
        System.out.println("Conectado con exito");
    }

    public static void main(String[] args) 
    throws Exception
    {
       
        Principal principal = new Principal();       
        principal.initialize();
        
        String menu = "Introduzca una opcion\n" +
                        "1 - Ver listas creadas\n" +
                        "2 - Añadir cancion a una lista\n" +
                        "3 - Crear una lista\n" +
                        "4 - Ver listas con canciones\n" +
                        "0 - Terminar\n";
        String id_lista;
        
        Scanner reader = new Scanner(System.in);  // Reading from System.in
        System.out.println(menu);
        
        int opcion = reader.nextInt();
                
        while(opcion != 0){        
            if(opcion == 1){
                int listaCount = principal.listListas();
                if (listaCount == 0 ){
                    System.out.println ("ERROR: No hay listas");
                }
                else{
                    System.out.println ("Hay " + listaCount + " listas\n");
                }
            }
            else if(opcion == 2){
                String id_cancion;
                
                System.out.println("Introduzca ID_LISTA y ID_CANCION:");            
                id_lista = reader.next();
                id_cancion = reader.next();
                
                int result = principal.insertCancion(id_lista,id_cancion);
                if (result == 0){
                    System.out.println("-Cancion aniadida con exito\n");
                }  
            }
            else if(opcion == 3){
                String nombre_lista;
                String fecha_lista;
                
                System.out.println("Introduzca ID Nombre Fecha('dd/mm/aa')");            
                id_lista = reader.next();
                nombre_lista = reader.next();            
                fecha_lista = reader.next();            
                
                int result = principal.insertLista(id_lista,nombre_lista,
													fecha_lista);
                if (result == 0){
                    System.out.println("-Lista aniadida con exito\n");
                }    
            }
            else if(opcion == 4){
                int listaCount = principal.listListasCanc();
                if (listaCount == 0 ){
                    System.out.println ("ERROR: No hay listas con canciones");
                }
                else{
                    System.out.println ("Hay " + listaCount + 
										" listas con canciones\n");
                }
            }
            
            System.out.println(menu);            
            opcion = reader.nextInt();            
        }
        reader.close();
    }
    
    //Metodo para listar listas
    public int listListas() throws Exception
    {
        String sql = "SELECT * FROM LISTA";
        stmt = conn.createStatement ( );
        ResultSet rset = stmt.executeQuery(sql);
        
        int count = 0;
        while (rset.next ())
        {
        count++;
        System.out.println("ID: " + rset.getString(1) + "\n" +
                           "Nombre: " + rset.getString(2) + "\n" +
                           "Fecha creacion: " + rset.getString(3) + "\n");
        }
        return count;
    }
    
    //Metodo para listar listas
    public int listListasCanc() throws Exception
    {
        String sql = "SELECT * FROM PERTENECE";
        stmt = conn.createStatement ( );
        ResultSet rset = stmt.executeQuery(sql);
        
        int count = 0;
        while (rset.next ())
        {
        count++;
        System.out.println("ID Lista: " + rset.getString(1) + "\n" +
                           "ID Cancion: " + rset.getString(2) + "\n");
        }
        return count;
    }
    
    public int insertLista(String idLista, String nombre, String fecha)
    {
        try
        {
        pstmt = conn.prepareStatement("INSERT INTO LISTA VALUES(?,?,?,NULL)");
        pstmt.setString(1, idLista);
        pstmt.setString(2, nombre);
        pstmt.setString(3, fecha);
        pstmt.executeUpdate();
        conn.commit();
        return 0; // return OK
        }
        catch (SQLException e)
        {
        System.out.println("Error insertando nueva lista" + e);
        return 1; // return error
        }
    }
    
    public int insertCancion(String idLista, String idCancion)
    {
        try
        {
        pstmt = conn.prepareStatement("INSERT INTO PERTENECE VALUES(?,?)");
        pstmt.setString(1, idLista);
        pstmt.setString(2, idCancion);
        pstmt.executeUpdate();
        conn.commit();
        return 0; // return OK
        }
        catch (SQLException e)
        {
        System.out.println("Error aniadiendo cancion a una lista" + e);
        return 1; // return error
        }
    }
}
