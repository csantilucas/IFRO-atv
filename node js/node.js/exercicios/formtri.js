const arg = process.argv.slice(2);

let number = 1
let quant = arg[0]
let tam = "#"
console.log("\ntamanho:", quant,"\n")

while (number <= quant) {
    console.log(tam)
    number++
    tam = tam + "#" 
}


