# -------------------------------------------------------------------------
# aula 3 - estrutura e manejo de dados

# mauricio vancine
# 30-09-2019
# -------------------------------------------------------------------------

# topicos -----------------------------------------------------------------  
# 3.1 atributos dos objetos
# 3.2 modos dos objetos (numeric, character e logical)
# 3.3 estrutura dos objetos (vector, factor, matrix, data frame e list)
# 3.4 manejo de dados unidimensionais
# 3.5 manejo de dados bidimensionais
# 3.6 valores faltantes e especiais
# 3.7 diretorio de trabalho
# 3.8 importar dados
# 3.9 conferir e manejar dados importados
# 3.10 exportar dados

# 3.1 atributos dos objetos -----------------------------------------------
# atribuicao
# palavra <- dados

## atribuicao - simbolo (<-)
obj_10 <- 10 
obj_10

# 3.2 modos dos objetos ----------------------------------------------------
# 1. numeric: numeros inteiros ou decimais
# numeric
obj_num <- 1
obj_num

# mode
mode(obj_num)

# 2. character: texto
# character
obj_cha <- "a" # atencao para as aspas
obj_cha

# mode
mode(obj_cha)

# 3. logical: assume apenas dois valores (booleano)
# logical
obj_log <- TRUE # maiusculas e sem aspas
obj_log

# mode
mode(obj_log)
  
# 3.3 estrutura dos objetos ----------------------------------------------
# 1. vector: homogeneo (um modo) e unidimensional (uma dimensao)

# concatenar elementos
temp <- c(15, 18, 20, 22, 18)
temp

amos <- c("amostra_01", "amostra_02", "amostra_03", "amostra_04")
amos

# sequencia unitaria (x1:x2)
se <- 1:10
se

# sequencia com diferentes espacamentos 
se.e <- seq(from = 0, to = 100, by = 10) 
se.e

# repeticao
# rep(x, times) # repete x tantas vezes
# rep(x, each) # retete x tantas vezes de cada
rep_times <- rep(x = c(1, 2), times = 5)
rep_times

rep_each <- rep(x = c("a", "b"), each = 5)
rep_each

# palavra e sequencia numerica - sem separacao
am1 <- paste("amostra", 1:6, sep = "0")
am1

# palavra e sequencia numerica - separacao por "_"
am2 <- paste("amostra", 1:6, sep = "_0")
am2

# coercao: vetor com elementos de modos diferentes
ve <- c(1, "a", 3)
ve

ve <- c(1, "a", TRUE)
ve

#  character >> numeric
ve <- c("a", 1)
ve

class(ve)
mode(ve)

# numeric >> logical
ve <- c(1, TRUE)
ve

class(ve)
mode(ve)

# character >> logical
ve <- c("a", TRUE)
ve

class(ve)
mode(ve)

# character >> numeric >> logical
ve <- c("a", 1, TRUE)
ve

class(ve)
mode(ve)

# Conversao: forcar um vetor a ter um modo especifico
# vector numeric
ve <- c(0, 1, 2, 3, 4)
ve

mode(ve)

# numeric para character
ve_ch <- as.character(ve)
ve_ch

mode(ve_ch)

# numeric para logical
ve_lo <- as.logical(ve)
ve_lo

mode(ve_lo)

# character para numeric
ve_nu <- as.numeric(ve_ch)
ve_nu

mode(ve_nu)

# 2. factor: homogeneo (um modo - sempre numeric), unidimensional (uma dimensao) e possui ainda levels (niveis)
# 2. factor nominal: variaveis nominais
fa_no <- factor(x = c("fechada", "fechada", "aberta", "aberta", "aberta"),
                levels = c("aberta", "fechada"))
fa_no

levels(fa_no)

# 2. factor ordinal: variaveis ordinais
fa_or <- factor(x = c("alta", "media", "baixa", "baixa", "media"),
                levels = c("baixa", "media", "alta"), ordered = TRUE)
fa_or

levels(fa_or)

# 2. factor: conversao
# vector
ve_ch <- c("alta", "media", "baixa", "baixa", "media")
ve_ch

mode(ve_ch)
class(ve_ch)

# factor nominal
fa_no <- as.factor(ve_ch)
fa_no

levels(fa_no)
class(fa_no)

# 3. matrix: homogeneo (um modo) e bidimensional (duas dimensao)
# 1 dispondo elementos
# matriz - funcao matrix
# vetor
ve <- 1:12

# matrix - preenchimento por linhas - horizontal
ma_row <- matrix(data = ve, nrow = 4, ncol = 3, byrow = TRUE)
ma_row

