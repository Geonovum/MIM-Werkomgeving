# Script om de ontologie om te zetten naar een begrippenmodel
# Maakt gebruik van: https://github.com/architolk/rdf2rdf
java -jar ~/GITREPO/rdf2rdf/target/rdf2rdf.jar ../../media/mim.ttl model/mim-begrippen.ttl owl2skos.yaml
