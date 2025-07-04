const prompt = require("prompt-sync")();
let morte = false

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
        status: true,// luz
        condicao: true,// aberto/fechado
        seuStatus: true // saude do jogador
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
        status: true, // luz
        condicao: false, // aberto/fechado
        seuStatus: true // saude do jogador

    },

    quintal: {
        descricao: "Você entrou no quintal, parece que ninguem cuida desse lugar a muito tempo, o mato esta alto e a grama seca, tem um cachorro morto no canto, pacerece ter um jardim com uma arvore velha com um balanço quebrado, parece que ninguem brinca aqui a muito tempo. A casa parece estar abandonada, mas você pode ver uma luz piscando na janela da sala.você pensa (Talvez eu possa pular a janela e entrar na sala)",
        conexoes: {
            "pular": "salaAternativa",
            "voltar": "Porta",
            "ir para jardim":"Jardim"
        },
        item: {
            pegar: "nada aqui",
        },
        status: true,// luz
        condicao: true, // aberto/fechado
        seuStatus: true // saude do jogador

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
        status: true, // luz
        condicao: true, // aberto/fechado
        seuStatus: false // saude do jogador
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
        status: false, // luz
        condicao: true, // aberto/fechado
        seuStatus: false // saude do jogador
    },
    Jardim: {
        descricao: "Voce entrou no jardir, para que nao é cuidado a muito anos uma árvore antiga estende seus galhos até o telhado (parece ter uma entrado por ali). Em um dos galhos, balança lentamente um velho balanço de madeira — range sem vento, como se alguém invisível ainda brincasse ali. O mato alto cobre o jardim, sufocando qualquer vida que um dia floresceu.",
        conexoes: {
            "subir na arvore": "Arvore",
            "voltar": "Porta",
        },
        item: {
            pegar: "nada aqui",
        },
        status: true,// luz
        condicao: true, // aberto/fechado
        seuStatus: true // saude do jogador
    },
    Arvore: {
        descricao: "Voce subiu na arvore, o galho ate o telhado parece aparentemente bem firme para chegar ate o telhado. ",
        conexoes: {
            "ir para o telhado": "telhado",
            "descer":"Jardim"
        },
        item: {
            pegar: "nada aqui",
        },
        status: true,// luz
        condicao: true, // aberto/fechado
        seuStatus: true // saude do jogador
    },
    telhado: {
        descricao: "Quase chegando no telhado vc escuta um estralo do galho atras de voce e pula para o telhado. Com muito esforço voce consegui suibiu no telhado, ele esta cheio de lodo e parece muito escorregadia. Tem uma portinha aberta na parede do telhado ",
        conexoes: {
            "entrar na porta ": "Sotao",
            "olhar em volta": "telhadomorte" ,
            
            
        },
        item: {
            pegar: "nada aqui",
        },
        status: true,// luz
        condicao: true, // aberto/fechado
        seuStatus: true // saude do jogador
    },
    telhadomorte: {
        descricao: "voce escorreugou do telhado e caiu de cabeça, seu pescoço quebrou",
        conexoes: {
            
        },
        item: {
            pegar: "nada aqui",
        },
        status: true,// luz
        condicao: true, // aberto/fechado
        seuStatus: true // saude do jogador
    },
   
  
};

let backpack = {
    itens: {
        lanterna: { status: false, quant:100 },
        chave: { status: false, quant:100},
        bandagem: { status: false, quant:4 },
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

    if (comando === "ex") {
        console.clear()
        console.log("Saindo do jogo...");
        break

    }
    else if (player.saude <= 0) {
        console.clear()
        console.log("Voce morreu!, sua saude:", player.saude)
        
        break
    }

    else if (comando == "olhar em volta"){
        console.log("voce morreu")
        break
    }


    saudeJogador(comando)
    usarItem(comando)
    const destino = salaAtual.conexoes[comando];
    let item = salaAtual.item.pegar;
    pegar_item(item, comando);
    mudaSala(destino);

    
    //condicoes para parar o jogo
    //fimjogo(comando)funcco par fazer isso
    
    console.clear()

}

function mostrar_mochila() {
    console.log("------------------")
    console.log("MOCHILA:")
    for (chave in backpack.itens) {
        verifica = backpack.itens[chave].status
        nivel = backpack.itens[chave].quant
        if (verifica == true)
            console.log(chave,"status:"+nivel+"%")
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
    if (comando === "usar chave" && salaAtual.condicao == false ) {
        if (backpack.itens.chave.status) { // Verifica se a chave está na mochila
            salaAtual.condicao = true; // Destranca a sala
           

        }
    }
    if (comando === "usar lanterna" && salaAtual.status == false) {
        if (backpack.itens.lanterna.status) { // Verifica se a lanterna está na mochila
            salaAtual.status = true; // liga a lanterna
            backpack.itens.lanterna.quant -=10
        }else if(backpack.itens.lanterna.quant < 0){
            backpack.itens.lanterna.status = false
        }
    }
    if (comando === "usar bandagem" && backpack.itens.bandagem.status) {
        player.saude += 25
        backpack.itens.bandagem.quant -=1
        console.log("Você usou uma bandagem");
    }else if(backpack.itens.bandagem.quant < 0){
            backpack.itens.bandagem.status = false
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

