# -------------------------------------------------------------------------
# aula 8 - estrutura e manejo de dados geoespaciais no r - vetor

# mauricio vancine
# 03-10-2019
# -------------------------------------------------------------------------

# topicos -----------------------------------------------------------------  
# 8.1 Material e pacotes para análise de dados geoespacias
# 8.2 Vetor: pacote sf
# 8.3 Importar dados vetoriais
# 8.4 Tipos de dados vetoriais
# 8.5 Estrutura de dados vetoriais
# 8.6 Tabela de atributos
# 8.7 Operações de atributos de dados vetoriais
# 8.8 Operações geométricas de dados vetoriais
# 8.9 Operações espaciais de dados vetoriais
# 8.10 Reprojeção e exportar dados vetoriais
# 8.11 Elaboração de mapas de vetores (ggplot e tmap)

# 8.2 Vetor: pacote sf ----------------------------------------------------
# install.packages("sf")
library(sf)

# 8.3 Importar dados vetoriais --------------------------------------------
# directory
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/01_vetor/recife_processamento")

# import
rec_uso <- sf::st_read("PE_2611606_USO_topologia.shp")

# view
rec_uso

# map
plot(rec_uso[1])

# diretorio
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/01_vetor")
dir.create("recife_prefeitura")
setwd("recife_prefeitura")

# download
download.file(url = "http://www.recife.pe.gov.br/ESIG/documentos/SHP/ProjetoRecife_SHP.zip",
              destfile = "ProjetoRecife_SHP.zip")

# unzip
unzip(zipfile = "ProjetoRecife_SHP.zip")

# directory
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/01_vetor/recife_prefeitura")

# import
rec_bairros <- sf::st_read("Bairros.shp", quiet = TRUE)

# map
plot(rec_bairros[1])

# pacote geobr - ibge
# nstall.packages("geobr")
library(geobr)

# brazil
br_2018 <- geobr::read_country(year = 2018)
br_2018

plot(br_2018[1], col = "gray", main = NA)

# brazil
br_1872 <- geobr::read_country(year = 1872)
br_1872

plot(br_1872[1], col = "gray", main = NA)

# pernambuco
per_2018 <- geobr::read_state(code_state = "PE", year = 2018)
per_2018

plot(per_2018[1], col = "gray", main = NA)

# pernambuco municipios
per_mun_2018 <- geobr::read_municipality(code_muni = "PE", year = 2018)
per_mun_2018

plot(per_mun_2018[1], col = "gray", main = NA)

# pacote rnaturalearth - mundo
# install.packages("rnaturalearth")
library(rnaturalearth)

# america do sul
south_america <- rnaturalearth::ne_countries(scale = "small", continent = "South America", returnclass = "sf")
south_america

plot(south_america[1], col = "gray", main = NA)

# america do sul
coastline <- rnaturalearth::ne_coastline(scale = "small", returnclass = "sf")
coastline

plot(coastline[1], col = "blue", main = NA)

# .csv para .shp
# pacote
library(tidyverse)

# diretorio
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/00_tabelas")

# importar tabela
si <- readr::read_csv("ATLANTIC_AMPHIBIANS_sites.csv")

# .csv para .shp
si_ve <- si %>% 
  dplyr::mutate(lon = longitude, lat = latitude) %>% 
  sf::st_as_sf(coords = c("lon", "lat"), crs = 4236)
si_ve

# plot
plot(si_ve[1], pch = 20, main = NA)

# importar dados de gps
# diretorio
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/03_gps")

# importar
gps <- sf::read_sf("10Set_2019_casa.gpx", layer = "waypoints")

# plot
plot(gps[1], pch = 20, main = NA)

# bairros de refice
rec_bairros


# 8.5 Estrutura de dados vetoriais ----------------------------------------
# extention
sf::st_bbox(rec_bairros)

# projection
sf::st_crs(rec_bairros)

# 8.6 Tabela de atributos -------------------------------------------------
# acessar a tabela de atributos
rec_bairros_tab <- sf::st_drop_geometry(rec_bairros)
rec_bairros_tab

# classe
class(rec_bairros_tab)

# 8.7 Operações com tabela de atributos -----------------------------------
# tidyverse
library(tidyverse)

# filtro da feicao
rec_bairros_caxanga <- rec_bairros %>% 
  dplyr::filter(EBAIRRNO_1 == "Caxangá")

# plot
plot(rec_bairros_caxanga[1], main = NA)

# manejo da tabela
rec_bairros_rename <- rec_bairros %>% 
  dplyr::rename(bairros = EBAIRRNOME)
rec_bairros_rename

# 8.8 Operações geométricas -----------------------------------------------
# simplification
rec_bairros_simp <- sf::st_simplify(rec_bairros, dTolerance = 500)
rec_bairros_simp

# plot
plot(rec_bairros[1], main = NA)

# plot
plot(rec_bairros_simp[1], main = NA)

# centroides
rec_bairros_cent <- sf::st_centroid(rec_bairros)
rec_bairros_cent

# plot
plot(rec_bairros_cent[1], main = NA)

