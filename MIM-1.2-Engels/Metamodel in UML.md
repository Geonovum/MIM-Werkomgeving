# Metamodel in UML

This chapter describes how to create an information model in UML using the model elements from the chapter [Metamodel General](#metamodel-general).

## Structure or the Metamodel in UML

The first paragraph contains UML diagrams. Each diagram shows a number or model elements. The complete set or diagrams, in their context, is included in appendix [[[#diagrams]]].  
The main principles for the metamodel in UML are:

- UML 2.5 is used as the basis for the conceptual description.  
- Existing UML model elements are used according to the OMG UML standard. OMG refers to these as UML metaclasses. An example or this is a UML-Class.  
- Where (semantically) necessary, extension mechanisms are applied **while preserving the meaning or UML metaclasses**. The model element then becomes a MIM metaclass. How these relate to UML is shown in appendix [[[#diagrams]]].  
- Only one stereotype is used per model element.  
- Two different stereotypes never share the same meaning.  
- Stereotypes are used only when a specialization or a UML construct is required, while maintaining the meaning or the UML metaclass.  
- Each model element has a MIM metaclass. In UML, this is modeled in an information model as an extension or a UML 2.5 Metaclass with an associated stereotype.

<aside class='example' title="Objecttype as UML-Class">
  <p>
    The MIM model element <code>«Objecttype»</code> is modeled as a <code>UML-Class</code> with the stereotype <code>«Objecttype»</code>.  
    Not all MIM metaclasses require a stereotype. In those cases, the column will show: <code>-</code>.
  </p>
  <table>
    <tr>
      <th><strong>MIM Metaclass</strong></th>
      <th><strong>Stereotype</strong></th>
      <th><strong>Metaclass UML 2.5</strong></th>
      <th><strong></strong></th>
      <th><strong>In EA</strong></th>
      <th><strong>In ...</strong></th>
    </tr>
    <tr>
      <td>Objecttype</td>
      <td>«Objecttype»</td>
      <td>(UML) Class</td>
      <td></td>
      <td>Class</td>
      <td></td>
    </tr>
  </table>
  <p>
    The left column shows the MIM model element, as defined in [[[#metamodel-general]]].  
    The 2nd and 3rd columns show how the MIM element is expressed in UML 2.5.  
    The 2nd and 5th columns show how the MIM element is represented in Sparx Enterprise Architect.  
    This tool uses “Class” (instead or “UML-Class”). Naturally, this UML tool is not part or the MIM specification and is not required for use.  
    The column is included only for illustration, to show that depending on the tool, it may sometimes be necessary to specify more precisely how the MIM element is expressed in the tool.  
    The 6th column is reserved for describing the use or another tool.
  </p>
</aside>

Almost all model elements are based on a UML metaclass (UML 2.5).  
In the diagrams that follow, a UML metaclass is shown in light blue.  
A diagrammatic overview including metadata is available in appendix [[[#diagrams]]].


### Core

<figure id="CoreWithoutMetadata">
  <img src="media/KernZonderMetadatas.png" alt="" />
  <figcaption>Diagram: Core without metadata</figcaption>
</figure>

The [appendix](#KernMetMetadatas_Alt2.png) contains the UML diagram including metadata.

### Core without Metadata

| **MIM Metaclass**   | **Stereotype**       | **UML 2.5 Metaclass**           |      | **In Enterprise Architect (EA)** | **In ...** |
| -------------------- | -------------------- | ------------------------------- | ---- | -------------------------------- | ---------- |
| Objecttype           | «Objecttype»         | (UML) Class                     |      | Class                            |            |
| Attribute type       | «Attributetype»     | (UML) Property                  |      | Attribute                        |            |
| Data group           | «Datagroup»      | (UML) Property                  |      | Attribute                        |            |
| Data group type      | «Datagrouptype»  | (UML) Class                     |      | Class                            |            |
| Generalization       | «Generalisation»      | (UML) Generalization            |      | Generalization                   |            |
| Relationship type    | «Relationship type»       | (UML) Association               |      | Association                      |            |
| Relationship class   | «Relatieklasse»      | (UML) Association and (UML) Class |    | Associationclass                 |            |

<aside class="note" title="Stereotype «Datatype» absent in UML">
  <p>
    The element <code>Datatype</code> is also part or the core and, as shown in the diagram, is meant as an abstract model element.  
    <code>Datatype</code> is elaborated in the following section into several concrete forms, each with its own stereotype.
  </p>
</aside>

### Datatypes

<figure id="DatatypesWithoutMetadata">
  <img src="media/DatatypenZonderMetadatas.png" alt="" />
  <figcaption>Diagram: Datatypes without metadata</figcaption>
</figure>

The [appendix](#DatatypenMetMetadatas.png) contains the UML diagram including metadata.

Datatypes without Metadata

_Datatypen_

| **MIM Metaclass**        | **Stereotype**           | **UML 2.5 Metaclass**      |      | **In Enterprise Architect (EA)** | **In ...** |
| --------------------------| ------------------------ | ---------------------------| ---- | -------------------------------- | ---------- |
| Primitive datatype        | «Primitief datatype»     | (UML) Primitive Type       |      | Datatype                         |            |
| Structured datatype       | «Gestructureerd datatype»| (UML) Datatype             |      | Datatype                         |            |
| Data element              | «Data-element»           | (UML) Property             |      | Attribute                        |            |
| Enumeration               | –                        | (UML) Enumeration          |      | Enumeration                      |            |
| Enumeration value         | –                        | (UML) EnumerationLiteral   |      | EnumerationLiteral               |            |
| Reference list            | «Referentielijst»        | (UML) Datatype             |      | Datatype                         |            |
| Reference element         | «Referentie-element»     | (UML) Property             |      | Attribute                        |            |
| Code list                 | «Codelijst»              | (UML) Datatype             |      | Datatype                         |            |

### Other Model Elements

In addition to the core and datatypes, there are several other model elements that serve specific modeling purposes.

#### Constraint

<figure id="ConstraintsWithoutMetadata">
  <img src="media/ConstraintsZonderMetadatas.png" alt="" />
  <figcaption>Diagram: Constraint without metadata</figcaption>
</figure>

**Constraint**

| **MIM Metaclass** | **Stereotype** | **UML 2.5 Metaclass** |      | **In Enterprise Architect (EA)** | **In ...** |
| ----------------- | -------------- | --------------------- | ---- | -------------------------------- | ---------- |
| Constraint        | –              | (UML) Constraint      |      | Constraint                       |            |

#### Choice

There are five situations in which a choice construct is applied:

- **Use case 1:** a choice between datatypes  
- **Use case 2:** a choice between two or more attribute types  
- **Use case 3:** a choice between several ways to fill one meaningful attribute type  
- **Use case 4:** a choice between relationship targets, as a further specification or one meaningful relationship type  
- **Use case 5:** a choice between relationship types/roles (each individually meaningful)

Each application has its own subset or the metamodel.  
The choice construct makes it possible to select between multiple datatypes, attribute types, and relationship targets.  
In UML, we retain the same modeling principle: a datatype remains a datatype, an attribute type remains an attribute type, and a relationship type remains a relationship type.  
The UML elements that use the stereotype `union` (choice) are **not themselves** a datatype, attribute type, or relationship target.  
Note that the diagrams are modeled at the metamodel level; below each diagram, text describes how this applies at the information model level.

#### Use Case 1: Choice between Datatypes

<figure id="ChoiceDatatype1UML">
  <img src="media/UnionDatatype1UML.png" alt="" />
  <figcaption>Diagram: Choice between datatypes in UML</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Datatype_ with the stereotype _«union»_.  
- Within it, model two or more MIM datatypes. For this, include a _UML attribute_ with stereotype _«union»_ inside the choice, and assign the desired (MIM) Datatype as its type.  
  Note: this extra UML attribute is **not** itself a choice option — the choice is between the datatypes.

**Using the Choice for a (MIM) Attribute Type:**
- Choose a _MIM-Attributetype_ and link it to the modeled Choice via typing, as usual.

#### Use Case 2: Choice between Two or More Attribute Types

<figure id="ChoiceAttributeType2UML">
  <img src="media/UnionAttributetype2UML.png" alt="" />
  <figcaption>Diagram: Choice between two or more attribute types</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«union»_.  
- Inside it, model two or more MIM attribute types. Each (MIM) Attributetype is modeled normally, as a _UML Property (attribute)_ with the stereotype _«Attributetype»_ (and this UML Property has as its type a MIM Datatype).

**Using the Choice for a (MIM) Objecttype or (MIM) Data Group Type:**
- Model in an Objecttype or Data Group Type a _UML Property (attribute)_ with the stereotype _«union»_, and link it to the modeled Choice via typing.  
  This _UML Property_ with stereotype _«union»_ is **not** a (MIM) Attribute Type itself.  
  Only UML Properties with stereotype _«Attributetype»_ represent a (MIM) Attribute Type.

#### Use Case 3: Choice between Multiple Ways to Populate One Meaningful Attribute Type

<figure id="ChoiceAttributeType3UML">
  <img src="media/UnionAttributetype3UML.png" alt="" />
  <figcaption>Diagram: Choice between multiple ways to populate one meaningful attribute type</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«union»_.  
- Within it, model two or more choice options by creating, for each, a UML Property (attribute) with the stereotype _«union»_ (and this UML Property has as its datatype a MIM Datatype).  
  Note: this _UML Property (attribute)_ with stereotype _«union»_ is **not** itself a (MIM) Attribute Type.

**Using the Choice for a (MIM) Attribute Type:**
- In a (MIM) Objecttype or Data Group Type, model a MIM Attribute Type as usual, and link the previously modeled Choice to it via typing.

#### Use Case 4: Choice between Relationship Targets, as a Further Specification or One Meaningful Relationship Type

<figure id="ChoiceRelationTarget4UML">
  <img src="media/UnionRelatiedoel4UML.png" alt="" />
  <figcaption>Diagram: Choice between relationship targets as further specification or one meaningful relationship type</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«union»_.  
- Inside it, model two or more outgoing _UML Associations_ with the stereotype _«union»_, each with a (MIM) Objecttype as its target.  
  This _UML Association_ with stereotype _«union»_ is **not** itself a Relationship Type or External Link.

**Using the Choice for a (MIM) Objecttype or Data Group Type:**
- Model in a (MIM) Objecttype or Data Group Type a (MIM) Relationship Type or External Link, as usual.

#### Use Case 5: Choice between Relationship Types / Roles (Each Meaningful in Itself)

<figure id="ChoiceRelationType5UML">
  <img src="media/UnionRelatiedoel5UML.png" alt="" />
  <figcaption>Diagram: Choice between relationship types/roles, each meaningful in itself</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«union»_.  
- Within it, model two or more MIM Relationship Types, each with a target.  
  Each Relationship Type is modeled as usual: a _UML Property_ (association) with the stereotype _«Relationship type»_ or _«External relationship»_, with a target role.

**Using the Choice for a (MIM) Objecttype or Data Group Type:**
- Model in a (MIM) Objecttype or Data Group Type a _UML Association_ with the stereotype _«union»_, and link the modeled Choice to it as the association’s target.  
  This _UML Association_ with stereotype _«union»_ is **not** itself a Relationship Type or External Link.

#### Modeling or a Choice in UML

There are three metaclasses named `Union`, each extending a different UML metaclass.  
The UML metaclass used indicates which variant or the Choice construct it represents.

| **MIM Metaclass** | **Stereotype** | **UML 2.5 Metaclass** |      | **In Enterprise Architect (EA)** | **In ...** |
| ----------------- | -------------- | --------------------- | ---- | -------------------------------- | ---------- |
| Choice            | «Union»        | (UML) Class           |      | Class                            |            |
| Choice            | «Union»        | (UML) Datatype        |      | Datatype                         |            |
| Choice            | «Union»        | (UML) Property        |      | Attribute                        |            |

- If a UML Class with stereotype `«union»` is used, it contains only attribute types and/or relationship targets — the elements to choose from.  
- If a UML Datatype with stereotype `«union»` is used, it contains only datatypes — the datatypes to choose from.  
- If a UML Property with stereotype `«union»` is used, it serves as a helper construct to connect the Choice model element to the MIM model element for which the choice applies.

Note: this table does **not** list the elements that can be chosen between (those are datatypes, attribute types, and relationship types).  
Instead, it describes the **Choice modeling mechanism** in UML — the auxiliary constructs needed to connect the possible elements to the MIM element to which the choice applies.  
These auxiliary constructs carry the stereotype _«union»_, indicating their meaning differs from that or MIM elements such as Datatype, Attribute Type, or Relationship Type.


#### Relatierol

<figure id="AssociatierollenZonderMetadatas">
  <img src="media/AssociatierollenZonderMetadatas.png" alt="" />
  <figcaption>Diagram: Associatierollen zonder metadatas</figcaption>
</figure>

_Relationship type en relatierol_

| **MIM metaclass** | **Stereotype** | **Metaclass UML 2.5** |  | **In EA** | **In ...** |
| ----------------------- | -------------------- | --------------------------- | - | --------------- | ---------------- |
| Relatierol (abstract)   | «Relatierol»       | Property                    |  | AssociationEnd  |                  |
| Relatierol source       | «Relatierol»       | Property                    |  | AssociationEnd  |                  |
| Relatierol target       | «Relatierol»       | Property                    |  | AssociationEnd  |                  |

#### External link

_External link_

| **MIM metaclass** | **Stereotype**  | **Metaclass UML 2.5** |  | **In EA** | **In ...** |
| ----------------------- | --------------------- | --------------------------- | - | --------------- | ---------------- |
| External relationship       | «External relationship» | (UML) Association           |  | Association     |                  |

#### Packages

<figure id="PackagesZonderMetadatas">
  <img src="media/PackagesZonderMetadatas.png" alt="" />
  <figcaption>Diagram: Packages zonder metadatas</figcaption>
</figure>

In de [bijlage](#PackagesMetMetadatas.png) is het UML diagram met de metadatas opgenomen.

_Packages_

| **MIM metaclass** | **Stereotype** | **Metaclass UML 2.5** |  | **In EA** | **In ...** |
| ----------------------- | -------------------- | --------------------------- | - | --------------- | ---------------- |
| Informatiemodel         | «Informatiemodel»  | (UML) Package               |  | Package         |                  |
| Domein (het eigen IM)   | «Domein»           | (UML) Package               |  | Package         |                  |
| Extern                  | «Extern»           | (UML) Package               |  | Package         |                  |
| View                    | «View»             | (UML) Package               |  | Package         |                  |

## Specification metadata in UML

This section is a supplement to [[[#specificationmetadata]]]. In the sections that follow, the metadata for each model element is specified in tables. For each metadata, the following items are specified:

- **Aspect**: The named metadata. The indication `√ `means: in accordance with system agreements for basic registrations. A `*` means: in conformity with the system catalogue. See also the section in H3 on this.
- **Cardinality**: Number or times a metadata entry can be included with this model element.
- **Explanation**: Further explanation or the metadata.
- **In UML 2.5**: The name by which the metadata is named in UML 2.5. It usually refers to inheritance or a metadata from a UML metaclass not named in this document.
- **In EA**: Indication or how the metadata is declared in Sparx Enterprise Architect (EA).

Red text refers to a standard element within EA. Black text in the column refers to an extension to the UM metamodel, via _tagged values_ or additional stereotypes.


<aside class="note" title="Nadere comment op het metadata Alias">
  <p>
    De `Alias` is te specificeren voor `NamedElements` (zoals `UML-Class`, `UML-association`, `UML-Datatype` en `UML-property`). De `Alias` is in UML gespecificeerd bij de metaclass `Element Import`. Dit wordt in UML ingezet voor het importeren van een `NamedElement` uit een ander package. In dit metamodel wordt de `Alias` (nog) niet zo gebruikt. In Enterprise Architect is de alternatieve weergave aan te zetten in de <i>properties</i> van een <i>Diagram</i>, via: `use alias if available`. Voor de definitie van en algemene comment op `Alias`, zie: [[[#metadata-alias]]].
  </p>
</aside>

<aside class="note" title="Nadere comment op het metadata Identficerend">
  <p>
    Als een attributetype identificerend is, dan krijgt dit kenmerk in UML `isId = true`. Als een <code>«<a>Relationship type</a>»</code> identificerend is, dan krijgt dit kenmerk in UML een stereotype `«id»`. Voor de definitie van en algemene comment op `Identificerend`, zie: [[[#metadata-identificerend]]].
  </p>
</aside>

### Objects and attributes in UML

#### «Objecttype»

The object types are specified according to the following aspects:

| **Aspect**                    | **Cardinality** | **Comment**                                                                                                                                                                                                                                                                                                                                                                                                                                                               | **In UML 2.5**                       |  | **In EA**                                                                                                                                                     | **In ...** |
| ----------------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ | - | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| **Identificatie**             | 1                       | Identificerend metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Naam√**                    | 1                       | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | *name of the metaclass Named element*    |  | *Name*                                                                                                                                                            |                  |
| **Alias**                     | 0..1                    | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | *UML-Property*                           |  | *Alias*                                                                                                                                                           |                  |
| **Herkomst**                  | 1                       | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *tagged value*                                                                                                                                                    |                  |
| **Begrip**                    | 0..\*                   | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Definitie√**               | 1                       | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | *Body of the metaclass Comment*          |  | *Notes*                                                                                                                                                           |                  |
| **Herkomst definitie√**      | 1                       | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Comment√**             | 0..1                    | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Datum opname**              | 1                       | General metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Unieke aanduiding√**       | 1                       | De identificerende kenmerken een object die een instantie van het objecttype uniek identificeren. Deze kenmerken worden in UML gemodelleerd als attributetype en/or relatie dus dit metadata hoeft niet apart te worden gespecificeerd bij een objecttype, het is afleidbaar. Voor objecttypen die deel uitmaken van een (basis)registratie or informatiemodel betreft dit de wijze waarop daarin voorkomende objecten (van dit type) uniek in de registratie worden aangeduid. | UML isID                                   |  | *isId bij attributetype, --- or --- stereotype «isId» bij target role relationship type --- or --- een combinatie of theze twee, elk hiervan meer keren toepasbaar* |                  |
| **Populatie√**               | 0..1                    | Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving of the exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.                                                                                                                                                                                                                                                                         |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Kwaliteit√**               | 0..1                    | Beschrijving of the mate waarin in de registratie opgenomen objecten van het desbetreffende type volledig, juist, actueel, nauwkeurig en betrouwbaar zijn.                                                                                                                                                                                                                                                                                                                          |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Indicatie abstract object** | 1                       | Conceptueel model: indicatie dat het objecttype een generalisation is, waarvan een object als specialisatie altijd voorkomt in de hoedanigheid van een (en slechts één) of the specialisaties van het betreffende objecttype. Logisch model: Indicatie dat er geen instanties (objecten) voor het betreffende objecttype mogen voorkomen.                                                                                                                                          | *isAbstract bij de metaclass Classifier* |  | *Abstract*                                                                                                                                                        |                  |
| has**attribuut** /          | 0..*                    | Binding to a attributetype.                                                                                                                                                                                                                                                                                                                                                                                                                                                     | *owned element* = UML-property           |  | *attribute*                                                                                                                                                       |                  |
| has**datagroup**        | 0..*                    | Binding to a datagroup.                                                                                                                                                                                                                                                                                                                                                                                                                                                      | *owned element* = UML-property           |  | *attribute*                                                                                                                                                       |                  |
| has**relationship type**         | 0..*                    | Binding to a relationship type or relatieklasse.                                                                                                                                                                                                                                                                                                                                                                                                                                      | *owned element* = UML-Relationship       |  | *association*                                                                                                                                                     |                  |
| has**external relationship**    | 0..*                    | Binding to a external relationship.                                                                                                                                                                                                                                                                                                                                                                                                                                                  | *owned element* = UML-Relationship       |  | *association*                                                                                                                                                     |                  |
| verwijst naar**supertype** *  | 0..*                    | Binding to a generalisation (naar een ander objecttype).                                                                                                                                                                                                                                                                                                                                                                                                                          | *owned element* = UML-Relationship       |  | *association*                                                                                                                                                     |                  |
| has**Constraint**           | 0..*                    | Binding to a constraint.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |                                            |  | *Constraint*                                                                                                                                                      |                  |

#### «Attributetype»

De attributetypeen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Cardinality** | **Comment**                                                                                                                                                                                        | **In UML 2.5**                                               |  | **In EA**     | **In ...** |
| --------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------ | - | ------------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metadata.                                                                                                                                                                                  |                                                                    |  | *Tagged value*    |                  |
| **Naam√**                                    | 1                       | General metadata.                                                                                                                                                                                        | *name of the metaclass Named element*                            |  | *Name*            |                  |
| **Alias**                                     | 0..1                    | General metadata.                                                                                                                                                                                        | *UML-Property*                                                   |  | *Alias*           |                  |
| **Herkomst**                                  | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *tagged value*    |                  |
| **Begrip**                                    | 0..\*                   | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Definitie√**                               | 1                       | General metadata.                                                                                                                                                                                        | *Body of the metaclass Comment*                                  |  | *Notes*           |                  |
| **Herkomst definitie√**                      | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Comment√**                             | 0..1                    | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Datum opname**                              | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Domein** *(aspecten van een waarde/data)* |                         | *Domein is zelf geen metadata aspect. Onder het kopje ‘domein’ vallen een aantal metadata aspecten die gelden voor een waarde, ortewel de eisen waaraan een waarde van een attributetype moet voldoen.* |                                                                    |  |                     |                  |
| **- Lengte**                                  | 0..1                    | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **- Patroon**                                 | 0..1                    | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **- Formeel Patroon**                         | 0..1                    | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Has tijdlijn geldigheid √**              | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Indicatie materiële historie √**          | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Has tijdlijn registratie √**             | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Indicatie formele historie √**             | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Cardinality √**                          | 1                       | General metadata.                                                                                                                                                                                        | *lowerValue en upperValue of the metaclass Multiplicity Element* |  | *Multiplicity*    |                  |
| **Authentiek √**                             | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Indicatie afleidbaar**                      | 1                       | General metadata.                                                                                                                                                                                        | *isDerived bij metaclass Property*                               |  | *isDerived*       |                  |
| **Indicatie classificerend**                  | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Mogelijk geen waarde**                      | 1                       | General metadata.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Identificerend**                            | 0..1                    | General metadata.                                                                                                                                                                                        | *isID bij de metaclass Property*                                 |  | *isID*            |                  |
| **Minimumwaarde inclusief**                   | 0..1                    | General metadata. An attribute type may contain either a metadata **Minimum value inclusive** or **Minimum value exclusive** , not both                                                  |                                                                    |  | _Tagged value_    |                  |
| **Minimumwaarde exclusief**                   | 0..1                    | General metadata. An attribute type may contain either a metadata **Minimum value inclusive** or **Minimum value exclusive** , not both                                                  |                                                                    |  | _Tagged value_    |                  |
| **Maximumwaarde inclusief**                   | 0..1                    | General metadata. An attribute type may contain either a metadata**Maximumwaarde inclusief** or **Maximumwaarde exclusief** , not both                                                  |                                                                    |  | _Tagged value_    |                  |
| **Maximumwaarde exclusief**                   | 0..1                    | General metadata. An attribute type may contain either a metadata**Maximumwaarde inclusief** or **Maximumwaarde exclusief** , not both                                                  |                                                                    |  | _Tagged value_    |                  |
| **Eenheid**                                   | 0..1                    | Toevoegen als het attributetype een waarde betreft en de eenheid als metadata opgenomen moet worden.                                                                                                     |                                                                    |  | *Tagged value*    |                  |
| has data**type**                            | 1                       | Binding to a datatype.                                                                                                                                                                                    | *datatype* = UML-datatype                                        |  | *type* = datatype |                  |
| has**Constraint**                           | 0..*                    | Binding to a constraint.                                                                                                                                                                                  |                                                                    |  | *Constraint*      |                  |

#### «Datagroup»

De datagroupen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                 | **Cardinality** | **Comment**              | **In UML 2.5**                                               |  | **In EA**                                                           | **In ...** |
| -------------------------------- | ----------------------- | ---------------------------------- | ------------------------------------------------------------------ | - | ------------------------------------------------------------------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metadata.        |                                                                    |  | *Tagged value*                                                          |                  |
| **Naam**                   | 1                       | General metadata.              | *name of the metaclass Named element*                            |  | *Name*                                                                  |                  |
| **Alias**                  | 0..1                    | General metadata.              | *UML-Property*                                                   |  | *Alias*                                                                 |                  |
| **Herkomst**               | 0..1                    | General metadata.              |                                                                    |  | *tagged value*                                                          |                  |
| **Begrip**                 | 0..\*                   | General metadata.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Definitie**              | 1                       | General metadata.              | *Body of the metaclass Comment*                                  |  | *Notes*                                                                 |                  |
| **Herkomst definitie**     | 1                       | General metadata.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Comment√**          | 0..1                    | General metadata.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Datum opname**           | 1                       | General metadata.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Cardinality**          | 1                       | General metadata.              | *lowerValue en upperValue of the metaclass Multiplicity Element* |  | *Multiplicity of the source role of the bijbehorende composite relatie* |                  |
| **Authentiek**             | 1                       | General metadata.              |                                                                    |  | *Tagged value*                                                          |                  |
| has**datagrouptype** | 1                       | Binding to a datagrouptype. | *owned element* = UML-Class                                      |  | *type* = Class                                                          |                  |
| has**Constraint**        | 0..*                    | Binding to a constraint.        |                                                                    |  | *Constraint*                                                            |                  |

#### «Datagrouptype»

De datagrouptypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                 | **Cardinality** | **Comment**                                             | **In UML 2.5**                                            |  | **In EA**                                                           | **In ...** |
| -------------------------------- | ----------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------- | - | ------------------------------------------------------------------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metadata.                                       |                                                                 |  | *Tagged value*                                                          |                  |
| **Naam**                   | 1                       | General metadata.                                             | *name of the metaclass Named element*                         |  | *Name*                                                                  |                  |
| **Alias**                  | 0..1                    | General metadata.                                             | *UML-Property*                                                |  | *Alias*                                                                 |                  |
| **Herkomst**               | 1                       | General metadata.                                             |                                                                 |  | *tagged value*                                                          |                  |
| **Begrip**                 | 0..\*                   | General metadata.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Definitie**              | 1                       | General metadata.                                             | *Body of the metaclass Comment*                               |  | *Notes*                                                                 |                  |
| **Herkomst definitie**     | 1                       | General metadata.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Comment√**          | 0..1                    | General metadata.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Datum opname**           | 1                       | General metadata.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Cardinality**          | 1                       | General metadata.                                             | *lowerValue en upperValue van metaclass Multiplicity Element* |  | *Multiplicity of the source role of the bijbehorende composite relatie* |                  |
| **Authentiek**             | 1                       | General metadata.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| has**attribuut**         | 0..*                    | Binding to a attributetype.                                   | *owned element* = UML-property                                |  | *attribute*                                                             |                  |
| has**datagroup**     | 0..*                    | Binding to a datagroup.                                    | *owned element* = UML-property                                |  | *attribute*                                                             |                  |
| has**relationship type**      | 0..*                    | Binding to a relationship type or relatieklasse.                    | *owned element* = UML-Relationship                            |  | *association*                                                           |                  |
| has**external relationship** | 0..*                    | Binding to a external relationship.                                | *owned element* = UML-Relationship                            |  | *association*                                                           |                  |
| verwijst naar**supertype** | 0..*                    | Binding to a generalisation (naar een ander datagrouptype). | *owned element* = UML-Relationship                            |  | *association*                                                           |                  |
| has**Constraint**        | 0..*                    | Binding to a constraint.                                       |                                                                 |  | *Constraint*                                                            |                  |

### Relaties in UML

<aside class="note" title="Aanvullen met uitleg Generalisation">
  <p>Deze paragraaf bevat de specificaties van <code>«Relationship type»</code>, <code>«Relatierol»</code>, <code>«Relatieklasse»</code> en <code>«Generalisation»</code>, maar onderstaande alinea's vertellen enkel iets over alternatieven met betrekking tot <code>«Relationship type»</code> en <code>«Relatierol»</code>. Je verwacht hier ook iets van uitleg over de toepassing van andere stereotypen (or een verwijzing ernaar).
  </p>
</aside>

Het metamodel has twee manieren om een relatie tussen twee objecttypen te
beschrijven. Deze union wordt aangegeven in de eigen extensie, zoals beschreven
in [[[#alternatieven]]]. Alleen het gekozen alternatief is relevant voor de modellering in uw informatiemodel. Welke alternatief je ook kiest: beide hanteren `<code>`«Relationship type»`</code>` en `<code>`«Relatierol»`</code>`, maar met andere regels voor gebruik.

**Alternatief 1: Relationship type is leidend**

Relationship type is verplicht, met een naam en met een definitie en deze is leidend.
Metadata aspecten worden hierbij altijd vastgelegd. Het gebruik van relatierol
is optioneel (zowel bij source en target). Áls er een relatierol target wordt
vastgelegd, dan is de metadata hierbij wel verplicht.

**Alternatief 2: Relatierol is leidend**

Verplichte benoeming of the rol of the target in een relatie met de bijbehoren
de metadatas en optioneel de benoeming of the naam of the relatie.

#### «Relationship type» (alt 1: soort leidend)

De relationship typeen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                           | **Cardinality** | **Comment**       | **In UML 2.5**                                                      |  | **In EA**                                                       | **In ...** |
| ------------------------------------------ | ----------------------- | --------------------------- | ------------------------------------------------------------------------- | - | --------------------------------------------------------------------- | ---------------- |
| **Identificatie**                    | 1                       | Identificerend metadata. |                                                                           |  | *Tagged value*                                                      |                  |
| **Naam√**                           | 1                       | General metadata.       | *name of the metaclass Named element*                                   |  | *Name*                                                              |                  |
| **Alias**                            | 0..1                    | General metadata.       | *UML-Property*                                                          |  | *Alias*                                                             |                  |
| **Herkomst**                         | 1                       | General metadata.       |                                                                           |  | *tagged value*                                                      |                  |
| **Begrip**                           | 0..\*                   | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Definitie√**                      | 1                       | General metadata.       | *Body of the metaclass Comment*                                         |  | *Notes*                                                             |                  |
| **Herkomst definitie√**             | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Comment√**                    | 0..1                    | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Datum opname**                     | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Identificerend**                   | 0..1                    | General metadata.       | *isID bij de metaclass Property*                                        |  | *isID*                                                              |                  |
| **Unidirectioneel**                  | 1                       | General metadata.       |                                                                           |  | *Direction of the betreffende assiciation (van source naar target)* |                  |
| **Bron**                             | 1                       | General metadata.       | */source: related Element bij Relationship Element*                     |  | *Source*                                                            |                  |
| **Doel**                             | 1                       | General metadata.       | */target: related Element bij Relationship Element*                     |  | *Target*                                                            |                  |
| **Aggregatietype**                   | 1                       | General metadata.       | *AggregationKind bij metaclass Property*                                |  | *Aggregation of the source role met waarde composite or shared*     |                  |
| **Cardinality√**                  | 1                       | General metadata.       | *lowerValue en upperValue of the metaclass MultiplicityElement* /target |  | *Multiplicity of the target role*                                   |                  |
| **Cardinality relatie bron**       | 1                       | General metadata.       | *lowerValue en upperValue of the metaclass MultiplicityElement* /source |  | *Multiplicity of the source role*                                   |                  |
| **Has tijdlijn geldigheid √**     | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie materiële historie √** | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Has tijdlijn registratie √**    | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie formele historie √**    | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Authentiek√**                     | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie afleidbaar**             | 1                       | General metadata.       | *isDerived bij UML metaclass Assocation*                                |  | *isDerived*                                                         |                  |
| **Mogelijk geen waarde**             | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| verwijst naar relatie**doel**        | 0..*                    | Binding to a objecttype. | */target: related Element bij Relationship Element* = UML-Class         |  | *association target* = Class                                        |                  |
| has**Constraint**                  | 0..*                    | Binding to a constraint. |                                                                           |  | *Constraint*                                                        |                  |

#### «Relationship type» (alt 2: rol leidend)

De relationship typeen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Cardinality** | **Comment**       | **In UML 2.5**                                              |  | **In EA**                | **In ...** |
| ---------------------------------- | ----------------------- | --------------------------- | ----------------------------------------------------------------- | - | ------------------------------ | ---------------- |
| **Identificatie**            | 1                       | Identificerend metadata. |                                                                   |  | *Tagged value*               |                  |
| **Naam**                     | 1                       | General metadata.       | *name of the metaclass Named element*                           |  | *Name*                       |                  |
| **Alias**                    | 0..1                    | General metadata.       | *UML-Property*                                                  |  | *Alias*                      |                  |
| **Herkomst**                 | 1                       | General metadata.       |                                                                   |  | *tagged value*               |                  |
| **Begrip**                   | 0..\*                   | General metadata.       |                                                                   |  | *Tagged value*               |                  |
| **Definitie**                | 1                       | General metadata.       | *Body of the metaclass Comment*                                 |  | *Notes*                      |                  |
| **Herkomst definitie**       | 1                       | General metadata.       |                                                                   |  | *Tagged value*               |                  |
| **Comment**              | 0..1                    | General metadata.       |                                                                   |  | *Tagged value*               |                  |
| **Datum opname**             | 1                       | General metadata.       |                                                                   |  | *Tagged value*               |                  |
| verwijst naar**relatiedoel** | 0..*                    | Binding to a objecttype. | */target: related Element bij Relationship Element* = UML-Class |  | *association target* = Class |                  |
| has**Constraint**          | 0..*                    | Binding to a constraint. |                                                                   |  | *Constraint*                 |                  |

#### «Relatierol» (alt 1: soort leidend)

Relatierollen worden naar de volgende aspecten gespecificeerd.

| **Aspect**             | **Cardinality** | **Comment**                                                                | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| ---------------------------- | ----------------------- | ------------------------------------------------------------------------------------ | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metadata.                                                          |                                         |  | *Tagged value* |                  |
| **Naam**               | 1                       | General metadata. De default naam is gelijk aan de naam van het doel-objecttype. | *name of the metaclass Named element* |  | *Name*         |                  |
| **Alias**              | 0..1                    | General metadata.                                                                | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**           | 1                       | General metadata.                                                                |                                         |  | *tagged value* |                  |
| **Begrip**             | 0..\*                   | General metadata.                                                                |                                         |  | *Tagged value* |                  |
| **Definitie**          | 1                       | General metadata.                                                                | *Body of the metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie** | 1                       | General metadata.                                                                |                                         |  | *Tagged value* |                  |
| **Comment**        | 0..1                    | General metadata.                                                                |                                         |  | *Tagged value* |                  |
| **Datum opname**       | 1                       | General metadata.                                                                |                                         |  | *Tagged value* |                  |
| has**Constraint**    | 0..*                    | Binding to a constraint.                                                          |                                         |  | *Constraint*   |                  |

#### «Relatierol» (alt 2: rol leidend)

Voor relatierol worden bij de target rol van een relationship type de volgende
aspecten gespecificeerd.

| **Aspect**                           | **Cardinality** | **Comment**                                                                 | **In UML 2.5**                                               |  | **In EA**  | **In ...** |
| ------------------------------------------ | ----------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------ | - | ---------------- | ---------------- |
| **Identificatie**                    | 1                       | Identificerend metadata.                                                           |                                                                    |  | *Tagged value* |                  |
| **Naam√**                           | 1                       | General metadata.  De default naam is gelijk aan de naam van het doel-objecttype. | *name of the metaclass Named element*                            |  | *Name*         |                  |
| **Alias**                            | 0..1                    | General metadata.                                                                 | *UML-Property*                                                   |  | *Alias*        |                  |
| **Herkomst**                         | 1                       | General metadata.                                                                 |                                                                    |  | *tagged value* |                  |
| **Begrip**                           | 0..\*                   | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Definitie√**                      | 1                       | General metadata.                                                                 | *Body of the metaclass Comment*                                  |  | *Notes*        |                  |
| **Herkomst definitie√**             | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Comment√**                    | 0..1                    | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Datum opname**                     | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Identificerend**                   | 0..1                    | General metadata.                                                                 | *isID bij de metaclass Property*                                 |  | *isID*         |                  |
| **Cardinality√**                  | 1                       | General metadata.                                                                 | *lowerValue en upperValue of the metaclass Multiplicity Element* |  | *Multiplicity* |                  |
| **Has tijdlijn geldigheid √**     | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Indicatie materiële historie √** | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Has tijdlijn registratie √**    | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Indicatie formele historie √**    | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Authentiek√ \***                  | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Mogelijk geen waarde**             | 1                       | General metadata.                                                                 |                                                                    |  | *Tagged value* |                  |
| has**Constraint**                  | 0..*                    | Binding to a constraint.                                                           |                                                                    |  | *Constraint*   |                  |

#### «Generalisation» tussen objecttypes

De generalisations worden naar het volgende aspecten gespecificeerd:

| **Aspect**                 | **Cardinality** | **Comment**                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | **In UML 2.5**                                              |  | **In EA**  | **In ...** |
| -------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                                   |  | *Tagged value* |                  |
| **Subtype**                | 1                       | De generalisation relatie kent twee kanten, de bron kant (source) of the relatie en de doel kant (target) of the relatie. De bron kant of theze generalisation relatie specificeert een_objecttype_ die een subtype/specialisatie is van het via deze generalisation relatie aangegeven supertype (zie verwijst naar supertype). Kortweg, het subtype is een specialisatie van het supertype. Het objecttype dat het subtype is of theze generalisation is verbonden met deze generalisation. | */source: related Element bij Relationship Element*             |  | *Source*       |                  |
| verwijst naar**supertype** | 1                       | Binding of theze generalisation aan een objecttype. De generalisation relatie kent twee kanten, de bron kant (source) of the relatie en de doel kant (target) of the relatie. De doel kant of theze generalisation relatie specificeert een_objecttype_ die het supertype/de generalisation is van het via deze generalisation aangegeven subtype. Kortweg, het supertype is een generalisation van het subtype.                                                                               | */target: related Element bij Relationship Element* = UML-Class |  | *Target*       |                  |
| **Datum opname**           | 1                       | General metadata                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |                                                                   |  | *Tagged value* |                  |
| has**Constraint**        | 0..*                    | Binding to a constraint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                                   |  | *Constraint*   |                  |
| **Mixin**                  | 1                       | Alleen bij MIM niveau 3, logische modellen                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                                   |  | *Tagged value* |                  |

#### «Generalisation» tussen datatypen

De generalisations worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                      | **Cardinality** | **Comment**                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | **In UML 2.5**                                                 |  | **In EA**  | **In ...** |
| ----------------------------------------------------- | ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**                               | 1                       | Identificerend metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                      |  | *Tagged value* |                  |
| **Subtype**                                     | 1                       | De generalisation relatie kent twee kanten, de bron kant (source) of the relatie en de doel kant (target) of the relatie. De bron kant of theze generalisation relatie specificeert een_datatype_ die een subtype/specialisatie is van het via deze generalisation relatie aangegeven supertype (zie verwijst naar supertype). Kortweg, het subtype is een specialisatie van het supertype. Het datatype dat het subtype is of theze generalisation is verbonden met deze generalisation. |                                                                      |  |                  |                  |
| */source: related Element bij Relationship Element* |                         | *Source*                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                                                      |  |                  |                  |
| verwijst naar**supertype**                      | 1                       | Binding of theze generalisation aan een datatype. De generalisation relatie kent twee kanten, de bron kant (source) of the relatie en de doel kant (target) of the relatie. De doel kant of theze generalisation relatie specificeert een_datatype_ die het supertype/de generalisation is van het via deze generalisation aangegeven subtype. Kortweg, het supertype is een generalisation van het subtype.                                                                               | */target: related Element bij Relationship Element* = UML-datatype |  |                  | *Target*       |
| **Datum opname**                                | 1                       | General metadata                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |                                                                      |  | *Tagged value* |                  |
| has**Constraint**                             | 0..*                    | Binding to a constraint.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                      |  | *Constraint*   |                  |

#### «Relatieklasse»

De relatieklassen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                          | **Cardinality** | **Comment**           | **In UML 2.5**                                                      |  | **In EA**                                                       | **In ...** |
| ----------------------------------------- | ----------------------- | ------------------------------- | ------------------------------------------------------------------------- | - | --------------------------------------------------------------------- | ---------------- |
| **Identificatie**                   | 1                       | Identificerend metadata.     |                                                                           |  | *Tagged value*                                                      |                  |
| **Naam√**                          | 1                       | General metadata.           | *name of the metaclass Named element*                                   |  | *Name*                                                              |                  |
| **Alias**                           | 0..1                    | General metadata.           | *UML-Property*                                                          |  | *Alias*                                                             |                  |
| **Herkomst**                        | 1                       | General metadata.           |                                                                           |  | *tagged value*                                                      |                  |
| **Begrip**                          | 0..\*                   | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Definitie√**                     | 1                       | General metadata.           | *Body of the metaclass Comment*                                         |  | *Notes*                                                             |                  |
| **Comment√**                   | 0..1                    | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Datum opname**                    | 1                       | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Herkomst definitie√**            | 1                       | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Unidirectioneel**                 | 1                       | General metadata.           |                                                                           |  | *Direction of the betreffende association (van source naar target)* |                  |
| **Bron**                            | 1                       | General metadata.           | */source: related Element bij Relationship Element*                     |  | *Source*                                                            |                  |
| **Doel**                            | 1                       | General metadata.           | */target: related Element bij Relationship Element*                     |  | *Target*                                                            |                  |
| **Aggregatietype**                  | 1                       | General metadata.           | *AggregationKind bij metaclass Property*                                |  | *Aggregation of the source role met waarde composite or shared*     |                  |
| **Cardinality√**                 | 1                       | General metadata.           | *lowerValue en upperValue of the metaclass MultiplicityElement*         |  | *Multiplicity of the target role*                                   |                  |
| **Cardinality relatie bron**      | 1                       | General metadata.           | *lowerValue en upperValue of the metaclass MultiplicityElement* /source |  | *Multiplicity of the source role*                                   |                  |
| **Indicatie materiële historie√** | 1                       | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie formele historie√**    | 1                       | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Authentiek√**                    | 1                       | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie afleidbaar**            | 1                       | General metadata.           | *isDerived bij UML metaclass Assocation*                                |  | *isDerived*                                                         |                  |
| **Mogelijk geen waarde**            | 1                       | General metadata.           |                                                                           |  | *Tagged value*                                                      |                  |
| **has attribuut**                 | 0..*                    | Binding to a attributetype. | *owned element* = UML-property                                          |  | *attribute*                                                         |                  |
| **verwijst naar relatiedoel**       | 0..*                    | Binding to a objecttype.     | */target: related Element bij Relationship Element* = UML-Class         |  | *association target* = Class                                        |                  |
| **has gedatagroup**           | 0..*                    | Binding aan datagroup.      | *owned element* = UML-property                                          |  | *attribute*                                                         |                  |
| has**Constraint**                 | 0..*                    | Binding to a constraint.     |                                                                           |  | *Constraint*                                                        |                  |

#### «External relationship»

External relationshipen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                          | **Cardinality** | **Comment**       | **In UML 2.5**                                                      |  | **In EA**                                                       | **In ...** |
| ----------------------------------------- | ----------------------- | --------------------------- | ------------------------------------------------------------------------- | - | --------------------------------------------------------------------- | ---------------- |
| **Identificatie**                   | 1                       | Identificerend metadata. |                                                                           |  | *Tagged value*                                                      |                  |
| **Naam√**                          | 1                       | General metadata.       | *name of the metaclass Named element*                                   |  | *Name*                                                              |                  |
| **Alias**                           | 0..1                    | General metadata.       | *UML-Property*                                                          |  | *Alias*                                                             |                  |
| **Herkomst**                        | 1                       | General metadata.       |                                                                           |  | *tagged value*                                                      |                  |
| **Begrip**                          | 0..\*                   | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Definitie√**                     | 1                       | General metadata.       | *Body of the metaclass Comment*                                         |  | *Notes*                                                             |                  |
| **Herkomst definitie√**            | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Comment√**                   | 0..1                    | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Datum opname**                    | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Unidirectioneel**                 | 1                       | General metadata.       |                                                                           |  | *Direction of the betreffende assiciation (van source naar target)* |                  |
| **Bron**                            | 1                       | General metadata.       | */source: related Element bij Relationship Element*                     |  | *Source*                                                            |                  |
| **Doel**                            | 1                       | General metadata.       | */target: related Element bij Relationship Element*                     |  | *Target*                                                            |                  |
| **Aggregatietype**                  | 1                       | General metadata.       | *AggregationKind bij metaclass Property*                                |  | *Aggregation of the source role met waarde composite or shared*     |                  |
| **Cardinality√**                 | 1                       | General metadata.       | *lowerValue en upperValue of the metaclass MultiplicityElement*         |  | *Multiplicity of the target role*                                   |                  |
| **Cardinality relatie bron**      | 1                       | General metadata.       | *lowerValue en upperValue of the metaclass MultiplicityElement* /source |  | *Multiplicity of the source role*                                   |                  |
| **Indicatie materiële historie√** | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie formele historie√**    | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Authentiek√**                    | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie afleidbaar**            | 1                       | General metadata.       | *isDerived bij UML metaclass Assocation*                                |  | *isDerived*                                                         |                  |
| **Mogelijk geen waarde**            | 1                       | General metadata.       |                                                                           |  | *Tagged value*                                                      |                  |
| verwijst naar**relatiedoel**        | 0..*                    | Binding to a objecttype. | */target: related Element bij Relationship Element* = UML-Class         |  | *association target* = Class                                        |                  |
| has**Constraint**                 | 0..*                    | Binding to a constraint. |                                                                           |  | *Constraint*                                                        |                  |

### Waardelijsten in UML

#### «Codelijst»

Voor codelijst worden de volgende aspecten gespecificeerd:

| **Aspect**              | **Cardinality** | **Comment**                                                                                                                                                                                                                             | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| ----------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**       | 1                       | Identificerend metadata.                                                                                                                                                                                                                       |                                         |  | *Tagged value* |                  |
| **Naam**                | 1                       | General metadata.*De naam of the lijst zoals gespecificeerd in de catalogus of the desbetreffende registratie dan wel, indien het een door de eigen organisatie toegevoegde lijst betreft, de door de eigen organisatie vastgestelde naam.* | *name of the metaclass Named element* |  | *Name*         |                  |
| **Alias**               | 0..1                    | General metadata.                                                                                                                                                                                                                             | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**            | 1                       | General metadata.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Begrip**              | 0..\*                   | General metadata.                                                                                                                                                                                                                             |                                         |  | *Tagged value* |                  |
| **Definitie**           | 1                       | General metadata.                                                                                                                                                                                                                             | *Body of the metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie**  | 1                       | General metadata.                                                                                                                                                                                                                             |                                         |  | *Tagged value* |                  |
| **Comment**         | 0..1                    | General metadata.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Datum opname**        | 1                       | General metadata.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Locatie**             | 1..1                    | General metadata.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Doelformaat**         | 1..1                    | General metadata.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Waarde-item**         | 0..1                    | General metadata.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Prorielspecificatie** | 0..1                    | General metadata.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| has**Constraint**     | 0..*                    | Binding to a constraint.                                                                                                                                                                                                                       |                                         |  | *Constraint*   |                  |

#### «Enumeratie»

Enumeraties betreffen de metaclass `Enumeration` en worden naar de volgende
aspecten gespecificeerd:

| **Aspect**                 | **Cardinality** | **Comment**             | **In UML 2.5**                       |  | **In EA**  | **In ...** |
| -------------------------------- | ----------------------- | --------------------------------- | ------------------------------------------ | - | ---------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metadata.       |                                            |  | *Tagged value* |                  |
| **Naam**                   | 1                       | General metadata.             | *name of the metaclass Named element*    |  | *Name*         |                  |
| **Alias**                  | 0..1                    | General metadata.             | *UML-Property*                           |  | *Alias*        |                  |
| **Herkomst**               | 1                       | General metadata.             |                                            |  | *tagged value* |                  |
| **Begrip**                 | 0..\*                   | General metadata.             |                                            |  | *Tagged value* |                  |
| **Definitie**              | 1                       | General metadata.             | *Body of the metaclass Comment*          |  | *Notes*        |                  |
| **Herkomst definitie**     | 1                       | General metadata.             |                                            |  | *Tagged value* |                  |
| **Comment**            | 0..1                    | General metadata.             |                                            |  | *tagged value* |                  |
| **Datum opname**           | 1                       | General metadata.             |                                            |  | *tagged value* |                  |
| bevat enumeratie**waarde** | 1..*                    | Binding van een enumeratiewaarde. | *owned element* = UML-EnumerationLiteral |  | *association*  |                  |
| has**Constraint**        | 0..*                    | Binding to a constraint.       |                                            |  | *Constraint*   |                  |

#### «Enumeratiewaarde»

De enumeratiewaarde zelf betreft de metaclass `UML-EnumerationLiteral` en kent de volgende aspecten:

| **Aspect**             | **Cardinality** | **Comment**                                                                                                                         | **In UML 2.5**                      |  | **In EA**  | **In ...** |
| ---------------------------- | ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metadata.                                                                                                                   |                                           |  | *Tagged value* |                  |
| **Naam**               | 1                       | General metadata.                                                                                                                         | *name of the metaclass Named element*   |  | *Name*         |                  |
| **Code**               | 0..1                    | De in een registratie or informatiemodel aan de enumeratiewaarde toegekend unieke code (niet te verwarren met alias, zoals bedoeld in 2.8.2). | *Alias of the metaclass Element Import* |  | *Alias*        |                  |
| **Herkomst**           | 0..1                    | General metadata.                                                                                                                         |                                           |  | *tagged value* |                  |
| **Begrip**             | 0..\*                   | General metadata.                                                                                                                         |                                           |  | *Tagged value* |                  |
| **Definitie**          | 0..1                    | General metadata.                                                                                                                         | *Body of the metaclass Comment*         |  | *Notes*        |                  |
| **Herkomst definitie** | 0..1                    | General metadata.                                                                                                                         |                                           |  | *Tagged value* |                  |
| **Comment**        | 0..1                    | General metadata.                                                                                                                         |                                           |  | *tagged value* |                  |
| **Datum opname**       | 1                       | General metadata.                                                                                                                         |                                           |  | *tagged value* |                  |
| has**Constraint**    | 0..*                    | Binding to a constraint.                                                                                                                   |                                           |  | *Constraint*   |                  |

#### «Referentielijst»

Voor referentielijsten worden de volgende aspecten gespecificeerd:

| **Aspect**                  | **Cardinality** | **Comment**                                             | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| --------------------------------- | ----------------------- | ----------------------------------------------------------------- | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**           | 1                       | Identificerend metadata.                                       |                                         |  | *Tagged value* |                  |
| **Naam**                    | 1                       | General metadata.                                             | *name of the metaclass Named element* |  | *Name*         |                  |
| **Alias**                   | 0..1                    | General metadata.                                             | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**                | 1                       | General metadata.                                             |                                         |  | *tagged value* |                  |
| **Begrip**                  | 0..\*                   | General metadata.                                             |                                         |  | *Tagged value* |                  |
| **Definitie**               | 1                       | General metadata.                                             | *Body of the metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie**      | 1                       | General metadata.                                             |                                         |  | *Tagged value* |                  |
| **Comment**             | 0..1                    | General metadata.                                             |                                         |  | *Tagged value* |                  |
| **Datum opname**            | 1                       | General metadata.                                             |                                         |  | *Tagged value* |                  |
| **Locatie**                 | 1                       | General metadata.                                             |                                         |  | *Tagged value* |                  |
| bevat**referentie-element** | 1..*                    | Binding to a referentie-element.                               | *owned element* = UML-property        |  | *attribute*    |                  |
| verwijst naar**supertype**  | 0..*                    | Binding to a generalisation (naar een andere referentie lijst). | *owned element* = UML-Relationship    |  | *association*  |                  |
| has**Constraint**         | 0..*                    | Binding to a constraint.                                       |                                         |  | *Constraint*   |                  |

#### «Referentie-element»

De referentie-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Cardinality** | **Comment**                                                                                                                                         | **In UML 2.5**                                               |  | **In EA**                        | **In ...** |
| --------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ | - | -------------------------------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metadata.                                                                                                                                   |                                                                    |  | *Tagged value*                       |                  |
| **Naam**                                      | 1                       | General metadata.                                                                                                                                         | *name of the metaclass Named element*                            |  | *Name*                               |                  |
| **Alias**                                     | 0..1                    | General metadata.                                                                                                                                         | *UML-Property*                                                   |  | *Alias*                              |                  |
| **Herkomst**                                  | 1                       | General metadata.                                                                                                                                         |                                                                    |  | *tagged value*                       |                  |
| **Begrip**                                    | 0..\*                   | General metadata.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Definitie**                                 | 1                       | General metadata.                                                                                                                                         | *Body of the metaclass Comment*                                  |  | *Notes*                              |                  |
| **Herkomst definitie**                        | 1                       | General metadata.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Comment**                               | 0..1                    | General metadata.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Datum opname**                              | 1                       | General metadata.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Domein** *(aspecten van een waarde/data)* |                         |                                                                                                                                                               |                                                                    |  |                                        |                  |
| **- Lengte**                                  | 0..1                    | General metadata.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **- Patroon**                                 | 0..1                    | General metadata.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **- Formeel patroon**                         | 0..1                    | General metadata.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Cardinality**                             | 1                       | General metadata.                                                                                                                                         | *lowerValue en upperValue of the metaclass Multiplicity Element* |  | *Multiplicity of the de target role* |                  |
| **Identificerend**                            | 0..1                    | General metadata.                                                                                                                                         | *isID of the metaclass Property*                                 |  | *isID bij de betreffende class*      |                  |
| **Minimumwaarde inclusief**                   | 0..1                    | General metadata. Een referentie-element mag or een metadata**Minimumwaarde inclusief** or **Minimumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Minimumwaarde exclusief**                   | 0..1                    | General metadata. Een referentie-element mag or een metadata**Minimumwaarde inclusief** or **Minimumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Maximumwaarde inclusief**                   | 0..1                    | General metadata. Een referentie-element mag or een metadata**Maximumwaarde inclusief** or **Maximumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Maximumwaarde exclusief**                   | 0..1                    | General metadata. Een referentie-element mag or een metadata**Maximumwaarde inclusief** or **Maximumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Eenheid**                                   | 0..1                    | Toevoegen als het referentie-element een waarde betreft en de eenheid als metadata opgenomen moet worden.                                                  |                                                                    |  |                                        |                  |
| has data**type**                            | 1                       | Binding to a datatype.                                                                                                                                     | *datatype* = UML-datatype                                        |  | *type* = datatype                    |                  |
| has**Constraint**                           | 0..*                    | Binding to a constraint.                                                                                                                                   |                                                                    |  | *Constraint*                         |                  |

### Datatypen in UML

Het betreft metadatas voor in het informatiemodel gedefinieerde datatypen,
ortewel exclusief datatypen die al buiten het model bestaan, zoals Integer,
DateTime, Surface.

#### «Primitief datatype»

De primitieve datatypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Cardinality** | **Comment**                                                                                                                               | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| --------------------------------------------------- | ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metadata.                                                                                                                         |                                         |  | *Tagged value* |                  |
| **Naam**                                      | 1                       | General metadata.                                                                                                                               | *name of the metaclass Named element* |  | *Name*         |                  |
| **Alias**                                     | 0..1                    | General metadata.                                                                                                                               | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**                                  | 0..1                    | General metadata.                                                                                                                               |                                         |  | *tagged value* |                  |
| **Begrip**                                    | 0..\*                   | General metadata.                                                                                                                               |                                         |  | *Tagged value* |                  |
| **Definitie**                                 | 0..1                    | General metadata.                                                                                                                               | *Body of the metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie**                        | 0..1                    | General metadata.                                                                                                                               |                                         |  | *Tagged value* |                  |
| **Comment**                               | 0..1                    | General metadata.                                                                                                                               |                                         |  | *tagged value* |                  |
| **Datum opname**                              | 1                       | General metadata.                                                                                                                               |                                         |  | *tagged value* |                  |
| **Domein** *(aspecten van een waarde/data)* |                         |                                                                                                                                                     |                                         |  |                  |                  |
| **- Lengte**                                  | 0..1                    | General metadata, in principe wordt dit metadata bij het attributetype gespecificeerd, behalve als het generiek gespecificeerd moet worden. |                                         |  | *Tagged value* |                  |
| **- Patroon**                                 | 0..1                    | General metadata, in principe wordt dit metadata bij het attributetype gespecificeerd, behalve als het generiek gespecificeerd moet worden. |                                         |  | *Tagged value* |                  |
| **- Formeel patroon**                         | 0..1                    | General metadata, in principe wordt dit metadata bij het attributetype gespecificeerd, behalve als het generiek gespecificeerd moet worden. |                                         |  | *Tagged value* |                  |
| has**Constraint**                           | 0..*                    | Binding to a constraint.                                                                                                                         |                                         |  | *Constraint*   |                  |

#### «Gestructureerd datatype»

Voor gestructureerde datatypen worden de volgende aspecten gespecificeerd:

| **Aspect**             | **Cardinality** | **Comment**                                                       | **In UML 2.5**                   |  | **In EA**  | **In ...** |
| ---------------------------- | ----------------------- | --------------------------------------------------------------------------- | -------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metadata.                                                 |                                        |  | *Tagged value* |                  |
| **Naam**               | 1                       | General metadata.*De naam van het domein package.*                    | *name of the metaclass Namedelement* |  | *Name*         |                  |
| **Alias**              | 0..1                    | General metadata.                                                       | *UML-Property*                       |  | *Alias*        |                  |
| **Herkomst**           | 0..1                    | General metadata.                                                       |                                        |  | *tagged value* |                  |
| **Begrip**             | 0..\*                   | General metadata.                                                       |                                        |  | *Tagged value* |                  |
| **Definitie**          | 0..1                    | General metadata.                                                       | *Body of the metaclass Comment*      |  | *Notes*        |                  |
| **Herkomst definitie** | 0..1                    | General metadata.                                                       |                                        |  | *Tagged value* |                  |
| **Comment**        | 0..1                    | General metadata.                                                       |                                        |  | *tagged value* |                  |
| **Datum opname**       | 1                       | General metadata.                                                       |                                        |  | *tagged value* |                  |
| **Patroon**            | 0..1                    | General metadata.                                                       |                                        |  | *Tagged value* |                  |
| **Formeel patroon**    | 0..1                    | General metadata.                                                       |                                        |  | *Tagged value* |                  |
| bevat**data-element**  | 0..*                    | Binding to a data-element, 2 or meer tenzij via generalisation verkregen. | *owned element* = UML-property       |  | *attribute*    |                  |
| has**Constraint**    | 0..*                    | Binding to a constraint.                                                 |                                        |  | *Constraint*   |                  |

#### «Data-element»

De data-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Cardinality** | **Comment**                                                                                                                                   | **In UML 2.5**                                              |  | **In EA**     | **In ...** |
| --------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | - | ------------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metadata.                                                                                                                             |                                                                   |  | *Tagged value*    |                  |
| **Naam**                                      | 1                       | General metadata.*De naam van het domein package.*                                                                                                | *name of the metaclass Namedelement*                            |  | *Name*            |                  |
| **Alias**                                     | 0..1                    | General metadata.                                                                                                                                   | *UML-Property*                                                  |  | *Alias*           |                  |
| **Herkomst**                                  | 0..1                    | General metadata.                                                                                                                                   |                                                                   |  | *tagged value*    |                  |
| **Begrip**                                    | 0..\*                   | General metadata.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **Definitie**                                 | 0..1                    | General metadata.                                                                                                                                   | *Body of the metaclass Comment*                                 |  | *Notes*           |                  |
| **Herkomst definitie**                        | 0..1                    | General metadata.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **Comment**                               | 0..1                    | General metadata.                                                                                                                                   |                                                                   |  | *tagged value*    |                  |
| **Datum opname**                              | 1                       | General metadata.                                                                                                                                   |                                                                   |  | *tagged value*    |                  |
| **Domein** *(aspecten van een waarde/data)* |                         |                                                                                                                                                         |                                                                   |  |                     |                  |
| **- Lengte**                                  | 0..1                    | General metadata.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **- Patroon**                                 | 0..1                    | General metadata.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **- Formeel patroon**                         | 0..1                    | General metadata.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **Cardinality**                             | 1                       | General metadata.                                                                                                                                   | *lowerValue en upperValue of the metaclass MultiplicityElement* |  | *Multiplicity*    |                  |
| **Minimumwaarde inclusief**                   | 0..1                    | General metadata. Een data-element mag or een metadata**Minimumwaarde inclusief** or **Minimumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| **Minimumwaarde exclusief**                   | 0..1                    | General metadata. Een data-element mag or een metadata**Minimumwaarde inclusief** or **Minimumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| **Maximumwaarde inclusief**                   | 0..1                    | General metadata. Een data-element mag or een metadata**Maximumwaarde inclusief** or **Maximumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| **Maximumwaarde exclusief**                   | 0..1                    | General metadata. Een data-element mag or een metadata**Maximumwaarde inclusief** or **Maximumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| has data**type**                            | 1                       | Binding to a datatype.                                                                                                                               | *datatype* = UML-datatype                                       |  | *type* = datatype |                  |
| has**Constraint**                           | 0..*                    | Binding to a constraint.                                                                                                                             |                                                                   |  | *Constraint*      |                  |

#### «Union»

Een Union worden naar de volgende aspecten gespecificeerd:

| **Aspect**                | **Cardinality** | **Comment**                                                                  | **In UML 2.5**                                           |  | **In EA**  | **In ...** |
| ------------------------------- | ----------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**         | 1                       | Identificerend metadata.                                                            |                                                                |  | *Tagged value* |                  |
| **Naam**                  | 1                       | General metadata.*De naam van het domein package.*                               | *name of the metaclass Namedelement*                         |  | *Name*         |                  |
| **Alias**                 | 0..1                    | General metadata.                                                                  | *UML-Property*                                               |  | *Alias*        |                  |
| **Herkomst**              | 0..1                    | General metadata.                                                                  |                                                                |  | *tagged value* |                  |
| **Begrip**                | 0..\*                   | General metadata.                                                                  |                                                                |  | *Tagged value* |                  |
| **Definitie**             | 0..1                    | General metadata.                                                                  | *Body of the metaclass Comment*                              |  | *Notes*        |                  |
| **Herkomst definitie**    | 0..1                    | General metadata.                                                                  |                                                                |  | *Tagged value* |                  |
| **Comment**           | 0..1                    | General metadata.                                                                  |                                                                |  | *tagged value* |                  |
| **Datum opname**          | 1                       | General metadata.                                                                  |                                                                |  | *tagged value* |                  |
| has data**type**union   | 0..*                    | Binding van een datatype, in UML via een additionale UML-property met stereotype union | *owned element* = UML-property en deze has en *datatype* |  | *attribute*    |                  |
| has**unionattribuut**   | 0..*                    | Binding to a attributetype.                                                        | *owned element* = UML-Property                               |  | *attribute*    |                  |
| has**unionrelatiedoel** | 0..*                    | Binding to a relationship type.                                                          | *owned element* = UML-Relationship                           |  | *association*  |                  |
| has**Constraint**       | 0..*                    | Binding to a constraint.                                                            |                                                                |  | *Constraint*   |                  |

*Opmerking: de modelelementen waaruit gekozen kan worden heten sinds MIM 1.1 geen union-elementen meer. Union-element is komen te vervallen.*

### Packages in UML

#### «Domein»

Domein packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**             | **Cardinality** | **Comment**                                                                           | **In UML 2.5**                   |  | **In EA**              | **In ...** |
| ---------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------- | -------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metadata.                                                                     |                                        |  | *Tagged value*             |                  |
| **Naam**               | 1                       | General metadata.*De naam van het domein package.*                                        | *name of the metaclass Namedelement* |  | *Name*                     |                  |
| **Alias**              | 0..1                    | General metadata.                                                                           | *UML-Property*                       |  | *Alias*                    |                  |
| **Herkomst**           | 1                       | General metadata.                                                                           |                                        |  | *tagged value*             |                  |
| **Definitie**          | 1                       | General metadata.                                                                           | *Body of the metaclass Comment*      |  | *Notes*                    |                  |
| **Herkomst definitie** | 1                       | General metadata.                                                                           |                                        |  | *Tagged value*             |                  |
| **Comment**        | 0..1                    | General metadata.                                                                           |                                        |  | *tagged value*             |                  |
| **Datum opname**       | 1                       | General metadata.                                                                           |                                        |  | *tagged value*             |                  |
| has**Constraint**    | 0..*                    | Binding to a constraint.                                                                     |                                        |  | *Constraint*               |                  |
| **Basis-URI**          | 0..1                    | General metadata.*Het niet-unieke deel of the URI van ieder modelelement in deze package* |                                        |  | *Tagged value*             |                  |
| bevat**Modelelement**  | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                    | *packagedElement*                    |  | *Browser packagestructuur* |                  |

#### «Extern»

Externe packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**             | **Cardinality** | **Comment**                                                                           | **In UML 2.5**                                        |  | **In EA**              | **In ...** |
| ---------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metadata.                                                                     |                                                             |  | *Tagged value*             |                  |
| **Naam**               | 1                       | General metadata.*De naam van het domein package.*                                        | *name of the metaclass Namedelement*                      |  | *Name*                     |                  |
| **Alias**              | 0..1                    | General metadata.                                                                           | *UML-Property*                                            |  | *Alias*                    |                  |
| **Herkomst**           | 1                       | General metadata.                                                                           | *Bij een view is de herkomst nooit de eigen organisatie.* |  | *tagged value*             |                  |
| **Definitie**          | 1                       | General metadata.                                                                           | *Body of the metaclass Comment*                           |  | *Notes*                    |                  |
| **Herkomst definitie** | 1                       | General metadata.                                                                           |                                                             |  | *Tagged value*             |                  |
| **Comment**        | 0..1                    | General metadata.                                                                           |                                                             |  | *tagged value*             |                  |
| **Datum opname**       | 1                       | General metadata.                                                                           |                                                             |  | *tagged value*             |                  |
| **Locatie**            | 1                       | General metadata.                                                                           |                                                             |  | *Tagged value*             |                  |
| **Basis-URI**          | 0..1                    | General metadata.*Het niet-unieke deel of the URI van ieder modelelement in deze package* |                                                             |  | *Tagged value*             |                  |
| has**Constraint**    | 0..*                    | Binding to a constraint.                                                                     |                                                             |  | *Constraint*               |                  |
| bevat**Modelelement**  | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                    | *packagedElement*                                         |  | *Browser packagestructuur* |                  |

#### «Informatiemodel»

Informatiemodel packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                  | **Cardinality** | **Comment**                                                                                                                                                                                                                                                     | **In UML 2.5**                    |  | **In EA**              | **In ...** |
| --------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**           | 1                       | Identificerend metadata.                                                                                                                                                                                                                                               |                                         |  | *Tagged value*             |                  |
| **Naam**                    | 1                       | General metadata.                                                                                                                                                                                                                                                     | *name of the metaclass Named element* |  | *Name*                     |                  |
| **Alias**                   | 0..1                    | General metadata.                                                                                                                                                                                                                                                     | *UML-Property*                        |  | *Alias*                    |                  |
| **Herkomst**                | 1                       | General metadata.                                                                                                                                                                                                                                                     |                                         |  | *tagged value*             |                  |
| **Definitie**               | 1                       | General metadata.                                                                                                                                                                                                                                                     | *Body of the metaclass Comment*       |  | *Notes*                    |                  |
| **Herkomst definitie**      | 1                       | General metadata.                                                                                                                                                                                                                                                     |                                         |  | *Tagged value*             |                  |
| **Comment**             | 0..1                    | General metadata.                                                                                                                                                                                                                                                     |                                         |  | *tagged value*             |                  |
| **Datum opname**            | 1                       | General metadata.                                                                                                                                                                                                                                                     |                                         |  | *tagged value*             |                  |
| **Informatiemodeltype**     | 1                       | General metadata.*De beschrijving of the aard van het informatiemodel: conceptueel, logisch, technisch.*                                                                                                                                                            |                                         |  | *Tagged value*             |                  |
| **Informatiedomein**        | 1                       | General metadata.*Aanduiding van het functionele domein waartoe het informatiemodel behoort.*                                                                                                                                                                       |                                         |  | *Tagged value*             |                  |
| **MIM versie**              | 1                       | *De versie of the MIM specificatie die gebruikt is om het informatiemodel in uit te drukken.*                                                                                                                                                                           |                                         |  | *Tagged value*             |                  |
|                                   |                         | *Bijvoorbeeld: 1.0.1 or 1.1*                                                                                                                                                                                                                                            |                                         |  |                              |                  |
| **MIM extensie**            | 0..1                    | *De aanduiding van een extensie op MIM.*                                                                                                                                                                                                                                |                                         |  | *Tagged value*             |                  |
|                                   |                         | *Bijvoorbeeld: Kadaster or NEN3610:2020*                                                                                                                                                                                                                                |                                         |  |                              |                  |
| **MIM taal**                | 0..1                    | *De aanduiding of the taal die gebruikt is voor de modelelementen.*  *Bijvoorbeeld: EN or NL*                                                                                                                                                                         |                                         |  | *Tagged value*             |                  |
| **Relatiemodelleringstype** | 1                       | General metadata.    Comment Type informatiemodel: zoals bedoeld in [[[#typering-van-modellen-gekoppeld-aan-beschouwingsniveaus]]]. Alle packages, ortewel «Domein» en «View», binnen het informatiemodel hebben hetzelfde type als het informatiemodel zelf. |                                         |  | *Tagged value*             |                  |
| **Tekstopmaak**             | 0..1                    | *Geldt voor hele model, voor de metadatas die beschreven zijn het het metadata tekstopmaak.*                                                                                                                                                                      |                                         |  | *Tagged value*             |                  |
| has**Constraint**         | 0..*                    | Binding to a constraint.                                                                                                                                                                                                                                               |                                         |  | *Constraint*               |                  |
| **Basis-URI**               | 0..1                    | General metadata.*Het niet-unieke deel of the URI van ieder modelelement in deze package*                                                                                                                                                                           |                                         |  | *Tagged value*             |                  |
| bevat**Modelelement**       | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                                                                                                                                                                                              | *packagedElement*                     |  | *Browser packagestructuur* |                  |

#### «View»

View packages worden naar de volgende aspecten gespecificeerd, analoog aan
«Extern»:

| **Aspect**             | **Cardinality** | **Comment**                                                                                                                                | **In UML 2.5**                    |  | **In EA**              | **In ...** |
| ---------------------------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metadata.                                                                                                                          |                                         |  | *Tagged value*             |                  |
| **Naam**               | 1                       | General metadata.*Deze is, indien mogelijk, analoog aan de naamgeving in het externe schema waar de view over gaat, eventueel met een prefix.* | *name of the metaclass Named element* |  | *Name*                     |                  |
| **Alias**              | 0..1                    | General metadata.                                                                                                                                | *UML-Property*                        |  | *Alias*                    |                  |
| **Herkomst**           | 1                       | General metadata.                                                                                                                                |                                         |  | *tagged value*             |                  |
| **Definitie**          | 1                       | General metadata.                                                                                                                                | *Body of the metaclass Comment*       |  | *Notes*                    |                  |
| **Herkomst definitie** | 1                       | General metadata.                                                                                                                                |                                         |  | *Tagged value*             |                  |
| **Comment**        | 0..1                    | General metadata.                                                                                                                                |                                         |  | *tagged value*             |                  |
| **Datum opname**       | 1                       | General metadata.                                                                                                                                |                                         |  | *tagged value*             |                  |
| **Locatie**            | 1                       | General metadata.                                                                                                                                |                                         |  | *Tagged value*             |                  |
| **Basis-URI**          | 0..1                    | General metadata.*Het niet-unieke deel of the URI van ieder modelelement in deze package*                                                      |                                         |  | *Tagged value*             |                  |
| has**Constraint**    | 0..*                    | Binding to a constraint.                                                                                                                          |                                         |  | *Constraint*               |                  |
| bevat**Modelelement**  | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                                                                         | *packagedElement*                     |  | *Browser packagestructuur* |                  |

### Overige modelelementen in UML

#### «Constraint»

`<a>`Constraint`</a>` betreft de metaclass UML Constraint en wordt naar de volgende
aspecten gespecificeerd:

| **Aspect**                                   | **Cardinality** | **Comment**                                                      | **In UML 2.5**                    |  | **In EA**              | **In ...** |
| -------------------------------------------------- | ----------------------- | -------------------------------------------------------------------------- | --------------------------------------- | - | ---------------------------- | ---------------- |
| **Naam√**                                   | 1                       | General metadata.                                                      | *name of the metaclass Named element* |  | *Name*                     |                  |
| **Specificatie tekst**                       | 0..1                    | De specificatie of the Constraint in normale tekst.                        |                                         |  | *Notes (type = invariant)* |                  |
| **Specificatie formeel**                     | 0..1                    | De beschrijving of the Constraint in een formele specificatietaal, in OCL. |                                         |  | *Notes (type =OCL)*        |                  |
| **Datum opname**                             | 1                       | General metadata.                                                      |                                         |  | *tagged value*             |                  |
| van toepassing op**Objecttype**              | 0..1                    | Binding to a Objecttype                                                 |                                         |  |                              |                  |
| van toepassing op**Attributetype**          | 0..1                    | Binding to a Attributetype                                             |                                         |  |                              |                  |
| van toepassing op**Datagroup**           | 0..1                    | Binding to a Datagroup                                              |                                         |  |                              |                  |
| van toepassing op**Datagrouptype**       | 0..1                    | Binding to a Datagrouptype                                          |                                         |  |                              |                  |
| van toepassing op**Relationship type**            | 0..1                    | Binding to a Relationship type                                               |                                         |  |                              |                  |
| van toepassing op**Relatierol**              | 0..1                    | Binding to a Relatierol                                                 |                                         |  |                              |                  |
| van toepassing op**Generalisation**           | 0..1                    | Binding to a Generalisation                                              |                                         |  |                              |                  |
| van toepassing op**Relatieklasse**           | 0..1                    | Binding to a Relatieklasse                                              |                                         |  |                              |                  |
| van toepassing op**External relationship**       | 0..1                    | Binding to a External relationship                                          |                                         |  |                              |                  |
| van toepassing op**Codelijst**               | 0..1                    | Binding to a Codelijst                                                  |                                         |  |                              |                  |
| van toepassing op**Enumeratie**              | 0..1                    | Binding to a Enumeratie                                                 |                                         |  |                              |                  |
| van toepassing op**Enumeratiewaarde**        | 0..1                    | Binding to a Enumeratiewaarde                                           |                                         |  |                              |                  |
| van toepassing op**Referentielijst**         | 0..1                    | Binding to a Referentielijst                                            |                                         |  |                              |                  |
| van toepassing op**Referentie-element**      | 0..1                    | Binding to a Referentie-element                                         |                                         |  |                              |                  |
| van toepassing op**Primitief datatype**      | 0..1                    | Binding to a Primitief datatype                                         |                                         |  |                              |                  |
| van toepassing op**Gestructureerd datatype** | 0..1                    | Binding to a Gestructureerd datatype                                    |                                         |  |                              |                  |
| van toepassing op**Data-element**            | 0..1                    | Binding to a Data-element                                               |                                         |  |                              |                  |
| van toepassing op**Union**                   | 0..1                    | Binding to a Union                                                      |                                         |  |                              |                  |
| van toepassing op**Domein**                  | 0..1                    | Binding to a Domein                                                     |                                         |  |                              |                  |
| van toepassing op**Extern**                  | 0..1                    | Binding to a Extern                                                     |                                         |  |                              |                  |
| van toepassing op**Informatiemodel**         | 0..1                    | Binding to a Informatiemodel                                            |                                         |  |                              |                  |
| van toepassing op**View**                    | 0..1                    | Binding to a View                                                       |                                         |  |                              |                  |

## UML Tooling

### MIM-toolbox

Er is door de MIM-beheerder een metamodel *proriel* gemaakt in Sparx Enterprise Architect, dat gebruikt kan worden bij het modelleren van een informatiemodel. Dit proriel kan je inladen en daarna kan je kiezen uit de metamodelelementen. Het proriel is faciliterend en zorgt dat (de meeste) modelelementen van het informatiemodel automatisch voldoen aan dit metamodel. Dit proriel is te vinden op [MIM proriel - toolbox voor EA](https://register.geostandaarden.nl/informatiemodel/mim/).

### Extensie op MIM-toolbox

Het is niet vereist om dit proriel te gebruiken. Bovendien is het ook mogelijk om het proriel uit te breiden, naar de behoefte of the eigen organisatie. Maar, het is niet toegestaan om het proriel te wijzigen; dan wordt niet meer aan MIM voldaan. De reden hiervoor is dat een dergelijk aanpassing niet beheerd kan worden door de MIM-beheerder en er ambiguïteit zal ontstaan bij de interpretatie van het model. Voor andere UML tools kan ook een MIM-proriel gemaakt worden.

### Imvertor

Er is een tool [Imvertor](https://armatiek.nl/imvertor.html), waarmee je onder andere kunt controleren or een informatiemodel voldoet aan het MIM en zo niet, wat de reden daarvan is. Deze tool is open source.
