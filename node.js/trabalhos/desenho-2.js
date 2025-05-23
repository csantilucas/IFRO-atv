let largura = 10;

console.log("\n")

for (let y = 0; y < largura; y++) {
    let linha = "";
    
    for (let x = 0; x < largura; x++) {
        if ( /*x == 0 || y ==0 || y == largura-1 || x == largura-1*/ x,y < largura) {
            linha += (y+','+x+ '  ')
            
        } 
        else {
            linha += " ";
        }
        
    }
    console.log(linha , ' ', '\n' );

    
}


for (let y = 0; y < largura; y++) {
    let linha = "";
    
    for (let x = 0; x < largura; x++) {
        if ( x == 0 || y ==0 || y == largura-1 || x == largura-1) {
            linha += '+'
            
        } 
        else {
            linha += " ";
        }
        
    }
    console.log(linha , ' ', );

    
}
console.log("\n")

for (let y = 0; y < largura/2; y++) {
    let linha = "";
    
    for (let x = 0; x < largura/2; x++) {
        if ( x == 0 || y ==0 || y == (largura/2)-1 || x == (largura/2)-1) {
            linha += '+'
            
        } 
        else {
            linha += " ";
        }
        
    }
    console.log(linha);
    
    
}

console.log("\n")


for (let y = 0; y < 3; y++) {
    let linha = "";
    
    for (let x = 0; x < 3; x++) {
        if ( x == 0 || y ==0 || y == 2 || x == 2) {
            linha += '+'
            
        } 
        else {
            linha += " ";
        }
        
    }
    console.log(linha);
    
    
}


console.log("\n")
