install.packages("OneR")
library(OneR)
install.packages("rfviz")
library(rfviz)
install.packages("tidyverse")
library(tidyverse)
library(loon)
training
#rfprep <- rf_prep(data_x, data_y)
trainingCopy <- training
wellbore <- str_split(trainingCopy$wellbore_chev_no_id, '_')
class(wellbore)
wellCat <- c()
for (well in wellbore){
  wellnum <- well[[length(well)]]
  wellCat <- append(wellCat, wellnum)
}
trainingCopy$wellbore_chev_no_id <- wellCat
wellseg <- str_split(trainingCopy$segment_id, '_')
segID <- c()
for (seg in wellseg){
  segnum <- seg[[length(seg)]]
  segID<- append(segID, segnum)
}
segID
trainingCopy$segment_id <- segID
trainingCopy
wellarea <- str_split(trainingCopy$area_id, '_')
areaID <- c()
for (area in wellarea){
  areanum <- area[[length(area)]]
  areaID<- append(areaID, areanum)
}
areaID
trainingCopy$area_id <- areaID
wellform <- str_split(trainingCopy$formation_id, '_')
formID <- c()
for (form in wellform){
  formnum <- form[[length(form)]]
  formID<- append(formID, formnum)
}
formID
trainingCopy$formation_id <- formID
wellbit <- str_split(trainingCopy$bit_model_id, '_')
bitID <- c()
for (bit in wellbit){
  bitnum <- bit[[length(bit)]]
  bitID<- append(bitID, bitnum)
}
trainingCopy$bit_model_id <- bitID


trainingCopy <- transform(trainingCopy, segment_id=as.numeric(segment_id))
trainingCopy <- transform(trainingCopy, area_id=as.numeric(area_id))
trainingCopy <- transform(trainingCopy, formation_id=as.numeric(formation_id))
trainingCopy <- transform(trainingCopy, bit_model_id=as.numeric(bit_model_id))
xregs <- trainingCopy[,-1]
yres <- trainingCopy$rate_of_penetration
rfprep <- rf_prep(xregs, yres)
varImpPlot(rfprep$rf)
wellforest <- rf_viz(rfprep, input=TRUE, imp=TRUE, cmd=TRUE)
wellforest
