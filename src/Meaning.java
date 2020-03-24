/**
 *
 * @author 
 */
public class Meaning {
    private long m_wid;
    private long m_tid;
    private String mText;

    /**
     * constructor
     * @param m_wid
     * @param m_tid
     * @param mText 
     * @throws MeaningException 
     */
    public Meaning(long m_tid, long m_wid, String mText) throws MeaningException {
        this.setM_wid(m_wid);
        this.setM_tid(m_tid);
        this.setmText(mText);
    }

    /**
     * get meaning id
     * @return id
     */
    public long getM_wid() {
        return m_wid;
    }

    /**
     * set word id
     * @param m_wid 
     * @throws MeaningException 
     */
    public void setM_wid(long m_wid) throws MeaningException {
        if (m_wid <= 0) {
            throw new MeaningException("Word id must be greater than 0!");
        } else {
            this.m_wid = m_wid;
        }
    }

    /**
     * get type id
     * @return id
     */
    public long getM_tid() {
        return m_tid;
    }

    /**
     * set type id
     * @param m_tid
     * @throws MeaningException 
     */
    public void setM_tid(long m_tid) throws MeaningException {
        if (m_tid <= 0) {
            throw new MeaningException("Type id must be greater than 0!");
        } else {
            this.m_tid = m_tid;
        }
    }

    /**
     * get meaning text
     * @return mean
     */
    public String getmText() {
        return mText;
    }

    /**
     * set meaning text
     * @param mText
     * @throws MeaningException 
     */
    public void setmText(String mText) throws MeaningException {
        if (mText.equals("")) {
            throw new MeaningException("Meaning text can't be empty!");
        } else {
            this.mText = mText;
        }
    }
    
    
}
