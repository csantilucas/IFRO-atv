const argumentos = process.argv.slice(2)

let dia = argumentos[0]
let mes = argumentos[1]
let ano = argumentos[2]

console.log('\ndata inserida:', dia, '-', mes, '-', ano,)


//funca que verifica se o ano e bissexto
function verifica(ano) {
    return (ano % 400 === 0 || ano % 4 === 0 && ano % 100 !== 0);
}

//funcao que verifica se a data e valida

function verifica2() {
    if (dia, mes, ano < 0) {

        console.log('\ndata invalida, os valores nao podem ser negativos');
    }
    else if (dia > 31) {
        console.log('\ndata invalida, o dia nao pode ser maior que 31');
    }
    else if (mes > 12) {
        console.log('\ndata invalida, o mes nao pode ser maior que 12');
    }
    else if (mes == 2, 4, 6, 9, 11 && dia > 30) {
        console.log('\ndata invalida, se o mês for 2 (Fevereiro), 4 (Abril), 6 (Junho), 9 (Setembro) ou 11 (Novembro), o valor do dia não pode ser maior que 30 ');
    }
}




verifica2()


{
    // Verificando se o ano é bissexto
    if (verifica(ano)) {
        console.log('O ano é bissexto.');
    } else {
        console.log('O ano não é bissexto.');
    }
}

//verifa se o dia do ano bissextoi e valido

if (mes = 2) {
    if (verifica(ano)) {
        if (dia >= 30) {
            console.log('data invalida\n')
        }
        else {
            console.log('data valida\n')
        }

    }
    else {

        if (dia >= 29) {
            console.log('data invalida\n')

        }
        else {
            console.log('data valida\n')
        }
    }
}