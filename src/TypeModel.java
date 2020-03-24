
import DBLib.ConnectionLib;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Acer
 */
public class TypeModel {

    private ArrayList<TypeWord> types;
    Statement st;
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    /**
     * constructor
     */
    public TypeModel() {
        this.types = new ArrayList<>();
    }

    /**
     * insert new Type to database
     * @param tText
     * @throws SQLException 
     */
    public void InsertType(String tText) throws SQLException {
        String sqlStr = "INSERT INTO Type(tText) VALUES (?)";
        con = ConnectionLib.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, tText);

        pst.executeUpdate();
    }

    /**
     * update Type in database
     * @param tId
     * @param tText
     * @throws SQLException 
     */
    public void UpdateType(long tId, String tText) throws SQLException {
        String sqlStr = "UPDATE Type SET tText=? WHERE tId=?";
        con = ConnectionLib.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, tText);
        pst.setLong(2, tId);

        pst.executeUpdate();
    }
    
    /**
     * load type from database and add to ArrayList
     * @return
     * @throws TypeException 
     */
    public ArrayList<TypeWord> SelectType() throws TypeException {
        try {
            con = ConnectionLib.getConnection();
            st = con.createStatement();
            String sqlStr = "SELECT * FROM Type";
            rs = st.executeQuery(sqlStr);
            while (rs.next()) {
                long id = rs.getLong("tId");
                String ttext = rs.getString("tText");
                this.types.add(new TypeWord(id, ttext));
            }
        } catch (SQLException e) {
            Logger.getLogger(ImageDictionary.class.getName()).log(Level.SEVERE, null, e);
        }
        return this.types;
    }

    /**
     * Finds type by type id and return the index of this type
     *
     * @param tId
     * @return
     */
    public int findType(long tId) {
        for (int i = 0; i < this.types.size(); i++) {
            TypeWord a = this.types.get(i);
            if (a.gettId() == tId) {
                return (int) a.gettId();
            }
        }
        return -1;
    }

    /**
     * Finds the type instance by type id
     *
     * @param tId
     * @return
     */
    public TypeWord getType(long tId) {
        int idx = this.findType(tId);
        if (idx == -1) {
            return null;
        } else {
            return this.types.get(idx);
        }
    }
}
