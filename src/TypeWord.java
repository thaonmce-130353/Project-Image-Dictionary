
/**
 * @author 
 */
public class TypeWord {

    private long tId;      //Type id (primary key)
    private String tText; //Type's text

    /**
     * constructor
     * @param tId
     * @param tText
     * @throws TypeException 
     */
    public TypeWord(long tId, String tText) throws TypeException {
        this.settId(tId);
        this.settText(tText);
    }

    /**
     * get type id
     * @return 
     */
    public long gettId() {
        return tId;
    }

    /**
     * set type text
     * @param tId
     * @throws TypeException 
     */
    public void settId(long tId) throws TypeException {
        if (tId <= 0) {
            throw new TypeException("Type's ID must greater than 0");
        } else {
            this.tId = tId;
        }
    }

    /**
     * get type text
     * @return 
     */
    public String gettText() {
        return tText;
    }

    /**
     * set type text
     * @param tText
     * @throws TypeException 
     */
    public void settText(String tText) throws TypeException {
        if (tText.equals("")) {
            throw new TypeException("Type's text can't be empty");
        } else {
            this.tText = tText;
        }
    }

}
