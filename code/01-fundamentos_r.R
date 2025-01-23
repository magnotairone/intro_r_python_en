## -----------------------------------------------------------------------------------------
# Número inteiro representando quantidade de acoes em uma carteira
qtd_acoes <- 100

# Número de ponto flutuante representando a taxa de inflação
taxa_inflacao <- 3.5

# Verificando a classe de taxa_inflacao
class(taxa_inflacao)


## -----------------------------------------------------------------------------------------
# Verificando se a taxa de juros está aumentando
taxa_juros_aumentando <- TRUE

# Verificando se o preço das ações está caindo
queda_preco_acoes <- FALSE

# Verificando a classe de queda_preco_acoes
class(queda_preco_acoes)


## -----------------------------------------------------------------------------------------
# Nome de um país
pais <- "Brasil"

# Nome de uma empresa multinacional
empresa <- "Petróleo Brasileiro S.A."

# Verificando a classe de pais
class(pais)


## -----------------------------------------------------------------------------------------
# Classificação do risco de crédito de uma empresa
risco_credito <- factor(c("Baixo", "Médio", "Alto", "Baixo", "Alto"))

# Verificando a classe de risco_credito
class(risco_credito)


## -----------------------------------------------------------------------------------------
# Exibindo os níveis de risco de crédito
levels(risco_credito)


ls()

is.character(empresa)


is.character(pais)


is.numeric(qtd_acoes)


is.logical(queda_preco_acoes)


is.numeric(taxa_inflacao)


is.logical(taxa_juros_aumentando)


## -----------------------------------------------------------------------------------------
numero <- 123
numero_caractere <- as.character(numero)
numero_caractere

## -----------------------------------------------------------------------------------------
texto <- "3.14"
numero <- as.numeric(texto)
numero

## -----------------------------------------------------------------------------------------
numero <- 0
logico <- as.logical(numero)
logico

## -----------------------------------------------------------------------------------------
texto <- "abc"
numero <- as.numeric(texto)
numero

## -----------------------------------------------------------------------------------------
# Vetor de preços de ações
precos_acoes <- c(100, 110, 105, 120, 115)
precos_acoes

## -----------------------------------------------------------------------------------------
# Vetor de números de 1 a 10
sequencia <- 1:10
sequencia


## -----------------------------------------------------------------------------------------
# Vetor de números de 1 a 10 com incremento de 2
sequencia_incremento <- seq(from = 1, to = 10, by = 2)
sequencia_incremento


## -----------------------------------------------------------------------------------------
# Verificando o tamanho do vetor de preços de ações
length(precos_acoes)
length(1:10)


## -----------------------------------------------------------------------------------------
# Vetor de preços de ações
precos_acoes <- c(100, 110, 105, 120, 115)

# Acessando o segundo elemento do vetor
segundo_elemento <- precos_acoes[2]
segundo_elemento

# Acessando uma série de elementos do vetor
varios_elementos <- precos_acoes[3:5]
varios_elementos

## -----------------------------------------------------------------------------------------
# Acessando preços de ações maiores que 110
precos_maior_que_110 <- precos_acoes[precos_acoes > 110]


## -----------------------------------------------------------------------------------------
# Matriz de retornos de ativos
retornos_ativos <- matrix(c(0.05, 0.03, 0.02, 0.04, 0.06, 0.03), 
                          nrow = 2, byrow = TRUE)
rownames(retornos_ativos) <- c("Ação 1", "Ação 2")
colnames(retornos_ativos) <- c("Ano 1", "Ano 2", "Ano 3")
retornos_ativos

## -----------------------------------------------------------------------------------------
# Verificando as dimensões da matriz
dim(retornos_ativos)


## -----------------------------------------------------------------------------------------
c(nrow(retornos_ativos), ncol(retornos_ativos))


## -----------------------------------------------------------------------------------------
length(retornos_ativos)


## -----------------------------------------------------------------------------------------
# Acessando a primeira linha da matriz
primeira_linha <- retornos_ativos[1, ]
primeira_linha

# Acessando a segunda coluna da matriz
segunda_coluna <- retornos_ativos[, 2]
segunda_coluna

# Acessando o elemento na segunda linha e terceira coluna da matriz
elemento <- retornos_ativos[2, 3]
elemento

# Acessando as três primeiras linhas da matriz
primeiras_linhas <- retornos_ativos[1:2, ]
primeiras_linhas

# Acessando mais de uma coluna da matriz
algumas_colunas <- retornos_ativos[, c(1,3)]
algumas_colunas

## -----------------------------------------------------------------------------------------
# Acessando a linha chamada "Ação 1"
acao1 <- retornos_ativos["Ação 1", ]
acao1

# Acessando a coluna chamada "Ano 2"
ano2 <- retornos_ativos[, "Ano 2"]
ano2

# Acessando o elemento na linha "Ação 2" e coluna "Ano 3"
elemento2 <- retornos_ativos["Ação 2", "Ano 3"]


## -----------------------------------------------------------------------------------------
# Criando uma lista com informações sobre um país
pais_info <- list(
  nome = "Brasil",
  pib = 1609,
  inflacao = 0.05,
  cambio = c(4.86, 5.13, 5.20, 5.07, 4.97)
)
pais_info


## -----------------------------------------------------------------------------------------
# Acessando o nome do país
pais_info$nome

# Acessando o PIB do país
pais_info$pib


## -----------------------------------------------------------------------------------------
# Acessando o primeiro elemento da lista (nome do país)
primeiro_elemento <- pais_info[[1]]

# Acessando o terceiro elemento da lista (taxa de inflação)
terceiro_elemento <- pais_info[[3]]


## -----------------------------------------------------------------------------------------
class(pais_info["nome"])
class(pais_info[["nome"]])


## -----------------------------------------------------------------------------------------
# Criando um dataframe com dados econômicos
dados_economicos <- data.frame(
  país = c("Brasil", "EUA", "China", "Índia", "Japão"),
  continente = factor(c("América", "América", "Ásia", "Ásia", "Ásia")),
  população = c(213, 328, 1441, 1380, 126),
  pib_per_capita = c(10294, 65741, 10380, 2353, 41581),
  inflação = c(0.02, 0.01, 0.04, 0.06, 0.005)
)
dados_economicos

## -----------------------------------------------------------------------------------------
# Acessando a primeira linha do dataframe
(primeira_linha <- dados_economicos[1, ])

# Acessando a coluna "país" do dataframe
(paises <- dados_economicos$país)

# Acessando o elemento na segunda linha e terceira coluna do dataframe
(elemento <- dados_economicos[2, 3])


## -----------------------------------------------------------------------------------------
# Criando outro dataframe para junção
dados_demograficos <- data.frame(
  país = c("China", "Índia", "Japão", "Brasil", "EUA"),
  expectativa_vida = c(76, 69, 84, 75, 79)
)
dados_demograficos

# Realizando uma junção (merge) com base na coluna "país"
(dados_com_demografia <- merge(dados_economicos, dados_demograficos, by = "país"))


## -----------------------------------------------------------------------------------------
# Criando outro dataframe para combinação de linhas
mais_dados <- data.frame(
  país = c("África do Sul", "Alemanha"),
  continente = c("África", "Europa"),
  população = c(60, 83),
  pib_per_capita = c(6151, 52947),
  inflação = c(0.025, NA),
  expectativa_vida = c(58, 81)
)

mais_dados

# Combinando os dataframes por linhas
(todos_dados <- rbind(dados_com_demografia, mais_dados))