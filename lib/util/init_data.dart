
class Itens {
  int? id;
  String? category;
  String? icon;
  String? color;
  List<String>? pretext;

  Itens({this.id, this.category, this.icon, this.color, this.pretext});

  Itens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    icon = json['icon'];
    color = json['color'];
    pretext = json['pretext'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['icon'] = this.icon;
    data['color'] = this.color;
    data['pretext'] = this.pretext;
    return data;
  }
}

class InitData {
  List<Itens> data() {
    return [
      Itens(
        category: "ESQUECIAÊ",
        icon: "categoria_esqueciae.svg",
        color: "#DB6341",
        pretext: [
          "Seu aniversário? É que eu esperei pra comemorar com o natal.",
          "Quem? Se eu lembro é de vidas passadas.",
          "Não esqueci, só não lembrei de lembrar.",
          "Quê? No hablo tu lengua.",
          "Impossível te esquecer nunca FabiaFernandaAmanda?",
          "Impossível te esquecer nunca ThiagoFelipeArtur?",
          "É que eu acho comum comemorar sempre no mesmo dia.",
          "Seu presente? Comprei na internet e só chega amanhã!",
          "Seu presente? Você se prende a cada detalhe.",
          "Não comprei presente porque minha religião não permite.",
          "Eu não esqueci o dia do nosso casamento. Somos casados todos os dias.",
          "Eu não esqueci, estava esperando você lembrar.",
          "Eu não esqueci, só estava esperando o momento certo.",
          "Amor, se Jesus não comemorava aniversário de namoro porquê a gente sim?",
          "Seu presente? Eu escondi pra você procurar.",
          "Seu presente? Você só pensa em você!",
          "Não esqueço do que eu não me lembro.",
          "Como te esquecer, se você é você?",
          "Não esqueci, você que está se lembrando demais.",
          "Aniversário? Tudo bem, ano que vem tem outro.",
          "Ué, você não recebeu minha mensagem?",
          "Agora uma culpa é minha que o entregador de flores errou o endereço?",
          "O meu cachorro comeu meus parabéns.",
          "Eu lembro de tudo, inclusive da última vez que eu esqueci algo.",
          "Hã? Dia? Namorados? Hã? Tô surdo!",
          "Eu não sei que dia é hoje? E você, sabe que dia é o dia do Índio?",
          "Fiz uma boa-ação: doei seu presente pra quem precisa.",
          "Olha alí uma vaca azul! (Corra)",
          "Sorry i can’t be perfect.",
          "Amor, eu só esqueço de te esquecer."
        ]
      ),
      Itens(
        category: "PERDOAÊ",
        icon: "categoria_perdoae.svg",
        color: "#E2B036",
        pretext: [
          "Tenho um compromisso inadiável na praia.",
          "Minha mãe não deixa.",
          "Você é a pessoa errada no momento errado.",
          "Foi mal, essa mensagem era pra outro idiota.",
          "Quebrei o dedo mindinho do pé direito.",
          "Foi mal, tava doidão.",
          "Tive meus motivos.",
          "Desculpa, é que eu tenho escutado muito funk.",
          "Não dá tenho dever de casa.",
          "Ixe foi mal nem vi.",
          "Não vai dar, vou estar doente no dia."
        ]
      ),
      Itens(  
        id: 3,
        category: "ATRASEIAÊ",
        icon: "categoria_atraseae.svg",
        color: "#b4be41",
        pretext: [
          "Minha avó ressuscitou e eu tive que ir lá buscá-la.",
          "Fiquei com o dedão preso no ralo.",
          "Acordei com dor na conciência.",
          "Minha barriga está latindo de dor.",
          "O motorista do metrô errou o caminho.",
          "Minha cabra de estimação morreu no Paraná.",
          "A virose me pegou de jeito.",
          "Meu hamster morreu.",
          "Estou no hospital. Escorreguei numa moeda.",
          "Brochei e não consegui dormir a noite.",
          "Meu cachorro me trancou do lado de fora.",
          "Meu galo esqueceu de acordar.",
          "Desculpe, fiquei preso na minha zona de conforto.",
          "Fiz um canal nos meus dentes da frente.",
          "Vou mais tarde, estou numa call com o Vaticano.",
          "Perdi a paciência e não sei onde eu deixei.",
          "O horário de verão acabou mais cedo aqui em casa.",
          "Hoje eu não vou. Sou adventista do quarto dia.",
          "Peguei conjuntivite no olho esquerdo.",
          "O cachorro de 15 anos da minha avó morreu.",
          "Fui abduzido.",
          "Fui sequestrado pela Máfia Russa.",
          "A safra de soja afetou o meu horário. Mauz aê.",
          "Vou chegar atrasado. Hoje o sol nasceu mais tarde aqui em casa.",
          "O meu pneu furou",
          "Errei um trânsito na marginal.",
          "Peguei um marginal no trânsito.",
          "Estava competindo com uma lesma. Ela ganhou.",
          "Esqueci a chave pra fora de casa.",
          "Descobri que meu pai é minha mãe.",
          "Só não cheguei ainda porque me confundiram com um terrorista.",
          "Amor, vou chegar atrasado. Meu chefe está tendo uma DR comigo."
        ]
      ),
      Itens(  
        id: 4,
        category: "NERDAÊ",
        icon: "categoria_nerdae.svg",
        color: "#6094A1",
        pretext: [
          "Desculpa, mas a química que rolava entre a gente não reage mais.",
          "Vou chegar com um pouco de delay no trabalho. Um hacker invadiu a minha casa.",
          "O computador está roubando.",
          "Eu não estava jogando sério.",
          "O R1 não está funcionando.",
          "Princesa, infelizmente a nossa conexão já não é mais banda larga.",
          "Agora vou jogar sério.",
          "Desculpa, nossa frequência já não é mais uma mesma.",
          "Foi mal o atraso. É que a minha pilha da vida descarregou.",
          "A gente se desencontrou. Fui para o eixo x e você para o y.",
          "Foi mal, é que você está muito Smeagol: chato, grudento e me chamando de preciosa.",
          "Eu não estava correndo de você, estava imitando o Sonic.",
          "Amigo, desculpa. Mas só o Mario pode me chamar de princesa.",
          "Não deu pra ir. Deu BUG ai eu travei na cama.",
          "Foi mal, mas nosso namoro deu Game Over. Tô ficando com o chefão.",
          "Você não acha que nosso relacionamento não tá meio Sub-Zero?",
          "Nem se eu reunisse as sete Esferas do Dragão eu chegaria a tempo.", 
          "Roxo amor, que roxo? Isso é uma cicatriz de raio. Sou bruxa.",
          "Não me achou? Procura no Google.",
          "Foi mal se não conheço sua história. Tem na Wikipédia?",
          "Foi mal, tô meio Lost hoje!",
          "Não me lembro de você. Deve ser porque eu formatei a minha memória esses dias.",
          "O Pi é infinito mas a minha paciência está bem curta.",
          "Vai ai um spoiler: minha paciência sempre morre no final.",
          "Spoiler: todo fds eu morro e só ressuscito na segunda.",
          "Desculpa, não dá pra namorar programadores. Vocês são garotos de programa.",
          "Tô igual engenheiro hidráulico, só dando cano.",
          "Não deu pra ir, deu tela azul e eu fiquei bugado.", 
          "Sorry. I see deadline all the time.",
          "Foi mal, é que eu só faço ligação com Carbono."
        ]
      ),
      Itens(
        id: 5,
        category: "SEXOAÊ",
        icon: "categoria_sexoae.svg",
        color: "#D7616F",
        pretext: [
          "Não é comigo, é com você.",
          "É que hoje você está me lembrando o meu pai.",
          "Brochei. Esse seu perfume é igual o do meu ex.",
          "Tô com dor de cabeça."
        ]
      ),
      
    ];
  }
}