# matrix - preenchimento por colunas - vertical
ma_col <- matrix(data = ve, nrow = 4, ncol = 3, byrow = FALSE)
ma_col

#  2 combinando vetores
# `rbind`: combina vetores por linha, i.e., vetor embaixo do outro
# `cbind`: combina vetores por coluna, i.e., vetor ao lado do outro

# criar dois vetores
vec_1 <- c(1, 2, 3)
vec_2 <- c(4, 5, 6)

# combinar por linhas - vertical - um embaixo do outro
ma_rbind <- rbind(vec_1, vec_2)
ma_rbind

# combinar por colunas - horizontal - um ao lado do outro
ma_cbind <- cbind(vec_1, vec_2)
ma_cbind

# coercao
# criar dois vetores
vec_ch <- c("sp1", "sp2", "sp3")
vec_nu <- c(4, 5, 6)

# combinar por colunas - horizontal - um ao lado do outro
ma_ch <- cbind(vec_ch, vec_nu)
ma_ch

# 4. array: homogeneo (um modo) e multidimensional (mais que duas dimensoes)
# 1 Dispondo elementos
# `array`: dispõem um vetor em um certo número de linhas, colunas e dimensões

# vetor
ve <- 1:8
ve

ar <- array(data = ve, dim = c(2, 2, 2))
ar

# 5. data frame: heterogêneo (mais de um modo) e bidimensional (duas dimensões)
# 1 Combinando vetores horizontalmente
# `data.frame`: combina vetores horizontalmente, um ao lado do outro. Semelhante à função `cbind`

# criar três vetores
vec_ch <- c("sp1", "sp2", "sp3")
vec_nu <- c(4, 5, 6)
vec_fa <- factor(c("campo", "floresta", "floresta"))

# data.frame - combinar por colunas - horizontal - um ao lado do outro
df <- data.frame(vec_ch, vec_nu, vec_fa)
df

# data.frame - nome das colunas
df <- data.frame(especies = vec_ch, 
                 abundancia = vec_nu, 
                 vegetacao = vec_fa)
df

# coercao de data frame para matrix
ma <- as.matrix(df)
ma

# coercao de matrix para data frame
df <- as.data.frame(ma)
df

str(df)

# coercao de matrix para data frame
df <- as.data.frame(ma, stringsAsFactors = FALSE)
df

str(df)

# data frame vs cbind
  
# vetores
pa <- paste("parcela", 1:4, sep = "_")
pa

pe <- sample(0:1, 4, rep = TRUE)
pe

tr <- factor(rep(c("trat", "cont"), each = 2))
tr

# uniao de vetores
df <- data.frame(pa, pe, tr)
df

str(df)

# uniao de vetores
df_c <- cbind(pa, pe, tr)
df_c

str(df_c)

# 6. list: heterogêneo (mais de um modo) e unidimensional (uma dimensão)
li <- list(rep(1, 20), # vector
           factor(1, 1), # factor
           cbind(c(1, 2), c(1, 2))) # matrix
li


# 3.4 Manejo de dados unidimensionais -------------------------------------
# vetor e fator
# 1 indexacao []
ve <- seq(10, 100, 10)
ve

# seleciona o quinto elemento
ve[5]

# seleciona os elementos de 10 a 50
ve[1:5] 

# seleciona os elementos 10 e 100 e atribuir
ve_sel <- ve[c(1, 10)]
ve_sel

# retirar o decimo elemento
ve[-10]

# retirar os elementos 20 a 90
ve[-(2:9)]

# retirar os elementos 50 e 100 e atribuir
ve_sub <- ve[-c(5, 10)]
ve_sub

# 2 selecao condicional: selecionar elementos por condições 
# dois vetores
foo <- 42
bar <- 23

# operadores relacionais - saidas booleanas (TRUE ou FALSE)
foo == bar # igualdade
foo != bar # diferenca 
foo > bar # maior
foo >= bar # maior ou igual
foo < bar # menor
foo <= bar # menor ou igual

# fixar a amostragem
set.seed(42)

# vetor
ve <- rnorm(10)
ve

# quais valores sao maiores que 1?
ve > 1 

# valores acima de 1
ve[ve > 1] 

# atribuir valores maiores que 1
ve_maior1 <- ve[ve > 1]
ve_maior1

# maximo
max(ve)

# minimo
min(ve)

# amplitude
range(ve)

# comprimento
length(ve)

# ordenar crescente
sort(ve)

# ordenar decrescente
sort(ve, dec = TRUE)
  
