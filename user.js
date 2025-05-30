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

    if (users[i][0] == arg[0] && users[i][1] == arg[1]) {
        senha = true
        usuario = true
        user[0] = users[i][0]
        console.log('\nusuario enconstrado, bem vindo', users[i][2], '\n')

    }   else if (users[i][0] == arg[0] && users[i][1] != arg[1]) {
        senha = false
        usuario = true
        console.log('\nAcesso negado!, senha incorreta\n')
    }   else if (users[i][0] != arg[0] && users[i][1] != arg[1]) {
        senha = false
        usario = false

    }  else {
        console.log('')
    }

}

if (senha == false && usuario == false) {
    console.log(`usuario nao existe`)
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



