let number = 2;
let primos = 0



for (let primos = 0; primos < 20;) {//se a variavel primos for menor que 20, ela vai ser incrementada de 1
    let divisor = 0


    

    for (let i = 2; i < number; i++) {//loop que vai de 2 ate o numero
        if (number % i == 0) {

           divisor++//adiconao de 1 ao divisor
        }



    }
    if (divisor == 0) {  //se o divisor for igual a 0, o numero e primo
        console.log(number, "é primo")
        primos++//incrementa o numero de primos
    }

    number++//incrementa o numero

}


