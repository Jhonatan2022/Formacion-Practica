<?php

function sumar($a, $b){
    return $a + $b;
}

echo sumar(1, 2);


/***************************
Tener una lista de ciudades
con un clima y una ubicacion
especifica
***************************/

function recomendacion($caracteristica, $tipoCaracteristica){
  
    $weather = array(
      "Bogota" => "frio",
      "Monteria" => "calido",
      "Medellin" => "templado"
    );
  
    $location = array(
      "Guajira" => "norte",
      "Leticia" => "sur",
      "Santander" => "este",
      "Antioquia" => "oeste"
    );
  
    $tourism = array(
      "Santa Marta" => "mar",
      "Villavicencio" => "llanos",
      "Riohacha" => "desierto",
      "Quindio" => "valle"
    );
  
    switch($tipoCaracteristica){
      case "clima":
        echo array_search($caracteristica, $weather);
        break;
      case "ubicacion":
        echo array_search($caracteristica, $location);
        break;
      case "turismo":
        echo array_search($caracteristica, $tourism);
        break;
      default:
        echo "No fue posible encontrar una ciudad con esas caracteristicas o criterios de busqueda, por favor intente nuevamente";
        break;
    }
  }
  
  /***********************************************
  Se debe invocar la función recomendación
  con teniendo en cuenta que el primer parámetro
  de la función es la característica de la ciudad
  y el segundo parámetro es el nombre del caso del
  switch en el cual se va a buscar
  ************************************************/
  recomendacion("valle", "turismo");
?>