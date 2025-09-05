const args = process.argv.slice(2);

let valor = parseInt(args[0]);


if (valor >= 100) {
    valor = valor * 0.9;
    desconto = valor * 0.1;
    console.log("Subtotal: " + valor);
    console.log("Desconto: " + desconto);
}
else (valor <= 100); {
    console.log("O valor do produto é: " + valor);
}
    
