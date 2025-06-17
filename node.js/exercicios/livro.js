const fs = require("fs");
const path = require("path");

// Lê o arquivo e divide em linhas (baixado de https://www.gutenberg.org/ebooks/results/)
const nomeArquivo = "livro.txt";
const conteudo = fs.readFileSync(path.join(__dirname, nomeArquivo), "utf-8");
const linhas = conteudo.split(/\r?\n/);

console.log("Nº de linhas:", linhas.length);
console.log("Primeira linha:", linhas[0]);
console.log("")

let unicas = []
let contagens = []

// Atravessar cada linha uma por uma:
for (let linha of linhas) {

    let palavras = linha.trim().split(" ");

    for (palavra of palavras) {
        if (palavra.trim() == "") continue;

        let posicao = unicas.indexOf(palavra)
        if (posicao == -1) {
            unicas.push(palavra)
            contagens.push(1);
        } else {
            contagens[posicao] += 1
        }

    }

}

for (let i = 0; i < palavras.length; i++) {
    const palavra = palavras[1]
    const cont = [1]
    console.log(cont, "\t", palavra)

}
