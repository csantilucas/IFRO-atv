
let cont = 0
num = Math.floor(Math.random() * 100);
cont = 1;
quant = 10;
maior = 0;
menor = 100;

while (cont < quant) {//gera numeros aleatorios de 0 a 100, e verifica se o numero gerado é maior ou menor que os numeros gerados anteriormente, se for maior ele substitui o maior, se for menor ele substitui o menor
    cont++;
    let num = Math.floor(Math.random() * 100);
    console.log('numero gerado é:', num);



    for (let i = 0; i < quant; i++) {
        if (num > maior) {// se num for maior que maior, o maior recebe o num gerado ex: num 20 e maior 10, o maior passa a ser 20
            maior = num;
            
        }else if (num < menor) {//verifica se o num gerado é menor que menor que foi definido como 100, se for o menor recebe o num gerado ex: num 20 e manor 100, o menor passa a ser 20
            menor = num;
        }
    }

}

console.log('\no maior numero é:', maior);
console.log('o menor numero é:', menor);


soma = (maior+menor)/2;

console.log('\na media é:', soma);//media do maior e menor

