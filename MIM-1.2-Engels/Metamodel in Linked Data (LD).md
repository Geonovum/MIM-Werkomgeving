# Metamodel in Linked Data (LD)

## Ontological Metamodel in LD

The MIM expressed in LD includes, among other things, an ontological metamodel. This means that for each of the model elements of the MIM, a class and/or property is defined in terms of RDF, RDFS, and OWL. The following paragraphs provide this elaboration.

The MIM is a *metamodel*. This means that in terms of the MIM, a concrete information model can be developed, for example, the Basic Register Addresses and Buildings information model. The MIM is not intended to then form a concrete dataset in terms of this information model. See also [[[#typering-van-modellen-gekoppeld-aan-beschouwingsniveaus]]]: the MIM is not intended for an information model at level 4. For this, a transformation to a (technical) exchange or storage model is required.

In the same way, applying the MIM in RDF does not yield an ontology or vocabulary in which RDF can be expressed: only the information model itself is expressed in RDF in this way. A separate transformation is required for the translation to an ontology.

From a Linked Data perspective, this is special. A core feature of Linked Data is that an information model at level 3 *also* can be used directly, without modifications, as an information model at level 4. Moreover: Linked Data models can also be used at levels 1 and 2. This is from the MIM itself...

## Linked Data representation of MIM Model Elements

Below, the model elements of the MIM are described in terms of Linked Data concepts.

### Conceptual elements

#### «Informatiemodel» / «Information model»

The `«Informatiemodel»` model element is represented as a class:

```turtle
mim:InformationModel a owl:Class ;
  rdfs:label "Informatiemodel"@nl , "Information Model"@en ;
  rdfs:comment "Het informatiemodel is een gestructureerde verzameling van informatie over een bepaald domein, bedoeld om de betekenis en onderlinge relaties van gegevens te definiëren en te organiseren. "@nl , "The information model is a structured collection of information about a specific domain, intended to define and organize the meaning and interrelationships of data."@en .
```

#### Domain 

mim:Domain a owl:Class ;
  rdfs:label "Domein"@nl , "Domain"@en ;
  rdfs:comment "Een domein is een afgebakend kennisgebied of toepassingsgebied waarbinnen het informatiemodel opereert. "@nl , "A domain is a defined knowledge area or application area within which the information model operates."@en .
