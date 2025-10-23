
let valor = 530;

let cont100 = valor/100;
let cont50 = valor/50;
let cont20 = valor/20;
let cont10 = valor/10;
let cont5 = valor/50;
let cont2 = valor/2;
let cont1 = valor/1;

valor = valor % 100;
valor = valor % 50;
valor = valor % 20;
valor = valor % 10;
valor = valor % 5;
valor = valor % 2;
valor = valor % 1;

console.log('Notas de 100: ', Math.floor(cont100),
'Notas de 50: ', Math.floor(cont50),
'Notas de 20: ', Math.floor(cont20),
'Notas de 10: ', Math.floor(cont10),
'Notas de 5: ', Math.floor(cont5),
'Notas de 2: ', Math.floor(cont2),
'Notas de 1: ', Math.floor(cont1));