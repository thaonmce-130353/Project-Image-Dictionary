/**
 *
 * @author 
 */
public class Word {
    private long wid;
    private String wText;
    private String wImage;
    private String wVoice;
    private String wPronounce;

    /**
     * constructor
     * @param wid
     * @param wText
     * @param wVoice
     * @param wPronounce 
     * @throws WordException 
     */
    public Word(long wid, String wText, String wImage, String wVoice, String wPronounce) throws WordException {
        this.setWid(wid);
        this.setwText(wText);
        this.setwImage(wImage);
        this.setwVoice(wVoice);
        this.setwPronounce(wPronounce);
    }

    /**
     * get word image
     * @return 
     */
    public String getwImage() {
        return wImage;
    }

    /**
     * set word image
     * @param wImage
     * @throws WordException 
     */
    public void setwImage(String wImage) throws WordException {
        if (wImage.equals("")) {
            throw new WordException("Word image can't be empty!");
        } else {
            this.wImage = wImage;
        }
    }

    /**
     * get word id
     * @return 
     */
    public long getWid() {
        return wid;
    }

    /**
     * set word id
     * @param wid 
     * @throws WordException 
     */
    public void setWid(long wid) throws WordException {
        if (wid <= 0) {
            throw new WordException("Word id must be greater than 0");
        } else {
            this.wid = wid;
        }
    }

    /**
     * get word text
     * @return 
     */
    public String getwText() {
        return wText;
    }

    /**
     * set word text
     * @param wText 
     * @throws WordException 
     */
    public void setwText(String wText) throws WordException {
        if (wText.equals("")) {
            throw new WordException("Word text can't be empty!");
        } else {
            this.wText = wText;
        }
    }

    /**
     * get word voice
     * @return 
     */
    public String getwVoice() {
        return wVoice;
    }

    /**
     * set word voice
     * @param wVoice
     * @throws WordException 
     */
    public void setwVoice(String wVoice) throws WordException {
        if (wVoice.equals("")) {
            throw new WordException("Word voice can't be empty!");
        } else {
            this.wVoice = wVoice;
        }
    }

    /**
     * get word pronounce
     * @return 
     */
    public String getwPronounce() {
        return wPronounce;
    }

    /**
     * set word pronounce
     * @param wPronounce
     * @throws WordException 
     */
    public void setwPronounce(String wPronounce) throws WordException {
        if (wPronounce.equals("")) {
            throw new WordException("Word pronounce can't be empty!");
        } else {
            this.wPronounce = wPronounce;
        }
    }
    
    
}
