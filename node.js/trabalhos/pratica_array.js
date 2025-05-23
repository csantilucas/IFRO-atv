const number = [];
soma = 0;
cont = 0;

while (cont < 10) {//gera numeros aleatorios de 0 a 100, e verifica se o numero gerado é maior ou menor que os numeros gerados anteriormente, se for maior ele substitui o maior, se for menor ele substitui o menor
    let gerados = Math.floor(Math.random() * 100);
    number.push(gerados);
    cont++;
    soma += gerados;
}
console.log(number);
let menor = Math.min(...number); // menor numero do array
let maior = Math.max(...number); // maior numero do array

console.log('\nmenor', menor);
console.log('maior', maior);
console.log('media :', soma);



