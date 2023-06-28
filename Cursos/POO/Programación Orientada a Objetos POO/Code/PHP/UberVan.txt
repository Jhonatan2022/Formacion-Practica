<?php
require_once('Car.php');

class UberVan extends Car
{
    public $typeCarAccepted;
    public $seatsMaterial;
    protected $passenger;

    public function __construct($license, $driver, $typeCarAccepted, $seatsMaterial)
    {
        // paent hace referencia a la clase padre
        parent::__construct($license, $driver);
        $this->typeCarAccepted = $typeCarAccepted;
        $this->seatsMaterial = $seatsMaterial;
    }

    public function setPassenger($passenger)
    {
        if ($passenger == 6) {
            $this->passenger = $passenger;
        } else {
            echo "Necesitas asignar 6 pasajeros";
        }
    }
}
?>