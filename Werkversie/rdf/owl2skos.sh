# Script om de ontologie om te zetten naar een begrippenmodel
# Maakt gebruik van: https://github.com/architolk/rdf2rdf
java -jar libs/rdf2rdf.jar ../../media/mim.ttl model/mim-begrippen.ttl owl2skos.yaml ../../media/mim-shapes.ttl
