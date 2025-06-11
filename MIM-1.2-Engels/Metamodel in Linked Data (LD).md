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

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Basis** |
|-------------------|----------------------|------------------|---------------|
| Featuretype        | [`mim:Objecttype`](http://modellen.mim-standaard.nl/def/mim#Objecttype) | shape:Objecttype | [basis](#objecttypen-en-attribuutsoorten) |
| Attributetype   | [`mim:Attribuuttype`](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort) | shape:Attribuuttype | [basis](#attribuutsoort)
| Datatype    | [`mim:Gegevensgroep`](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep) | shape:Gegevensgroep | [basis](#gegevensgroep) |
| Gegevensgroeptype | [`mim:Gegevensgroeptype`](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype) | shape:Gegevensgroeptype | [basis](#gegevensgroeptype) |
| Generalisatie     | [`mim:Generalisatie`](http://modellen.mim-standaard.nl/def/mim#Generalisatie) | shape:Generalisatie | [basis](#generalisatie) |
| Relatiesoort      | [`mim:Relatiesoort`](http://modellen.mim-standaard.nl/def/mim#Relatiesoort) | shape:Relatiesoort | [basis](#relatiesoort) |
| Relatieklasse     | [`mim:Relatieklasse`](http://modellen.mim-standaard.nl/def/mim#Relatieklasse) | shape:Relatieklasse | [basis](#relatieklasse) |

In the figure above, not all bindings have been drawn around `mim:Relationship Type`: this would make the figure unnecessarily complex. The bindings with `mim:Data group type` have not been drawn. This is depicted in the figure below. This shows that a `mim:Data Group Type` can have outgoing relations, but no incoming relations: that is always a `mim:Object Type`.