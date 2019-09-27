# -------------------------------------------------------------------------
# install packages
# mauricio vancine - mauricio.vancine@gmail.com
# 30-09-2019
# -------------------------------------------------------------------------

# occurrences -------------------------------------------------------------
# manipulation and visualization
if(!require(tidyverse)) install.packages("tidyverse", dependencies = TRUE)
if(!require(lubridate)) install.packages("lubridate", dependencies = TRUE)

# occurrences download
if(!require(spocc)) install.packages("spocc", dependencies = TRUE)

# clear - taxonomy
if(!require(taxize)) install.packages("taxize", dependencies = TRUE)

# clear - spatial
if(!require(CoordinateCleaner)) install.packages("CoordinateCleaner", dependencies = TRUE)
if(!require(sf)) install.packages("sf", dependencies = TRUE)

# variables ------------------------------------------------------
# manipulation and visualization
if(!require(ggspatial)) install.packages("ggspatial", dependencies = TRUE)
if(!require(landscapetools)) install.packages("landscapetools", dependencies = TRUE)
if(!require(raster)) install.packages("raster", dependencies = TRUE)
if(!require(rgdal)) install.packages("rgdal", dependencies = TRUE)
if(!require(devtools)) install.packages("devtools", dependencies = TRUE)
if(!require(wesanderson)) devtools::install_github("karthik/wesanderson")

# limits
if(!require(rnaturalearth)) install.packages("rnaturalearth", dependencies = TRUE)

# selection - correlation
if(!require(corrr)) install.packages("corrr", dependencies = TRUE)
if(!require(caret)) install.packages("caret", dependencies = TRUE)
if(!require(psych)) install.packages("psych", dependencies = TRUE)

# algorithms --------------------------------------------------------------
# bioclim, domain, and mahalanobis
if(!require(dismo)) install.packages("dismo", dependencies = TRUE)

# svm
if(!require(kernlab)) install.packages("kernlab", dependencies = TRUE)

# random forest
if(!require(randomForest)) install.packages("randomForest", dependencies = TRUE)

# ensemble
if(!require(vegan)) install.packages("vegan", dependencies = TRUE)

# notifications -----------------------------------------------------------
# notification - sound
if(!require(beepr)) install.packages("beepr", dependencies = TRUE)

# end ---------------------------------------------------------------------
