const prompt = require("prompt-sync")();

let lado_a = prompt(" digite o valor da base do triangulo: " );
let lado_b = prompt(" digite o valor do lado c: " );
let lado_c = prompt(" digite o valor do lado a: " );

let soma = (lado_b + lado_c);

    if (soma <= lado_a){
        console.log("não é um triangulo"); 
                         

}
    else {
        console.log("Lado A: " + lado_a);
        console.log("Lado B: " + lado_b);
        console.log("Lado C: " + lado_c);

}



if (lado_a == lado_b && lado_b == lado_c){
    console.log("O triangulo é escaleno");

} else if (lado_a == lado_b && lado_a != lado_c ||
        lado_b == lado_c && lado_a != lado_b ||
        lado_a == lado_c && lado_b != lado_a)
        {
    console.log("O triangulo é isósceles");

} else 
    (lado_a != lado_b 
    && lado_a != lado_c 
    && lado_b != lado_c);
    {
    console.log("O triangulo é equilatero");
}



