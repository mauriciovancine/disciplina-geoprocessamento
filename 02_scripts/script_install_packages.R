# -------------------------------------------------------------------------
# install packages
# mauricio vancine - mauricio.vancine@gmail.com
# 30-09-2019
# -------------------------------------------------------------------------

# github ------------------------------------------------------------------
if(!require(devtools)) install.packages("devtools", dependencies = TRUE)

# data manipulation and visualization -------------------------------------
# manipulation and visualization
if(!require(tidyverse)) install.packages("tidyverse", dependencies = TRUE)

# xlsx
if(!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)
if(!require(readxl)) install.packages("readxl", dependencies = TRUE)
if(!require(writexl)) install.packages("writexl", dependencies = TRUE)

# plot in ggpubr
if(!require(ggpubr)) install.packages("ggpubr", dependencies = TRUE)

# geospatial data ---------------------------------------------------------
# vectors
if(!require(geobr)) devtools::install_github("ipeaGIT/geobr")
if(!require(rnaturalearth)) install.packages("rnaturalearth", dependencies = TRUE)
if(!require(sf)) install.packages("sf", dependencies = TRUE)

# manipulation and visualization
if(!require(raster)) install.packages("raster", dependencies = TRUE)
if(!require(rgdal)) install.packages("rgdal", dependencies = TRUE)
if(!require(wesanderson)) devtools::install_github("karthik/wesanderson")

# maps
if(!require(tmap)) install.packages("tmap", dependencies = TRUE)

# end ---------------------------------------------------------------------