# mostrar a ordem da ordenacao crescente
order(ve)

# mostrar a ordem da ordenacao decrescente
order(ve, decreasing = TRUE)

# mostrar a ordem da ordenacao "sort"
order(sort(ve))

# arredondamento
round(ve, digits = 2)

# arredondamento
round(ve, 3)

# algum?
any(ve > 1)

# todos?
all(ve > 1)

# qual(is)?
which(ve > 1)

# subconjunto
subset(ve, ve > 1)

# condicao para uma operacao
ifelse(ve > 1, 1, 0)

# lista - indexacao []
li <- list(elem1 = 1, elem2 = 2, elem3 = 3)
li

# acessar o primeiro elemento
li[1]

# acessar o primeiro e o terceiro elementos e atribuir
li2 <- li[c(1, 3)]
li2

# retirar o primeiro elemento
li[-1]

# retirar o segundo elemento e atribuir
li_13 <- li[-2]
li_13

# comprimento
length(li)

# names
names(li)

# matriz - indexacao []
ma <- matrix(1:12, 4, 3)
ma 

ma[3, ] # linha 3
ma[, 2] # coluna 2
ma[1, 2] # elemento da linha 1 e coluna 2
ma[1, 1:2] # elementos da linha 1 e coluna 1 e 2
ma[1, c(1, 3)] # elementos da linha 1 e coluna 1 e 3
ma_sel <- ma[1, c(1, 3)]
ma_sel

# 1 indexacao $ - data frame
# criar tres vetores
sp <- paste("sp", 1:10, sep = "")
abu <- 1:10
flo <- factor(rep(c("campo", "floresta"), each = 5))

# data frame
df <- data.frame(sp, abu, flo)
df

# $ funciona apenas para data frame 
df$sp 
df$abu
df$flo

length(df$abu)
max(df$abu)
min(df$abu)
range(df$abu)

# converter colunas
mode(df$abu)
df$abu <- as.character(df$abu)

df$abu
mode(df$abu)

# converter colunas
df$abu <- as.numeric(df$abu)
df$abu
mode(df$abu)

# adicionar uma coluna
set.seed(1)
df$abu2 <- sample(0:1, nrow(df), rep = TRUE)
df$abu2
df

# selecionar linhas de uma matriz ou data frame 
df[df$abu > 4, ]

# selecionar linhas de uma matriz ou data frame 
df[df$abu2 == 0, ]

# selecionar linhas de uma matriz ou data frame 
df[df$flo == "floresta", ]


# 3.5 manejo de dados bidimensionais --------------------------------------
# matrizes e data frames
  
# head(): mostra as primeiras 10 linhas
head(df)

# head(): mostra as primeiras 10 linhas
head(df, 10)

# tail(): mostra as últimas 6 linhas
tail(df)

# nrow(): mostra o número de linhas
nrow(df)

# ncol(): mostra o número de colunas
ncol(df)

# dim(): mostra o número de linhas e de colunas
dim(df)

# rownames(): mostra os nomes dfs linhas (locais)
rownames(df)

# colnames(): mostra os nomes dfs colunas (variáveis)
colnames(df)

# mudfr o nome dfs linhas
df 
rownames(df)
rownames(df) <- c(paste("local", 1:9, sep = "_0"), "local_10")
rownames(df)
df

# str(): mostra as classes de cadf coluna (estrutura)
str(df)

# summary(): mostra um resumo dos valores de cadf coluna
summary(df)

# criar uma matriz
ma <- matrix(c(12, 5, 8, 0, 15, 0, 0, 2, 7), 3)
ma

# rowSums(): soma das linhas
rowSums(ma)
  
# colSums(): soma das colunas
colSums(ma)

# rowMeans(): media das linhas
rowMeans(ma)

# colMeans(): media das linhas
colMeans(ma)

#  amostragem de linhas
n_row <- 1:10
n_row

row_sa <- sample(n_row, 4)
n_row_sa

df_sa <- df[n_row_sa, ]
df_sa

# fixar amostragem
set.seed(5)

# amostragem de linhas
n_row <- 1:10
n_row

n_row_sa <- sample(n_row, 4)
n_row_sa

df_sa <- df[n_row_sa, ]
df_sa

# ordencao de linhas
df_so <- df[order(df$abu, decreasing = TRUE), ]
df_so

# ordencao de linhas
df_so <- df[order(df$abu, decreasing = FALSE), ]
df_so

# filtro
df_su <- subset(df, flo == "floresta")
df_su

# filtro
df_su <- subset(df, abu2 == 1)
df_su

