//vamos a tener que obtener los valores de los input

function problema1(){
    var p1_input = document.querySelector('#p1-input').value;

    /*
    tenemos que identificar el espacio
    tenemos que invertir la cadena

    hola como
    como hola
    */ 

    var p1_array = p1_input.split(' ').reverse();

    //contruir una nueva cadena a partir del array invertido

    //comohola

    var p1_res = '';

    p1_array.forEach(function (palabra, i){
        //si estamos al princio o final de la palabra
        // como hola 
        if(i != 0 || i != p1_array.length) p1_res += ' ';
        p1_res += palabra;
    });

    document.querySelector('#p1-output').textContent = p1_res;
}

function problema2(){
    /*
    Para encontrar el minimo producto escalar entre 2 vectores, tenemos que realizar
    las operaciones correspondientes que son el maximo valor de un vector por
    el minimo vector del otro valor 
    
    */ 

    var p2_x1 = document.querySelector('#p2-x1').value;
    var p2_x2 = document.querySelector('#p2-x2').value;
    var p2_x3 = document.querySelector('#p2-x3').value;
    var p2_x4 = document.querySelector('#p2-x4').value;
    var p2_x5 = document.querySelector('#p2-x5').value;

    var p2_y1 = document.querySelector('#p2-y1').value;
    var p2_y2 = document.querySelector('#p2-y2').value;
    var p2_y3 = document.querySelector('#p2-y3').value;
    var p2_y4 = document.querySelector('#p2-y4').value;
    var p2_y5 = document.querySelector('#p2-y5').value;

    //contruir el vector
    var v1 = [p2_x1, p2_x2, p2_x3, p2_x4, p2_x5];
    var v2 = [p2_y1, p2_y2, p2_y3, p2_y4, p2_y5];

    //ordenar los elementos del vector

    v1 = v1.sort(function (a, b){
        return b-a;
    });

    v2 = v2.sort(function (a, b){
        return b-a;
    });

    //invertir el vector
    v2 = v2.reverse();

    //producto
    var p2_producto = 0;

    for(var i = 0; i < v1.length; i++){
        p2_producto += v1[i]*v2[i];
    }

    document.querySelector('#p2-output').textContent = 'Producto escalar minimo :' + p2_producto;


}
function problema3(){
    var car = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var text = document.querySelector('#p3-input').value;
    var text = text.split(" ").join("");
    var cont=0

    for(var i=0;i<text.length;i++){
        for(var k=0;k<car.length;k++){
            if(text[i]==car[k]){
                cont += 1;
                break;
            }else if(text[i]==","){
                cont += 1;
                break;
            }
        }
    }
    if(cont==text.length){
        var words = text.split(",");
        var carUn = new Array(words.length);
        for(var i=0;i<carUn.length;i++){
            carUn[i] = 0;
        }
        var carUnWord = new Array(car.length);
        for(var i=0;i<words.length;i++){
            var wor = words[i];
            for(var k=0;k<carUnWord.length;k++){
                carUnWord[k] = 0;
            }
            for(var k=0;k<car.length;k++){
                for(var j=0;j<wor.length;j++){
                    if(wor[j]==car[k]){
                        carUnWord[k] += 1;
                    }
                }
            }
            for(var k=0;k<carUnWord.length;k++){
                if(carUnWord[k]>0){
                    carUn[i] += 1;
                }
            }
        }
        var max = 0;
        var index;
        for(var i=0;i<carUn.length;i++){
            if(carUn[i]>max){
                max = carUn[i];
                index = i;
            }
        }
        document.querySelector('#p3-output').textContent = 'La palabra : ' + words[index] + ', tiene '+ max +' caracteres especiales';
    }else{
        alert("Ingresaste un caracter invalido")
    }

    

}
/*

problema 3

primero mi alfabeto a - z

identificar la coma   varible.split(',')

eliminar los espacios   

habia, un, patito, que, decia, miau, miau

4 (h, a, b, i)
2 (u, n)
5 (p, a, t, i, o)

variable que se encargue de iterar la palabra
guardando los caracteres unicos


un bucle dentro de otro bucle

wiiiiiiiiiiiiiiii uwu/


*/