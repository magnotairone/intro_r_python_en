# calculadora
1 + 1
2 * 4
3 / 5
8 - 6
(1 + 2) * 2

# tipos de dados
# numerico
qtd_acoes <- 100 # prefira este
qtd_acoes = 100

class(qtd_acoes)

taxa_inflacao <- 3.5
class(taxa_inflacao)

# logico (boolean)
taxa_juros_aumentando <- FALSE # TRUE
class(taxa_juros_aumentando)

# cadeias de caracteres (character) - palavras
pais <- "Brasil"
class(pais)

# qualitativas (factor)
# valores possiveis "Baixo" "Medio" "Alto"

empresas <- factor(c("Baixo", "Alto", "Baixo", "Medio")) #vetor
class(empresas)
levels(empresas)

# listar variaveis que estao carregadas no meu
# ambiente
ls()

# verificar formato de variaveis is.*
is.character(empresas)
is.factor(empresas)
is.numeric(qtd_acoes)
is.numeric(taxa_juros_aumentando)
is.logical(taxa_juros_aumentando)

# transformacoes de tipos de dados
numero <- 123
numero_character <- as.character(numero)
class(numero)

texto <- "3.14"
numero <- as.numeric(texto)
numero + 1
class(numero)

estuda_no_insper <- 1
estuda_no_insper_logico <- as.logical(estuda_no_insper)
estuda_no_insper_logico
class(estuda_no_insper_logico)

# estruturas de dados que eu posso utilizar
# vetor
preco_acoes <- c(100, 110, 105, 120, 115) 
preco_acoes
class(preco_acoes)

sequencia <- 1:50

sequencia_impares <- seq(from = 1, to = 10, by = 2)
seq(1, 10, 2)
seq(to = 10, from = 1, by = 2)
seq(9, 1, by = -2)
sequencia_impares

length(preco_acoes) # tamanho do vetor
length(1:50)

segundo_elemento <- preco_acoes[2]
segundo_elemento

preco_acoes[2:3]
preco_acoes[c(4,1,3)]

length(preco_acoes)
preco_acoes[6] # NAO GERA ERRO!

preco_acoes > 110
preco_acoes_maior_110 <- preco_acoes[preco_acoes > 110]
preco_acoes_maior_110
!(preco_acoes > 110)

# matriz
retornos_ativos <- matrix(c(0.05, 0.03, 0.02, 
                            0.04, 0.06, 0.03),
       nrow = 2, byrow = TRUE)
rownames(retornos_ativos) <- c("Acao 1", "Acao 2")
retornos_ativos
colnames(retornos_ativos) <- c("Ano 1", "Ano 2", "Ano 3")
retornos_ativos
class(retornos_ativos)
dim(retornos_ativos)
c(nrow(retornos_ativos), ncol(retornos_ativos))
length(retornos_ativos)

retornos_ativos[1, 1]
retornos_ativos[1, 3]
retornos_ativos[1, 2:3]
retornos_ativos[1, c(2, 3)]
retornos_ativos[1, c(FALSE, TRUE, TRUE)]
retornos_ativos[1, -1]

retornos_ativos[1, -c(1, 2)]
retornos_ativos[1, c(-1, -2)]

primeira_linha <- retornos_ativos[1, ]
segunda_linha <- retornos_ativos[2, ]

segunda_coluna <- retornos_ativos[,2]

acao1 <- retornos_ativos["Acao 1", ]
acao1

ano2 <- retornos_ativos[, "Ano 2"]
ano2

# lista
pais_info <- list(nome = "Brasil",
                  pib = 1609,
                  inflacao = 0.05,
                  cambio = c(4.86, 5.13, 5.20, 5.07, 4.97),
                  matriz_retornos = retornos_ativos)
pais_info
pais_info$nome
pais_info$pib
pais_info$inflacao
pais_info$cambio
pais_info$matriz_retornos

class(pais_info)

class(pais_info[1])
class(pais_info$nome)
class(pais_info[[1]])


pais_info[1] # acessando o vagao inteiro
pais_info[[1]] # acessando o interior do vagao

pais_info["nome"]
pais_info[["nome"]]


# dataframe
dados_economicos <- data.frame(
  pais = c("Brasil", "EUA", "China"),
  continente = factor(c("America", "America", "Asia")),
  populacao = c(213, 328, 1441),
  pib_per_capta = c(10294, 65741, 10380),
  inflacao = c(0.02, 0.01, 0.04))
dados_economicos

primeira_linha <- dados_economicos[1, ]
dados_economicos[ ,1]
dados_economicos$pais

dados_economicos[2, 3]

View(dados_economicos)

dados_demograficos <- data.frame(
  pais = c("China", "EUA", "Brasil"),
  expectativa_vida = c(76, 79, 75)
)

# juncao de bases de dados diferentes
dados_com_expectativa_vida <- merge(dados_economicos, 
                                    dados_demograficos,
                                    by = "pais")

# combinando linhas
dados_novos <- data.frame(
  pais = c("Africa do Sul", "Alemanha"),
  continente = c("Africa", "Europa"),
  populacao = c(60, 83),
  pib_per_capta = c(6151, 52947),
  inflacao = c(0.025, NA),
  expectativa_vida = c(58, 81)
)

resultado <- rbind(dados_com_expectativa_vida, dados_novos)
resultado

colnames(dados_com_expectativa_vida)
colnames(dados_novos)

colnames(dados_com_expectativa_vida) == colnames(dados_novos)
colnames(dados_com_expectativa_vida)[6]
colnames(dados_novos)[6]

cbind()
