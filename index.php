<?php

//PHP VERSION (la vedo in basso a dx ==> PHP: 8.2)

/*
istruzioni e dati
DATI:
-integer
-double
-boolean
-string
*/

//le variabili vanno col dolaro davanti, ma non ci metto il tipo!(case sensitive, no caratteri strani, ecc...)

$count = 10;
$list_price = 23.65;
$first_name = 'Gino';//singoli e doppi apici sono equivalenti quasi sempre in php
$first_name2 = "Pino";
$list_valid = true;
$microwave = 3.9e-12;//posso usare le lettere strane matemaitche
echo PHP_INT_MAX;
echo '<br>';//breaak
echo PHP_INT_MIN;

echo '<br>';

const PIGRECO = 3.141516; // costanti dopo php 7.0
define('PIGRECO2',3.141516); //costanti prima di php 7.0
