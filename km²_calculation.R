#Calculo da area em km2 dos mapas de presença-ausência

# Defina o diretório onde estão os seus rasters
diretorio <- "E:/jaguar v4.0"

# Obtenha uma lista de todos os arquivos na pasta com a extensão desejada 
rasters <- list.files(diretorio, pattern = ".tif", full.names = TRUE)

# Crie uma lista para armazenar os rasters importados
lista_rasters <- list()

# Importe cada raster e armazene na lista
for (raster in rasters) {
  nome_raster <- basename(raster)  # Obtenha apenas o nome do raster sem o caminho
  lista_rasters[[nome_raster]] <- terra::rast(raster)  # Importe o raster e armazene na lista usando o nome do arquivo como chave
}

library(terra)

#use a função expanse do pacote terra - Compute the area covered by polygons or for all raster cells that are not NA.
# raster
# unit = km - para cálculo em km2
# byValue = T, a função irá disponibilizar separadamente a soma das células com valor 0 (ausência) e valor 1 (presença)
# transform = T, só utilize se o raster tiver em UTM ou outro CRS plano

expanse(lista_rasters$model_1.26_PA.tif, unit = "km", byValue = T)
