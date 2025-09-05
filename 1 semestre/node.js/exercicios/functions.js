function ale(a, b) {
    const n1 = Math.round(Math.random() * ((b - 1) - a + 1)) + a
    return n1
}

function divisivel(a, b) {
    let div = a % b
    if (div == 0) {
        return (true)
    } else {
        return (false)
    }
}

function pri(a) {
    let primo = true
    for (let i = 2; i < a; i++) {
        if (divisivel(a , i)) {
            primo = false
        }
    }
    return (`ePrimo(${a})? --> ${primo}`)
}

function VerificaF(a,b,c) {
    console.log("numero gerado", ale(a, b))
    console.log(divisivel(a, c))
    console.log(pri(c))
}

VerificaF(17, 1000, 17)











