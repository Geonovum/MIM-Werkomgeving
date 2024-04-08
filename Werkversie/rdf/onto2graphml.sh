java -jar libs/rdf2rdf.jar ../../media/mim.ttl model/onto.ttl copy.yaml ../../media/mim-shapes.ttl
java -jar libs/rdf2rdf.jar model/onto.ttl model/ontoref.ttl copy.yaml ../../media/referenties.ttl
# Figuur 27: Kern metamodel in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-kern.graphml libs/rdf2graphml.xsl follow libs/rdf-kern.graphml
# Figuur 28: Bindingen met mim:Gegevensgroeptype in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-relatiekern.graphml libs/rdf2graphml.xsl follow libs/rdf-relatiekern.graphml
# Figuur 29: Datatypen in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-datatype.graphml libs/rdf2graphml.xsl follow libs/rdf-datatype.graphml
# Figuur 30: Constraint in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-constraint.graphml libs/rdf2graphml.xsl follow libs/rdf-constraint.graphml
# Figuur 31: Datatypekeuze in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-keuze-datatype.graphml libs/rdf2graphml.xsl follow libs/rdf-keuze-datatype.graphml
# Figuur 32: Attribuutkeuze in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-keuze-attribuut.graphml libs/rdf2graphml.xsl follow libs/rdf-keuze-attribuut.graphml
# Figuur 33: Relatiedoelkeuze in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-keuze-relatiedoel.graphml libs/rdf2graphml.xsl follow libs/rdf-keuze-relatiedoel.graphml
# Figuur 34: Relatiesoortkeuze in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-keuze-relatiesoort.graphml libs/rdf2graphml.xsl follow libs/rdf-keuze-relatiesoort.graphml
# Figuur 35: Relatierol in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-relatie.graphml libs/rdf2graphml.xsl follow libs/rdf-relatie.graphml
# Figuur 36: Packages in LD
java -jar libs/rdf2xml.jar model/ontoref.ttl media/rdf-packages.graphml libs/rdf2graphml.xsl follow libs/rdf-packages.graphml
rm model/onto.ttl
rm model/ontoref.ttl
