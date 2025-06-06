let eixoX = 16
let eixoY = 32

let quadro = []

//gerar o quadro
for (let x = 0; x < eixoX; x++) {
    let linha = [];
    for (let y = 0; y < eixoY; y++) {
        linha.push(" & "); // Adicionando os "@" diretamente
    }
    quadro.push(linha)
   
}

for (let x = 0; x < eixoX; x++) {
    let linha = " "
    for (let y = 0; y < eixoY; y++) {
        linha += quadro[x][y]
    } console.log(linha)
}




