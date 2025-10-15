# Metamodel in UML

This chapter describes how to create an information model in UML using the model elements from the chapter [Metamodel General](#metamodel-general).

## Structure of the Metamodel in UML

The first paragraph contains UML diagrams. Each diagram shows a number of model elements. The complete set of diagrams, in their context, is included in appendix [[[#diagrams]]].  
The main principles for the metamodel in UML are:

- UML 2.5 is used as the basis for the conceptual description.  
- Existing UML model elements are used according to the OMG UML standard. OMG refers to these as UML metaclasses. An example of this is a UML-Class.  
- Where (semantically) necessary, extension mechanisms are applied **while preserving the meaning of UML metaclasses**. The model element then becomes a MIM metaclass. How these relate to UML is shown in appendix [[[#diagrams]]].  
- Only one stereotype is used per model element.  
- Two different stereotypes never share the same meaning.  
- Stereotypes are used only when a specialization of a UML construct is required, while maintaining the meaning of the UML metaclass.  
- Each model element has a MIM metaclass. In UML, this is modeled in an information model as an extension of a UML 2.5 Metaclass with an associated stereotype.

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
    This tool uses “Class” (instead of “UML-Class”). Naturally, this UML tool is not part of the MIM specification and is not required for use.  
    The column is included only for illustration, to show that depending on the tool, it may sometimes be necessary to specify more precisely how the MIM element is expressed in the tool.  
    The 6th column is reserved for describing the use of another tool.
  </p>
</aside>

Almost all model elements are based on a UML metaclass (UML 2.5).  
In the diagrams that follow, a UML metaclass is shown in light blue.  
A diagrammatic overview including metadata is available in appendix [[[#diagrams]]].


### Core

<figure id="CoreWithoutMetadata">
  <img src="media/KernZonderMetagegevens.png" alt="" />
  <figcaption>Diagram: Core without metadata</figcaption>
</figure>

The [appendix](#KernMetMetagegevens_Alt2.png) contains the UML diagram including metadata.

### Core without Metadata

| **MIM Metaclass**   | **Stereotype**       | **UML 2.5 Metaclass**           |      | **In Enterprise Architect (EA)** | **In ...** |
| -------------------- | -------------------- | ------------------------------- | ---- | -------------------------------- | ---------- |
| Objecttype           | «Objecttype»         | (UML) Class                     |      | Class                            |            |
| Attribute type       | «Attribuutsoort»     | (UML) Property                  |      | Attribute                        |            |
| Data group           | «Gegevensgroep»      | (UML) Property                  |      | Attribute                        |            |
| Data group type      | «Gegevensgroeptype»  | (UML) Class                     |      | Class                            |            |
| Generalization       | «Generalisatie»      | (UML) Generalization            |      | Generalization                   |            |
| Relationship type    | «Relatiesoort»       | (UML) Association               |      | Association                      |            |
| Relationship class   | «Relatieklasse»      | (UML) Association and (UML) Class |    | Associationclass                 |            |

<aside class="note" title="Stereotype «Datatype» absent in UML">
  <p>
    The element <code>Datatype</code> is also part of the core and, as shown in the diagram, is meant as an abstract model element.  
    <code>Datatype</code> is elaborated in the following section into several concrete forms, each with its own stereotype.
  </p>
</aside>

### Datatypes

<figure id="DatatypesWithoutMetadata">
  <img src="media/DatatypenZonderMetagegevens.png" alt="" />
  <figcaption>Diagram: Datatypes without metadata</figcaption>
</figure>

The [appendix](#DatatypenMetMetagegevens.png) contains the UML diagram including metadata.

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
  <img src="media/ConstraintsZonderMetagegevens.png" alt="" />
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
- **Use case 4:** a choice between relationship targets, as a further specification of one meaningful relationship type  
- **Use case 5:** a choice between relationship types/roles (each individually meaningful)

Each application has its own subset of the metamodel.  
The choice construct makes it possible to select between multiple datatypes, attribute types, and relationship targets.  
In UML, we retain the same modeling principle: a datatype remains a datatype, an attribute type remains an attribute type, and a relationship type remains a relationship type.  
The UML elements that use the stereotype `keuze` (choice) are **not themselves** a datatype, attribute type, or relationship target.  
Note that the diagrams are modeled at the metamodel level; below each diagram, text describes how this applies at the information model level.

#### Use Case 1: Choice between Datatypes

<figure id="ChoiceDatatype1UML">
  <img src="media/KeuzeDatatype1UML.png" alt="" />
  <figcaption>Diagram: Choice between datatypes in UML</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Datatype_ with the stereotype _«keuze»_.  
- Within it, model two or more MIM datatypes. For this, include a _UML attribute_ with stereotype _«keuze»_ inside the choice, and assign the desired (MIM) Datatype as its type.  
  Note: this extra UML attribute is **not** itself a choice option — the choice is between the datatypes.

**Using the Choice for a (MIM) Attribute Type:**
- Choose a _MIM-Attribuutsoort_ and link it to the modeled Choice via typing, as usual.

#### Use Case 2: Choice between Two or More Attribute Types

<figure id="ChoiceAttributeType2UML">
  <img src="media/KeuzeAttribuutsoort2UML.png" alt="" />
  <figcaption>Diagram: Choice between two or more attribute types</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«keuze»_.  
- Inside it, model two or more MIM attribute types. Each (MIM) Attribuutsoort is modeled normally, as a _UML Property (attribute)_ with the stereotype _«Attribuutsoort»_ (and this UML Property has as its type a MIM Datatype).

**Using the Choice for a (MIM) Objecttype or (MIM) Data Group Type:**
- Model in an Objecttype or Data Group Type a _UML Property (attribute)_ with the stereotype _«keuze»_, and link it to the modeled Choice via typing.  
  This _UML Property_ with stereotype _«keuze»_ is **not** a (MIM) Attribute Type itself.  
  Only UML Properties with stereotype _«Attribuutsoort»_ represent a (MIM) Attribute Type.

#### Use Case 3: Choice between Multiple Ways to Populate One Meaningful Attribute Type

<figure id="ChoiceAttributeType3UML">
  <img src="media/KeuzeAttribuutsoort3UML.png" alt="" />
  <figcaption>Diagram: Choice between multiple ways to populate one meaningful attribute type</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«keuze»_.  
- Within it, model two or more choice options by creating, for each, a UML Property (attribute) with the stereotype _«keuze»_ (and this UML Property has as its datatype a MIM Datatype).  
  Note: this _UML Property (attribute)_ with stereotype _«keuze»_ is **not** itself a (MIM) Attribute Type.

**Using the Choice for a (MIM) Attribute Type:**
- In a (MIM) Objecttype or Data Group Type, model a MIM Attribute Type as usual, and link the previously modeled Choice to it via typing.

#### Use Case 4: Choice between Relationship Targets, as a Further Specification of One Meaningful Relationship Type

<figure id="ChoiceRelationTarget4UML">
  <img src="media/KeuzeRelatiedoel4UML.png" alt="" />
  <figcaption>Diagram: Choice between relationship targets as further specification of one meaningful relationship type</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«keuze»_.  
- Inside it, model two or more outgoing _UML Associations_ with the stereotype _«keuze»_, each with a (MIM) Objecttype as its target.  
  This _UML Association_ with stereotype _«keuze»_ is **not** itself a Relationship Type or External Link.

**Using the Choice for a (MIM) Objecttype or Data Group Type:**
- Model in a (MIM) Objecttype or Data Group Type a (MIM) Relationship Type or External Link, as usual.

#### Use Case 5: Choice between Relationship Types / Roles (Each Meaningful in Itself)

<figure id="ChoiceRelationType5UML">
  <img src="media/KeuzeRelatiedoel5UML.png" alt="" />
  <figcaption>Diagram: Choice between relationship types/roles, each meaningful in itself</figcaption>
</figure>

**Modeling this Choice in an information model:**
- Model a _UML Class_ with the stereotype _«keuze»_.  
- Within it, model two or more MIM Relationship Types, each with a target.  
  Each Relationship Type is modeled as usual: a _UML Property_ (association) with the stereotype _«Relatiesoort»_ or _«Externe koppeling»_, with a target role.

**Using the Choice for a (MIM) Objecttype or Data Group Type:**
- Model in a (MIM) Objecttype or Data Group Type a _UML Association_ with the stereotype _«keuze»_, and link the modeled Choice to it as the association’s target.  
  This _UML Association_ with stereotype _«keuze»_ is **not** itself a Relationship Type or External Link.

#### Modeling of a Choice in UML

There are three metaclasses named `Keuze`, each extending a different UML metaclass.  
The UML metaclass used indicates which variant of the Choice construct it represents.

| **MIM Metaclass** | **Stereotype** | **UML 2.5 Metaclass** |      | **In Enterprise Architect (EA)** | **In ...** |
| ----------------- | -------------- | --------------------- | ---- | -------------------------------- | ---------- |
| Choice            | «Keuze»        | (UML) Class           |      | Class                            |            |
| Choice            | «Keuze»        | (UML) Datatype        |      | Datatype                         |            |
| Choice            | «Keuze»        | (UML) Property        |      | Attribute                        |            |

- If a UML Class with stereotype `«keuze»` is used, it contains only attribute types and/or relationship targets — the elements to choose from.  
- If a UML Datatype with stereotype `«keuze»` is used, it contains only datatypes — the datatypes to choose from.  
- If a UML Property with stereotype `«keuze»` is used, it serves as a helper construct to connect the Choice model element to the MIM model element for which the choice applies.

Note: this table does **not** list the elements that can be chosen between (those are datatypes, attribute types, and relationship types).  
Instead, it describes the **Choice modeling mechanism** in UML — the auxiliary constructs needed to connect the possible elements to the MIM element to which the choice applies.  
These auxiliary constructs carry the stereotype _«keuze»_, indicating their meaning differs from that of MIM elements such as Datatype, Attribute Type, or Relationship Type.


#### Relatierol

<figure id="AssociatierollenZonderMetagegevens">
  <img src="media/AssociatierollenZonderMetagegevens.png" alt="" />
  <figcaption>Diagram: Associatierollen zonder metagegevens</figcaption>
</figure>

_Relatiesoort en relatierol_

| **MIM metaclass** | **Stereotype** | **Metaclass UML 2.5** |  | **In EA** | **In ...** |
| ----------------------- | -------------------- | --------------------------- | - | --------------- | ---------------- |
| Relatierol (abstract)   | «Relatierol»       | Property                    |  | AssociationEnd  |                  |
| Relatierol source       | «Relatierol»       | Property                    |  | AssociationEnd  |                  |
| Relatierol target       | «Relatierol»       | Property                    |  | AssociationEnd  |                  |

#### External link

_External link_

| **MIM metaclass** | **Stereotype**  | **Metaclass UML 2.5** |  | **In EA** | **In ...** |
| ----------------------- | --------------------- | --------------------------- | - | --------------- | ---------------- |
| Externe koppeling       | «Externe koppeling» | (UML) Association           |  | Association     |                  |

#### Packages

<figure id="PackagesZonderMetagegevens">
  <img src="media/PackagesZonderMetagegevens.png" alt="" />
  <figcaption>Diagram: Packages zonder metagegevens</figcaption>
</figure>

In de [bijlage](#PackagesMetMetagegevens.png) is het UML diagram met de metagegevens opgenomen.

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
- **Cardinality**: Number of times a metadata entry can be included with this model element.
- **Explanation**: Further explanation of the metadata.
- **In UML 2.5**: The name by which the metadata is named in UML 2.5. It usually refers to inheritance of a metadata from a UML metaclass not named in this document.
- **In EA**: Indication of how the metadata is declared in Sparx Enterprise Architect (EA).

Red text refers to a standard element within EA. Black text in the column refers to an extension to the UM metamodel, via _tagged values_ or additional stereotypes.


<aside class="note" title="Nadere toelichting op het metagegeven Alias">
  <p>
    De `Alias` is te specificeren voor `NamedElements` (zoals `UML-Class`, `UML-association`, `UML-Datatype` en `UML-property`). De `Alias` is in UML gespecificeerd bij de metaclass `Element Import`. Dit wordt in UML ingezet voor het importeren van een `NamedElement` uit een ander package. In dit metamodel wordt de `Alias` (nog) niet zo gebruikt. In Enterprise Architect is de alternatieve weergave aan te zetten in de <i>properties</i> van een <i>Diagram</i>, via: `use alias if available`. Voor de definitie van en algemene toelichting op `Alias`, zie: [[[#metagegeven-alias]]].
  </p>
</aside>

<aside class="note" title="Nadere toelichting op het metagegeven Identficerend">
  <p>
    Als een attribuutsoort identificerend is, dan krijgt dit kenmerk in UML `isId = true`. Als een <code>«<a>Relatiesoort</a>»</code> identificerend is, dan krijgt dit kenmerk in UML een stereotype `«id»`. Voor de definitie van en algemene toelichting op `Identificerend`, zie: [[[#metagegeven-identificerend]]].
  </p>
</aside>

### Objects and attributes in UML

#### «Objecttype»

The object types are specified according to the following aspects:

| **Aspect**                    | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                                                                                                                                                                                                                                                               | **In UML 2.5**                       |  | **In EA**                                                                                                                                                     | **In ...** |
| ----------------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ | - | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| **Identificatie**             | 1                       | Identificerend metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Naam√**                    | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | *name van de metaclass Named element*    |  | *Name*                                                                                                                                                            |                  |
| **Alias**                     | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | *UML-Property*                           |  | *Alias*                                                                                                                                                           |                  |
| **Herkomst**                  | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *tagged value*                                                                                                                                                    |                  |
| **Begrip**                    | 0..\*                   | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Definitie√**               | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | *Body van de metaclass Comment*          |  | *Notes*                                                                                                                                                           |                  |
| **Herkomst definitie√**      | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Toelichting√**             | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Datum opname**              | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Unieke aanduiding√**       | 1                       | De identificerende kenmerken een object die een instantie van het objecttype uniek identificeren. Deze kenmerken worden in UML gemodelleerd als attribuutsoort en/of relatie dus dit metagegeven hoeft niet apart te worden gespecificeerd bij een objecttype, het is afleidbaar. Voor objecttypen die deel uitmaken van een (basis)registratie of informatiemodel betreft dit de wijze waarop daarin voorkomende objecten (van dit type) uniek in de registratie worden aangeduid. | UML isID                                   |  | *isId bij attribuutsoort, --- of --- stereotype «isId» bij target role relatiesoort --- of --- een combinatie van deze twee, elk hiervan meer keren toepasbaar* |                  |
| **Populatie√**               | 0..1                    | Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.                                                                                                                                                                                                                                                                         |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Kwaliteit√**               | 0..1                    | Beschrijving van de mate waarin in de registratie opgenomen objecten van het desbetreffende type volledig, juist, actueel, nauwkeurig en betrouwbaar zijn.                                                                                                                                                                                                                                                                                                                          |                                            |  | *Tagged value*                                                                                                                                                    |                  |
| **Indicatie abstract object** | 1                       | Conceptueel model: indicatie dat het objecttype een generalisatie is, waarvan een object als specialisatie altijd voorkomt in de hoedanigheid van een (en slechts één) van de specialisaties van het betreffende objecttype. Logisch model: Indicatie dat er geen instanties (objecten) voor het betreffende objecttype mogen voorkomen.                                                                                                                                          | *isAbstract bij de metaclass Classifier* |  | *Abstract*                                                                                                                                                        |                  |
| heeft**attribuut** /          | 0..*                    | Binding aan een attribuutsoort.                                                                                                                                                                                                                                                                                                                                                                                                                                                     | *owned element* = UML-property           |  | *attribute*                                                                                                                                                       |                  |
| heeft**gegevensgroep**        | 0..*                    | Binding aan een gegevensgroep.                                                                                                                                                                                                                                                                                                                                                                                                                                                      | *owned element* = UML-property           |  | *attribute*                                                                                                                                                       |                  |
| heeft**relatiesoort**         | 0..*                    | Binding aan een relatiesoort of relatieklasse.                                                                                                                                                                                                                                                                                                                                                                                                                                      | *owned element* = UML-Relationship       |  | *association*                                                                                                                                                     |                  |
| heeft**externe koppeling**    | 0..*                    | Binding aan een externe koppeling.                                                                                                                                                                                                                                                                                                                                                                                                                                                  | *owned element* = UML-Relationship       |  | *association*                                                                                                                                                     |                  |
| verwijst naar**supertype** *  | 0..*                    | Binding aan een generalisatie (naar een ander objecttype).                                                                                                                                                                                                                                                                                                                                                                                                                          | *owned element* = UML-Relationship       |  | *association*                                                                                                                                                     |                  |
| heeft**Constraint**           | 0..*                    | Binding aan een constraint.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |                                            |  | *Constraint*                                                                                                                                                      |                  |

#### «Attribuutsoort»

De attribuutsoorten worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                        | **In UML 2.5**                                               |  | **In EA**     | **In ...** |
| --------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------ | - | ------------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metagegeven.                                                                                                                                                                                  |                                                                    |  | *Tagged value*    |                  |
| **Naam√**                                    | 1                       | Algemeen metagegeven.                                                                                                                                                                                        | *name van de metaclass Named element*                            |  | *Name*            |                  |
| **Alias**                                     | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                        | *UML-Property*                                                   |  | *Alias*           |                  |
| **Herkomst**                                  | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *tagged value*    |                  |
| **Begrip**                                    | 0..\*                   | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Definitie√**                               | 1                       | Algemeen metagegeven.                                                                                                                                                                                        | *Body van de metaclass Comment*                                  |  | *Notes*           |                  |
| **Herkomst definitie√**                      | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Toelichting√**                             | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Datum opname**                              | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Domein** *(aspecten van een waarde/data)* |                         | *Domein is zelf geen metadata aspect. Onder het kopje ‘domein’ vallen een aantal metadata aspecten die gelden voor een waarde, oftewel de eisen waaraan een waarde van een attribuutsoort moet voldoen.* |                                                                    |  |                     |                  |
| **- Lengte**                                  | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **- Patroon**                                 | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **- Formeel Patroon**                         | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Heeft tijdlijn geldigheid √**              | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Indicatie materiële historie √**          | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Heeft tijdlijn registratie √**             | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Indicatie formele historie √**             | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Kardinaliteit √**                          | 1                       | Algemeen metagegeven.                                                                                                                                                                                        | *lowerValue en upperValue van de metaclass Multiplicity Element* |  | *Multiplicity*    |                  |
| **Authentiek √**                             | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Indicatie afleidbaar**                      | 1                       | Algemeen metagegeven.                                                                                                                                                                                        | *isDerived bij metaclass Property*                               |  | *isDerived*       |                  |
| **Indicatie classificerend**                  | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Mogelijk geen waarde**                      | 1                       | Algemeen metagegeven.                                                                                                                                                                                        |                                                                    |  | *Tagged value*    |                  |
| **Identificerend**                            | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                        | *isID bij de metaclass Property*                                 |  | *isID*            |                  |
| **Minimumwaarde inclusief**                   | 0..1                    | Algemeen metagegeven. Een attribuutsoort mag of een metagegeven**Minimumwaarde inclusief** of **Minimumwaarde exclusief** hebben, niet beide.                                                    |                                                                    |  | _Tagged value_    |                  |
| **Minimumwaarde exclusief**                   | 0..1                    | Algemeen metagegeven. Een attribuutsoort mag of een metagegeven**Minimumwaarde inclusief** of **Minimumwaarde exclusief** hebben, niet beide.                                                    |                                                                    |  | _Tagged value_    |                  |
| **Maximumwaarde inclusief**                   | 0..1                    | Algemeen metagegeven. Een attribuutsoort mag of een metagegeven**Maximumwaarde inclusief** of **Maximumwaarde exclusief** hebben, niet beide.                                                    |                                                                    |  | _Tagged value_    |                  |
| **Maximumwaarde exclusief**                   | 0..1                    | Algemeen metagegeven. Een attribuutsoort mag of een metagegeven**Maximumwaarde inclusief** of **Maximumwaarde exclusief** hebben, niet beide.                                                    |                                                                    |  | _Tagged value_    |                  |
| **Eenheid**                                   | 0..1                    | Toevoegen als het attribuutsoort een waarde betreft en de eenheid als metagegeven opgenomen moet worden.                                                                                                     |                                                                    |  | *Tagged value*    |                  |
| heeft data**type**                            | 1                       | Binding aan een datatype.                                                                                                                                                                                    | *datatype* = UML-datatype                                        |  | *type* = datatype |                  |
| heeft**Constraint**                           | 0..*                    | Binding aan een constraint.                                                                                                                                                                                  |                                                                    |  | *Constraint*      |                  |

#### «Gegevensgroep»

De gegevensgroepen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                 | **Kardinaliteit** | **Toelichting**              | **In UML 2.5**                                               |  | **In EA**                                                           | **In ...** |
| -------------------------------- | ----------------------- | ---------------------------------- | ------------------------------------------------------------------ | - | ------------------------------------------------------------------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metagegeven.        |                                                                    |  | *Tagged value*                                                          |                  |
| **Naam**                   | 1                       | Algemeen metagegeven.              | *name van de metaclass Named element*                            |  | *Name*                                                                  |                  |
| **Alias**                  | 0..1                    | Algemeen metagegeven.              | *UML-Property*                                                   |  | *Alias*                                                                 |                  |
| **Herkomst**               | 0..1                    | Algemeen metagegeven.              |                                                                    |  | *tagged value*                                                          |                  |
| **Begrip**                 | 0..\*                   | Algemeen metagegeven.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Definitie**              | 1                       | Algemeen metagegeven.              | *Body van de metaclass Comment*                                  |  | *Notes*                                                                 |                  |
| **Herkomst definitie**     | 1                       | Algemeen metagegeven.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Toelichting√**          | 0..1                    | Algemeen metagegeven.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Datum opname**           | 1                       | Algemeen metagegeven.              |                                                                    |  | *Tagged value*                                                          |                  |
| **Kardinaliteit**          | 1                       | Algemeen metagegeven.              | *lowerValue en upperValue van de metaclass Multiplicity Element* |  | *Multiplicity van de source role van de bijbehorende composite relatie* |                  |
| **Authentiek**             | 1                       | Algemeen metagegeven.              |                                                                    |  | *Tagged value*                                                          |                  |
| heeft**gegevensgroeptype** | 1                       | Binding aan een gegevensgroeptype. | *owned element* = UML-Class                                      |  | *type* = Class                                                          |                  |
| heeft**Constraint**        | 0..*                    | Binding aan een constraint.        |                                                                    |  | *Constraint*                                                            |                  |

#### «Gegevensgroeptype»

De gegevensgroeptypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                 | **Kardinaliteit** | **Toelichting**                                             | **In UML 2.5**                                            |  | **In EA**                                                           | **In ...** |
| -------------------------------- | ----------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------- | - | ------------------------------------------------------------------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metagegeven.                                       |                                                                 |  | *Tagged value*                                                          |                  |
| **Naam**                   | 1                       | Algemeen metagegeven.                                             | *name van de metaclass Named element*                         |  | *Name*                                                                  |                  |
| **Alias**                  | 0..1                    | Algemeen metagegeven.                                             | *UML-Property*                                                |  | *Alias*                                                                 |                  |
| **Herkomst**               | 1                       | Algemeen metagegeven.                                             |                                                                 |  | *tagged value*                                                          |                  |
| **Begrip**                 | 0..\*                   | Algemeen metagegeven.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Definitie**              | 1                       | Algemeen metagegeven.                                             | *Body van de metaclass Comment*                               |  | *Notes*                                                                 |                  |
| **Herkomst definitie**     | 1                       | Algemeen metagegeven.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Toelichting√**          | 0..1                    | Algemeen metagegeven.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Datum opname**           | 1                       | Algemeen metagegeven.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| **Kardinaliteit**          | 1                       | Algemeen metagegeven.                                             | *lowerValue en upperValue van metaclass Multiplicity Element* |  | *Multiplicity van de source role van de bijbehorende composite relatie* |                  |
| **Authentiek**             | 1                       | Algemeen metagegeven.                                             |                                                                 |  | *Tagged value*                                                          |                  |
| heeft**attribuut**         | 0..*                    | Binding aan een attribuutsoort.                                   | *owned element* = UML-property                                |  | *attribute*                                                             |                  |
| heeft**gegevensgroep**     | 0..*                    | Binding aan een gegevensgroep.                                    | *owned element* = UML-property                                |  | *attribute*                                                             |                  |
| heeft**relatiesoort**      | 0..*                    | Binding aan een relatiesoort of relatieklasse.                    | *owned element* = UML-Relationship                            |  | *association*                                                           |                  |
| heeft**externe koppeling** | 0..*                    | Binding aan een externe koppeling.                                | *owned element* = UML-Relationship                            |  | *association*                                                           |                  |
| verwijst naar**supertype** | 0..*                    | Binding aan een generalisatie (naar een ander gegevensgroeptype). | *owned element* = UML-Relationship                            |  | *association*                                                           |                  |
| heeft**Constraint**        | 0..*                    | Binding aan een constraint.                                       |                                                                 |  | *Constraint*                                                            |                  |

### Relaties in UML

<aside class="note" title="Aanvullen met uitleg Generalisatie">
  <p>Deze paragraaf bevat de specificaties van <code>«Relatiesoort»</code>, <code>«Relatierol»</code>, <code>«Relatieklasse»</code> en <code>«Generalisatie»</code>, maar onderstaande alinea's vertellen enkel iets over alternatieven met betrekking tot <code>«Relatiesoort»</code> en <code>«Relatierol»</code>. Je verwacht hier ook iets van uitleg over de toepassing van andere stereotypen (of een verwijzing ernaar).
  </p>
</aside>

Het metamodel heeft twee manieren om een relatie tussen twee objecttypen te
beschrijven. Deze keuze wordt aangegeven in de eigen extensie, zoals beschreven
in [[[#alternatieven]]]. Alleen het gekozen alternatief is relevant voor de modellering in uw informatiemodel. Welke alternatief je ook kiest: beide hanteren `<code>`«Relatiesoort»`</code>` en `<code>`«Relatierol»`</code>`, maar met andere regels voor gebruik.

**Alternatief 1: Relatiesoort is leidend**

Relatiesoort is verplicht, met een naam en met een definitie en deze is leidend.
Metadata aspecten worden hierbij altijd vastgelegd. Het gebruik van relatierol
is optioneel (zowel bij source en target). Áls er een relatierol target wordt
vastgelegd, dan is de metadata hierbij wel verplicht.

**Alternatief 2: Relatierol is leidend**

Verplichte benoeming van de rol van de target in een relatie met de bijbehoren
de metagegevens en optioneel de benoeming van de naam van de relatie.

#### «Relatiesoort» (alt 1: soort leidend)

De relatiesoorten worden naar de volgende aspecten gespecificeerd.

| **Aspect**                           | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                                                      |  | **In EA**                                                       | **In ...** |
| ------------------------------------------ | ----------------------- | --------------------------- | ------------------------------------------------------------------------- | - | --------------------------------------------------------------------- | ---------------- |
| **Identificatie**                    | 1                       | Identificerend metagegeven. |                                                                           |  | *Tagged value*                                                      |                  |
| **Naam√**                           | 1                       | Algemeen metagegeven.       | *name van de metaclass Named element*                                   |  | *Name*                                                              |                  |
| **Alias**                            | 0..1                    | Algemeen metagegeven.       | *UML-Property*                                                          |  | *Alias*                                                             |                  |
| **Herkomst**                         | 1                       | Algemeen metagegeven.       |                                                                           |  | *tagged value*                                                      |                  |
| **Begrip**                           | 0..\*                   | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Definitie√**                      | 1                       | Algemeen metagegeven.       | *Body van de metaclass Comment*                                         |  | *Notes*                                                             |                  |
| **Herkomst definitie√**             | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Toelichting√**                    | 0..1                    | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Datum opname**                     | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Identificerend**                   | 0..1                    | Algemeen metagegeven.       | *isID bij de metaclass Property*                                        |  | *isID*                                                              |                  |
| **Unidirectioneel**                  | 1                       | Algemeen metagegeven.       |                                                                           |  | *Direction van de betreffende assiciation (van source naar target)* |                  |
| **Bron**                             | 1                       | Algemeen metagegeven.       | */source: related Element bij Relationship Element*                     |  | *Source*                                                            |                  |
| **Doel**                             | 1                       | Algemeen metagegeven.       | */target: related Element bij Relationship Element*                     |  | *Target*                                                            |                  |
| **Aggregatietype**                   | 1                       | Algemeen metagegeven.       | *AggregationKind bij metaclass Property*                                |  | *Aggregation van de source role met waarde composite of shared*     |                  |
| **Kardinaliteit√**                  | 1                       | Algemeen metagegeven.       | *lowerValue en upperValue van de metaclass MultiplicityElement* /target |  | *Multiplicity van de target role*                                   |                  |
| **Kardinaliteit relatie bron**       | 1                       | Algemeen metagegeven.       | *lowerValue en upperValue van de metaclass MultiplicityElement* /source |  | *Multiplicity van de source role*                                   |                  |
| **Heeft tijdlijn geldigheid √**     | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie materiële historie √** | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Heeft tijdlijn registratie √**    | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie formele historie √**    | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Authentiek√**                     | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie afleidbaar**             | 1                       | Algemeen metagegeven.       | *isDerived bij UML metaclass Assocation*                                |  | *isDerived*                                                         |                  |
| **Mogelijk geen waarde**             | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| verwijst naar relatie**doel**        | 0..*                    | Binding aan een objecttype. | */target: related Element bij Relationship Element* = UML-Class         |  | *association target* = Class                                        |                  |
| heeft**Constraint**                  | 0..*                    | Binding aan een constraint. |                                                                           |  | *Constraint*                                                        |                  |

#### «Relatiesoort» (alt 2: rol leidend)

De relatiesoorten worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                                              |  | **In EA**                | **In ...** |
| ---------------------------------- | ----------------------- | --------------------------- | ----------------------------------------------------------------- | - | ------------------------------ | ---------------- |
| **Identificatie**            | 1                       | Identificerend metagegeven. |                                                                   |  | *Tagged value*               |                  |
| **Naam**                     | 1                       | Algemeen metagegeven.       | *name van de metaclass Named element*                           |  | *Name*                       |                  |
| **Alias**                    | 0..1                    | Algemeen metagegeven.       | *UML-Property*                                                  |  | *Alias*                      |                  |
| **Herkomst**                 | 1                       | Algemeen metagegeven.       |                                                                   |  | *tagged value*               |                  |
| **Begrip**                   | 0..\*                   | Algemeen metagegeven.       |                                                                   |  | *Tagged value*               |                  |
| **Definitie**                | 1                       | Algemeen metagegeven.       | *Body van de metaclass Comment*                                 |  | *Notes*                      |                  |
| **Herkomst definitie**       | 1                       | Algemeen metagegeven.       |                                                                   |  | *Tagged value*               |                  |
| **Toelichting**              | 0..1                    | Algemeen metagegeven.       |                                                                   |  | *Tagged value*               |                  |
| **Datum opname**             | 1                       | Algemeen metagegeven.       |                                                                   |  | *Tagged value*               |                  |
| verwijst naar**relatiedoel** | 0..*                    | Binding aan een objecttype. | */target: related Element bij Relationship Element* = UML-Class |  | *association target* = Class |                  |
| heeft**Constraint**          | 0..*                    | Binding aan een constraint. |                                                                   |  | *Constraint*                 |                  |

#### «Relatierol» (alt 1: soort leidend)

Relatierollen worden naar de volgende aspecten gespecificeerd.

| **Aspect**             | **Kardinaliteit** | **Toelichting**                                                                | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| ---------------------------- | ----------------------- | ------------------------------------------------------------------------------------ | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metagegeven.                                                          |                                         |  | *Tagged value* |                  |
| **Naam**               | 1                       | Algemeen metagegeven. De default naam is gelijk aan de naam van het doel-objecttype. | *name van de metaclass Named element* |  | *Name*         |                  |
| **Alias**              | 0..1                    | Algemeen metagegeven.                                                                | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**           | 1                       | Algemeen metagegeven.                                                                |                                         |  | *tagged value* |                  |
| **Begrip**             | 0..\*                   | Algemeen metagegeven.                                                                |                                         |  | *Tagged value* |                  |
| **Definitie**          | 1                       | Algemeen metagegeven.                                                                | *Body van de metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie** | 1                       | Algemeen metagegeven.                                                                |                                         |  | *Tagged value* |                  |
| **Toelichting**        | 0..1                    | Algemeen metagegeven.                                                                |                                         |  | *Tagged value* |                  |
| **Datum opname**       | 1                       | Algemeen metagegeven.                                                                |                                         |  | *Tagged value* |                  |
| heeft**Constraint**    | 0..*                    | Binding aan een constraint.                                                          |                                         |  | *Constraint*   |                  |

#### «Relatierol» (alt 2: rol leidend)

Voor relatierol worden bij de target rol van een relatiesoort de volgende
aspecten gespecificeerd.

| **Aspect**                           | **Kardinaliteit** | **Toelichting**                                                                 | **In UML 2.5**                                               |  | **In EA**  | **In ...** |
| ------------------------------------------ | ----------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------ | - | ---------------- | ---------------- |
| **Identificatie**                    | 1                       | Identificerend metagegeven.                                                           |                                                                    |  | *Tagged value* |                  |
| **Naam√**                           | 1                       | Algemeen metagegeven.  De default naam is gelijk aan de naam van het doel-objecttype. | *name van de metaclass Named element*                            |  | *Name*         |                  |
| **Alias**                            | 0..1                    | Algemeen metagegeven.                                                                 | *UML-Property*                                                   |  | *Alias*        |                  |
| **Herkomst**                         | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *tagged value* |                  |
| **Begrip**                           | 0..\*                   | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Definitie√**                      | 1                       | Algemeen metagegeven.                                                                 | *Body van de metaclass Comment*                                  |  | *Notes*        |                  |
| **Herkomst definitie√**             | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Toelichting√**                    | 0..1                    | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Datum opname**                     | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Identificerend**                   | 0..1                    | Algemeen metagegeven.                                                                 | *isID bij de metaclass Property*                                 |  | *isID*         |                  |
| **Kardinaliteit√**                  | 1                       | Algemeen metagegeven.                                                                 | *lowerValue en upperValue van de metaclass Multiplicity Element* |  | *Multiplicity* |                  |
| **Heeft tijdlijn geldigheid √**     | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Indicatie materiële historie √** | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Heeft tijdlijn registratie √**    | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Indicatie formele historie √**    | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Authentiek√ \***                  | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| **Mogelijk geen waarde**             | 1                       | Algemeen metagegeven.                                                                 |                                                                    |  | *Tagged value* |                  |
| heeft**Constraint**                  | 0..*                    | Binding aan een constraint.                                                           |                                                                    |  | *Constraint*   |                  |

#### «Generalisatie» tussen objecttypes

De generalisaties worden naar het volgende aspecten gespecificeerd:

| **Aspect**                 | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | **In UML 2.5**                                              |  | **In EA**  | **In ...** |
| -------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                                   |  | *Tagged value* |                  |
| **Subtype**                | 1                       | De generalisatie relatie kent twee kanten, de bron kant (source) van de relatie en de doel kant (target) van de relatie. De bron kant van deze generalisatie relatie specificeert een_objecttype_ die een subtype/specialisatie is van het via deze generalisatie relatie aangegeven supertype (zie verwijst naar supertype). Kortweg, het subtype is een specialisatie van het supertype. Het objecttype dat het subtype is van deze generalisatie is verbonden met deze generalisatie. | */source: related Element bij Relationship Element*             |  | *Source*       |                  |
| verwijst naar**supertype** | 1                       | Binding van deze generalisatie aan een objecttype. De generalisatie relatie kent twee kanten, de bron kant (source) van de relatie en de doel kant (target) van de relatie. De doel kant van deze generalisatie relatie specificeert een_objecttype_ die het supertype/de generalisatie is van het via deze generalisatie aangegeven subtype. Kortweg, het supertype is een generalisatie van het subtype.                                                                               | */target: related Element bij Relationship Element* = UML-Class |  | *Target*       |                  |
| **Datum opname**           | 1                       | Algemeen metagegeven                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |                                                                   |  | *Tagged value* |                  |
| heeft**Constraint**        | 0..*                    | Binding aan een constraint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                                   |  | *Constraint*   |                  |
| **Mixin**                  | 1                       | Alleen bij MIM niveau 3, logische modellen                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                                   |  | *Tagged value* |                  |

#### «Generalisatie» tussen datatypen

De generalisaties worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                      | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | **In UML 2.5**                                                 |  | **In EA**  | **In ...** |
| ----------------------------------------------------- | ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**                               | 1                       | Identificerend metagegeven.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                      |  | *Tagged value* |                  |
| **Subtype**                                     | 1                       | De generalisatie relatie kent twee kanten, de bron kant (source) van de relatie en de doel kant (target) van de relatie. De bron kant van deze generalisatie relatie specificeert een_datatype_ die een subtype/specialisatie is van het via deze generalisatie relatie aangegeven supertype (zie verwijst naar supertype). Kortweg, het subtype is een specialisatie van het supertype. Het datatype dat het subtype is van deze generalisatie is verbonden met deze generalisatie. |                                                                      |  |                  |                  |
| */source: related Element bij Relationship Element* |                         | *Source*                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                                                      |  |                  |                  |
| verwijst naar**supertype**                      | 1                       | Binding van deze generalisatie aan een datatype. De generalisatie relatie kent twee kanten, de bron kant (source) van de relatie en de doel kant (target) van de relatie. De doel kant van deze generalisatie relatie specificeert een_datatype_ die het supertype/de generalisatie is van het via deze generalisatie aangegeven subtype. Kortweg, het supertype is een generalisatie van het subtype.                                                                               | */target: related Element bij Relationship Element* = UML-datatype |  |                  | *Target*       |
| **Datum opname**                                | 1                       | Algemeen metagegeven                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |                                                                      |  | *Tagged value* |                  |
| heeft**Constraint**                             | 0..*                    | Binding aan een constraint.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                      |  | *Constraint*   |                  |

#### «Relatieklasse»

De relatieklassen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                          | **Kardinaliteit** | **Toelichting**           | **In UML 2.5**                                                      |  | **In EA**                                                       | **In ...** |
| ----------------------------------------- | ----------------------- | ------------------------------- | ------------------------------------------------------------------------- | - | --------------------------------------------------------------------- | ---------------- |
| **Identificatie**                   | 1                       | Identificerend metagegeven.     |                                                                           |  | *Tagged value*                                                      |                  |
| **Naam√**                          | 1                       | Algemeen metagegeven.           | *name van de metaclass Named element*                                   |  | *Name*                                                              |                  |
| **Alias**                           | 0..1                    | Algemeen metagegeven.           | *UML-Property*                                                          |  | *Alias*                                                             |                  |
| **Herkomst**                        | 1                       | Algemeen metagegeven.           |                                                                           |  | *tagged value*                                                      |                  |
| **Begrip**                          | 0..\*                   | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Definitie√**                     | 1                       | Algemeen metagegeven.           | *Body van de metaclass Comment*                                         |  | *Notes*                                                             |                  |
| **Toelichting√**                   | 0..1                    | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Datum opname**                    | 1                       | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Herkomst definitie√**            | 1                       | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Unidirectioneel**                 | 1                       | Algemeen metagegeven.           |                                                                           |  | *Direction van de betreffende association (van source naar target)* |                  |
| **Bron**                            | 1                       | Algemeen metagegeven.           | */source: related Element bij Relationship Element*                     |  | *Source*                                                            |                  |
| **Doel**                            | 1                       | Algemeen metagegeven.           | */target: related Element bij Relationship Element*                     |  | *Target*                                                            |                  |
| **Aggregatietype**                  | 1                       | Algemeen metagegeven.           | *AggregationKind bij metaclass Property*                                |  | *Aggregation van de source role met waarde composite of shared*     |                  |
| **Kardinaliteit√**                 | 1                       | Algemeen metagegeven.           | *lowerValue en upperValue van de metaclass MultiplicityElement*         |  | *Multiplicity van de target role*                                   |                  |
| **Kardinaliteit relatie bron**      | 1                       | Algemeen metagegeven.           | *lowerValue en upperValue van de metaclass MultiplicityElement* /source |  | *Multiplicity van de source role*                                   |                  |
| **Indicatie materiële historie√** | 1                       | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie formele historie√**    | 1                       | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Authentiek√**                    | 1                       | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie afleidbaar**            | 1                       | Algemeen metagegeven.           | *isDerived bij UML metaclass Assocation*                                |  | *isDerived*                                                         |                  |
| **Mogelijk geen waarde**            | 1                       | Algemeen metagegeven.           |                                                                           |  | *Tagged value*                                                      |                  |
| **heeft attribuut**                 | 0..*                    | Binding aan een attribuutsoort. | *owned element* = UML-property                                          |  | *attribute*                                                         |                  |
| **verwijst naar relatiedoel**       | 0..*                    | Binding aan een objecttype.     | */target: related Element bij Relationship Element* = UML-Class         |  | *association target* = Class                                        |                  |
| **heeft gegegevensgroep**           | 0..*                    | Binding aan gegevensgroep.      | *owned element* = UML-property                                          |  | *attribute*                                                         |                  |
| heeft**Constraint**                 | 0..*                    | Binding aan een constraint.     |                                                                           |  | *Constraint*                                                        |                  |

#### «Externe koppeling»

Externe koppelingen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                          | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                                                      |  | **In EA**                                                       | **In ...** |
| ----------------------------------------- | ----------------------- | --------------------------- | ------------------------------------------------------------------------- | - | --------------------------------------------------------------------- | ---------------- |
| **Identificatie**                   | 1                       | Identificerend metagegeven. |                                                                           |  | *Tagged value*                                                      |                  |
| **Naam√**                          | 1                       | Algemeen metagegeven.       | *name van de metaclass Named element*                                   |  | *Name*                                                              |                  |
| **Alias**                           | 0..1                    | Algemeen metagegeven.       | *UML-Property*                                                          |  | *Alias*                                                             |                  |
| **Herkomst**                        | 1                       | Algemeen metagegeven.       |                                                                           |  | *tagged value*                                                      |                  |
| **Begrip**                          | 0..\*                   | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Definitie√**                     | 1                       | Algemeen metagegeven.       | *Body van de metaclass Comment*                                         |  | *Notes*                                                             |                  |
| **Herkomst definitie√**            | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Toelichting√**                   | 0..1                    | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Datum opname**                    | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Unidirectioneel**                 | 1                       | Algemeen metagegeven.       |                                                                           |  | *Direction van de betreffende assiciation (van source naar target)* |                  |
| **Bron**                            | 1                       | Algemeen metagegeven.       | */source: related Element bij Relationship Element*                     |  | *Source*                                                            |                  |
| **Doel**                            | 1                       | Algemeen metagegeven.       | */target: related Element bij Relationship Element*                     |  | *Target*                                                            |                  |
| **Aggregatietype**                  | 1                       | Algemeen metagegeven.       | *AggregationKind bij metaclass Property*                                |  | *Aggregation van de source role met waarde composite of shared*     |                  |
| **Kardinaliteit√**                 | 1                       | Algemeen metagegeven.       | *lowerValue en upperValue van de metaclass MultiplicityElement*         |  | *Multiplicity van de target role*                                   |                  |
| **Kardinaliteit relatie bron**      | 1                       | Algemeen metagegeven.       | *lowerValue en upperValue van de metaclass MultiplicityElement* /source |  | *Multiplicity van de source role*                                   |                  |
| **Indicatie materiële historie√** | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie formele historie√**    | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Authentiek√**                    | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| **Indicatie afleidbaar**            | 1                       | Algemeen metagegeven.       | *isDerived bij UML metaclass Assocation*                                |  | *isDerived*                                                         |                  |
| **Mogelijk geen waarde**            | 1                       | Algemeen metagegeven.       |                                                                           |  | *Tagged value*                                                      |                  |
| verwijst naar**relatiedoel**        | 0..*                    | Binding aan een objecttype. | */target: related Element bij Relationship Element* = UML-Class         |  | *association target* = Class                                        |                  |
| heeft**Constraint**                 | 0..*                    | Binding aan een constraint. |                                                                           |  | *Constraint*                                                        |                  |

### Waardelijsten in UML

#### «Codelijst»

Voor codelijst worden de volgende aspecten gespecificeerd:

| **Aspect**              | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                             | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| ----------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**       | 1                       | Identificerend metagegeven.                                                                                                                                                                                                                       |                                         |  | *Tagged value* |                  |
| **Naam**                | 1                       | Algemeen metagegeven.*De naam van de lijst zoals gespecificeerd in de catalogus van de desbetreffende registratie dan wel, indien het een door de eigen organisatie toegevoegde lijst betreft, de door de eigen organisatie vastgestelde naam.* | *name van de metaclass Named element* |  | *Name*         |                  |
| **Alias**               | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                             | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**            | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Begrip**              | 0..\*                   | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *Tagged value* |                  |
| **Definitie**           | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                             | *Body van de metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie**  | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *Tagged value* |                  |
| **Toelichting**         | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Datum opname**        | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Locatie**             | 1..1                    | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Doelformaat**         | 1..1                    | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Waarde-item**         | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| **Profielspecificatie** | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                             |                                         |  | *tagged value* |                  |
| heeft**Constraint**     | 0..*                    | Binding aan een constraint.                                                                                                                                                                                                                       |                                         |  | *Constraint*   |                  |

#### «Enumeratie»

Enumeraties betreffen de metaclass `Enumeration` en worden naar de volgende
aspecten gespecificeerd:

| **Aspect**                 | **Kardinaliteit** | **Toelichting**             | **In UML 2.5**                       |  | **In EA**  | **In ...** |
| -------------------------------- | ----------------------- | --------------------------------- | ------------------------------------------ | - | ---------------- | ---------------- |
| **Identificatie**          | 1                       | Identificerend metagegeven.       |                                            |  | *Tagged value* |                  |
| **Naam**                   | 1                       | Algemeen metagegeven.             | *name van de metaclass Named element*    |  | *Name*         |                  |
| **Alias**                  | 0..1                    | Algemeen metagegeven.             | *UML-Property*                           |  | *Alias*        |                  |
| **Herkomst**               | 1                       | Algemeen metagegeven.             |                                            |  | *tagged value* |                  |
| **Begrip**                 | 0..\*                   | Algemeen metagegeven.             |                                            |  | *Tagged value* |                  |
| **Definitie**              | 1                       | Algemeen metagegeven.             | *Body van de metaclass Comment*          |  | *Notes*        |                  |
| **Herkomst definitie**     | 1                       | Algemeen metagegeven.             |                                            |  | *Tagged value* |                  |
| **Toelichting**            | 0..1                    | Algemeen metagegeven.             |                                            |  | *tagged value* |                  |
| **Datum opname**           | 1                       | Algemeen metagegeven.             |                                            |  | *tagged value* |                  |
| bevat enumeratie**waarde** | 1..*                    | Binding van een enumeratiewaarde. | *owned element* = UML-EnumerationLiteral |  | *association*  |                  |
| heeft**Constraint**        | 0..*                    | Binding aan een constraint.       |                                            |  | *Constraint*   |                  |

#### «Enumeratiewaarde»

De enumeratiewaarde zelf betreft de metaclass `UML-EnumerationLiteral` en kent de volgende aspecten:

| **Aspect**             | **Kardinaliteit** | **Toelichting**                                                                                                                         | **In UML 2.5**                      |  | **In EA**  | **In ...** |
| ---------------------------- | ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metagegeven.                                                                                                                   |                                           |  | *Tagged value* |                  |
| **Naam**               | 1                       | Algemeen metagegeven.                                                                                                                         | *name van de metaclass Named element*   |  | *Name*         |                  |
| **Code**               | 0..1                    | De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code (niet te verwarren met alias, zoals bedoeld in 2.8.2). | *Alias van de metaclass Element Import* |  | *Alias*        |                  |
| **Herkomst**           | 0..1                    | Algemeen metagegeven.                                                                                                                         |                                           |  | *tagged value* |                  |
| **Begrip**             | 0..\*                   | Algemeen metagegeven.                                                                                                                         |                                           |  | *Tagged value* |                  |
| **Definitie**          | 0..1                    | Algemeen metagegeven.                                                                                                                         | *Body van de metaclass Comment*         |  | *Notes*        |                  |
| **Herkomst definitie** | 0..1                    | Algemeen metagegeven.                                                                                                                         |                                           |  | *Tagged value* |                  |
| **Toelichting**        | 0..1                    | Algemeen metagegeven.                                                                                                                         |                                           |  | *tagged value* |                  |
| **Datum opname**       | 1                       | Algemeen metagegeven.                                                                                                                         |                                           |  | *tagged value* |                  |
| heeft**Constraint**    | 0..*                    | Binding aan een constraint.                                                                                                                   |                                           |  | *Constraint*   |                  |

#### «Referentielijst»

Voor referentielijsten worden de volgende aspecten gespecificeerd:

| **Aspect**                  | **Kardinaliteit** | **Toelichting**                                             | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| --------------------------------- | ----------------------- | ----------------------------------------------------------------- | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**           | 1                       | Identificerend metagegeven.                                       |                                         |  | *Tagged value* |                  |
| **Naam**                    | 1                       | Algemeen metagegeven.                                             | *name van de metaclass Named element* |  | *Name*         |                  |
| **Alias**                   | 0..1                    | Algemeen metagegeven.                                             | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**                | 1                       | Algemeen metagegeven.                                             |                                         |  | *tagged value* |                  |
| **Begrip**                  | 0..\*                   | Algemeen metagegeven.                                             |                                         |  | *Tagged value* |                  |
| **Definitie**               | 1                       | Algemeen metagegeven.                                             | *Body van de metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie**      | 1                       | Algemeen metagegeven.                                             |                                         |  | *Tagged value* |                  |
| **Toelichting**             | 0..1                    | Algemeen metagegeven.                                             |                                         |  | *Tagged value* |                  |
| **Datum opname**            | 1                       | Algemeen metagegeven.                                             |                                         |  | *Tagged value* |                  |
| **Locatie**                 | 1                       | Algemeen metagegeven.                                             |                                         |  | *Tagged value* |                  |
| bevat**referentie-element** | 1..*                    | Binding aan een referentie-element.                               | *owned element* = UML-property        |  | *attribute*    |                  |
| verwijst naar**supertype**  | 0..*                    | Binding aan een generalisatie (naar een andere referentie lijst). | *owned element* = UML-Relationship    |  | *association*  |                  |
| heeft**Constraint**         | 0..*                    | Binding aan een constraint.                                       |                                         |  | *Constraint*   |                  |

#### «Referentie-element»

De referentie-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Kardinaliteit** | **Toelichting**                                                                                                                                         | **In UML 2.5**                                               |  | **In EA**                        | **In ...** |
| --------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ | - | -------------------------------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metagegeven.                                                                                                                                   |                                                                    |  | *Tagged value*                       |                  |
| **Naam**                                      | 1                       | Algemeen metagegeven.                                                                                                                                         | *name van de metaclass Named element*                            |  | *Name*                               |                  |
| **Alias**                                     | 0..1                    | Algemeen metagegeven.                                                                                                                                         | *UML-Property*                                                   |  | *Alias*                              |                  |
| **Herkomst**                                  | 1                       | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *tagged value*                       |                  |
| **Begrip**                                    | 0..\*                   | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Definitie**                                 | 1                       | Algemeen metagegeven.                                                                                                                                         | *Body van de metaclass Comment*                                  |  | *Notes*                              |                  |
| **Herkomst definitie**                        | 1                       | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Toelichting**                               | 0..1                    | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Datum opname**                              | 1                       | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Domein** *(aspecten van een waarde/data)* |                         |                                                                                                                                                               |                                                                    |  |                                        |                  |
| **- Lengte**                                  | 0..1                    | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **- Patroon**                                 | 0..1                    | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **- Formeel patroon**                         | 0..1                    | Algemeen metagegeven.                                                                                                                                         |                                                                    |  | *Tagged value*                       |                  |
| **Kardinaliteit**                             | 1                       | Algemeen metagegeven.                                                                                                                                         | *lowerValue en upperValue van de metaclass Multiplicity Element* |  | *Multiplicity van de de target role* |                  |
| **Identificerend**                            | 0..1                    | Algemeen metagegeven.                                                                                                                                         | *isID van de metaclass Property*                                 |  | *isID bij de betreffende class*      |                  |
| **Minimumwaarde inclusief**                   | 0..1                    | Algemeen metagegeven. Een referentie-element mag of een metagegeven**Minimumwaarde inclusief** of **Minimumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Minimumwaarde exclusief**                   | 0..1                    | Algemeen metagegeven. Een referentie-element mag of een metagegeven**Minimumwaarde inclusief** of **Minimumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Maximumwaarde inclusief**                   | 0..1                    | Algemeen metagegeven. Een referentie-element mag of een metagegeven**Maximumwaarde inclusief** of **Maximumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Maximumwaarde exclusief**                   | 0..1                    | Algemeen metagegeven. Een referentie-element mag of een metagegeven**Maximumwaarde inclusief** of **Maximumwaarde exclusief** hebben, niet beide. |                                                                    |  | _Tagged value_                       |                  |
| **Eenheid**                                   | 0..1                    | Toevoegen als het referentie-element een waarde betreft en de eenheid als metagegeven opgenomen moet worden.                                                  |                                                                    |  |                                        |                  |
| heeft data**type**                            | 1                       | Binding aan een datatype.                                                                                                                                     | *datatype* = UML-datatype                                        |  | *type* = datatype                    |                  |
| heeft**Constraint**                           | 0..*                    | Binding aan een constraint.                                                                                                                                   |                                                                    |  | *Constraint*                         |                  |

### Datatypen in UML

Het betreft metagegevens voor in het informatiemodel gedefinieerde datatypen,
oftewel exclusief datatypen die al buiten het model bestaan, zoals Integer,
DateTime, Surface.

#### «Primitief datatype»

De primitieve datatypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Kardinaliteit** | **Toelichting**                                                                                                                               | **In UML 2.5**                    |  | **In EA**  | **In ...** |
| --------------------------------------------------- | ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metagegeven.                                                                                                                         |                                         |  | *Tagged value* |                  |
| **Naam**                                      | 1                       | Algemeen metagegeven.                                                                                                                               | *name van de metaclass Named element* |  | *Name*         |                  |
| **Alias**                                     | 0..1                    | Algemeen metagegeven.                                                                                                                               | *UML-Property*                        |  | *Alias*        |                  |
| **Herkomst**                                  | 0..1                    | Algemeen metagegeven.                                                                                                                               |                                         |  | *tagged value* |                  |
| **Begrip**                                    | 0..\*                   | Algemeen metagegeven.                                                                                                                               |                                         |  | *Tagged value* |                  |
| **Definitie**                                 | 0..1                    | Algemeen metagegeven.                                                                                                                               | *Body van de metaclass Comment*       |  | *Notes*        |                  |
| **Herkomst definitie**                        | 0..1                    | Algemeen metagegeven.                                                                                                                               |                                         |  | *Tagged value* |                  |
| **Toelichting**                               | 0..1                    | Algemeen metagegeven.                                                                                                                               |                                         |  | *tagged value* |                  |
| **Datum opname**                              | 1                       | Algemeen metagegeven.                                                                                                                               |                                         |  | *tagged value* |                  |
| **Domein** *(aspecten van een waarde/data)* |                         |                                                                                                                                                     |                                         |  |                  |                  |
| **- Lengte**                                  | 0..1                    | Algemeen metagegeven, in principe wordt dit metagegeven bij het attribuutsoort gespecificeerd, behalve als het generiek gespecificeerd moet worden. |                                         |  | *Tagged value* |                  |
| **- Patroon**                                 | 0..1                    | Algemeen metagegeven, in principe wordt dit metagegeven bij het attribuutsoort gespecificeerd, behalve als het generiek gespecificeerd moet worden. |                                         |  | *Tagged value* |                  |
| **- Formeel patroon**                         | 0..1                    | Algemeen metagegeven, in principe wordt dit metagegeven bij het attribuutsoort gespecificeerd, behalve als het generiek gespecificeerd moet worden. |                                         |  | *Tagged value* |                  |
| heeft**Constraint**                           | 0..*                    | Binding aan een constraint.                                                                                                                         |                                         |  | *Constraint*   |                  |

#### «Gestructureerd datatype»

Voor gestructureerde datatypen worden de volgende aspecten gespecificeerd:

| **Aspect**             | **Kardinaliteit** | **Toelichting**                                                       | **In UML 2.5**                   |  | **In EA**  | **In ...** |
| ---------------------------- | ----------------------- | --------------------------------------------------------------------------- | -------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metagegeven.                                                 |                                        |  | *Tagged value* |                  |
| **Naam**               | 1                       | Algemeen metagegeven.*De naam van het domein package.*                    | *name van de metaclass Namedelement* |  | *Name*         |                  |
| **Alias**              | 0..1                    | Algemeen metagegeven.                                                       | *UML-Property*                       |  | *Alias*        |                  |
| **Herkomst**           | 0..1                    | Algemeen metagegeven.                                                       |                                        |  | *tagged value* |                  |
| **Begrip**             | 0..\*                   | Algemeen metagegeven.                                                       |                                        |  | *Tagged value* |                  |
| **Definitie**          | 0..1                    | Algemeen metagegeven.                                                       | *Body van de metaclass Comment*      |  | *Notes*        |                  |
| **Herkomst definitie** | 0..1                    | Algemeen metagegeven.                                                       |                                        |  | *Tagged value* |                  |
| **Toelichting**        | 0..1                    | Algemeen metagegeven.                                                       |                                        |  | *tagged value* |                  |
| **Datum opname**       | 1                       | Algemeen metagegeven.                                                       |                                        |  | *tagged value* |                  |
| **Patroon**            | 0..1                    | Algemeen metagegeven.                                                       |                                        |  | *Tagged value* |                  |
| **Formeel patroon**    | 0..1                    | Algemeen metagegeven.                                                       |                                        |  | *Tagged value* |                  |
| bevat**data-element**  | 0..*                    | Binding aan een data-element, 2 of meer tenzij via generalisatie verkregen. | *owned element* = UML-property       |  | *attribute*    |                  |
| heeft**Constraint**    | 0..*                    | Binding aan een constraint.                                                 |                                        |  | *Constraint*   |                  |

#### «Data-element»

De data-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                    | **Kardinaliteit** | **Toelichting**                                                                                                                                   | **In UML 2.5**                                              |  | **In EA**     | **In ...** |
| --------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | - | ------------------- | ---------------- |
| **Identificatie**                             | 1                       | Identificerend metagegeven.                                                                                                                             |                                                                   |  | *Tagged value*    |                  |
| **Naam**                                      | 1                       | Algemeen metagegeven.*De naam van het domein package.*                                                                                                | *name van de metaclass Namedelement*                            |  | *Name*            |                  |
| **Alias**                                     | 0..1                    | Algemeen metagegeven.                                                                                                                                   | *UML-Property*                                                  |  | *Alias*           |                  |
| **Herkomst**                                  | 0..1                    | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *tagged value*    |                  |
| **Begrip**                                    | 0..\*                   | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **Definitie**                                 | 0..1                    | Algemeen metagegeven.                                                                                                                                   | *Body van de metaclass Comment*                                 |  | *Notes*           |                  |
| **Herkomst definitie**                        | 0..1                    | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **Toelichting**                               | 0..1                    | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *tagged value*    |                  |
| **Datum opname**                              | 1                       | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *tagged value*    |                  |
| **Domein** *(aspecten van een waarde/data)* |                         |                                                                                                                                                         |                                                                   |  |                     |                  |
| **- Lengte**                                  | 0..1                    | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **- Patroon**                                 | 0..1                    | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **- Formeel patroon**                         | 0..1                    | Algemeen metagegeven.                                                                                                                                   |                                                                   |  | *Tagged value*    |                  |
| **Kardinaliteit**                             | 1                       | Algemeen metagegeven.                                                                                                                                   | *lowerValue en upperValue van de metaclass MultiplicityElement* |  | *Multiplicity*    |                  |
| **Minimumwaarde inclusief**                   | 0..1                    | Algemeen metagegeven. Een data-element mag of een metagegeven**Minimumwaarde inclusief** of **Minimumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| **Minimumwaarde exclusief**                   | 0..1                    | Algemeen metagegeven. Een data-element mag of een metagegeven**Minimumwaarde inclusief** of **Minimumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| **Maximumwaarde inclusief**                   | 0..1                    | Algemeen metagegeven. Een data-element mag of een metagegeven**Maximumwaarde inclusief** of **Maximumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| **Maximumwaarde exclusief**                   | 0..1                    | Algemeen metagegeven. Een data-element mag of een metagegeven**Maximumwaarde inclusief** of **Maximumwaarde exclusief** hebben, niet beide. |                                                                   |  | _Tagged value_    |                  |
| heeft data**type**                            | 1                       | Binding aan een datatype.                                                                                                                               | *datatype* = UML-datatype                                       |  | *type* = datatype |                  |
| heeft**Constraint**                           | 0..*                    | Binding aan een constraint.                                                                                                                             |                                                                   |  | *Constraint*      |                  |

#### «Keuze»

Een Keuze worden naar de volgende aspecten gespecificeerd:

| **Aspect**                | **Kardinaliteit** | **Toelichting**                                                                  | **In UML 2.5**                                           |  | **In EA**  | **In ...** |
| ------------------------------- | ----------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------- | - | ---------------- | ---------------- |
| **Identificatie**         | 1                       | Identificerend metagegeven.                                                            |                                                                |  | *Tagged value* |                  |
| **Naam**                  | 1                       | Algemeen metagegeven.*De naam van het domein package.*                               | *name van de metaclass Namedelement*                         |  | *Name*         |                  |
| **Alias**                 | 0..1                    | Algemeen metagegeven.                                                                  | *UML-Property*                                               |  | *Alias*        |                  |
| **Herkomst**              | 0..1                    | Algemeen metagegeven.                                                                  |                                                                |  | *tagged value* |                  |
| **Begrip**                | 0..\*                   | Algemeen metagegeven.                                                                  |                                                                |  | *Tagged value* |                  |
| **Definitie**             | 0..1                    | Algemeen metagegeven.                                                                  | *Body van de metaclass Comment*                              |  | *Notes*        |                  |
| **Herkomst definitie**    | 0..1                    | Algemeen metagegeven.                                                                  |                                                                |  | *Tagged value* |                  |
| **Toelichting**           | 0..1                    | Algemeen metagegeven.                                                                  |                                                                |  | *tagged value* |                  |
| **Datum opname**          | 1                       | Algemeen metagegeven.                                                                  |                                                                |  | *tagged value* |                  |
| heeft data**type**keuze   | 0..*                    | Binding van een datatype, in UML via een additionale UML-property met stereotype keuze | *owned element* = UML-property en deze heeft en *datatype* |  | *attribute*    |                  |
| heeft**keuzeattribuut**   | 0..*                    | Binding aan een attribuutsoort.                                                        | *owned element* = UML-Property                               |  | *attribute*    |                  |
| heeft**keuzerelatiedoel** | 0..*                    | Binding aan een relatiesoort.                                                          | *owned element* = UML-Relationship                           |  | *association*  |                  |
| heeft**Constraint**       | 0..*                    | Binding aan een constraint.                                                            |                                                                |  | *Constraint*   |                  |

*Opmerking: de modelelementen waaruit gekozen kan worden heten sinds MIM 1.1 geen keuze-elementen meer. Keuze-element is komen te vervallen.*

### Packages in UML

#### «Domein»

Domein packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**             | **Kardinaliteit** | **Toelichting**                                                                           | **In UML 2.5**                   |  | **In EA**              | **In ...** |
| ---------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------- | -------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metagegeven.                                                                     |                                        |  | *Tagged value*             |                  |
| **Naam**               | 1                       | Algemeen metagegeven.*De naam van het domein package.*                                        | *name van de metaclass Namedelement* |  | *Name*                     |                  |
| **Alias**              | 0..1                    | Algemeen metagegeven.                                                                           | *UML-Property*                       |  | *Alias*                    |                  |
| **Herkomst**           | 1                       | Algemeen metagegeven.                                                                           |                                        |  | *tagged value*             |                  |
| **Definitie**          | 1                       | Algemeen metagegeven.                                                                           | *Body van de metaclass Comment*      |  | *Notes*                    |                  |
| **Herkomst definitie** | 1                       | Algemeen metagegeven.                                                                           |                                        |  | *Tagged value*             |                  |
| **Toelichting**        | 0..1                    | Algemeen metagegeven.                                                                           |                                        |  | *tagged value*             |                  |
| **Datum opname**       | 1                       | Algemeen metagegeven.                                                                           |                                        |  | *tagged value*             |                  |
| heeft**Constraint**    | 0..*                    | Binding aan een constraint.                                                                     |                                        |  | *Constraint*               |                  |
| **Basis-URI**          | 0..1                    | Algemeen metagegeven.*Het niet-unieke deel van de URI van ieder modelelement in deze package* |                                        |  | *Tagged value*             |                  |
| bevat**Modelelement**  | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                    | *packagedElement*                    |  | *Browser packagestructuur* |                  |

#### «Extern»

Externe packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**             | **Kardinaliteit** | **Toelichting**                                                                           | **In UML 2.5**                                        |  | **In EA**              | **In ...** |
| ---------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metagegeven.                                                                     |                                                             |  | *Tagged value*             |                  |
| **Naam**               | 1                       | Algemeen metagegeven.*De naam van het domein package.*                                        | *name van de metaclass Namedelement*                      |  | *Name*                     |                  |
| **Alias**              | 0..1                    | Algemeen metagegeven.                                                                           | *UML-Property*                                            |  | *Alias*                    |                  |
| **Herkomst**           | 1                       | Algemeen metagegeven.                                                                           | *Bij een view is de herkomst nooit de eigen organisatie.* |  | *tagged value*             |                  |
| **Definitie**          | 1                       | Algemeen metagegeven.                                                                           | *Body van de metaclass Comment*                           |  | *Notes*                    |                  |
| **Herkomst definitie** | 1                       | Algemeen metagegeven.                                                                           |                                                             |  | *Tagged value*             |                  |
| **Toelichting**        | 0..1                    | Algemeen metagegeven.                                                                           |                                                             |  | *tagged value*             |                  |
| **Datum opname**       | 1                       | Algemeen metagegeven.                                                                           |                                                             |  | *tagged value*             |                  |
| **Locatie**            | 1                       | Algemeen metagegeven.                                                                           |                                                             |  | *Tagged value*             |                  |
| **Basis-URI**          | 0..1                    | Algemeen metagegeven.*Het niet-unieke deel van de URI van ieder modelelement in deze package* |                                                             |  | *Tagged value*             |                  |
| heeft**Constraint**    | 0..*                    | Binding aan een constraint.                                                                     |                                                             |  | *Constraint*               |                  |
| bevat**Modelelement**  | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                    | *packagedElement*                                         |  | *Browser packagestructuur* |                  |

#### «Informatiemodel»

Informatiemodel packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                  | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                                                     | **In UML 2.5**                    |  | **In EA**              | **In ...** |
| --------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**           | 1                       | Identificerend metagegeven.                                                                                                                                                                                                                                               |                                         |  | *Tagged value*             |                  |
| **Naam**                    | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                     | *name van de metaclass Named element* |  | *Name*                     |                  |
| **Alias**                   | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                                                     | *UML-Property*                        |  | *Alias*                    |                  |
| **Herkomst**                | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                     |                                         |  | *tagged value*             |                  |
| **Definitie**               | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                     | *Body van de metaclass Comment*       |  | *Notes*                    |                  |
| **Herkomst definitie**      | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                     |                                         |  | *Tagged value*             |                  |
| **Toelichting**             | 0..1                    | Algemeen metagegeven.                                                                                                                                                                                                                                                     |                                         |  | *tagged value*             |                  |
| **Datum opname**            | 1                       | Algemeen metagegeven.                                                                                                                                                                                                                                                     |                                         |  | *tagged value*             |                  |
| **Informatiemodeltype**     | 1                       | Algemeen metagegeven.*De beschrijving van de aard van het informatiemodel: conceptueel, logisch, technisch.*                                                                                                                                                            |                                         |  | *Tagged value*             |                  |
| **Informatiedomein**        | 1                       | Algemeen metagegeven.*Aanduiding van het functionele domein waartoe het informatiemodel behoort.*                                                                                                                                                                       |                                         |  | *Tagged value*             |                  |
| **MIM versie**              | 1                       | *De versie van de MIM specificatie die gebruikt is om het informatiemodel in uit te drukken.*                                                                                                                                                                           |                                         |  | *Tagged value*             |                  |
|                                   |                         | *Bijvoorbeeld: 1.0.1 of 1.1*                                                                                                                                                                                                                                            |                                         |  |                              |                  |
| **MIM extensie**            | 0..1                    | *De aanduiding van een extensie op MIM.*                                                                                                                                                                                                                                |                                         |  | *Tagged value*             |                  |
|                                   |                         | *Bijvoorbeeld: Kadaster of NEN3610:2020*                                                                                                                                                                                                                                |                                         |  |                              |                  |
| **MIM taal**                | 0..1                    | *De aanduiding van de taal die gebruikt is voor de modelelementen.*  *Bijvoorbeeld: EN of NL*                                                                                                                                                                         |                                         |  | *Tagged value*             |                  |
| **Relatiemodelleringstype** | 1                       | Algemeen metagegeven.    Toelichting Type informatiemodel: zoals bedoeld in [[[#typering-van-modellen-gekoppeld-aan-beschouwingsniveaus]]]. Alle packages, oftewel «Domein» en «View», binnen het informatiemodel hebben hetzelfde type als het informatiemodel zelf. |                                         |  | *Tagged value*             |                  |
| **Tekstopmaak**             | 0..1                    | *Geldt voor hele model, voor de metagegevens die beschreven zijn het het metagegeven tekstopmaak.*                                                                                                                                                                      |                                         |  | *Tagged value*             |                  |
| heeft**Constraint**         | 0..*                    | Binding aan een constraint.                                                                                                                                                                                                                                               |                                         |  | *Constraint*               |                  |
| **Basis-URI**               | 0..1                    | Algemeen metagegeven.*Het niet-unieke deel van de URI van ieder modelelement in deze package*                                                                                                                                                                           |                                         |  | *Tagged value*             |                  |
| bevat**Modelelement**       | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                                                                                                                                                                                              | *packagedElement*                     |  | *Browser packagestructuur* |                  |

#### «View»

View packages worden naar de volgende aspecten gespecificeerd, analoog aan
«Extern»:

| **Aspect**             | **Kardinaliteit** | **Toelichting**                                                                                                                                | **In UML 2.5**                    |  | **In EA**              | **In ...** |
| ---------------------------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | - | ---------------------------- | ---------------- |
| **Identificatie**      | 1                       | Identificerend metagegeven.                                                                                                                          |                                         |  | *Tagged value*             |                  |
| **Naam**               | 1                       | Algemeen metagegeven.*Deze is, indien mogelijk, analoog aan de naamgeving in het externe schema waar de view over gaat, eventueel met een prefix.* | *name van de metaclass Named element* |  | *Name*                     |                  |
| **Alias**              | 0..1                    | Algemeen metagegeven.                                                                                                                                | *UML-Property*                        |  | *Alias*                    |                  |
| **Herkomst**           | 1                       | Algemeen metagegeven.                                                                                                                                |                                         |  | *tagged value*             |                  |
| **Definitie**          | 1                       | Algemeen metagegeven.                                                                                                                                | *Body van de metaclass Comment*       |  | *Notes*                    |                  |
| **Herkomst definitie** | 1                       | Algemeen metagegeven.                                                                                                                                |                                         |  | *Tagged value*             |                  |
| **Toelichting**        | 0..1                    | Algemeen metagegeven.                                                                                                                                |                                         |  | *tagged value*             |                  |
| **Datum opname**       | 1                       | Algemeen metagegeven.                                                                                                                                |                                         |  | *tagged value*             |                  |
| **Locatie**            | 1                       | Algemeen metagegeven.                                                                                                                                |                                         |  | *Tagged value*             |                  |
| **Basis-URI**          | 0..1                    | Algemeen metagegeven.*Het niet-unieke deel van de URI van ieder modelelement in deze package*                                                      |                                         |  | *Tagged value*             |                  |
| heeft**Constraint**    | 0..*                    | Binding aan een constraint.                                                                                                                          |                                         |  | *Constraint*               |                  |
| bevat**Modelelement**  | 0..*                    | *Binding van modelelementen die zich in package bevinden.*                                                                                         | *packagedElement*                     |  | *Browser packagestructuur* |                  |

### Overige modelelementen in UML

#### «Constraint»

`<a>`Constraint`</a>` betreft de metaclass UML Constraint en wordt naar de volgende
aspecten gespecificeerd:

| **Aspect**                                   | **Kardinaliteit** | **Toelichting**                                                      | **In UML 2.5**                    |  | **In EA**              | **In ...** |
| -------------------------------------------------- | ----------------------- | -------------------------------------------------------------------------- | --------------------------------------- | - | ---------------------------- | ---------------- |
| **Naam√**                                   | 1                       | Algemeen metagegeven.                                                      | *name van de metaclass Named element* |  | *Name*                     |                  |
| **Specificatie tekst**                       | 0..1                    | De specificatie van de Constraint in normale tekst.                        |                                         |  | *Notes (type = invariant)* |                  |
| **Specificatie formeel**                     | 0..1                    | De beschrijving van de Constraint in een formele specificatietaal, in OCL. |                                         |  | *Notes (type =OCL)*        |                  |
| **Datum opname**                             | 1                       | Algemeen metagegeven.                                                      |                                         |  | *tagged value*             |                  |
| van toepassing op**Objecttype**              | 0..1                    | Binding aan een Objecttype                                                 |                                         |  |                              |                  |
| van toepassing op**Attribuutsoort**          | 0..1                    | Binding aan een Attribuutsoort                                             |                                         |  |                              |                  |
| van toepassing op**Gegevensgroep**           | 0..1                    | Binding aan een Gegevensgroep                                              |                                         |  |                              |                  |
| van toepassing op**Gegevensgroeptype**       | 0..1                    | Binding aan een Gegevensgroeptype                                          |                                         |  |                              |                  |
| van toepassing op**Relatiesoort**            | 0..1                    | Binding aan een Relatiesoort                                               |                                         |  |                              |                  |
| van toepassing op**Relatierol**              | 0..1                    | Binding aan een Relatierol                                                 |                                         |  |                              |                  |
| van toepassing op**Generalisatie**           | 0..1                    | Binding aan een Generalisatie                                              |                                         |  |                              |                  |
| van toepassing op**Relatieklasse**           | 0..1                    | Binding aan een Relatieklasse                                              |                                         |  |                              |                  |
| van toepassing op**Externe koppeling**       | 0..1                    | Binding aan een Externe koppeling                                          |                                         |  |                              |                  |
| van toepassing op**Codelijst**               | 0..1                    | Binding aan een Codelijst                                                  |                                         |  |                              |                  |
| van toepassing op**Enumeratie**              | 0..1                    | Binding aan een Enumeratie                                                 |                                         |  |                              |                  |
| van toepassing op**Enumeratiewaarde**        | 0..1                    | Binding aan een Enumeratiewaarde                                           |                                         |  |                              |                  |
| van toepassing op**Referentielijst**         | 0..1                    | Binding aan een Referentielijst                                            |                                         |  |                              |                  |
| van toepassing op**Referentie-element**      | 0..1                    | Binding aan een Referentie-element                                         |                                         |  |                              |                  |
| van toepassing op**Primitief datatype**      | 0..1                    | Binding aan een Primitief datatype                                         |                                         |  |                              |                  |
| van toepassing op**Gestructureerd datatype** | 0..1                    | Binding aan een Gestructureerd datatype                                    |                                         |  |                              |                  |
| van toepassing op**Data-element**            | 0..1                    | Binding aan een Data-element                                               |                                         |  |                              |                  |
| van toepassing op**Keuze**                   | 0..1                    | Binding aan een Keuze                                                      |                                         |  |                              |                  |
| van toepassing op**Domein**                  | 0..1                    | Binding aan een Domein                                                     |                                         |  |                              |                  |
| van toepassing op**Extern**                  | 0..1                    | Binding aan een Extern                                                     |                                         |  |                              |                  |
| van toepassing op**Informatiemodel**         | 0..1                    | Binding aan een Informatiemodel                                            |                                         |  |                              |                  |
| van toepassing op**View**                    | 0..1                    | Binding aan een View                                                       |                                         |  |                              |                  |

## UML Tooling

### MIM-toolbox

Er is door de MIM-beheerder een metamodel *profiel* gemaakt in Sparx Enterprise Architect, dat gebruikt kan worden bij het modelleren van een informatiemodel. Dit profiel kan je inladen en daarna kan je kiezen uit de metamodelelementen. Het profiel is faciliterend en zorgt dat (de meeste) modelelementen van het informatiemodel automatisch voldoen aan dit metamodel. Dit profiel is te vinden op [MIM profiel - toolbox voor EA](https://register.geostandaarden.nl/informatiemodel/mim/).

### Extensie op MIM-toolbox

Het is niet vereist om dit profiel te gebruiken. Bovendien is het ook mogelijk om het profiel uit te breiden, naar de behoefte van de eigen organisatie. Maar, het is niet toegestaan om het profiel te wijzigen; dan wordt niet meer aan MIM voldaan. De reden hiervoor is dat een dergelijk aanpassing niet beheerd kan worden door de MIM-beheerder en er ambiguïteit zal ontstaan bij de interpretatie van het model. Voor andere UML tools kan ook een MIM-profiel gemaakt worden.

### Imvertor

Er is een tool [Imvertor](https://armatiek.nl/imvertor.html), waarmee je onder andere kunt controleren of een informatiemodel voldoet aan het MIM en zo niet, wat de reden daarvan is. Deze tool is open source.
