# definindo funções
def boas_vindas
    # printando msgs no console
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"

    # pegando o que o usuário digitar
    # .strip -> método da string que limpa os valores em branco
    nome = gets.strip

    # printando msg no console
    puts "\n\nComeçaremos o jogo para você, #{nome}"

    # retornando valor para a função
    return nome
end

def nivel_de_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
    dificuldade = gets.to_i

    # retornando valor para a função
    return dificuldade
end

def sorteia_numero_secreto(dificuldade)
    # condicionais case
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 50
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end

    # printando msg no console
    puts "\n\nEscolhendo um número entre 1 e #{maximo}..."

    # escolhendo o número secreto aleatório
    sorteado = rand(maximo) + 1

    # printando msg no console
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"

    # retornando valor para a função
    return sorteado
end

def pede_um_numero(valores_escolhidos, i, limite_de_tentativas)
    # printando msg no console
    puts "Chutes até agora: #{valores_escolhidos}"

    # printando msgs no console
    puts "\n\nTentativa #{i} de #{limite_de_tentativas}"
    puts "Entre com seu número"

    # pegando o que o usuário digitar
    chute = gets.strip

    # printando msg no console
    puts "\n\nSerá que acertou? Você chutou #{chute}"

    # retornando valor para a função
    # .to_i -> convertendo em inteiro
    return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    # comparando os valores
    acertou = chute == numero_secreto

    if acertou
        # printando msg no console
        ganhou
        return true
    end

    # variável booleana
    maior = chute > numero_secreto
    if maior
        # printando msg no console
        puts "O número secreto é menor!"
    else
        # printando msg no console
        puts "O número secreto é maior!"
    end
    return false
end

def joga_novamente(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto(dificuldade)

    # definindo pontos que o usuário começa
    pontos_ate_agora = 1000

    # definindo o limite do laço de repetição
    limite_de_tentativas = 5

    # array de valores escolhidos
    valores_escolhidos = []

    # criando o laço de repetição
    for i in 1..limite_de_tentativas
        # chamando a função e passando argumentos
        # ou -> pede_um_numero(valores_escolhidos, i, limite_de_tentativas)
        chute = pede_um_numero valores_escolhidos, i, limite_de_tentativas

        # acrescentando os valores no array
        valores_escolhidos << chute

        # descontando pontos
        # 2.0 -> representa um Float
        # .abs -> retorna o valor absoluto (sem o sinal)
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder

        # verificando o retorno da função - true ou false
        break if verifica_se_acertou numero_secreto, chute
    end

    # printando msg no console
    puts "Você ganhou #{pontos_ate_agora} pontos."
end

def quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip

    # retornando booleano
    return quero_jogar.upcase == "S"
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

# chamando funções
nome = boas_vindas
dificuldade = nivel_de_dificuldade

# executando o jogo enquanto o usuário quiser jogar
loop do
    joga_novamente nome, dificuldade
    break if !quer_jogar
end