#  3.6 valores faltantes e especiais --------------------------------------
# 1 na - not available
foo_na <- NA
foo_na

# data frame
df <- data.frame(var1 = c(1, 4, 2, NA), var2 = c(1, 4, 5, 2))
df

# verificar a presença/ausência de NA's
is.na(df)

# verificar a presença de algum NA's
any(is.na(df))

# retirar as linhas que possuem NA's
df_sem_na <- na.omit(df)
df_sem_na

nrow(df)
nrow(df_sem_na)

# substituir na por 0
df[is.na(df)] <- 0
df

# 2 nan - not a number
0/0
log(-1)

# criar um vetor
ve <- c(1, 2, 3, NA, NaN)
ve

# verificar a presenca de na
is.na(ve)

# verificar a presenca de nan
is.nan(ve)

# 3 inf - infinito
# limite matematico
1/0

# numero grande
10^310

# objeto nulo
nulo <- NULL
nulo

# 3.7 diretorio de trabalho -----------------------------------------------
# definir o diretorio de trabalho
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/00_tabelas")
  
# verificar o diretorio
getwd()

# verificar os arquivos
dir()

# 3.8 importar dados ------------------------------------------------------
# ler uma planilha eletronica (.csv)
read.csv("ATLANTIC_AMPHIBIANS_sites.csv")

# ler e atribuir uma planilha eletronica (.csv) a um objeto
da <- read.csv("ATLANTIC_AMPHIBIANS_sites.csv")

# ver os dados
da

# conferir a classe
class(da)

# ler e atribuir uma planilha simples (.txt) a um objeto
da <- read.table("ATLANTIC_AMPHIBIANS_sites.txt", header = TRUE, sep = "\t")
da
  
# pacote openxlsx
# install.packages("openxlsx")
library(openxlsx)
  
# ler e atribuir uma planilha eletrônica (.xlsx) a um objeto
da <- openxlsx::read.xlsx("ATLANTIC_AMPHIBIANS_sites.xlsx", sheet = 1)
da

# 3.9 Conferir e manejar dados importados ---------------------------------
# conjunto de funcoes para conferir os dados
# head(): mostra as primeiras 6 linhas
# tail(): mostra as últimas 6 linhas
# nrow(): mostra o número de linhas
# ncol(): mostra o número de colunas
# dim(): mostra o número de linhas e de colunas
# rownames(): mostra os nomes das linhas (locais)
# colnames(): mostra os nomes das colunas (variáveis)
# str(): mostra as classes de cada coluna (estrutura)
# summary(): mostra um resumo dos valores de cada coluna

# ler e atribuir uma planilha eletronica (.csv) a um objeto
da <- read.csv("/home/mude/data/github/disciplina-geoprocessamento/03_dados/00_tabelas/ATLANTIC_AMPHIBIANS_sites.csv")
da

# head(): mostra as primeiras 10 linhas
head(da)

# head(): mostra as primeiras 10 linhas
head(da, 10)

# tail(): mostra as últimas 6 linhas
tail(da)

# nrow(): mostra o número de linhas
nrow(da)

# ncol(): mostra o número de colunas
ncol(da)

# dim(): mostra o número de linhas e de colunas
dim(da)

# rownames(): mostra os nomes das linhas (locais)
rownames(da)

# colnames(): mostra os nomes das colunas (variáveis)
colnames(da)

# str(): mostra as classes de cada coluna (estrutura)
str(da)

# summary(): mostra um resumo dos valores de cada coluna
summary(da)

# Verificar a presença de NAs
# algum?
any(is.na(da))

# quais?
which(is.na(da))

# retirar os NAs
da_na <- na.omit(da)

nrow(da)
nrow(da_na)

# subset das linhas com amostragens de anfibios em pernambuco
da_per <- da[da$state == "Pernambuco", ]
da_per

# 3.10 Exportar dados -----------------------------------------------------
# Planilha eletrônica (.csv)
write.csv(da_per, "ATLANTIC_AMPHIBIAN_sites_pernambuco.csv", 
          row.names = FALSE, quote = FALSE)


# Planilha de texto (.txt)
write.table(da_per, "ATLANTIC_AMPHIBIAN_sites_pernambuco.txt", 
            row.names = FALSE, quote = FALSE)

# Planilha eletrônica (.xlsx)
openxlsx::write.xlsx(da_per, "ATLANTIC_AMPHIBIAN_sites_pernambuco.xlsx", 
                     row.names = FALSE, quote = FALSE)

# end ---------------------------------------------------------------------