// herencia de la clase Car
class UberPool extends Car {
    String brand;
    String model;

    public UberPool(String license, Account driver, String brand, String model) {
        // Super hace referencia a la clase padre (Car)
        super(license, driver);
        this.brand = brand;
        this.model = model;
    }
}