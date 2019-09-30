# -------------------------------------------------------------------------
# aula 4 - introducao ao tidyverse

# mauricio vancine
# 30-09-2019
# -------------------------------------------------------------------------

# topicos -----------------------------------------------------------------  
# 4.1 tidyverse
# 4.2 magrittr (pipe - %>%)
# 4.3 readr
# 4.4 readxl e writexl
# 4.5 tibble
# 4.6 tidyr
# 4.7 dplyr
# 4.8 stringr
# 4.9 forcats
# 4.10 purrr

# 4.1 tidyverse -----------------------------------------------------------
# instalar o pacote
# install.packages("tidyverse")

# carregar o pacote
library(tidyverse)

# 4.2 magrittr (pipe - %>%) -----------------------------------------------
# sem pipe
sqrt(sum(1:100))

# com pipe
1:100 %>% 
  sum() %>% 
  sqrt()

# fixar amostragem
set.seed(1)

# sem pipe
ve <- sum(sqrt(sort(log10(rpois(100, 5)))))
ve

# com pipe
ve <- rpois(100, 5) %>% 
  log10() %>%
  sort() %>% 
  sqrt() %>% 
  sum()
ve  

# 4.3 readr ---------------------------------------------------------------
# diretorio
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/00_tabelas")

# formato .csv
# import sites
si <- read_csv("ATLANTIC_AMPHIBIANS_sites.csv")
si

# import species
sp <- read_csv("ATLANTIC_AMPHIBIANS_species.csv")
sp

# formato .txt
# import sites
si <- read_table2("ATLANTIC_AMPHIBIANS_sites.txt")
si

# import species
sp <- read_table2("ATLANTIC_AMPHIBIANS_species.txt")
sp

# 4.4 readxl e writexl ----------------------------------------------------
# packages
# install.packages("readxl")
library("readxl")

# install.packages("writexl")
library("writexl")

# import sites
si <- read_xlsx("ATLANTIC_AMPHIBIANS_sites.xlsx")
si

# import species
sp <- read_xlsx("ATLANTIC_AMPHIBIANS_species.xlsx")
sp

# 4.5 tibble --------------------------------------------------------------
# view the data
glimpse(si)

# view the data
glimpse(sp)

# tibble vs data.frame
# 1. nunca converte um tipo character como factor
df <- data.frame(ch = c("a", "b"), nu = 1:2)
str(df)

tb <- tibble(ch = c("a", "b"), nu = 1:2)
glimpse(tb)

# 2. a indexacao com colchetes sempre retorna um tibble
df_ch <- df[, 1]
class(df_ch)

tb_ch <- tb[, 1]
class(tb_ch)

# indexacao pelo nome devolve um vetor
tb_ch <- tb$ch
class(tb_ch)

# 3. nao faz correspondencia parcial, retorna NULL se a coluna nao existe com o nome especificado
df$c 
tb$c

# 4.6 tidyr ---------------------------------------------------------------
# funcoes
# 1 unite(): junta dados de multiplas colunas em uma
# 2 separate(): separa caracteres em mulplica colunas
# 3 drop_na(): retira linhas com NA
# 4 replace_na(): substitui NA
# 5 spread(): long para wide
# 6 gather(): wide para long
  
# 1 unite
# unir as colunas latirude e longitude separadas por uma vírgula
si_unite <- si %>% 
  unite("lat_lon", latitude:longitude, sep = ",")
si_unite$lat_lon
  
# 2 separate
# separar os dados de "period" em quatro colunas dos seus valores
si_separate <- si %>% 
  separate("period", c("mo", "da", "tw", "ni"), remove = FALSE)
si_separate[, c(1, 9:13)]

# 3 drop_na()
# remove as linhas com NA de todas as colunas
si_drop_na <- si %>% 
  drop_na()
si_drop_na

# remove as linhas com NA da coluna "year_start"
si_drop_na <- si %>% 
  drop_na(year_start)
si_drop_na

# 4 replace_na()
# substituir os NAs da coluna "year_start" por 0 
si_replace_na <- si %>% 
  replace_na(list(year_start = 0))
si_replace_na

# 5 spread () 
# long para wide
# 1. key: variavel categorica que ira definir os nomes das colunas
# 2. value: variavel numerica que ira preencher os dados
si_spread <- si[, c("id", "record", "species_number")] %>% 
  spread(key = record, value = species_number, fill = 0)
si_spread

si_spread <- si[, c("id", "state_abbreviation", "species_number")] %>% 
  spread(key = state_abbreviation, value = species_number, fill = 0)
si_spread

sp_spread <- sp[1:1000, c("id", "species", "individuals")] %>% 
  spread(key = species, value = individuals, fill = 0)
sp_spread

# 6 gather()
# wide para long
# 1. key: variavel categorica que ira definir os nomes das colunas
# 2. value: variavel numerica que ira preencher os dados
si_gather <- si_spread %>% 
  gather(key = record, value = species_number, -id)
si_gather

