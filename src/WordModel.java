
import DBLib.ConnectionLib;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javazoom.jl.decoder.JavaLayerException;
import javazoom.jl.player.Player;
import java.awt.Image;
import java.io.IOException;
import javax.swing.JComboBox;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Acer
 */
public class WordModel {

    private ArrayList<Word> words;
    private TypeModel tm;
    private MeaningModel mm;
    Statement st;
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    /**
     * constructor
     *
     * @throws MeaningException
     */
    public WordModel() throws MeaningException {
        this.words = new ArrayList<>();
        mm = new MeaningModel();
        tm = new TypeModel();
    }

    /**
     * insert new word to database
     *
     * @param wText
     * @param wImage
     * @param wVoice
     * @param wPronounce
     * @throws SQLException
     */
    public void InsertWord(String wText, String wImage, String wVoice, String wPronounce) throws SQLException {
        String sqlStr = "INSERT INTO Word(wText, wImage, wVoice, wPronounce) VALUES (?,?,?,?)";
        con = ConnectionLib.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, wText);
        pst.setString(2, wImage);
        pst.setString(3, wVoice);
        pst.setString(4, wPronounce);

        pst.executeUpdate();
    }

    /**
     * update word in database
     *
     * @param wId
     * @param wText
     * @param wImage
     * @param wVoice
     * @param wPronounce
     * @throws SQLException
     */
    public void UpdateWord(long wId, String wText, String wImage, String wVoice, String wPronounce) throws SQLException {
        String sqlStr = "UPDATE Word SET wText=?,wImage=?,wVoice=?,wPronounce=? WHERE wId=?";
        con = ConnectionLib.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, wText);
        pst.setString(2, wImage);
        pst.setString(3, wVoice);
        pst.setString(4, wPronounce);
        pst.setLong(5, wId);

        pst.executeUpdate();
    }

    /**
     * load word in database and add to ArrayList
     *
     * @return
     * @throws WordException
     */
    public ArrayList<Word> SelectWord() throws WordException {
        try {
            con = ConnectionLib.getConnection();
            st = con.createStatement();
            String sqlStr = "SELECT * FROM Word";
            rs = st.executeQuery(sqlStr);
            while (rs.next()) {
                long id = rs.getLong("wId");
                String wtext = rs.getString("wText");
                String wimage = rs.getString("wImage");
                String wvoice = rs.getString("wVoice");
                String wpronounce = rs.getString("wPronounce");
                this.words.add(new Word(id, wtext, wimage, wvoice, wpronounce));
            }
        } catch (WordException | SQLException e) {
            Logger.getLogger(ImageDictionary.class.getName()).log(Level.SEVERE, null, e);
        }
        return this.words;
    }

    /**
     * Finds word by word id and return the index of this word
     *
     * @param wId
     * @return i
     */
    public int findWord(long wId) {
        for (int i = 0; i < this.words.size(); i++) {
            Word a = this.words.get(i);
            if (a.getWid() == wId) {
                return i;
            }
        }
        return -1;
    }

    /**
     * find word with id in ArrayList and set information of word
     *
     * @param wtext
     * @param wMean
     * @param wImage
     * @param wId
     */
    public void FindAndShowWord(JLabel wtext, JLabel wMean, JLabel wImage, long wId) {
        for (int i = 0; i < this.words.size(); i++) {
            Word a = this.words.get(i);
            if (i == wId) {
                wtext.setText(a.getwText() + " /" + a.getwPronounce() + "/");
                wMean.setText(mm.getMeanings(a.getWid()));
                setImage(wImage, a.getwText().toLowerCase());
            }
        }
    }

    /**
     * find word with id in ArrayList and set old information word to dialog update
     * @param wtext
     * @param wMean
     * @param cbb
     * @param wImage
     * @param wVoice
     * @param wPro
     * @param wId
     * @return
     * @throws TypeException
     */
    public String FindAndShowWord(JTextField wtext, JTextField wMean, JComboBox cbb, JTextField wImage, 
            JTextField wVoice, JTextField wPro, long wId) throws TypeException {
        tm.SelectType();
        String tmp = "";
        String path = "C:\\Users\\Acer\\Documents\\NetBeansProjects\\Assignment02_PRJ311\\src\\";
        for (int i = 0; i < this.words.size(); i++) {
            Word a = this.words.get(i);
            if (i == wId) {
                wtext.setText(a.getwText());
                wMean.setText(mm.getMeanings(a.getWid()));
                cbb.setSelectedIndex((int) mm.getType(a.getWid()) - 1);
                wImage.setText(path + "image_Word\\" + a.getwImage());
                wVoice.setText(path + "Voice\\" + a.getwVoice());
                wPro.setText(a.getwPronounce());
                tmp = a.getwText();
                break;
            }
        }
        return tmp;
    }

    /**
     * Finds word by word text and return word id
     *
     * @param userInput
     * @return
     */
    public long search(String userInput) {
        for (int i = 0; i < this.words.size(); i++) {
            Word a = this.words.get(i);
            if (a.getwText().equalsIgnoreCase(userInput)) {
                return a.getWid();
            }
        }
        return -1;
    }

    /**
     * Get word by word id
     *
     * @param wId
     * @return
     */
    public Word getWord(long wId) {
        int idx = this.findWord(wId);
        if (idx == -1) {
            return null;
        } else {
            return this.words.get(idx);
        }
    }

    /**
     * Gets number of words
     *
     * @return
     */
    public int getSize() {
        return words.size();
    }

    /**
     * check input word is exist or not
     *
     * @param wText
     * @return
     */
    public int CheckDuplicate(String wText) {
        for (int i = 0; i < this.words.size(); i++) {
            if (this.words.get(i).getwText().equalsIgnoreCase(wText)) {
                return -1;
            }
        }
        return 1;
    }

    /**
     * UpperCase first
     *
     * @param wText
     * @return
     */
    public String UpperCaseFirst(String wText) {
        String tmp = wText.charAt(0) + "";
        String c = tmp.toUpperCase().charAt(0) + "";
        return wText.replaceFirst(tmp, c);
    }

    /**
     * set all information of word to empty
     *
     * @param wText
     * @param wMean
     * @param wPro
     * @param wVoice
     * @param wImage
     */
    public void ClearInsert(JTextField wText, JTextField wMean, JTextField wPro, JTextField wVoice, JTextField wImage) {
        wText.setText("");
        wMean.setText("");
        wPro.setText("");
        wVoice.setText("");
        wImage.setText("");
    }

    /**
     * set image
     *
     * @param image
     * @param wtext
     */
    public void setImage(JLabel image, String wtext) {
        try {
            image.setIcon(null);
            image.setBounds(10, 11, 414, 86);
            ImageIcon Myimg = new ImageIcon(getClass().getResource("/image_Word/" + wtext + ".jpg"));
            Image img = Myimg.getImage();
            Image newImg = img.getScaledInstance(450, 300, Image.SCALE_SMOOTH);
            ImageIcon Newimage = new ImageIcon(newImg);
            image.setIcon(Newimage);
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }

    /**
     * play file mp3
     *
     * @param voice
     */
    public void PlayMp3(String voice) throws IOException {
        try {
            FileInputStream fis = new FileInputStream("src/voice/" + voice + ".mp3");
            Player playMP3 = new Player(fis);
            playMP3.play();
        } catch (FileNotFoundException | JavaLayerException e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * rename file to
     *
     * @param fileName
     * @param newName
     * @throws Exception
     */
    public void MoveAndRenameFile(File fileName, String newName) throws Exception {
        boolean success = false;
        if (fileName.toString().endsWith(".mp3")) {
            File file2 = new File(newName.toLowerCase() + ".mp3");
            success = fileName.renameTo(file2);
        } else {
            File file2 = new File(newName.toLowerCase() + ".jpg");
            success = fileName.renameTo(file2);
        }
    }

    /**
     * delete file
     *
     * @param source
     * @param nameOldImage
     * @throws IOException
     */
    public void deleteFile(String source, String nameOldImage) throws IOException {
        if (source.endsWith(".jpg")) {
            if (source.equals("C:\\Users\\Acer\\Documents\\NetBeansProjects\\Assignment02_PRJ311\\src\\image_Word\\" + nameOldImage + ".jpg")) {
                return;
            } else {
                File file = new File("C:\\Users\\Acer\\Documents\\NetBeansProjects\\Assignment02_PRJ311\\src\\image_Word\\" + nameOldImage + ".jpg");
                file.delete();
            }
        } else if (source.endsWith(".mp3")) {
            if (source.equals("C:\\Users\\Acer\\Documents\\NetBeansProjects\\Assignment02_PRJ311\\src\\Voice\\" + nameOldImage + ".mp3")) {
                return;
            } else {
                File file = new File("C:\\Users\\Acer\\Documents\\NetBeansProjects\\Assignment02_PRJ311\\src\\Voice\\" + nameOldImage + ".mp3");
                file.delete();
            }
        }
    }

    /**
     * remove all row in table
     *
     * @param model
     */
    public void removeTable(DefaultTableModel model) {
        int i = 0;
        while (i < model.getRowCount()) {
            model.removeRow(i);
        }
    }
}
