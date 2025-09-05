let argm = process.argv.slice(2);
let senha = argm[0];

let forca = senha.length;

if(senha.includes("!") || senha.includes("@") || senha.includes("#") || senha.includes("$")){
    forca = forca + 15;
    console.log("Possui simbolo")
}

if(senha.toLowerCase () != senha){
    console.log ("Possui maiusculas")
    forca = forca +10
}else (senha.toLowerCase () == senha );{
    console.log ("Possui minusculas")
    forca = forca +10
}

if (senha.includes (0)
||senha.includes (1)
||senha.includes (2)
||senha.includes (3)
||senha.includes (4)
||senha.includes (5)
||senha.includes (6)
||senha.includes (7)
||senha.includes (8)
||senha.includes (9)
) {
    forca = forca + 10;
    console.log("tem numero")
}



if (senha.length < 8) {
    forca = forca -100
}

console.log ("Sua senha é:", senha)
console.log ("e a força da senha é:", forca);