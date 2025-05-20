let largura = 10;

for (let y = 0; y < largura; y++) {
    let linha = "";
    
    for (let x = 0; x < largura; x++) {
        if ( x < 1 || y < 1 || x > 8 || y > 8) {
            linha += "#";
        } 
        else {
            linha += "  ";
        }
    }
    console.log(linha);
}




for (let y = 0; y < 5; y++) {
    let linha = "";
    
    for (let x = 0; x < 5; x++) {
        if ( x < 1 || y < 1 || x > 4 || y > 4) {
            linha += "#";
        } 
        else {
            linha += "";
        }
    }
    console.log(linha);
}



for (let y = 0; y < 2; y++) {
    let linha = "";
    
    for (let x = 0; x < 2; x++) {
        if ( x < 1 || y < 1 || x > 2 || y > 2) {
            linha += "#";
        } 
        else {
            linha += "  ";
        }
    }
    console.log(linha);
}