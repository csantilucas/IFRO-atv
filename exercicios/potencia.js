const arg = process.argv.slice(2);

let number = arg[0]
let cont = 0

while (cont  <= 20) {
    mult = number**cont 
    console.log(number,"^", cont, "=", mult)
    cont++

}

