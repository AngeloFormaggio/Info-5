<?php

/*
$a = range(1,5);
echo "\n";
echo 'array a prima di func';
print_r($a);
echo "\n";

//array passato per valore
function arr($a)
{
	array_pop($a);
	return ($a);
}
echo "\n";
arr($a);
echo 'array a dopo di func';
print_r($a);

//array passato per riferimento
$b = range(1,5);
echo "\n";
echo 'array b prima di func';
print_r($b);
echo "\n";


function arr1(&$a)
{
	array_pop($a);
	return ($a);
}
echo "\n";
arr1($b);
echo 'array b dopo di func';
print_r($b);
*/

/*
//posso avere delle costanti nelle funzioni, si chiama default value
function avg(int $a,int $b,int $c = 10) : int// se meto i : e il tipo, mi restituisce quel tipo(ora ad esempio arrotonda perche ho messo int)
{
    if($a <0 || $b < 0)
    {
        return("Media non clacolabile");
    }
    else
    {
        return($a+$b+$c)/3;
    }
}
echo avg(1,45);
echo "\n";
*/

//posso assegnare a una variabile una funzione, passando gli argomrnti giusti quando la creo
function add(int $a,int $b) : int
{
    return $a+$b;
}

function mul(int $a,int $b) : int
{
    return $a*$b;
}

$random = mt_rand(0,1);

if($random == 0)
{
    $function = 'add';//alla variabile function assegno la funz add
}
else
{
    $function = 'mul';
}

echo $function(10,5);
echo "\n";



//funzione di callback, in una funzione come argomento chiamo una altra funzione

function filter($min, $a, $b,$pippo) : void
{
    if($pippo($a,$b) > 30)//funcrion viene chiamata pippo nella nuova funzione, e qui la chiamo per eseguirla
    {
        echo "valore " . $pippo($a,$b);
    }
    else
    {
        echo "Nessun valore rilevato";
    }
}

$a = 5;
$b = 10;
filter(10,$a,$b,$function);//chiamo la func function dentro un altra funzione
echo "\n";






function is_at_least_10($number)
{
    return $number >= 10;
}


function is_less_than_35($number)
{
    return $number < 35;
}

$funzioni = ['is_numeric','is_at_least_10','is_less_than_35'];//faccio una array di funzioni con le mie funzioni e quelle di base di php

function validate($num,$funcs) : bool
{
    $valid = true;
    foreach($funcs as $func)
    {
        $valid = $valid && $func;
    }

    return $valid;
}

echo validate(15,$funzioni) ? 'ok' : 'KO';//if(true) = ok else = KO
echo "\n";


$numeri = [1,2,3,4,5];

$result = array_map(function($n)// callback anonima, non do il nome alla funzione
{
    return $n*$n;
}, $numeri);

print_r($result);