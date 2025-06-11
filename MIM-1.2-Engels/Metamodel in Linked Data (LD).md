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
| Featuretype        | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) | shape:Objecttype | [base](#objecttypen-en-attribuutsoorten) |
| Attributetype   | [`mim:Attribuuttype`](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort) | shape:Attribuuttype | [base](#attribuutsoort)
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
| Keuzeconstraint   | [`mim:Keuzeconstraint`](http://modellen.mim-standaard.nl/def/mim#Keuze) | shape:Choice | [base](#choice) |

#### Choice

The "choice construct" allows a choice between multiple attribute types, data types and relationship targets (object types). Only one type of these three may be associated with one specific choice. If this data type is chosen for an attribute type or relationship purpose, it has the following meaning, depending on the connected type:

- Attribute type: a choice between attribute types **instead of** the attribute type this choice has as data type;
- Data type: a choice between data types **instead of** this choice data type;
- Relationship Purpose: a choice between object types as relationship purpose **instead of** the relationship role purpose

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| Keuze             | [`mim:Keuze`](http://modellen.mim-standaard.nl/def/mim#Keuze) | shape:Keuze | [base](#keuze) |
| Datatype          | [`mim:Datatype`](http://modellen.mim-standaard.nl/def/mim#Datatype) | shape:Datatype | [base](#datatype) |
| Objecttype        | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) | shape:Objecttype | [base](#objecttype) |
| Attribuutsoort    | [`mim:Attribuutsoort`](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort) | shape:Attribuutsoort | [base](#attribuutsoort) |

*Data type selection*

<figure id="media/rdf-keuze-datatype">
  <img src="media/rdf-keuze-datatype.png" alt="" />
  <figcaption>Diagram: Datatypekeuze in LD</figcaption>
</figure>

Since an `mim:Choice` is a specialisation of an `mim:Datatype`, an attribute type may refer to a Choice via an `mim:type` one. In this case, such a choice itself has at least two `mim:type` references to the 2 (or more) data types from which to choose.

*Attribute selection*

<figure id="media/rdf-keuze-attribuut">
  <img src="media/rdf-keuze-attribuut.png" alt="" />
  <figcaption>Diagram: Attribuutkeuze in LD</figcaption>
</figure>

If an `mim:Choice` is used for a choice between attribute types, then from an object type via an `mim:attribute` is not referred to an attribute type, but to the choice. The choice itself in turn refers to the attribute types being chosen between.

*Relationship target selection*

<figure id="media/rdf-keuze-relatietarget">
  <img src="media/rdf-keuze-relatietarget.png" alt="" />
  <figcaption>Diagram: Relatietargetkeuze in LD</figcaption>
</figure>

If an `mim:Choice` is used for a choice between object types that are the relationship targets for a relationship type, then from a relationship type via an `mim:target` is not referred to an object type, but to the choice. The choice itself in turn refers to the object types being chosen between.

*Relationship choice*

<figure id="media/rdf-keuze-relatiesoort">
  <img src="media/rdf-keuze-relatiesoort.png" alt="" />
  <figcaption>Diagram: Relatiesoortkeuze in LD</figcaption>
</figure>

A choice between relationship types is made based on a choice constraint. A choice constraint is not a data type, but rather a constraint that, in this case, indicates that a choice must be made between two relation types.

#### AssociationRole

<figure id="media/rdf-relatie">
  <img src="media/rdf-relatie.png" alt="" />
  <figcaption>Diagram: AssociationRole in LD</figcaption>
</figure>

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| AssociationRole (abstract) | [`AssociationRole`](http://modellen.mim-standaard.nl/def/mim#AssociationRole) | shape:AssociationRole | [grondslag](#AssociationRole) |
| AssociationRole source       | [`AssociationRolesource`](http://modellen.mim-standaard.nl/def/mim#AssociationRolesource) | shape:AssociationRolesource | [grondslag](#AssociationRole) |
| AssociationRole target       | [`AssociationRoletarget`](http://modellen.mim-standaard.nl/def/mim#AssociationRoletarget) | shape:AssociationRoletarget | [grondslag](#AssociationRole) |

#### External link

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-------------------|----------------------|------------------|---------------|
| Externe koppeling | [`mim:ExterneKoppeling`](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling) | shape:ExterneKoppeling | [grondslag](#externe-koppeling) |

#### Pakketten

<figure id="media/rdf-packages">
  <img src="media/rdf-packages.png" alt="" />
  <figcaption>Diagram: Packages in LD</figcaption>
</figure>

The metadata <a href="#metadata-contains-model-element">contains-model-element</a> indicates that packages can contain model elements. This metadata is included in the Linked Data metamodel as a relation. Exactly which model elements are allowed is not expressed in the image. For this, see [section 2.6](#packages).

| **MIM metaclass**     | **Metaclass in RDF** | **Shape in RDF** | **Base** |
|-----------------------|----------------------|------------------|---------------|
| Package               | [`mim:Package`](http://modellen.mim-standaard.nl/def/mim#Package) | shape:Package | [base](#packages) |
| Informatiemodel       | [`mim:Informatiemodel`](http://modellen.mim-standaard.nl/def/mim#Informatiemodel) | shape:Informatiemodel | [grondslag](#informatiemodel) |
| Domain (het eigen IM) | [`mim:Domain`](http://modellen.mim-standaard.nl/def/mim#Domain) | shape:Domain | [base](#domain) |
| External                | [`mim:External`](http://modellen.mim-standaard.nl/def/mim#External) | shape:External | [base](#external) |
| View                  | [`mim:View`](http://modellen.mim-standaard.nl/def/mim#View) | shape:View | [base](#view) |

## Specification metadata in LD

This section complements the [[[#specification-metadata]]] section. The meaning of metadata is specified in LD independently of the class to which this metadata belongs. Below is a listing of all metadata and the corresponding meta property in RDF. The data rules (structure) for the metadata are specific per class, though, and are covered in the relevant section.

| **MIM metagegeven** | **Meta-eigenschap in RDF** | **RDF type** | **Grondslag** |
|---------------------|----------------------------|--------------|---------------|
| aggregatietype | [`mim:aggregatietype`](http://modellen.mim-standaard.nl/def/mim#aggregatietype) | owl:ObjectProperty | [grondslag](#metagegeven-aggregatietype) |
| alias | [`mim:alias`](http://modellen.mim-standaard.nl/def/mim#alias) | owl:DatatypeProperty | [grondslag](#metagegeven-alias) |
| attribuut | [`mim:attribuut`](http://modellen.mim-standaard.nl/def/mim#attribuut) | owl:ObjectProperty | [grondslag](#metagegeven-heeft-attribuut) |
| authentiek | [`mim:authentiek`](http://modellen.mim-standaard.nl/def/mim#authentiek) | owl:ObjectProperty | [grondslag](#metagegeven-authentiek) |
| basis-URI | [`mim:basisUri`](http://modellen.mim-standaard.nl/def/mim#basisUri) | owl:DatatypeProperty | [grondslag](#metagegeven-basis-uri) |
| begrip | [`mim:begrip`](http://modellen.mim-standaard.nl/def/mim#begrip) | owl:ObjectProperty | [grondslag](#metagegeven-begrip) |
| begripsterm | [`mim:begripsterm`](http://modellen.mim-standaard.nl/def/mim#begripsterm) | owl:DatatypeProperty | [grondslag](#metagegeven-begrip) |
| bron | [`mim:bron`](http://modellen.mim-standaard.nl/def/mim#bron) | owl:ObjectProperty | [grondslag](#metagegeven-bron) |
| code | [`mim:code`](http://modellen.mim-standaard.nl/def/mim#code) | owl:DatatypeProperty | [grondslag](#metagegeven-code) |
| constraint | [`mim:constraint`](http://modellen.mim-standaard.nl/def/mim#constraint) | owl:ObjectProperty | [grondslag](#metagegeven-heeft-constraint) |
| data-element | [`mim:dataElement`](http://modellen.mim-standaard.nl/def/mim#dataElement) | owl:ObjectProperty | [grondslag](#metagegeven-heeft-data-element) |
| datum opname | [`mim:datumOpname`](http://modellen.mim-standaard.nl/def/mim#datumOpname) | owl:DatatypeProperty | [grondslag](#metagegeven-datum-opname) |
| definitie | [`mim:definitie`](http://modellen.mim-standaard.nl/def/mim#definitie) | owl:DatatypeProperty | [grondslag](#metagegeven-definitie) |
| doel | [`mim:doel`](http://modellen.mim-standaard.nl/def/mim#doel) | owl:ObjectProperty | [grondslag](#metagegeven-doel) |
| formeel patroon | [`mim:formeelPatroon`](http://modellen.mim-standaard.nl/def/mim#formeelPatroon) | owl:DatatypeProperty | [grondslag](#metagegeven-formeel-patroon) |
| gegevensgroep | [`mim:gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#gegevensgroep) | owl:ObjectProperty | [grondslag](#metagegeven-heeft-gegevensgroep) |
| groeptype | [`mim:groeptype`](http://modellen.mim-standaard.nl/def/mim#groeptype) | owl:ObjectProperty | [grondslag](#metagegeven-heeft-gegevensgroeptype) |
| herkomst | [`mim:herkomst`](http://modellen.mim-standaard.nl/def/mim#herkomst) | owl:DatatypeProperty | [grondslag](#metagegeven-herkomst) |
| herkomst definitie | [`mim:herkomstDefinitie`](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie) | owl:DatatypeProperty | [grondslag](#metagegeven-herkomst-definitie) |
| identificerend | [`mim:identificerend`](http://modellen.mim-standaard.nl/def/mim#identificerend) | owl:DatatypeProperty | [grondslag](#metagegeven-identificerend) |
| indicatie abstract object | [`mim:indicatieAbstractObject`](http://modellen.mim-standaard.nl/def/mim#indicatieAbstractObject) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-abstract-object)|
| indicatie afleidbaar | [`mim:indicatieAfleidbaar`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-afleidbaar) |
| indicatie classificerend | [`mim:indicatieClassificerend`](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-classificerend) |
| heeft tijdlijn geldigheid | [`mim:heeftTijdlijnGeldigheid`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-materiele-historie) |
| indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-materiele-historie) |
| heeft tijdlijn registratie | [`mim:heeftTijdlijnRegistratie`](http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-formele-historie) |
| indicatie formele historie | [`mim:indicatieFormeleHistorie`](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-formele-historie) |
| informatiedomein | [`mim:informatiedomein`](http://modellen.mim-standaard.nl/def/mim#informatiedomein) | owl:DatatypeProperty | [grondslag](#metagegeven-informatiedomein) |
| informatiemodeltype | [`mim:informatiemodeltype`](http://modellen.mim-standaard.nl/def/mim#informatiemodeltype) | owl:ObjectProperty | [grondslag](#metagegeven-informatiemodeltype) |
| kardinaliteit | [`mim:kardinaliteit`](http://modellen.mim-standaard.nl/def/mim#kardinaliteit) | owl:DatatypeProperty | [grondslag](#metagegeven-kardinaliteit)
| kwaliteit | [`mim:kwaliteit`](http://modellen.mim-standaard.nl/def/mim#kwaliteit) | owl:DatatypeProperty | |
| lengte | [`mim:lengte`](http://modellen.mim-standaard.nl/def/mim#lengte) | owl:DatatypeProperty | [grondslag](#metagegeven-lengte) |
| locatie | [`mim:locatie`](http://modellen.mim-standaard.nl/def/mim#locatie) | owl:DatatypeProperty | [grondslag](#metagegeven-locatie) |
| identificatie | [`mim:identificatie`](http://modellen.mim-standaard.nl/def/mim#identificatie) | owl:DatatypeProperty | [grondslag](#metagegeven-identificatie) |
| mim extensie | [`mim:extensie`](http://modellen.mim-standaard.nl/def/mim#extensie) | owl:DatatypeProperty | [grondslag](#metagegeven-mim-extensie)
| mim taal | [`mim:taal`](http://modellen.mim-standaard.nl/def/mim#taal) | owl:DatatypeProperty | [grondslag](#metagegeven-mim-taal) |
| mim tekstopmaak | [`mim:tekstopmaak`](http://modellen.mim-standaard.nl/def/mim#tekstopmaak) | owl:DatatypeProperty | [grondslag](#metagegeven-tekstopmaak) |
| mim versie | [`mim:versie`](http://modellen.mim-standaard.nl/def/mim#versie) | owl:DatatypeProperty | [grondslag](#metagegeven-mim-versie) |
| mogelijk geen waarde | [`mim:mogelijkGeenWaarde`](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde) | owl:DatatypeProperty | [grondslag](#metagegeven-mogelijk-geen-waarde) |
| naam | [`mim:naam`](http://modellen.mim-standaard.nl/def/mim#naam) | owl:DatatypeProperty | [grondslag](#metagegeven-naam) |
| patroon | [`mim:patroon`](http://modellen.mim-standaard.nl/def/mim#patroon) | owl:DatatypeProperty | [grondslag](#metagegeven-patroon) |
| populatie | [`mim:populatie`](http://modellen.mim-standaard.nl/def/mim#populatie) | owl:DatatypeProperty | |
| referentie-element | [`mim:referentieElement`](http://modellen.mim-standaard.nl/def/mim#referentieElement) | owl:ObjectProperty | [grondslag](#metagegeven-bevat-referentie-element) |
| relatiemodelleringstype | [`mim:relatiemodelleringstype`](http://modellen.mim-standaard.nl/def/mim#relatiemodelleringstype) | owl:ObjectProperty | [grondslag](#metagegeven-relatiemodelleringstype) |
| relatierol | [`mim:relatierol`](http://modellen.mim-standaard.nl/def/mim#relatierol) | owl:ObjectProperty | |
| specificatie formeel | [`mim:specificatieFormeel`](http://modellen.mim-standaard.nl/def/mim#specificatieFormeel) | owl:DatatypeProperty | |
| specificatie tekst | [`mim:specificatieTekst`](http://modellen.mim-standaard.nl/def/mim#specificatieTekst) | owl:DatatypeProperty | |
| subtype | [`mim:subtype`](http://modellen.mim-standaard.nl/def/mim#subtype) | owl:ObjectProperty | |
| supertype | [`mim:supertype`](http://modellen.mim-standaard.nl/def/mim#supertype) | owl:ObjectProperty | |
| toelichting | [`mim:toelichting`](http://modellen.mim-standaard.nl/def/mim#toelichting) | owl:DatatypeProperty | [grondslag](#metagegeven-toelichting)
| type | [`mim:type`](http://modellen.mim-standaard.nl/def/mim#type) | owl:ObjectProperty | [grondslag](#metagegeven-type) |
| unidirectioneel | [`mim:unidirectioneel`](http://modellen.mim-standaard.nl/def/mim#unidirectioneel) | owl:DatatypeProperty | [grondslag](#metagegeven-unidirectioneel) |
| waarde | [`mim:waarde`](http://modellen.mim-standaard.nl/def/mim#waarde) | owl:ObjectProperty | [grondslag](#metagegeven-bevat-enumeratiewaarde) |
| minimumwaarde inclusief | [`mim:minimumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeInclusief) | owl:DatatypeProperty  |  [grondslag](#metagegeven-minimumwaarde-inclusief) |
| minimumwaarde exclusief | [`mim:minimumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#minimumwaardeExclusief) | owl:DatatypeProperty  |  [grondslag](#metagegeven-minimumwaarde-exclusief) |
| maximumwaarde inclusief | [`mim:maximumwaardeInclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeInclusief) | owl:DatatypeProperty  |  [grondslag](#metagegeven-maximumwaarde-inclusief) |
| maximumwaarde exclusief | [`mim:maximumwaardeExclusief`](http://modellen.mim-standaard.nl/def/mim#maximumwaardeExclusief) | owl:DatatypeProperty  |  [grondslag](#metagegeven-maximumwaarde-exclusief) |
| mixin | [`mim:mixin`](http://modellen.mim-standaard.nl/def/mim#mixin) | owl:DatatypeProperty  |  [grondslag](#metagegeven-mixin) |