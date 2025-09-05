let backpack = {
  itens:{
    lanterna:{status:true},
    lanterna1:{status:false},
    lanterna3:{status:true},
  }
}

console.log(backpack.itens.status)
for (chave in backpack.itens) {
    verifica = backpack.itens[chave].status
    if(verifica == true)
        console.log(chave)
}