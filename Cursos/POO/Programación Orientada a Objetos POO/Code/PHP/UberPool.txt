<?php
require_once('Car.php');

class UberPool extends Car {
    public $brand;
    public $model;

    public function __construct($license, $driver, $brand, $model) {
        // paent hace referencia a la clase padre
        parent::__construct($license, $driver);
        $this->brand = $brand;
        $this->model = $model;
    }
}
?>