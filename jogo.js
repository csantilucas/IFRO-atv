const prompt = require("prompt-sync")();


const salas = {
    Porta: {
        descricao: "Você está em frente da porta de uma casa parece que tem uma chave em cima da mesinha ao lado, voce pensa(Deve ser a chave da porta), ao lado esquerdo da casa tem um quintal mal cuidado",
        conexoes: {
            "abrir porta": "sala",
            "quintal": "quintal",
        },
        item: {
            pegar: "chave",
        },
        status: true,
        condicao: true,
        seuStatus: true
    },

    sala: {
        descricao: "Voce entrou na sala. Parece que nao ha nada fora do comum, um sofa velho com um pano estampado  de flores por cima dele, uma mesa de centro com os pes de madeira e a tampa de vidro, parece ter uma lanterna em cima dela, e um tapete esquisito com marcas de botas suja de lama que levam ate a outra sala, mas parece que nao tem luz la, .",
        conexoes: {
            "voltar": "Porta",
            "sala escura": "cozinha",

        },
        item: {
            pegar: "lanterna",
        },
        status: true,
        condicao: false,
        seuStatus: true

    },

    quintal: {
        descricao: "Você entrou no quintal, parece que ninguem cuida desse lugar a muito tempo, o mato esta alto e a grama seca, tem um cachorro morto no canto, e uma arvore velha com um balanço quebrado, parece que ninguem brinca aqui a muito tempo. A casa parece estar abandonada, mas você pode ver uma luz piscando na janela da sala.você pensa (Talvez eu possa pular a janela e entrar na sala)",
        conexoes: {
            "pular": "salaAternativa",
            "voltar": "Porta",
        },
        item: {
            pegar: "nada aqui",
        },
        status: true,
        condicao: true,
        seuStatus: true

    },

    salaAternativa: {
        descricao: "Voce pulou a janela pisou em algo pontudo e atravesou seu pe, começou a sangrar e voce GRITOU DE DOR. Voce conseguiu entrar na sala mas esta mancando e sangrando muito, se nao cuidar disso voce pode desmaiar.Voce olha em volta e ve uma mesa de centro e parece ter uma lanterna em cima dela, tem uma sala com  luz piscando as sua direita e voce ouve uma goteira vindo de la, voce pensa que pode ser a cozinha, talvez possa ter uma pano para ajudar com o sangramento.",
        conexoes: {
            "voltar": "Porta",
            "sala escura": "cozinha",

        },
        item: {
            pegar: "lanterna",
        },
        status: true,
        condicao: true,
        seuStatus: false
    },

    cozinha: {
        descricao: "Entrou na cozinha.",
        conexoes: {
            "voltar": "sala",
            "sala escura": "cozinha",

        },
        item: {
            pegar: "bandagem",
        },
        status: false,
        condicao: true,
        seuStatus: false
    },
};

let backpack = {
    itens: {
        lanterna: { status: false },
        chave: { status: false },
        bandagem: { status: false },
    }
}

let player = {
    saude: 100,
    ferido: false,
};

let salaAtual = salas["Porta"];
let jogo = true

while (jogo) {
    console.log("\n\n")
    console.log("Saude do Jogador:" + player.saude)
    console.log("\n")
    mostrar_mochila();
    console.log("\n")
    
    mostrarSala();
    console.log("\n\n")
    const comando = prompt(">");
    saudeJogador(comando)
    usarItem(comando)
    const destino = salaAtual.conexoes[comando];
    let item = salaAtual.item.pegar;
    pegar_item(item, comando);
    mudaSala(destino);

    
    //condicoes para parar o jogo
    //fimjogo(comando)funcco par fazer isso
    if (comando === "ex") {
        console.clear()
        console.log("Saindo do jogo...");
        break

    }
    if (player.saude <= 0) {
        console.clear()
        console.log("Voce morreu!, sua saude:", player.saude)
        
        break
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
    if (comando == "pegar" + " " + item) {
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
        if (salaAtual.item && salaAtual.item.pegar !== "nada aqui" && !backpack.itens[salaAtual.item.pegar].status) {
            console.log(`Você vê um(a) ${salaAtual.item.pegar} aqui.`);
        }
        for (chave in salaAtual.conexoes) {
            console.log("-", chave);
        }
    }



}

function mudaSala(destino) {
    if (destino) {
        salaAtual = salas[destino];
    }
}

function saudeJogador(comando) {

    if (comando === "pular" && salaAtual === salas["quintal"]) {
        player.saude -= 50;
        player.ferido = true;

    } else if (player.ferido = true && player.saude < 60) {
        player.saude -= 2
    }

}

function usarItem(comando) {
    if (comando === "usar chave" && salaAtual.condicao == false) {
        if (backpack.itens.chave.status) { // Verifica se a chave está na mochila
            salaAtual.condicao = true; // Destranca a sala
            console.log("Você usou a chave e destrancou a porta!");

        }
    }
    if (comando === "usar lanterna" && salaAtual.status == false) {
        if (backpack.itens.lanterna.status) { // Verifica se a lanterna está na mochila
            salaAtual.status = true; // liga a lanterna
            console.log("Você usou a chave e destrancou a porta!");
        }
    }
    if (comando === "usar bandagem" && backpack.itens.bandagem.status) {
        player.saude += 50
    }
}

function fimjogo(comando) {
    if (comando === "ex") {
        let tela = console.log("Saindo do jogo...");
        jogo = false
        return tela

    }
    if (player.saude <= 0) {
        let tela = ("Voce morreu!, sua saude:", player.saude)
        jogo = false
        return tela;
    }
}

