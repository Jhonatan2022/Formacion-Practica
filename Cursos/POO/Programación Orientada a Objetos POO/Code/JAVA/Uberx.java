// herencia de la clase Car
class Uberx extends Car{
    String brand;
    String model;
    

    public Uberx(String license, Account driver, String brand, String model){
        // Super hace referencia a la clase padre (Car)
        super(license, driver);
        this.brand = brand;
        this.model = model;
    }


    @Override
    void printDataCar() {
        super.printDataCar();
        System.out.println("Modelo: " + model + " Marca: " + brand);
    }
}