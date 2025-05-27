let lista = [   'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'a', 'b', 'k', 'f', 'l', 's', 'u'  ];//lista
const duplicados = [];
const naoDuplicados = [];




for (let i =0; i < lista.length; i++) {
    
    let fruta = lista[i];
    
    if(naoDuplicados.includes (fruta) ){
        duplicados.push(fruta);
    }
    else {
        naoDuplicados.push(fruta);
    }

}

console.log('Lista original:', lista);
console.log('Lista de duplicados:', duplicados);
console.log('Lista de não duplicados:', naoDuplicados);