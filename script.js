// Cria um botão

const input = document.getElementById('meuInput');
const botao = document.getElementById('botao');
const div = document.getElementById('minhaDiv');
botao2.addEventListener('click', () => {

  //cria uma div nova
  const novaDiv = document.createElement('div', 'h1');
  novaDiv.textContent = ' ';
  novaDiv.id = 'minhaDiv';
  novaDiv.style.backgroundColor = 'lightblue';
  document.body.appendChild(novaDiv);





  // Pega o valor do input e coloca na div
  // Adiciona um evento ao botão
  botao.addEventListener('click', () => {
    // Pega o valor do input e coloca na div
    div.textContent = input.value;
  });
});

''