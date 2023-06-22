import java.util.ArrayList;
import java.util.Map;

class UberBlack extends Car {
    Map<String, ArrayList<String>> typeCarAccepted;
    ArrayList<String> seatsMaterial;

    public UberBlack(String license, Account driver, Map<String, ArrayList<String>> typeCarAccepted, ArrayList<String> seatsMaterial) {
        // Super hace referencia a la clase padre (Car)
        super(license, driver);
        this.typeCarAccepted = typeCarAccepted;
        this.seatsMaterial = seatsMaterial;
        
    }
}
