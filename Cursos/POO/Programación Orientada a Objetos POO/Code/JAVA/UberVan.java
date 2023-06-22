import java.util.ArrayList;
import java.util.Map;

class UberVan extends Car {
    Map<String, Map<String, Integer>> typeCarAccepted;
    ArrayList<String> seatsMaterial;
    private Integer passenger;

    public UberVan(String license, Account driver, Map<String, Map<String, Integer>> typeCarAccepted,
            ArrayList<String> seatsMaterial) {
        // Super hace referencia a la clase padre (Car)
        super(license, driver);
        this.typeCarAccepted = typeCarAccepted;
        this.seatsMaterial = seatsMaterial;

    }

    @Override
    public void setPassenger(Integer passenger) {
        if (passenger == 6) {
            this.passenger = passenger;
        } else {
            System.out.println("Necesitas asignar 6 pasajeros");
        }
    }
}
