let tabela = [
    [0, 16, 'MAGREZA GRAVE'], [16, 17, 'MAGREZA moderada'], [17, 18.5, 'MAGREZA leve'],
    [18, 25, 'SAUDAVEL'], [25, 30, 'SOBRE PESO'], [30, 35, 'OBSIDADE I'],
    [35, 40, 'OBSIDADE II'], [40, 41, 'OBSIDADE III'],
]
console.log('\nTABELA IMC\n');
for (let i = 0; i < tabela.length; i++) {
    lista = tabela[i]
    console.log('entre', lista[0], 'e', lista[1], '|', lista[2])
}

let peso = 74;
let alt = 1.87;
let linhas = []
imc = peso / (alt * alt);

console.log('\nseu IMC é de:', imc);

for (let x = 0; x < tabela.length; x++) {
    linhas = tabela[x]
    if (imc > linhas[0] && imc < linhas[1]) {
        console.log('seu IMC esta entre:', linhas[0], 'e', linhas[1], '|', linhas[2], '\n')
        break;
    } else if (linhas[0] == 40 && imc > linhas[1]) {
        console.log('seu IMC esta entre:', linhas[0], 'e', linhas[1], '|', linhas[2], '\n')
        break;
    }
}
