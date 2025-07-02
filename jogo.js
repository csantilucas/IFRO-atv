const prompt = require("prompt-sync")();

const salas = {
    Porta: {
        descricao: "Você está em frente da porta de uma casa parece que tem uma chave em cima da mesinha ao lado, voce pensa(Deve ser a chave da porta), ao lado esquerdo da casa tem um quintal mal cuidado",
        conexoes: {
            "abrir porta": "sala",
            "quintal": "quintal",
            "ir para direita": 'voce deu de cara com uma cerca suja e velha, a tinta amarela esta descascando, parece que ninguem passa por aqui a muito tempo,',
        },
        item: {
            pegar: "chave",
        },
        status: true,
        condicao: true
    },

    sala: {
        descricao: "Voce entrou na sala. Parece que nao ha nada fora do comum, um sofa velho com um pano estampado  de flores por cima dele, uma mesa de centro com os pes de madeira e a tampa de vidro, parece ter uma lanterna em cima dela, e um tapete esquisito com marcas de botas suja de lama que levam ate a outra sala, mas parece que nao tem luz la, .",
        conexoes: {
            "voltar": "Porta",
            "sala escura": "",

        },
        item: {
            pegar: "lanterna",
        },
        status: true,
        condicao: false
    },

    quintal: {
        descricao: "Você entrou no quintal, parece que ninguem cuida desse lugar a muito tempo, o mato esta alto e a grama seca, tem um cachorro morto no canto, e uma arvore velha com um balanço quebrado, parece que ninguem brinca aqui a muito tempo. A casa parece estar abandonada, mas você pode ver uma luz piscando na janela da sala.você pensa (Talvez eu possa pular a janela e entrar na sala)",
        conexoes: {
            "pular": "sala",
            "voltar": "Porta",
        },
        item: {
            pegar: "nada aqui",
        },
        status: false,
        condicao: true
    },
};

let backpack = {
    itens: {
        lanterna: { status: false },
        chave: { status: false },
        bandagem: { status: false },
    }
}

let salaAtual = salas["Porta"];


while (true) {


    mostrar_mochila();
    mostrarSala();
    
    const comando = prompt(">");


    if (comando === "abrir porta" && salaAtual === salas["Porta"]) {
        if (backpack.itens.chave.status) { // Verifica se a chave está na mochila
            salas.sala.condicao = true; // Destranca a sala
            console.log("Você usou a chave e destrancou a porta!");
            // Opcional: Remover a chave da mochila após o uso
            // backpack.itens.chave.status = false;
        } 
    }


    const destino = salaAtual.conexoes[comando];
    
    let item = salaAtual.item.pegar;
    pegar_item(item, comando);
    mudaSala(destino);



    if (comando === "ex") {
        console.log("Saindo do jogo...");
        break;
    }
    console.clear()

}

function mostrar_mochila() {
    console.log("------------------")
    console.log("MOCHILA:")
    for (chave in backpack.itens) {
        verifica = backpack.itens[chave].status
        if (verifica == true)
            console.log(chave)
    }
    console.log("------------------")
}

function pegar_item(item, comando) {
    if (comando == "pegar"+" "+item) {
        backpack.itens[item].status = true;
    }
}

function mostrarSala() {

    if (!salaAtual.condicao) {
        console.log("Sala trancada, use uma chave");
        return;
    } else if (salaAtual.status == false) {
        console.log("esta muito escuro, use uma lanterna");
    }
    else {
        console.log(salaAtual.descricao);
        for (chave in salaAtual.conexoes) {
            console.log("-", chave);
        }
    }

    if (salaAtual.item && salaAtual.item.pegar !== "nada aqui" && !backpack.itens[salaAtual.item.pegar].status) {
        console.log(`Você vê um(a) ${salaAtual.item.pegar} aqui.`);
    }

}

function mudaSala(destino) {
    if (destino) {
        salaAtual = salas[destino];
    }
}