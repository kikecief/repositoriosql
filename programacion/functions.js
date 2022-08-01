function edad(edad){
    if(edad < 18){
        return "Eres menor de edad";
    }else{
        return "Eres mayor de edad";
    }
}

function calculo_envio_impuestos(precio, iva, gastos){
    var i = (precio * iva) / 100;
    return precio + gastos + i;
}

function semaforo(color){
    switch(color){
        case "rojo":
            return "No puedes pasar";
        case "ambar":
            return "Pasa con precaucion";
        case "verde":
            return "Puedes pasar";
        default:
            return "No es color de semaforo";
    }
}

function capicua(numero){
    var tmp = numero;
    var res = 0;
    var reves = 0;
    do{
        res = tmp%10;
        tmp = Math.floor(tmp/10);
        if(tmp > 9) reves = (reves + res) * 10;
        else reves = reves + res;
    }while(tmp > 10);
    reves = (reves * 10) + tmp;
    if(reves == numero){
        return numero+" es capicua";
    }else{
        return numero+" no es capicua";
    }
}