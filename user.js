const users = [

    ['user1@gmail.com', '1', 'User One'],
    ['user2@gmail.com', '2', 'User Two'],
    ['user3@gmail.com', '3', 'User Three'],
    ['user4@gmail.com', '4', 'User Four'],
    ['user5@gmail.com', '5', 'User Five'],
    ['user6@gmail.com', '6', 'User Six'],
    ['user7@gmail.com', '7', 'User Seven'],
    ['user8@gmail.com', '8', 'User Eight'],
    ['user9@gmail.com', '9', 'User Nine'],
    ['user10@gmail.com', '10', 'User Ten']

]


const arg = process.argv.slice(2);

let usuario = false
let senha = false
let usuari = 0

for (let i = 0; i < users.length; i++) {

    let user = []

    if (users[i][0] == arg[0] && users[i][1] == arg[1]) {// verifica se o gmail e senha e igual
        // se for senha e usuario igaul a true
        senha = true
        usuario = true
        user[0] = users[i][0]
        //mostra o usuario encontrado
        console.log('\nusuario enconstrado, bem vindo', users[i][2], '\n')

    }   else if (users[i][0] == arg[0] && users[i][1] != arg[1]) {// se so a senha estiver errada mantem o true do usuario e senha vira false
        senha = false
        usuario = true
        console.log('\nAcesso negado!, senha incorreta\n')// mostra senha errada
    }   

}

if (senha == false && usuario == false) {// se a senha e o usuario forem igual a false 
    console.log(`Acesso negado ,usuario nao existe`)// mostra usuario nao encorntrado
}








// console.log(user[i][0], user[i][1], user[i][2]);

// if (users[i][0] == arg[0] && users[i][1] == arg[1]) {
//     console.log("Bem vindo(a) ", users[i][2],'!');
//     break;
// }
// if (users[i][0] == arg[0] && users[i][1] != arg[1]) {
//     console.log("Acesso negado, Senha incorreta!");
//     break;
// }




// if (users[i][0] != arg[0]) {
//     console.log("Acesso negado,nao existe esse usuario!");

// }




// let user1 = user[i];
// console.log(user1[0]);



