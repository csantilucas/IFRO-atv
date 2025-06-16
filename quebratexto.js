var prompt = require('prompt-sync')();
let palavra = prompt('escreva uma frase: ')
let a = [palavra]
console.log(a[0].length)

function quebraTexto(n) {
    let word = a[0]
    let b = []


    if (word.length < 40) {

        console.log("|", "-".repeat(40), "|")
        console.log("|", n + " ".repeat(40 - word.length), '|')
        console.log("|", "-".repeat(40), "|")
    }
    else if (word.length > 40) {
        n = word.slice(0, 40)
        b = word.slice(40, 80)
        // console.log(n)
        // console.log(b)
        console.log("|", "-".repeat(40), "|")
        console.log("|", n, '|')
        console.log("|", b, '|')
        console.log("|", "-".repeat(40), "|")


    }


}

function mostrarPalavra(n) {
    quebraTexto(n)

}

mostrarPalavra(a[0])




