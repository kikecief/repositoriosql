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