const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

console.log("Calculadora de IMC");


rl.question('digite seu peso (em kg):', (peso) => {
    rl.question('digite sua altura (em metros):', (altura) => {
        const calculoImc = (peso / (altura ** 2)); 
        console.log('seu imc é ' + calculoImc);
                    if (calculoImc < 18.5) {
                        console.log("Você está abaixo do peso.");
                    } 
                    else if (calculoImc >= 18.5 && calculoImc < 24.9) {
                            console.log("Seu peso está normal. Parabéns!");
                    } 
                    else if (calculoImc >= 25 && calculoImc < 29.9) {
                            console.log("Você está com sobrepeso.");
                    }
                    else {
                        console.log("Você está com obesidade. Procure um médico.");
                    }

        rl.close();
    })
})