/**
 *
 * @author 
 */
public class WordException extends Exception{

    /**
     * constructor
     * @param string 
     */
    public WordException(String string) {
        super("WordException: " + string);
    }
    
}
