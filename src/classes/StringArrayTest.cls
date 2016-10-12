public class StringArrayTest {
    public static String[] generateStringArray(Integer i) {
    	List<String> aaa = new List<String>();
    	for(Integer j=0; j<i; j++) {
    		aaa.add('Test '+j);
    		System.debug(aaa[j]);
    	}
    	return aaa;
    }
}