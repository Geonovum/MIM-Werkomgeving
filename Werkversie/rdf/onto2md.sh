java -jar libs/rdf2rdf.jar ../../media/mim.ttl model/onto.ttl copy.yaml ../../media/mim-shapes.ttl
java -jar libs/rdf2rdf.jar model/onto.ttl model/ontoref.ttl copy.yaml ../../media/referenties.ttl
java -jar libs/rdf2xml.jar model/ontoref.ttl model/Ontologie.md onto2md.xsl lang=nl
rm model/onto.ttl
rm model/ontoref.ttl