# buffer
rec_bairros_buf <- rec_bairros %>% 
  dplyr::filter(EBAIRRNO_1 == "Caxangá") %>% 
  sf::st_buffer(1000)
rec_bairros_buf

# plot
plot(rec_bairros_buf[1], main = NA)

# union = dissolve
rec_bairros_union <- sf::st_union(rec_bairros)
rec_bairros_union

# plot
plot(rec_bairros_union[1], main = NA)

# 8.9 Operações espaciais -------------------------------------------------
rec_uso_caxanga <- rec_bairros %>% 
  dplyr::filter(EBAIRRNO_1 == "Caxangá") %>% 
  sf::st_intersection(rec_uso, .)
rec_uso_caxanga

# plot
plot(rec_uso_caxanga[1], main = NA)

# pontos aleatorios
rec_bairros_rp <- sf::st_sample(rec_bairros_union, 100)
rec_bairros_rp

# plot
plot(rec_bairros_rp, pch = 20, cex = 2, main = NA)

# gride
rec_bairros_grid <- sf::st_make_grid(rec_bairros_union, cellsize = 1000) %>% 
  sf::st_as_sf()
rec_bairros_grid

# pacote
library(tmap)

# plot
tm_shape(rec_bairros) +
  tm_fill() +
tm_shape(rec_bairros_grid) +
  tm_borders()

# contagem por célula
rec_bairros_grid_count <- rec_bairros_grid %>% 
  dplyr::mutate(n = sf::st_intersects(rec_bairros_grid, rec_bairros_rp) %>% 
                  lengths())
rec_bairros_grid_count

# map
tm_shape(rec_bairros_grid_count) +
  tm_polygons(col = "n") +
tm_shape(rec_bairros_rp) +
  tm_dots(size = .5, alpha = .75) +
  tm_legend(legend.position = c("left", "bottom"))

# 8.10 Reprojeção e exportar um vetor -------------------------------------
# reprojection
sf::st_crs(rec_bairros)
rec_bairros_geo <- sf::st_transform(rec_bairros, 4326)
sf::st_crs(rec_bairros_geo)

# directory
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/01_vetor/recife_prefeitura")

# export
sf::st_write(rec_bairros_geo, "bairros_gcs_wgs84.shp")

# 8.11 Elaboração de mapas vetoriais --------------------------------------
# pacote
library(tidyverse)
library(ggspatial)

# mapa bairros
ggplot(data = rec_bairros_geo) +
  geom_sf(col = "black", fill = "gray") +
  theme_bw() +
  annotation_scale(location = "bl", width_hint = .3) +
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(0, "cm"), pad_y = unit(.8, "cm"),
                         style = north_arrow_fancy_orienteering)


# mapa bairros
ggplot(data = rec_bairros_geo) +
  geom_sf(aes(fill = EBAIRRNO_1), col = "gray") +
  scale_fill_viridis_d() +
  theme_bw() +
  annotation_scale(location = "bl", width_hint = .3) +
  annotation_north_arrow(location = "bl", which_north = "true", 
                         pad_x = unit(0, "cm"), pad_y = unit(.8, "cm"),
                         style = north_arrow_fancy_orienteering) +
  theme(legend.position = "none")

# mapa uso
ggplot(data = rec_uso) +
  geom_sf(aes(fill = CLASSE_USO), col = NA) +
  geom_sf(data = rec_bairros, col = "black", fill = NA) +
  scale_fill_manual(values = c("blue", "orange", "gray", "forestgreen")) +
  theme_bw() +
  annotation_scale(location = "bl", width_hint = .3) +
  annotation_north_arrow(location = "bl", which_north = "true", 
                         pad_x = unit(0, "cm"), pad_y = unit(.8, "cm"),
                         style = north_arrow_fancy_orienteering) +
  theme(legend.position = "none")

# package
library(tmap)

# map
rec_bairros_map <- tm_shape(rec_bairros) +
  tm_polygons() +
  tm_grid(lwd = 0.1, labels.inside.frame = FALSE) +
  tm_compass(type = "8star", position = c("right", "top")) +
  tm_scale_bar(breaks = c(0, 1, 2), text.size = 1)
rec_bairros_map

# exportar
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/04_maps")

tmap_save(rec_bairros_map, "map_recife_bairros.png")

# map
rec_uso_map <- tm_shape(rec_uso) +
  tm_fill(col = "CLASSE_USO", palette = c("blue", "orange", "gray", "forestgreen"),
              style = "cat", title = "Classes") +
  tm_shape(rec_bairros) +
  tm_borders() +
  tm_grid(lwd = 0.1, labels.inside.frame = FALSE) +
  tm_compass(type = "8star", position = c("right", "top")) +
  tm_scale_bar(breaks = c(0, 1, 2), text.size = 1)
rec_uso_map

# exportar
setwd("/home/mude/data/github/disciplina-geoprocessamento/03_dados/04_maps")

tmap_save(rec_uso_map, "map_recife_uso.png")

# end ---------------------------------------------------------------------