let largura = 10;

for (let y = 0; y < largura; y++) {
    let linha = "";
    
    for (let x = 0; x < largura; x++) {
        if ( x < 1 || y < 1 || x > 8 || y > 8) {
            linha += ".";
        } 
        else {
            linha += "  ";
        }
    }
    console.log(linha);
}
  