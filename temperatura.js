const valor = process.argv.slice(2);
let TempC = valor[0];
let TempF = 1.8 * TempC + 32;

console.log("Temperatura em Celsius: " + TempC);
console.log("Temperatura em Fahrenheit: " + TempF);
