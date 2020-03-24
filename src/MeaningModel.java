
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
 * @author 
 */
public class MeaningModel {
    private ArrayList<Meaning> meanings;
    Statement st;
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    /**
     * constructor
     * @throws MeaningException
     */
    public MeaningModel() throws MeaningException {
        this.meanings = new ArrayList<>();
        SelectMeaning();
    }
    
    /**
     * insert new meaning to database
     * @param tId
     * @param wId
     * @param mText
     * @throws SQLException 
     */
    public void InsertMeaning(long tId, long wId, String mText) throws SQLException {
        String sqlStr = "INSERT INTO Meaning(tId, wId, mText) VALUES (?,?,?)";
        con = ConnectionLib.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setLong(1, tId);
        pst.setLong(2, wId);
        pst.setString(3, mText);

        pst.executeUpdate();
    }

    /**
     * update meaning in database
     * @param tId
     * @param wId
     * @param mText
     * @throws SQLException 
     */
    public void UpdateMeaning(long tId, long wId, String mText) throws SQLException {
        String sqlStr = "UPDATE Meaning SET mText=?, tId=? WHERE wId=?";
        con = ConnectionLib.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, mText);
        pst.setLong(2, tId);
        pst.setLong(3, wId);

        pst.executeUpdate();
    }
    
    /**
     * load data from database and add to ArrayList
     * @return
     * @throws MeaningException 
     */
    public ArrayList<Meaning> SelectMeaning() throws MeaningException {
        try {
            con = ConnectionLib.getConnection();
            st = con.createStatement();
            String sqlStr = "SELECT * FROM Meaning";
            rs = st.executeQuery(sqlStr);
            while (rs.next()) {
                long tid = rs.getLong("tId");
                long wid = rs.getLong("wId");
                String mtext = rs.getString("mText");
                this.meanings.add(new Meaning(tid, wid, mtext));
            }
        } catch (SQLException e) {
            Logger.getLogger(ImageDictionary.class.getName()).log(Level.SEVERE, null, e);
        }
        return this.meanings;
    }
    
    /**
     * Gets meaning that belongs to word that identifies by word id
     * @param wId
     * @return 
     */
    public String getMeanings(long wId) {
        for (int i = 0; i < this.meanings.size(); i++) {
            Meaning m = this.meanings.get(i);
            if (m.getM_wid() == wId) {
                return m.getmText();
            }
        }
        return null;
    }
    
    /**
     * get type word with word id
     * @param wid
     * @return type id
     */
    public long getType(long wid){
        for (int i = 0; i < meanings.size(); i++) {
            Meaning m = this.meanings.get(i);
            if (m.getM_wid() == wid) {
                return m.getM_tid();
            }
        }
        return -1;
    }
    
}
