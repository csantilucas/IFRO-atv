const arg = process.argv.slice(2);

numeroLados = parseInt(arg[0]);

const n1 = Math.round(Math.random() * numeroLados) + 1;
const n2 = Math.round(Math.random() * numeroLados) + 1;


console.log("n1: " + n1);
console.log("n2: " + n2);
if (n1 > n2) {
    console.log("o primeiro numero é maior");
} else if (n1 < n2) {
    console.log("o segundo numero é maior");
}



