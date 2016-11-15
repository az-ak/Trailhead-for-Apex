public class ParkLocator {
    public static String[] country(String arg0) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(arg0);
    }
}