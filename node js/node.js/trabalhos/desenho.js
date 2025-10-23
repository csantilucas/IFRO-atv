let largura = 10;

for (let y = 0; y < largura; y++) {
    let linha = "";
    
    for (let x = 0; x < largura; x++) {
        if ( x == y) {
            linha += "╲";
        } 
        else if(x + y == largura -1  ) {
            linha += "╱";
        }
        else  {
            linha += " ";
        }
    }
    
    console.log(linha);
}



largura =5
for (let y = 0; y < largura; y++) {
    let linha = "";
    
    for (let x = 0; x < largura; x++) {
        if ( x == y) {
            linha += "╲";
        } 
        else if(x + y == largura -1  ) {
            linha += "╱";
        }
        else  {
            linha += " ";
        }
    }
    console.log(linha);
}

largura =2
for (let y = 0; y < largura; y++) {
    let linha = "";
    
    for (let x = 0; x < largura; x++) {
        if ( x == y) {
            linha += "╲";
        } 
        else if(x + y == largura -1  ) {
            linha += "╱";
        }
        else  {
            linha += " ";
        }
    }
    console.log(linha);
}




