
package DBLib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 
 */
public class ConnectionLib {
    public static Connection getConnection() throws SQLException {
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try {
                return DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ImageDictionary;user=sa;password=123456");
            } catch (SQLException ex) {
                Logger.getLogger(ConnectionLib.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionLib.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
