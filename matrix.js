let eixoX = 55
let eixoY = 110

let quadro = []

//gerar o quadro

for (let x = 0; x < eixoX; x++) {
    let linha = [];
    for (let y = 0; y < eixoY; y++) {
        linha.push(" & "); // Adicionando os "@" diretamente
    }
    quadro.push(linha)
   
}
function gerar(){

for (let x = 0; x < eixoX; x++) {
    let linha = " "
    for (let y = 0; y < eixoY; y++) {
        linha += quadro[x][y]
    } console.log(linha)
    setTimeout 
}}






