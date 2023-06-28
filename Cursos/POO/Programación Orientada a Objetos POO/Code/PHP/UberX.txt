<?php
require_once('Car.php');

class UberX extends Car
{
    public $brand;
    public $model;
    protected $passenger;

    public function __construct($license, $driver, $brand, $model)
    {
        // paent hace referencia a la clase padre
        parent::__construct($license, $driver);
        $this->brand = $brand;
        $this->model = $model;
    }

    public function setPassenger($passenger)
    {
        if ($passenger == 4) {
            $this->passenger = $passenger;
        } else {
            echo "Necesitas asignar 4 pasajeros";
        }
    }
}
?>