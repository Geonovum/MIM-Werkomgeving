# Metamodel in Linked Data (LD)

## Ontological Metamodel in LD

The MIM expressed in LD includes, among other things, an ontological metamodel. This means that for each of the model elements of the MIM, a class and/or property is defined in terms of RDF, RDFS, and OWL. The following paragraphs provide this elaboration.

The MIM is a *metamodel*. This means that in terms of the MIM, a concrete information model can be developed, for example, the Basic Register Addresses and Buildings information model. The MIM is not intended to then form a concrete dataset in terms of this information model. See also [[[#typering-van-modellen-gekoppeld-aan-beschouwingsniveaus]]]: the MIM is not intended for an information model at level 4. For this, a transformation to a (technical) exchange or storage model is required.

In the same way, applying the MIM in RDF does not yield an ontology or vocabulary in which RDF can be expressed: only the information model itself is expressed in RDF in this way. A separate transformation is required for the translation to an ontology.

From a Linked Data perspective, this is special. A core feature of Linked Data is that an information model at level 3 *also* can be used directly, without modifications, as an information model at level 4. Moreover: Linked Data models can also be used at levels 1 and 2. This is from the MIM itself not possible. This requires a translation into a "real" Linked Data ontology.

For example, an MIM object type "Ship" leads to the following representation in RDF:

<pre class='ex-turtle'>
@prefix vb: &lt;http://modellen.mim-standaard.nl/voorbeeld/> .
@prefix mim: &lt;http://modellen.mim-standaard.nl/def/mim#> .

vb:Ship a mim:Objecttype;
  rdfs:label "Ship"@en;
.
</pre>

`vb:Ship` in this example is an occurrence of the class `mim:Objecttype`. this occurrence itself has no occurrences. This requires a translation to a `rdfs:Class`, for example by:

<pre class='ex-turtle'>
@prefix vbo: &lt;http://modellen.mim-standaard.nl/voorbeeld/def#>.

vbo:Ship a rdfs:Class;
  mim:equivalent vb:Ship;
.
vb:Boat12 a vbo:Ship.
</pre>

The transformation of the MIM model to this RDF ontology is contained in [[[#transformation-mim-rdfs-owl-shacl]]].

## Structure of the metamodel in LD

The RDF model is split into two parts. As usual in RDF, these model parts can be accessed on the Internet via their URL:

1. the [RDF vocabulary](media/mim.ttl), with its (meta)classes and (meta)properties;
2. the [RDF Shapesgraph](media/mim-shapes.ttl), with "shapes", the structure that apply to the use of the classes and properties.

In the sections below, both the vocabulary and structure are discussed jointly for each model element. An RDF representation in turtle is given as well as a graphical representation. For this, the representation is used as described in the document: [Best Practises for meaningful connected computing](https://bp4mc2.org/20181107/#grafische-representative).

Using the above two - machine-readable - files, a serialised MIM model expressed in RDF (e.g. an [XML](https://www.w3.org/TR/rdf-syntax-grammar/), [JSON](https://www.w3.org/TR/json-ld11/) or [Turtle](https://www.w3.org/TR/turtle/) file) can be validated as to whether it has been correctly compiled in accordance with MIM. For example, [this open source java tool](https://github.com/architolk/mimtools) can be used for this purpose.

When creating the MIM in RDF, the general, textual description of the MIM from the [Metamodel General](#metamodel-general) chapter was used. A 1-to-1 conversion was done, without any adaptation of the descriptions. This makes it possible to convert a MIM information model from one representation (e.g. in UML) to another and back again, without loss of information.

The following rules were used when converting the MIM text to RDF:

1. Each occurrence of an MIM "metaclass" was converted to an occurrence of an `owl:Class`;
2. Each metadata of an MIM "metaclass" has been converted to an occurrence of an `owl:DatatypeProperty`, insofar as it is a metadata that has a value expressible with a datatype (such as textual, numeric or boolean metadata);
3. Each metadata of a MIM metaclass is converted to an occurrence of an `owl:ObjectProperty`, insofar as there is a metadata where the value refers to an occurrence of another MIM metaclass;
4. An `rdfs:label` is included with the name of the MIM "metaclass" or metadata, as appropriate;
5. An `rdfs:comment` is included with the definition of the MIM "metaclass" c.q. the metadata.

To convert the data constraints (such as cardinalities, data types and properties per class), a SHACL shape graph was created in the following way:

1. Each occurrence of a MIM "metaclass" also has a `sh:NodeShape` with a `sh:name` corresponding to the original technical name (UpperCamelCase);
2. For each occurrence of a MIM "metaclass", `sh:PropertyShapes` are created to indicate the metadata allowed for a MIM "metaclass", the cardinalities and the data type or associated MIM "metaclass".

Compared to the UML representation of the MIM metamodel, the MIM in RDF only has the use of metadata names and not the names of the bindings associated with these metadata. For example, for the binding between Object Type and Attribute Type, the UML metamodel has the binding name "has attribute" and the role name "attribute". The MIM in RDF uses only the role name "attribute" in this case.

### Core
<figure id="media/rdf-kern">
  <img src="media/rdf-kern.png" alt="" />
  <figcaption>Diagram: Kern metamodel in LD</figcaption>
</figure>

As a prefix for the vocabulary `mim`,with the  namespace `http://modellen.mim-standaard.nl/def/mim#`, will be used. The prefix for the shapes is going to be `shape`, with the following namespace `http://modellen.mim-standaard.nl/def/mim-shapes#`.

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| Featuretype        | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) | shape:Objecttype | [base](#objecttypen-en-attributesoorten) |
| Attributetype   | [`mim:Attribuuttype`](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort) | shape:Attribuuttype | [base](#attributesoort)
| Datatype    | [`mim:Gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep) | shape:Gegevensgroep | [base](#gegevensgroep) |
| Gegevensgroeptype | [`mim:Gegevensgroeptype`](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype) | shape:Gegevensgroeptype | [base](#gegevensgroeptype) |
| Generalisatie     | [`mim:Generalisatie`](http://modellen.mim-standaard.nl/def/mim#Generalisatie) | shape:Generalisatie | [base](#generalisatie) |
| Relatiesoort      | [`mim:Relatiesoort`](http://modellen.mim-standaard.nl/def/mim#Relatiesoort) | shape:Relatiesoort | [base](#relatiesoort) |
| Relatieklasse     | [`mim:Relatieklasse`](http://modellen.mim-standaard.nl/def/mim#Relatieklasse) | shape:Relatieklasse | [base](#relatieklasse) |

In the figure above, not all bindings have been drawn around `mim:Relationship Type`: this would make the figure unnecessarily complex. The bindings with `mim:Data group type` have not been drawn. This is depicted in the figure below. This shows that a `mim:Data Group Type` can have outgoing relations, but no incoming relations: that is always a `mim:Object Type`.

### Datatypes

<figure id="media/rdf-datatype">
  <img src="media/rdf-datatype.png" alt="" />
  <figcaption>Diagram: Datatypen in LD</figcaption>
</figure>

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| Datatype                | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) | shape:Datatype | [base](#datatypen) |
| Primitief datatype      | [`mim:PrimitiefDatatype`](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype) |shape:PrimitiefDatatype | [base](#primitief-datatype) |
| Gestructureerd datatype | [`mim:GestructuurdDatatype`](http://modellen.mim-standaard.nl/def/mim#GestructuurdDatatype) | shape:GestructuurdDatatype | [base](#gestructureerd-datatype) |
| Data element            | [`mim:DataElement`](http://modellen.mim-standaard.nl/def/mim#DataElement) | shape:DataElement | [base](#data-element) |
| Enumeratie              | [`mim:Enumeratie`](http://modellen.mim-standaard.nl/def/mim#Enumeratie) | shape:Enumeratie | [base](#enumeratie) |
| Enumeratiewaarde        | [`mim:Enumeratiewaarde`](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde) | shape:Enumeratiewaarde | [base](#enumeratiewaarde) |
| Referentielijst         | [`mim:Referentielijst`](http://modellen.mim-standaard.nl/def/mim#Referentielijst) | shape:Referentielijst | [base](#referentielijst) |
| Referentie element      | [`mim:ReferentieElement`](http://modellen.mim-standaard.nl/def/mim#ReferentieElement) | shape:ReferentieElement | [base](#referentie-element) |
| Codelijst                | [`mim:Codelijst`](http://modellen.mim-standaard.nl/def/mim#Codelijst) | shape:Codelijst | [base](#codelijst) |

### Other

#### Constraint

<figure id="media/rdf-constraint">
  <img src="media/rdf-constraint.png" alt="" />
  <figcaption>Diagram: Constraint in LD</figcaption>
</figure>

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| Constraint        | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) | shape:Constraint | [base](#constraint) |
| unionconstraint   | [`mim:unionconstraint`](http://modellen.mim-standaard.nl/def/mim#union) | shape:union | [base](#union) |

#### union

The "union construct" allows a union between multiple attribute types, data types and relationship targets (object types). Only one type of these three may be associated with one specific choice. If this data type is chosen for an attribute type or relationship purpose, it has the following meaning, depending on the connected type:

- Attribute type: a choice between attribute types **instead of** the attribute type this choice has as data type;
- Data type: a choice between data types **instead of** this choice data type;
- Relationship Purpose: a choice between object types as relationship purpose **instead of** the relationship role purpose

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| union             | [`mim:union`](http://modellen.mim-standaard.nl/def/mim#union) | shape:union | [base](#union) |
| Datatype          | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) | shape:Datatype | [base](#datatype) |
| Objecttype        | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) | shape:Objecttype | [base](#objecttype) |
| Attribuutsoort    | [`mim:Attribuutsoort`](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort) | shape:Attribuutsoort | [base](#attributesoort) |

*Data type selection*

<figure id="media/rdf-union-datatype">
  <img src="media/rdf-union-datatype.png" alt="" />
  <figcaption>Diagram: Datatypeunion in LD</figcaption>
</figure>

Since an `mim:Choice` is a specialisation of an `mim:Datatype`, an attribute type may refer to a Choice via an `mim:type` one. In this case, such a choice itself has at least two `mim:type` references to the 2 (or more) data types from which to choose.

*Attribute selection*

<figure id="media/rdf-union-attribute">
  <img src="media/rdf-union-attribute.png" alt="" />
  <figcaption>Diagram: Attribuutunion in LD</figcaption>
</figure>

If an `mim:Choice` is used for a choice between attribute types, then from an object type via an `mim:attribute` is not referred to an attribute type, but to the choice. The choice itself in turn refers to the attribute types being chosen between.

*Relationship target selection*

<figure id="media/rdf-union-relatietarget">
  <img src="media/rdf-union-relatietarget.png" alt="" />
  <figcaption>Diagram: Relatietargetunion in LD</figcaption>
</figure>

If an `mim:Choice` is used for a choice between object types that are the relationship targets for a relationship type, then from a relationship type via an `mim:target` is not referred to an object type, but to the choice. The choice itself in turn refers to the object types being chosen between.

*Relationship choice*

<figure id="media/rdf-union-relatiesoort">
  <img src="media/rdf-union-relatiesoort.png" alt="" />
  <figcaption>Diagram: Relatiesoortunion in LD</figcaption>
</figure>

A choice between relationship types is made based on a choice constraint. A choice constraint is not a data type, but rather a constraint that, in this case, indicates that a choice must be made between two relation types.

#### AssociationRole

<figure id="media/rdf-relatie">
  <img src="media/rdf-relatie.png" alt="" />
  <figcaption>Diagram: AssociationRole in LD</figcaption>
</figure>

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| AssociationRole (abstract) | [`AssociationRole`](http://modellen.mim-standaard.nl/def/mim#AssociationRole) | shape:AssociationRole | [base](#AssociationRole) |
| AssociationRole source       | [`AssociationRolesource`](http://modellen.mim-standaard.nl/def/mim#AssociationRolesource) | shape:AssociationRolesource | [base](#AssociationRole) |
| AssociationRole target       | [`AssociationRoletarget`](http://modellen.mim-standaard.nl/def/mim#AssociationRoletarget) | shape:AssociationRoletarget | [base](#AssociationRole) |

#### External link

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| Externe koppeling | [`mim:ExterneKoppeling`](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling) | shape:ExterneKoppeling | [base](#externe-koppeling) |

#### Pakketten

<figure id="media/rdf-packages">
  <img src="media/rdf-packages.png" alt="" />
  <figcaption>Diagram: Packages in LD</figcaption>
</figure>

The metadata <a href="#metadata-contains-model-element">contains-model-element</a> indicates that packages can contain model elements. This metadata is included in the Linked Data metamodel as a relation. Exactly which model elements are allowed is not expressed in the image. For this, see [section 2.6](#packages).

| **MIM metaclass**     | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-----------------------|----------------------|------------------|---------------|
| Package               | [`mim:Package`](http://modellen.mim-standaard.nl/def/mim#Package) | shape:Package | [base](#packages) |
| InformationModel      | [`mim:InformationModel`](http://modellen.mim-standaard.nl/def/mim#InformationModel) | shape:InformationModel | [base](#informatiemodel) |
| Domain (its own IM)   | [`mim:Domain`](http://modellen.mim-standaard.nl/def/mim#Domain) | shape:Domain | [base](#domain) |
| External              | [`mim:External`](http://modellen.mim-standaard.nl/def/mim#External) | shape:External | [base](#external) |
| View                  | [`mim:View`](http://modellen.mim-standaard.nl/def/mim#View) | shape:View | [base](#view) |

## Specification metadata in LD

This section complements the [[[#specification-metadata]]] section. The meaning of metadata is specified in LD independently of the class to which this metadata belongs. Below is a listing of all metadata and the corresponding meta property in RDF. The data rules (structure) for the metadata are specific per class, though, and are covered in the relevant section.

| **MIM metadata** | **Meta-ownership in RDF** | **RDF type** | **Base** |
|---------------------|----------------------------|--------------|---------------|
| aggregatietype | [`mim:aggregatietype`](http://modellen.mim-standaard.nl/def/mim#aggregatietype) | owl:ObjectProperty | [base](#metadata-aggregatietype) |
| alias | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | owl:DatatypeProperty | [base](#metadata-alias) |
| attribute | [`mim:attribute`](http://modellen.mim-standaard.nl/def/mim#attribute) | owl:ObjectProperty | [base](#metadata-heeft-attribute) |
| authentic | [`mim:authentic`](http://modellen.mim-standaard.nl/def/mim#authentic) | owl:ObjectProperty | [base](#metadata-authentic) |
| basis-URI | [`mim:basisUri`](http://modellen.mim-standaard.nl/def/mim#basisUri) | owl:DatatypeProperty | [base](#metadata-basis-uri) |
| concept | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | owl:ObjectProperty | [base](#metadata-concept) |
| term | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | owl:DatatypeProperty | [base](#metadata-concept) |
| source | [`mim:source`](http://modellen.mim-standaard.nl/def/mim#source) | owl:ObjectProperty | [base](#metadata-source) |
| code | [`mim:code`](http://modellen.mim-standaard.nl/def/mim#code) | owl:DatatypeProperty | [base](#metadata-code) |
| constraint | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | owl:ObjectProperty | [base](#metadata-heeft-constraint) |
| data-element | [`mim:dataElement`](http://modellen.mim-standaard.nl/def/mim#dataElement) | owl:ObjectProperty | [base](#metadata-heeft-data-element) |
| datum opname | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | owl:DatatypeProperty | [base](#metadata-datum-opname) |
| definitie | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | owl:DatatypeProperty | [base](#metadata-definitie) |
| doel | [`mim:doel`](http://modellen.mim-standaard.nl/def/mim#doel) | owl:ObjectProperty | [base](#metadata-doel) |
| formeel patroon | [`mim:formeelPatroon`](http://modellen.mim-standaard.nl/def/mim#formeelPatroon) | owl:DatatypeProperty | [base](#metadata-formeel-patroon) |
| gegevensgroep | [`mim:gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#gegevensgroep) | owl:ObjectProperty | [base](#metadata-heeft-gegevensgroep) |
| groeptype | [`mim:groeptype`](http://modellen.mim-standaard.nl/def/mim#groeptype) | owl:ObjectProperty | [base](#metadata-heeft-gegevensgroeptype) |
| herkomst | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | owl:DatatypeProperty | [base](#metadata-herkomst) |
| herkomst definitie | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | owl:DatatypeProperty | [base](#metadata-herkomst-definitie) |
| identificerend | [`mim:identificerend`](http://modellen.mim-standaard.nl/def/mim#identificerend) | owl:DatatypeProperty | [base](#metadata-identificerend) |
| indicatie abstract object | [`mim:indicatieAbstractObject`](http://modellen.mim-standaard.nl/def/mim#indicatieAbstractObject) | owl:DatatypeProperty | [base](#metadata-indicatie-abstract-object)|
| indicatie afleidbaar | [`mim:indicatieAfleidbaar`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | [base](#metadata-indicatie-afleidbaar) |
| indicatie classificerend | [`mim:indicatieClassificerend`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | [base](#metadata-indicatie-classificerend) |
| heeft tijdlijn geldigheid | [`mim:heeftTijdlijnGeldigheid`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid) | owl:DatatypeProperty | [base](#metadata-indicatie-materiele-historie) |
| indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie) | owl:DatatypeProperty | [base](#metadata-indicatie-materiele-historie) |
| heeft tijdlijn registratie | [`mim:heeftTijdlijnRegistratie`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie) | owl:DatatypeProperty | [base](#metadata-indicatie-formele-historie) |
| indicatie formele historie | [`mim:indicatieFormeleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie) | owl:DatatypeProperty | [base](#metadata-indicatie-formele-historie) |
| informatiedomein | [`mim:informatiedomein`](http://modellen.mim-standaard.nl/def/mim#informatiedomein) | owl:DatatypeProperty | [base](#metadata-informatiedomein) |
| informatiemodeltype | [`mim:informatiemodeltype`](http://modellen.mim-standaard.nl/def/mim#informatiemodeltype) | owl:ObjectProperty | [base](#metadata-informatiemodeltype) |
| kardinaliteit | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | owl:DatatypeProperty | [base](#metadata-kardinaliteit)
| kwaliteit | [`mim:kwaliteit`](http://modellen.mim-standaard.nl/def/mim#kwaliteit) | owl:DatatypeProperty | |
| lengte | [`mim:lengte`](http://modellen.mim-standaard.nl/def/mim#lengte) | owl:DatatypeProperty | [base](#metadata-lengte) |
| locatie | [`mim:locatie`](http://modellen.mim-standaard.nl/def/mim#locatie) | owl:DatatypeProperty | [base](#metadata-locatie) |
| identificatie | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | owl:DatatypeProperty | [base](#metadata-identificatie) |
| mim extensie | [`mim:extensie`](http://modellen.mim-standaard.nl/def/mim#extensie) | owl:DatatypeProperty | [base](#metadata-mim-extensie)
| mim taal | [`mim:taal`](http://modellen.mim-standaard.nl/def/mim#taal) | owl:DatatypeProperty | [base](#metadata-mim-taal) |
| mim tekstopmaak | [`mim:tekstopmaak`](http://modellen.mim-standaard.nl/def/mim#tekstopmaak) | owl:DatatypeProperty | [base](#metadata-tekstopmaak) |
| mim versie | [`mim:versie`](http://modellen.mim-standaard.nl/def/mim#versie) | owl:DatatypeProperty | [base](#metadata-mim-versie) |
| mogelijk geen waarde | [`mim:mogelijkGeenWaarde`](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde) | owl:DatatypeProperty | [base](#metadata-mogelijk-geen-waarde) |
| naam | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | owl:DatatypeProperty | [base](#metadata-naam) |
| patroon | [`mim:patroon`](http://modellen.mim-standaard.nl/def/mim#patroon) | owl:DatatypeProperty | [base](#metadata-patroon) |
| populatie | [`mim:populatie`](http://modellen.mim-standaard.nl/def/mim#populatie) | owl:DatatypeProperty | |
| referentie-element | [`mim:referentieElement`](http://modellen.mim-standaard.nl/def/mim#referentieElement) | owl:ObjectProperty | [base](#metadata-bevat-referentie-element) |
| relatiemodelleringstype | [`mim:relatiemodelleringstype`](http://modellen.mim-standaard.nl/def/mim#relatiemodelleringstype) | owl:ObjectProperty | [base](#metadata-relatiemodelleringstype) |
| relatierol | [`mim:relatierol`](http://modellen.mim-standaard.nl/def/mim#relatierol) | owl:ObjectProperty | |
| specificatie formeel | [`mim:specificatieFormeel`](http://modellen.mim-standaard.nl/def/mim#specificatieFormeel) | owl:DatatypeProperty | |
| specificatie text | [`mim:specificatieTekst`](http://modellen.mim-standaard.nl/def/mim#specificatieTekst) | owl:DatatypeProperty | |
| subtype | [`mim:subtype`](http://modellen.mim-standaard.nl/def/mim#subtype) | owl:ObjectProperty | |
| supertype | [`mim:supertype`](http://modellen.mim-standaard.nl/def/mim#supertype) | owl:ObjectProperty | |
| toelichting | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | owl:DatatypeProperty | [base](#metadata-toelichting)
| type | [`mim:type`](http://modellen.mim-standaard.nl/def/mim#type) | owl:ObjectProperty | [base](#metadata-type) |
| unidirectioneel | [`mim:unidirectioneel`](http://modellen.mim-standaard.nl/def/mim#unidirectioneel) | owl:DatatypeProperty | [base](#metadata-unidirectioneel) |
| waarde | [`mim:waarde`](http://modellen.mim-standaard.nl/def/mim#waarde) | owl:ObjectProperty | [base](#metadata-bevat-enumeratiewaarde) |
| minimumwaarde inclusief | [`mim:minimumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeInclusief) | owl:DatatypeProperty  |  [base](#metadata-minimumwaarde-inclusief) |
| minimumwaarde exclusief | [`mim:minimumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeExclusief) | owl:DatatypeProperty  |  [base](#metadata-minimumwaarde-exclusief) |
| maximumwaarde inclusief | [`mim:maximumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeInclusief) | owl:DatatypeProperty  |  [base](#metadata-maximumwaarde-inclusief) |
| maximumwaarde exclusief | [`mim:maximumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeExclusief) | owl:DatatypeProperty  |  [base](#metadata-maximumwaarde-exclusief) |
| mixin | [`mim:mixin`](http://modellen.mim-standaard.nl/def/mim#mixin) | owl:DatatypeProperty  |  [base](#metadata-mixin) |

### Objects and attributes in LD
#### mim:Featuretype

The object types are specified according to the following aspects:

| **Aspect**                | **ownership** | **Cardinality** | **Datatype or class** |
|---------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                      | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                     | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Origin                  | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                 | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Origin definiton        | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Date of recording              | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Populatie                 | [`mim:populatie`](http://modellen.mim-standaard.nl/def/mim#populatie) | 0..1 | text |
| Kwaliteit                 | [`mim:kwaliteit`](http://modellen.mim-standaard.nl/def/mim#kwaliteit) | 0..1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Indicatie abstract object | [`mim:indicatieAbstractObject`](http://modellen.mim-standaard.nl/def/mim#indicatieAbstractObject) | 1 | boolean |
| Attribut                  | [`mim:attribute`](http://modellen.mim-standaard.nl/def/mim#attribute) | 0..* | [`mim:Attribuutsoort`](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort) |
| Gegevensgroep             | [`mim:gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#gegevensgroep) | 0..* | [`mim:Gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep) |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:Attribuutsoort

The attribute types are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://modellen.mim-standaard.nl/def/mim#type) | 1 | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) |
| Length                       | [`mim:lengte`](http://modellen.mim-standaard.nl/def/mim#lengte) | 0..1 | text |
| Pattern                      | [`mim:patroon`](http://modellen.mim-standaard.nl/def/mim#patroon) | 0..1 | text |
| Formal pattern              | [`mim:formeelPatroon`](http://modellen.mim-standaard.nl/def/mim#formeelPatroon) | 0..1 | text |
| Heeft tijdlijn geldigheid    | [`mim:heeftTijdlijnGeldigheid`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid) | 1 | boolean |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Heeft tijdlijn registratie   | [`mim:heeftTijdlijnRegistratie`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Authentiek                   | [`mim:authentic`](http://modellen.mim-standaard.nl/def/mim#authentic) | 1 | Authenticiteit |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Indicatie classificerend     | [`mim:indicatieAfleidbaar`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Identificerend               | [`mim:identificerend`](http://modellen.mim-standaard.nl/def/mim#identificerend) | 0..1 | boolean |
| Eenheid                      | [`mim:eenheid`](http://modellen.mim-standaard.nl/def/mim#eenheid) | 0..1 | [`si:MeasurementUnit`](https://si-digital-framework.org/SI/units?lang=en) |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Minimum value including      | [`mim:minimumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeInclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Minimum value excluding      | [`mim:minimumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeExclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Maximum value including      | [`mim:maximumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeInclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Maximum value excluding      | [`mim:maximumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeExclusief) | 0..1 | integer, decimal, float, real, dateTime, date |

The `mim:authentic` field refers to one of the following possible values:

| **Authenticiteit** | **Definition** |
|--------------------|---------------|
| [`mim:Authentiek`](http://modellen.mim-standaard.nl/def/mim#Authentiek) | In een basisregistratie opgenomen gegeven dat bij wettelijk voorschrift als authentic is aangemerkt. |
| [`mim:Basisgegeven`](http://modellen.mim-standaard.nl/def/mim#Basisgegeven) | Een in een basisregistratie opgenomen gegeven. |
| [`mim:WettelijkGegeven`](http://modellen.mim-standaard.nl/def/mim#WettelijkGegeven) | Gegeven behorende bij een wettelijke registratie, niet zijnde een basisregistratie |
| [`mim:LandelijkKerngegeven`](http://modellen.mim-standaard.nl/def/mim#LandelijkKerngegeven) | Indien het een gegeven of een als relatiesoort gemodelleerd gegeven is in een landelijk sector- en domein-overstijgend informatiemodel en geen authentic gegeven en geen basisgegeven is. |
| [`mim:OverigeAuthenticiteit`](http://modellen.mim-standaard.nl/def/mim#OverigeAuthenticiteit) | Indien het géén van de voorgaande categorieën betreft. Veelal gaat het dan om proces-, taakveld- of domeinspecifieke gegevens. |

The `mim:unit` field refers to a value taken from [SI Digital framework](https://si-digital-framework.org/SI/units?lang=en).

#### mim:AttributeGroup

The data groups are specified by the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Gegevensgroeptype            | [`mim:gegevensgroeptype`](http://modellen.mim-standaard.nl/def/mim#gegevensgroeptype) | 1 | [`mim:Gegevensgroeptype`](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype) |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Authentiek                   | [`mim:authentic`](http://modellen.mim-standaard.nl/def/mim#authentic) | 1 | Authenticiteit |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:AttributeGroupType

The data group types are specified by the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 0..1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 0..1 | text |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Attribut                 | [`mim:attribute`](http://modellen.mim-standaard.nl/def/mim#attribute) | 0..* | [`mim:Attribuutsoort`](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort) |
| Gegevensgroep             | [`mim:gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#gegevensgroep) | 0..* | [`mim:Gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep) |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

### Relationships in LD

The metamodel has two ways of describing a relationship between two object types. This choice is indicated in its own extension, as described in [[[#express-in-linked-data]]]. Only the chosen alternative is relevant for modelling in your information model.

- Alternative 1: Mandatory naming of the relationship name with the associated metadata
- Alternative 2: Mandatory naming of the role of the target in a relationship with its associated metadata and optional naming of the relationship name.

Both alternatives use relationship type and relationship role, but with different rules for use.

#### mim:AssociationType (alt 1: type leading)

Association types are specified according to the following aspects.

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                       | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term                  | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Unidirectioneel              | [`mim:unidirectioneel`](http://modellen.mim-standaard.nl/def/mim#unidirectioneel) | 1 | boolean |
| Bron                         | [`mim:source`](http://modellen.mim-standaard.nl/def/mim#source) | 1 | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) |
| Doel                         | [`mim:doel`](http://modellen.mim-standaard.nl/def/mim#doel) | 1 | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) |
| Aggregatietype               | [`mim:aggregatietype`](http://modellen.mim-standaard.nl/def/mim#aggregatietype) | 1 | Aggregatietype |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Cardinality relatie source   | [`mim:kardinaliteitRelatieBron`](http://modellen.mim-standaard.nl/def/mim#kardinaliteitRelatieBron) | 0..1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Identificerend               | [`mim:identificerend`](http://modellen.mim-standaard.nl/def/mim#identificerend) | 0..1 | boolean |
| Heeft tijdlijn geldigheid    | [`mim:heeftTijdlijnGeldigheid`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid) | 1 | boolean |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Heeft tijdlijn registratie   | [`mim:heeftTijdlijnRegistratie`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentic`](http://modellen.mim-standaard.nl/def/mim#authentic) | 1 | Authenticiteit |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

The `mim:aggregation type` field refers to one of the following possible values:

| **Aggregatietype** | **Definition** |
|--------------------|---------------|
| [`mim:Geen`](http://modellen.mim-standaard.nl/def/mim#Geen) | Er is geen sprake van een aggregatie |
| [`mim:Compositie`](http://modellen.mim-standaard.nl/def/mim#Compositie) | Compositie (gesloten wiebertje) |
| [`mim:Gedeeld`](http://modellen.mim-standaard.nl/def/mim#Gedeeld) | Gedeelde aggregatie (open wiebertje) |

#### mim:AssociationTypes (alt 2: leading role)

Association types are specified according to the following aspects.

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 0..1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                       | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term                  | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 0..1 | text |
| Relatierol                   | [`mim:relatierol`](http://modellen.mim-standaard.nl/def/mim#relatierol) | 1..2 | [`Relatierol`](http://modellen.mim-standaard.nl/def/mim#Relatierol) |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:AssociationRole (alt 1: type of leading)

For relationship roles, the following aspects are specified.

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 0..1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 0..1 | text |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |


#### mim:AssociationRole (alt 2: leading rol)

For association role, the target role of a relationship type will have the following aspects specified.

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                       | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term                  | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Identificerend               | [`mim:identificerend`](http://modellen.mim-standaard.nl/def/mim#identificerend) | 0..1 | boolean |
| Heeft tijdlijn geldigheid    | [`mim:heeftTijdlijnGeldigheid`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid) | 1 | boolean |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Heeft tijdlijn registratie   | [`mim:heeftTijdlijnRegistratie`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentic`](http://modellen.mim-standaard.nl/def/mim#authentic) | 1 | Authenticiteit |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:Generalisation based on feature type

The generalisations are specified by the following aspect:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Subtype                      | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#subtype) | 1 | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) |
| Supertype                      | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#supertype) | 1 | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Mixin                        | [`mim:mixin`](http://modellen.mim-standaard.nl/def/mim#mixin)             | 1 | boolean |
<!-- | Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) | -->

#### mim:Generalisation based on datatypes

The generalisations are specified by the following aspect:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Subtype                      | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#subtype) | 1 | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) |
| Supertype                      | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#supertype) | 1 | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) |
<!-- | Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) | -->

#### mim:AssociationClass

The association classes are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 0..1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 0..1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Constraint                   | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Unidirectioneel              | [`mim:unidirectioneel`](http://modellen.mim-standaard.nl/def/mim#unidirectioneel) | 1 | boolean |
| Aggregatietype               | [`mim:aggregatietype`](http://modellen.mim-standaard.nl/def/mim#aggregatietype) | 1 | Aggregatietype |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Heeft tijdlijn geldigheid    | [`mim:heeftTijdlijnGeldigheid`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid) | 1 | boolean |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Heeft tijdlijn registratie   | [`mim:heeftTijdlijnRegistratie`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentic`](http://modellen.mim-standaard.nl/def/mim#authentic) | 1 | Authenticiteit |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde) | 1 | boolean |

#### mim:ExternalLink

External links are specified according to the following aspects.

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                       | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term                  | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Unidirectioneel              | [`mim:unidirectioneel`](http://modellen.mim-standaard.nl/def/mim#unidirectioneel) | 1 | boolean |
| Bron                         | [`mim:source`](http://modellen.mim-standaard.nl/def/mim#source) | 1 | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) |
| Doel                         | [`mim:doel`](http://modellen.mim-standaard.nl/def/mim#doel) | 1 | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) |
| Aggregatietype               | [`mim:aggregatietype`](http://modellen.mim-standaard.nl/def/mim#aggregatietype) | 1 | Aggregatietype |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Heeft tijdlijn geldigheid    | [`mim:heeftTijdlijnGeldigheid`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid) | 1 | boolean |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Heeft tijdlijn registratie   | [`mim:heeftTijdlijnRegistratie`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentic`](http://modellen.mim-standaard.nl/def/mim#authentic) | 1 | Authenticiteit |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

### Value lists in LD

Where a location is mentioned in the specifications below, it is assumed in Linked Data terms that the value list can be found at this location. Specifically, this means that via content negotiation, the value list is retrievable in a specific serialisation of Linked Data (such as: JSON-LD, RDF/XML, Turtle). It is then assumed that the resources in this file are the individual values of the value list, or other metadata of the value list. Thus, it is obvious that the file contains a resource with the same URL as specified in the location, which can be used to indicate further information.
*** Translated with www.DeepL.com/Translator (free version) ***



#### mim:ReferenceList

For reference lists, the following aspects are specified:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                       | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term                  | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Origin definiton           | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Locatie                      | [`mim:locatie`](http://modellen.mim-standaard.nl/def/mim#locatie) | 1 | text |
| Referentie-element           | [`mim:referentieElement`](http://modellen.mim-standaard.nl/def/mim#referentieElement) | 1..* | [`mim:ReferentieElement`](http://modellen.mim-standaard.nl/def/mim#ReferentieElement) |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:ReferenceElement

The reference elements are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://modellen.mim-standaard.nl/def/mim#type) | 1 | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) |
| Length                       | [`mim:lengte`](http://modellen.mim-standaard.nl/def/mim#lengte) | 0..1 | text |
| Pattern                      | [`mim:patroon`](http://modellen.mim-standaard.nl/def/mim#patroon) | 0..1 | text |
| Formal pattern              | [`mim:formeelPatroon`](http://modellen.mim-standaard.nl/def/mim#formeelPatroon) | 0..1 | text |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Identificerend               | [`mim:identificerend`](http://modellen.mim-standaard.nl/def/mim#identificerend) | 0..1 | text |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Eenheid                      | [`mim:eenheid`](http://modellen.mim-standaard.nl/def/mim#eenheid) | 0..1 | [`si:MeasurementUnit`](https://si-digital-framework.org/SI/units?lang=en) |
| Minimum value including      | [`mim:minimumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeInclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Minimum value excluding      | [`mim:minimumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeExclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Maximum value including      | [`mim:maximumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeInclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Maximum value excluding      | [`mim:maximumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeExclusief) | 0..1 | integer, decimal, float, real, dateTime, date |

#### mim:Codelist

For code list, the following aspects are specified:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Toelichting                  | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Locatie                      | [`mim:locatie`](http://modellen.mim-standaard.nl/def/mim#locatie) | 1 | text |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

### Datatypes in LD
It concerns metadata for data types defined in the information model, or excluding data types that already exist outside the model, such as Integer, DateTime, Surface.

#### mim:PrimitiveDataType

The data types are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Type                         | [`mim:type`](http://modellen.mim-standaard.nl/def/mim#type) | 1 | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) |
| Length                       | [`mim:lengte`](http://modellen.mim-standaard.nl/def/mim#lengte) | 0..1 | text |
| Pattern                      | [`mim:patroon`](http://modellen.mim-standaard.nl/def/mim#patroon) | 0..1 | text |
| Formal pattern              | [`mim:formeelPatroon`](http://modellen.mim-standaard.nl/def/mim#formeelPatroon) | 0..1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:StructuredDataType

For Structured data types, the following aspects are specified:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Pattern                      | [`mim:patroon`](http://modellen.mim-standaard.nl/def/mim#patroon) | 0..1 | text |
| Formal pattern              | [`mim:formeelPatroon`](http://modellen.mim-standaard.nl/def/mim#formeelPatroon) | 0..1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Data-element                 | [`mim:dataElement`](http://modellen.mim-standaard.nl/def/mim#dataElement) | 0..* | [`mim:DataElement`](http://modellen.mim-standaard.nl/def/mim#DataElement) |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:DataElement

The data elements are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://modellen.mim-standaard.nl/def/mim#type) | 1 | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) |
| Length                       | [`mim:lengte`](http://modellen.mim-standaard.nl/def/mim#lengte) | 0..1 | text |
| Pattern                      | [`mim:patroon`](http://modellen.mim-standaard.nl/def/mim#patroon) | 0..1 | text |
| Formal pattern              | [`mim:formeelPatroon`](http://modellen.mim-standaard.nl/def/mim#formeelPatroon) | 0..1 | text |
| Cardinality                | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | 1 | text |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Minimum value including      | [`mim:minimumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeInclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Minimum value excluding      | [`mim:minimumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeExclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Maximum value including      | [`mim:maximumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeInclusief) | 0..1 | integer, decimal, float, real, dateTime, date |
| Maximum value excluding      | [`mim:maximumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeExclusief) | 0..1 | integer, decimal, float, real, dateTime, date |

### Packages in LD

#### mim:InformationModel

Information model packages are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| MIM versie                   | [`mim:mimversie`](http://modellen.mim-standaard.nl/def/mim#mimversie) | 1 | text |
| MIM extensie                 | [`mim:mimextensie`](http://modellen.mim-standaard.nl/def/mim#mimextensie) | 0..1 | text |
| MIM taal                     | [`mim:mimtaal`](http://modellen.mim-standaard.nl/def/mim#mimtaal) | 0..1 | text |
| Informatiedomein             | [`mim:informatiedomein`](http://modellen.mim-standaard.nl/def/mim#informatiedomein) | 1..1 | text |
| InformationModeltype         | [`mim:informatiemodeltype`](http://modellen.mim-standaard.nl/def/mim#informatiemodeltype) | 1..1 | InformationModeltypen |
| Relatiemodelleringstype       | [`mim:relatiemodelleringstype`](http://modellen.mim-standaard.nl/def/mim#relatiemodelleringstype) | 1..1 | Relatiemodelleringstypen |
| tekstopmaak                  | [`mim:tekstopmaak`](http://modellen.mim-standaard.nl/def/mim#tekstopmaak) | 0..1 | text |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Basis-URI                    | [`mim:basisUri`](http://modellen.mim-standaard.nl/def/mim#basisUri) | 0..1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |

The `mim:information model type` field refers to one of the following possible values:

| **InformationModeltype** | **Definition** |
|-------------------------|---------------|
| [`mim:ConceptueelInformationModel`](http://modellen.mim-standaard.nl/def/mim#ConceptueelInformationModel) | Niveau-2 model, conform [deze](#beschouwingsniveau-2-conceptueel-informatiemodel) sectie |
| [`mim:LogischInformationModel`](http://modellen.mim-standaard.nl/def/mim#LogischInformationModel) | Niveau-3 model, conform [deze](#beschouwingsniveau-3-logisch-informatie-of-gegevensmodel) sectie |
| [`mim:TechnischInformationModel`](http://modellen.mim-standaard.nl/def/mim#TechnischInformationModel) | Niveau-4 model, conform [deze](#beschouwingsniveau-4-fysiek-of-technisch-gegevens-of-datamodel) sectie |

The `mim:relationshipModellingType` field refers to one of the following possible values:

| **Relatiemodelleringstype** | **Definition** |
|----------------------------|---------------|
| [`mim:RelatiesoortLeidend`](http://modellen.mim-standaard.nl/def/mim#RelatiesoortLeidend) | Relatiesoort leidend, conform [deze](#relatiesoort-alt-1-soort-leidend) en [deze](#relatierol-alt-1-soort-leidend) secties |
| [`mim:RelatierolLeidend`](http://modellen.mim-standaard.nl/def/mim#RelatierolLeidend) | Relatierol leidend, conform [deze](#relatiesoort-alt-2-rol-leidend) en [deze](#relatierol-alt-2-rol-leidend) secties |

#### mim:Domain

Domain packages are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Basis-URI                    | [`mim:basisUri`](http://modellen.mim-standaard.nl/def/mim#basisUri) | 0..1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |

#### mim:External

External packages are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Locatie                      | [`mim:locatie`](http://modellen.mim-standaard.nl/def/mim#locatie) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Basis-URI                    | [`mim:basisUri`](http://modellen.mim-standaard.nl/def/mim#basisUri) | 0..1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |

#### mim:View

View packages are specified according to the following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Locatie                      | [`mim:locatie`](http://modellen.mim-standaard.nl/def/mim#locatie) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Origin                     | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | 1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |
| Basis-URI                    | [`mim:basisUri`](http://modellen.mim-standaard.nl/def/mim#basisUri) | 0..1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |

### Other model elements in LD

#### mim:Enumeration

Enumerations refer to the Enumeration metaclass and are sent to the following
aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Alias                        | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | 0..1 | text |
| Concept                    | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term               | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Waarde                       | [`mim:waarde`](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde) | 1..* | [`mim:Waarde`](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde) |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

#### mim:EnumerationValue

The enumeration value itself concerns the UML-EnumerationLiteral metaclass and has
following aspects:

| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype or class** |
|------------------------------|----------------|-------------------|--------------|
| Identification | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | 1 | [`xsd:anyURI`](http://www.w3.org/2001/XMLSchema#anyURI) |
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Definition                    | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | 0..1 | text |
| Toelichting               | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | 0..1 | text |
| Code                         | [`mim:code`](http://modellen.mim-standaard.nl/def/mim#code) | 0..1 | text |
| Concept                       | [`mim:concept`](http://modellen.mim-standaard.nl/def/mim#concept) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Term                  | [`mim:term`](http://modellen.mim-standaard.nl/def/mim#term) | 0..* | text |
| Date of recording                 | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | 0..* | [`mim:Constraint`](http://modellen.mim-standaard.nl/def/mim#Constraint) |

An enumeration value may not have an alias, because in UML the alias field is used for the mim:code. Nevertheless, should a `mim:alias` be specified for an enumeration value, it should be read as a `mim:code`. In the RDF model, `mim:code` is a subproperty of a `mim:alias`.

#### mim:Constraint

The enumeration value itself concerns the metaclass UML-EnumerationLiteral and has following aspects:


| **Aspect**                   | **Ownership** | **Cardinality** | **Datatype of _klasse** |
|------------------------------|----------------|-------------------|--------------|
| Name                         | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | 1 | text |
| Specificatie-tekst           | [`mim:specificatieTekst`](http://modellen.mim-standaard.nl/def/mim#specificatieTekst) | 0..1 | text |
| Specificatie-formeel         | [`mim:specificatieFormeel`](http://modellen.mim-standaard.nl/def/mim#specificatieFormeel) | 0..1 | text |

## Linked Data Tooling

MIM's meta-model was created specifically for MIM. No tools are readily available for this. However, there are two alternative options that modellers can follow:

1. Modelers can create an MIM model using Enterprise Architect. There is a tool [Imvertor](https://armatiek.nl/imvertor.html), with which it is possible to transform an MIM Model prepared in Enterprise Architect into a Linked Data model. This tool is open source.
2. Modellers can also draft directly in a Linked Data model (in OWL and SHACL). Such a model, if it complies with the transformation rules, can be seen as an MIM information model. To explicitly make the link to the MIM clear, use can be made of these [SPARQL construction rules](media/rdf2mim.sparql), which "translate back" an RDF/RDFS/OWL/SHACL model into an MIM model. The back-translation rules are described in [[[#transformation-from-rdfs-owl-shacl]]. Several tools are available to build such a model. The most well-known tools are [Protege]](https://protege.stanford.edu) (open source)and [Poolparty](https://www.poolparty.biz) (commercial product). There are also many modellers who use generic IDEs to create Linked Data models, often based on the human-readable [Turtle syntax](https://www.w3.org/TR/turtle).




