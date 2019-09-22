# Repositório de dados

## Programa de Pós Graduação em Etnobiologia e Conservação da Natureza

## Nome da disciplina: Introdução ao geoprocessamento para Etnobiologia e Conservação da Biodiversidade 

**Docente responsável** <br>
Prof. Thiago Gonçalves Souza

**Docente externo convidado** <br>
Prof. Maurício Vancine (UNESP- Rio Claro)

**Período** <br>
30/09/2019 - 04/10/2019

**Créditos** <br>
45 horas (3 créditos)

**Vagas** <br>
15 + 5 especiais

**Resumo** <br>
A disciplina oferecerá os principais conceitos teórico-práticos introdutórios de geoprocessamento aplicado à Ecologia. A parte prática será desenvolvida através de ferramentas na linguagem R e dos softwares QGIS e GRASS GIS. Serão abordados os seguintes temas: (i) introdução e funcionamento da linguagem R e do software RStudio, (ii) estrutura e manejo de dados na linguagem R, (iii) introdução ao tidyverse, (iv) visualização de dados, (v) estrutura e fonte de dados espaciais, (vi) introdução e funcionamento do software QGIS, (vii) estrutura e manejo de dados espacias na linguagem R, e (viii) introdução e funcionamento do software GRASS GIS. A carga horária total será de 60 horas, onde em cada dia serão ministrados 6 horas teóricas-práticas num total de 30 horas. As 30 horas restantes serão direcionadas à realização de exercícios práticos, que serão aplicados remotamente como forma de avaliação para compor a nota final da disciplina. Após a realização da disciplina, espera-se que os alunos adquiram conceitos gerais da estrutura e manipulação de dados espaciais, assim como domínio das técnicas e métodos para alcançar autonomia e produzir soluções para suas próprias questões relativas ao geoprocessamento aplicados à Ecologia.

---

### Informações aos participantes

**Datas e horários** <br>
Teórico-prático: 30/09 – 04/10 [09:00 h - 12:00 h | 14:00 h - 17:00 h] (30 horas) <br>
Exercícios-atividades assistidas remotamente: 07/09 – 11/09 (15 horas)

**Local** <br>

**Ementa** <br> 
[pdf](https://gitlab.com/mauriciovancine/disciplina-geoprocessamento/blob/master/00_ementa/ementa.pdf)

**Contato** <br>
Para mais informações ou dúvidas, envie e-mail para Maurício Vancine (mauricio.vancine@gmail.com)

---

### Instruções aos participantes

**Hardware** <br>
Será necessário que todos tragam seus próprios notebooks

**Softwares**<br>
R, RStudio, QGIS e GRASS GIS <br>

1. Instalar a versão mais recente do [R (3.6.1)](https://www.r-project.org) e [RStudio (1.2.5001)](https://www.rstudio.com) <br>
[Vídeo de instalação do R e do RStudio](https://youtu.be/l1bWvZMNMCM) <br>
[Curso da linguagem R](https://www.youtube.com/playlist?list=PLucm8g_ezqNq0RMHvzZ8M32xhopFhmsr6)

2. Instalar a versão mais estável do [QGIS (3.4 LTR)](https://qgis.org/pt_BR/site) <br>
[Vídeo de instalação do QGIS](https://youtu.be/QjhCkX2sVI4) <br>
[Curso Básico de QGIS](https://www.youtube.com/playlist?list=PLRrETkwtvTrMEeicAyYABdNwPpnzZdw5q) <br>
[Curso de QGIS 3.6 - MasterGIS](https://www.youtube.com/watch?v=anSaq5pbCpk&list=PLjHRAtOKOOLhHyQHUXBCfSqOWHFJZ1Pnf)

3. Instalar a versão mais estável do [GRASS GIS (7.6.1 stable)]( https://grass.osgeo.org/#) <br>
[Vídeo de instalação do GRASS GIS](https://youtu.be/wKRCtwq65VU) <br>
[Curso de GRASS GIS](https://www.youtube.com/watch?v=56xkXMd9XBM&list=PLycBDiXWmuxnfLUjs1wkm6WvYsazeLZ0K)

#### Linux (Ubuntu e Linux Mint)
```
# r
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" # mint 19 ou ubuntu 18
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu disco-cran35/" # ubuntu 19
sudo apt update
sudo apt install -y r-base-core # r
sudo apt install -y r-base-dev # devtools
sudo apt install -y libssl-dev # tidyverse
sudo apt install -y libxml2-dev # tidyverse
sudo apt install -y libcurl4-openssl-dev # tidyverse
sudo apt install -y libgdal-dev # gdal
sudo apt install -y libproj-dev # gdal
sudo apt install -y libudunits2-dev # units

# rstudio
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.1335-amd64.deb
sudo dpkg -i rstudio-1.2.1335-amd64.deb
sudo apt install -fy
rm rstudio-1.2.1335-amd64.deb

# qgis
sudo add-apt-repository ppa:ubuntugis/ppa && sudo apt update # mint 19 ou ubuntu 18
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B827C12C2D425E227EDCA75089EBE08314DF160 # ubuntu 19
sudo add-apt-repository "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu bionic main" # ubuntu 19
sudo apt install -y qgis qgis-plugin-grass

# grass
sudo apt install -y grass

```

**Instalar os pacotes no R** <br>
Com o R e o RStudio instalados, baixe esse [script]() (scripts são roteiros que possuem comandos, como um rascunho). <br>
Abra o script baixado (**00_script_install_packages.R**) no software RStudio e rode cada linha de comando para instalar os pacotes. <br>
Para rodar as linhas, basta colocar o cursor na linha de código a ser executada e precionar: `Crtl + Enter`, como mostra o gif abaixo:

![Alt Text](https://appsilon.com/wp-content/uploads/2019/03/blog_code_execution_optimized.gif)
---