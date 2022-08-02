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

function variables(){
    var numero = 123;
    var decimal = 12.43;
    var boleano = true;
    var cadena = "Soy una cadena";
    var array = ["PHP", "Java", "C#"];

    var objeto_literal = {
        nombre: "Enrique Flo",
        edad: 55,
        ciudad: "Barcelona",
        dos: function (){
            return "dos";
        },
        pasta: function (){
            return "10.560";
        }
    }
    alert("Variables primitivas\n"+numero+", "+decimal+", "+boleano+", "+cadena+"\nArrays\n"+
          array[0]+", "+array[1]+", "+array[2]+"\nObjeto literal\n"+objeto_literal.nombre+", "+objeto_literal["edad"]+
          ", "+objeto_literal["ciudad"]+", "+objeto_literal.dos()+", "+objeto_literal.pasta())
}

function imprimir_numero(num){
    var tmp = num;
    var msg = "while:\n"
    
    while(tmp != 0){
        if(tmp != 1) msg = msg+tmp+", "
        else msg = msg+tmp+"\n";
        tmp--;
    }

    tmp = num;
    msg = msg+"do/while:\n"

    do{
        if(tmp != 1) msg = msg+tmp+", "
        else msg = msg+tmp+"\n";
        tmp--;
    }while(tmp != 0);

    msg = msg+"for:\n"

    for(i = 1; i <= num; i++){
        if(i != num) msg = msg+i+", "
        else msg = msg+i+"\n";
    }

    msg = msg+"for reves:\n"

    for(i = num; i > 0; i--){
        if(i != 1) msg = msg+i+", "
        else msg = msg+i+"\n";
    }

    return msg;
}

function notas(){
    var notas = [3, 5, 7, 2, 5, 9, 6, 5, 10];
    var msg = "Notas: "

    for(var i = 0; i < notas.length; i++){
        msg = msg+"["+notas[i]+"]";
    }

    return msg;
}