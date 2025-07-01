const prompt = require('prompt-sync')();
let salaAtual = "Sala1"

//usar objetos

while (salaAtual != "Sala4") {
    descreveSala(salaAtual);
    const comando = prompt("insira o comando >");
    salaAtual = Comando(salaAtual, comando)
}

function descreveSala(sala) {
    switch (sala) {
        case 'Sala1':                    
            console.log('Sala1');
            break;
        case 'Sala2':
            console.log('Sala2');
            break;
        case 'Sala3':
            console.log('Sala3');
            break;
        case 'Sala4':
            console.log('Sala4');
            break;

    }
}

function Comando(sala, comando) {
    switch (sala) {
        case "Sala1":
            if (comando === "O") return "Sala2";
            break;
        case "Sala2":
            if (comando === "O") return "Sala3";
            break;
        case "Sala3":
            if (comando === "O") return "Sala4";
            break;
    }
    console.log("Comando inválido ou não há saída nessa direção.");
    return sala; // Permanece na mesma sala se comando inválido
}