# 4.7 dplyr ---------------------------------------------------------------
# funcoes
# 1 select(): seleciona colunas pelo nome gerando um tibble
# 2 pull(): seleciona uma coluna como vetor
# 3 rename(): muda o nome das colunas
# 4 mutate(): adiciona novas colunas ou adiciona resultados em colunas existentes
# 5 arrange(): reordenar as linhas com base nos valores de colunas
# 6 filter(): seleciona linhas com base em valores
# 7 distinc(): remove linhas com valores repetidos com base nos valores de colunas
# 8 slice(): seleciona linhas pelos numeros
# 9 n_sample(): amostragem aleatoria de linhas
# 10 summarise(): agrega ou resume os dados atraves de funcoes, podendo considerar valores das colunas
# 11 join(): junta dados de duas tabelas atraves de uma coluna chave


# 1 select
# seleciona colunas pelo nome
si_select <- si %>% 
  select(id, longitude, latitude)
si_select

# nao seleciona colunas pelo nome
si_select <- si %>% 
  select(-c(id, longitude, latitude))
si_select

#  starts_with(), ends_with() e contains()
si_select <- si %>% 
  select(contains("sp"))
si_select

# 2 pull
# coluna para vetor
si_pull <- si %>% 
  pull(id)
si_pull

si_pull <- si %>% 
  pull(species_number)
si_pull

# 3 rename
si_rename <- si %>%
  rename(sp = species_number)
si_rename

# 4 mutate
si_mutate <- si %>% 
  mutate(record_factor = as.factor(record))
si_mutate

# 5 arrange
si_arrange <- si %>% 
  arrange(species_number)
si_arrange

si_arrange <- si %>% 
  arrange(desc(species_number))
si_arrange

si_arrange <- si %>% 
  arrange(-species_number)
si_arrange

# 6 filter
si_filter <- si %>% 
  filter(species_number > 5)
si_filter

si_filter <- si %>% 
  filter(between(species_number, 1, 5))
si_filter

si_filter <- si %>% 
  filter(is.na(passive_methods))
si_filter

si_filter <- si %>% 
  filter(is.na(active_methods) & is.na(passive_methods))
si_filter

si_filter <- si %>% 
  filter(species_number > 5 & state_abbreviation == "BR-PE") 
si_filter

si_filter <- si %>% 
  filter(species_number > 5 | state_abbreviation == "BR-PE")
si_filter

# 7 distinct
si_distinct <- si %>% 
  distinct(species_number)
si_distinct

si_distinct <- si %>% 
  distinct(species_number, .keep_all = TRUE)
si_distinct

# 8 slice 
si_slice <- si %>% 
  slice(1:10)
si_slice

# 9 n_sample 
si_sample_n <- si %>% 
  sample_n(100)
si_sample_n

# 10 summarise
si_summarise <- si %>% 
  summarise(mean_sp = mean(species_number), sd_sp = sd(species_number))
si_summarise

si_summarise_group <- si %>% 
  group_by(country) %>% 
  summarise(mean_sp = mean(species_number), sd_sp = sd(species_number))
si_summarise_group

# 11 join
si_coord <- si %>% 
  select(id, longitude, latitude)
si_coord 

sp_join <- sp %>% 
  left_join(si_coord, by = "id")
sp_join

colnames(sp_join)

#  manipular os dados de forma mais simples
da <- si %>% 
  select(id, state_abbreviation, species_number)
da

da <- si %>% 
  select(id, state_abbreviation, species_number) %>% 
  filter(species_number > 5)
da

da <- si %>% 
  select(id, state_abbreviation, species_number) %>% 
  filter(species_number > 5) %>% 
  group_by(state_abbreviation) %>% 
  summarise(nsp_state_abb = n())
da

da <- si %>% 
  select(id, state_abbreviation, species_number) %>% 
  filter(species_number > 5) %>% 
  group_by(state_abbreviation) %>% 
  summarise(nsp_state_abb = n()) %>% 
  arrange(nsp_state_abb)
da

# 4.8 stringr -------------------------------------------------------------
# comprimento
str_length("abc")

# substituicao
str_sub("abc", 3)

# inserir espaco em branco
str_pad("abc", width = 4, side = "left")
str_pad("abc", width = 4, side = "right")

# remover espaco em branco do comeco, final ou ambos
str_trim(" abc ")

# minusculas e maiusculas
str_to_upper("abc")
str_to_title("abc")
str_to_title("aBc")

# ordenarcao
le <- sample(letters, 26, rep = TRUE)
le

str_sort(le)
str_sort(le, dec = TRUE)

# extrair
str_extract("abc", "b")

# substituir
str_replace("abc", "a", "y")

# separacao
str_split("a-b-c", "-")

# 4.9 forcats -------------------------------------------------------------
# fixar amostragem
set.seed(1)

# criar um fator
fa <- factor(sample(c("alto", "medio", "baixo"), 30, rep = TRUE))
fa

# fct_relevel: reordena os levels de forma simples
fa_or <- fa %>% 
  fct_relevel(c("baixo", "medio", "alto"))
fa_or

# 4.10 purrr --------------------------------------------------------------
# calcular a media para varaos colunas
mean_var <- si %>% 
  select(species_number, altitude) %>% 
  map_dbl(mean)
mean_var

# calcular o desvio padrao para varias colunas
mean_var <- si %>% 
  select(species_number, altitude) %>% 
  map_dbl(sd)
mean_var

# end ---------------------------------------------------------------------