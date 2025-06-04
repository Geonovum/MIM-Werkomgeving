# Metamodel Overview
This chapter describes the model elements of MIM used to create an information model. The first section contains several diagrams that provide an overview of the model elements recognized at the metamodel level and their interrelationships. This section offers a general description of all model elements, meaning: independent of any modeling language. If you prefer to read the descriptions first, you can also start with the section on object types and attribute types. The final section contains the metadata that is maintained about the model elements in an information model.

To illustrate the relationship between a metamodel and an information model: in the Basic Registration of Cadastre (BRK), a Parcel is modeled as a <code>«<a>ObjectType</a>»</code>. The boundary of a parcel is modeled as a <code>«<a>AttributeType</a>»</code>. «ObjectType» and «AttributeType» are the model elements from MIM. Parcel and boundary are the specific representations within the information model—in this case, the BRK. By labeling Parcel as an «ObjectType» and boundary as an «AttributeType», their intended interpretation is clarified.

## Principles of the Metamodel

The information modeling metamodel is based on a number of foundational principles that guide its creation and usage:

Each model element has a name and its own MIM metaclass, by which it can be identified everywhere.

The model elements are first explained without using a specific modeling language. This allows us to later specify how each model element is expressed in a specific modeling language, namely UML or W3C specification techniques.

A tool-independent description of the metamodel is provided. However, since VNG Realisatie, Kadaster, Geonovum, and many other organizations use Sparx Enterprise Architect, additional guidance is included on how the metamodel is applied in Enterprise Architect. This ensures alignment.

Uniform application of the metamodel in information models is essential. In other words: extensions are allowed, deviations are not. Do not create alternative constructions for the same purpose.

Data types are part of the metamodel and describe the structure of data, but not the semantics or meaning. It is recommended to first create an information model without data types. The rule is that if all data types are removed from the model, no semantic meaning should be lost.

<!-- ### Explanation of MIM Metaclass All model elements are a metaclass in the metamodel. This indicates that it is not a class within an information model (such as the class `Parcel`), but rather a classification—such as the class `Person` being of the metaclass `«ObjectType»`. Hence the term _metaclass_. Additionally, the MIM metaclasses relate to the metaclasses of UML and W3C. The metaclasses are also used to indicate how they relate to the UML and W3C metaclasses, in the following chapters. When creating an information model, you essentially model using the model elements and indicate that a Person is an ObjectType and a date of birth is an AttributeType. -->
Next, diagrams are presented that provide an overview of the model elements. In the following sections, each of these model elements is described with a definition, explanation, and example. Finally, there is a section on metadata that is or can be maintained for a model element.

## Metamodel Structure
This section provides an overview of MIM and lists all the model elements. The descriptions of the model elements follow in the next section. The model elements are organized across several diagrams, each showing a specific view of part of the metamodel. Each view displays a selection of model elements, including their interrelationships. All views together form the complete metamodel:

- Core: key model elements and their interrelationships.

- Data Types: the types of data types recognized in the model.

- Other Model Elements: elements that are not always relevant.

Each model element is labeled with a «MIM metaclass» and a name. This allows each model element to be recognized in all diagrams, in the text, and in any modeling language that expresses this metamodel. These diagrams do not include descriptive properties (such as metadata like name, definition, etc.). These can be found in appendix [[[#diagrammen]]].

### Model Element
The class Model Element is the superclass of all metaclasses in the MIM metamodel.

<aside class="definition"> <dfn>Model Element</dfn> Any element within a model that has a distinct identity, including the model itself. </aside>

*Explanation* :

    The identity of a model element is determined by its identifier. Model Element has a general definition that applies at both the metamodel and model levels. In a metamodel, a model element describes a class of model elements—a metaclass. All metaclasses in MIM are model elements, such as «MIM metaclass»: <a>Object Type</a>, «MIM metaclass»: <a>Attribute Type</a>, and «MIM metaclass»: <a>Generalization</a>.
The metadata of the metaclasses is not considered a model element.

### Core
The core of the metamodel consists of the following model elements. The diagram shows how they are interrelated. A detailed description of each element is provided in the section Model Elements.

«MIM metaclass»: <a>Object Type</a>

«MIM metaclass»: <a>Attribute Type</a>

«MIM metaclass»: <a>Data Group</a>

«MIM metaclass»: <a>Data Group Type</a>

«MIM metaclass»: <a>Generalization</a>

«MIM metaclass»: <a>Relationship Type</a>

«MIM metaclass»: <a>Relationship Class</a>

«MIM metaclass»: <a>Relationship Role</a>

«MIM metaclass»: <a>Target Role</a>

«MIM metaclass»: <a>Datatype</a>

<figure id="KernZonderUML"> <img src="media/KernZonderUML.png" alt="" /> <figcaption>Diagram: Core without UML and metadata</figcaption> </figure>
In the diagram, the connections between the model elements indicate which combinations are possible at the metamodel level—in other words, which model elements can be combined within an information model. For example:

An <code><a>Object Type</a></code> can be connected to an <code><a>Attribute Type</a></code>. This means that in an information model, attribute types can be assigned to an Object Type. An Attribute Type can then have a <code><a>Datatype</a></code> as its type.

An Object Type can be connected to a <code><a>Relationship Type</a></code>, which in turn can be connected to another Object Type. This indicates that the Relationship Type is a model element that links two object types. An Object Type, therefore, cannot be connected directly to another Object Type.

An Object Type can be connected to a <code><a>Data Group</a></code>, and this Data Group can be connected to a <code><a>Data Group Type</a></code>. So, an Object Type cannot be directly connected to a Data Group Type. In an information model, a Data Group is a property of the Object Type, and you can specify that this Data Group has a Data Group Type as its type.

### Datatypes
MIM supports several ways to assign a datatype to a model element. The overview below shows which types are available, including the components that some types consist of.

«MIM metaclass»: <code><a>Primitive Datatype</a></code>

«MIM metaclass»: <code><a>Structured Datatype</a></code>

«MIM metaclass»: <code><a>Data Element</a></code>

«MIM metaclass»: <code><a>Enumeration</a></code>

«MIM metaclass»: <code><a>Enumeration Value</a></code>

«MIM metaclass»: <code><a>Reference List</a></code>

«MIM metaclass»: <code><a>Reference Element</a></code>

«MIM metaclass»: <code><a>Code List</a></code>

The diagram illustrates their interrelationships and structure. It shows, for example, that a Structured Datatype is composed of two or more Data Elements, an Enumeration consists of Enumeration Values, and a Reference List is made up of Reference Elements. These types are explained in more detail in the sections Datatypes and Value Lists.

<figure id="DatatypenZonderUML"> <img src="media/DatatypenZonderUML.png" alt="" /> <figcaption>Diagram: Datatypes without UML and metadata</figcaption> </figure>

### Other Model Elements

In addition to the core elements and datatypes, MIM also defines a number of other model elements. These elements fall into several categories, the function and structure of which are further explained in the following sections.

«MIM metaclass»: <code><a>Constraint</a></code>

«MIM metaclass»: <code><a>Choice</a></code>

«MIM metaclass»: <code><a>Relationship Role</a></code>

«MIM metaclass»: <code><a>Source Role</a></code>

«MIM metaclass»: <code><a>Target Role</a></code>

«MIM metaclass»: <code><a>External Link</a></code>

«MIM metaclass»: <code><a>Information Model</a></code>

«MIM metaclass»: <code><a>Domain</a></code>

«MIM metaclass»: <code><a>External</a></code>

«MIM metaclass»: <code><a>View</a></code>

#### Constraint and Choice
The Choice and the Constraint are different ways to impose a condition or limitation on a model element. Both approaches have their pros and cons. More information can be found in the sections constraint and choice. The following paragraphs explain how each is applied.

Constraint in brief

A Constraint imposes conditions or limitations on a model element. More information can be found in the section on <code><a>Constraint</a></code>. The diagram shows that a Constraint can be applied to all model elements.

<figure id="ConstraintsZonderUML"> <img src="media/ConstraintsZonderUML.png" alt="" /> <figcaption>Diagram: Constraint without UML and metadata</figcaption> </figure>
Choice in brief

The model element Choice defines that there are multiple options, of which one must be selected. There are five possible scenarios where a choice is applied. Each scenario has its own metamodel.

a choice between data types (diagram)

a choice between two or more attribute types (diagram)

a choice between multiple ways to fill in a meaningful attribute type (diagram)

a choice between relationship targets, as a further specification of one meaningful relationship type (diagram)

a choice between two or more relationship types/roles (each with its own meaning) (diagram)

For each case, a separate «MIM metaclass» is available in the metamodel.

«MIM metaclass»: <code>Datatype(choice)</code>

«MIM metaclass»: <code>Choice(attribute)</code>

«MIM metaclass»: <code>Choice(attribute)</code>

«MIM metaclass»: <code>Choice(relationship)</code>

«MIM metaclass»: <code>Choice(relationship)</code>

<aside class="example" title="Choice between data types"> <p> This diagram is worked out for <code>ObjectType</code>. The same pattern applies to <code>DataGroupType</code> and <code>RelationshipClass</code>. An <code>AttributeType</code> normally has one <code>Datatype</code>. If a <code>Choice</code> applies, then the <code>AttributeType</code> is linked to a <code>Choice</code>, which specifies two or more <code>Datatypes</code>. </p> <figure id="KeuzeDatatype1"> <img src="media/KeuzeDatatype1.png" alt="" /> <figcaption>Diagram: Choice between data types</figcaption> </figure> </aside>
For the use case, see: (use case 1: datatype choice).

<aside class="example" title="Choice between multiple ways to fill one meaningful attribute type"> <p> This diagram is worked out for <code>ObjectType</code>. The same pattern applies to <code>DataGroupType</code> and <code>RelationshipClass</code>. An <code>ObjectType</code> or <code>DataGroup</code> normally has an <code>AttributeType</code> with a <code>Datatype</code> (line on the left). If an <code>AttributeType</code> can be filled in multiple ways with a <code>Choice</code> between them, then the <code>AttributeType</code> is not directly linked to a <code>Datatype</code>, but instead to a <code>Choice</code> which specifies two or more <code>AttributeTypes</code>, each with its own <code>Datatype</code>. </p> <figure id="KeuzeAttribuutsoort3"> <img src="media/KeuzeAttribuutsoort3.png" alt="" /> <figcaption>Diagram: Choice between attribute types within an attribute type</figcaption> </figure> </aside>
For the use case, see: (use case 3: attribute choice 2).

<aside class="example" title="Choice between relationship targets with one meaningful relationship type"> <p> As a further specification of a meaningful <code>RelationshipType</code>. This diagram is worked out for <code>ObjectType</code>. The same pattern applies to <code>DataGroupType</code>, except that a <code>DataGroupType</code> may not be the target of a <code>RelationshipType</code>. An <code>ObjectType</code> or <code>DataGroup</code> normally has a <code>RelationshipType</code> connected to a specific <code>ObjectType</code>. When a <code>Choice</code> is applied to the relationship target, the <code>RelationshipType</code> is not linked to just one <code>ObjectType</code>, but to a <code>Choice</code> which in turn specifies two or more relationship targets. </p> <figure id="KeuzeRelatiedoel4"> <img src="media/KeuzeRelatiedoel4.png" alt="" /> <figcaption>Diagram: Choice between relationship targets</figcaption> </figure> <p> Explanation: A source object type or data group type normally has a relationship type/role linked to (referring to) a target object type. When there is a relationship type/role with a target choice, the relationship type is not linked to one object type, but to a choice, which in turn links to two or more target object types. Each object type is a separate relationship target. One of these must be selected. The meaning of the relationship remains the same, regardless of which object type is selected. </p> </aside>
For the use case, see: (use case 4: relationship target choice).

<aside class="example" title="Choice between two or more relationship types/roles (each individually meaningful)"> <p> Analogous to the choice between attribute types 2, but for relationship types/roles. The object type has two or more relationship types/roles, each with its own meaning, of which exactly one must be selected. </p> <p> The source object has multiple possible relationships, but only one may apply. The source object type has two or more relationship types/roles, each with its own meaning, and each is linked to (refers to) its own target object type. </p> <p> This diagram is worked out for <code>ObjectType</code>. The same pattern applies to <code>DataGroupType</code> (two or more relationship types from a data group type to an object type). </p> <figure id="KeuzeRelatiedoel5"> <img src="media/KeuzeRelatiedoel5.png" alt="" /> <figcaption>Diagram: Choice between relationship types</figcaption> </figure> <p><strong>Explanation:</strong> A source object type or data group type normally has a relationship type/role that is linked to (refers to) a target object type. When a relationship type/role choice is involved, the object type has one link—a 'choice as relationship'—to a `Choice`. This 'choice as relationship' has no inherent meaning. The 'choice between relationships' has two or more relationship types/roles to target object types. One of these relationship types/roles must be selected, thereby also selecting the related target object type.</p> <p>Notes: <ul> <li>Each relationship type or role must have its own name.</li> <li>A data group type may not be a target itself.</li> </ul> </p> </aside>
For the use case, see: (use case 5: meaningful relationship target).

#### Relationship Type and Relationship Role
Explanation of the structure and coherence of relationship role, source, and target.

MIM metaclass: <code><a>RelationshipRole</a></code> (abstract)

MIM metaclass: <code><a>RelationshipRoleSource</a></code>

MIM metaclass: <code><a>RelationshipRoleTarget</a></code>

In diagram form:

<figure id="AssociatierollenZonderUml"> <img src="media/AssociatierollenZonderUml.png" alt="" /> <figcaption>Diagram: Relationship roles without UML and metadata</figcaption> </figure>
External Link
The external link consists of the following model elements:

MIM metaclass: <code><a>ExternalLink</a></code>

See: [[[#KernZonderUML]]]

#### Grouping
Grouping consists of the following model elements:

MIM metaclass: <code><a>Package</a></code>

MIM metaclass: <code><a>ModelElement</a></code>

MIM metaclass: <code><a>InformationModel</a></code>

MIM metaclass: <code><a>Domain</a></code>

MIM metaclass: <code><a>External</a></code>

MIM metaclass: <code><a>View</a></code>

The meaning of these model elements and their descriptions can be found in Packages.

In diagram form:

<figure id="PackageZonderUml"> <img src="media/PackageZonderUml.png" alt="" /> <figcaption>Diagram: Packages without UML</figcaption> </figure>

## Model Elements
This paragraph specifies all model elements occurring in the MIM metamodel. For each model element, a definition and explanation are provided. Before defining all model elements, we first describe what objects and data are, and how they relate to model elements.

### Objects and Data
An important model element in MIM is the object type. An object type is a group of similar objects. For example, Jan and Katrien are both objects that are similar and can both be typed as Person. They are both persons, meaning their object type is Person. In the information model, we represent Person by using the model element ObjectType.

To clarify this, we first look at the concepts of ‘object’ and ‘data’.

#### Object
<aside class="definition"> <dfn data-lt="objects">Object</dfn>An object is a distinguishable thing within the considered domain. </aside> <aside class="note" title="Object vs. Object Type"> An <strong>object is not a model element</strong> in an information model. An object type <em>is</em> a model element in an information model. </aside>

*Explanation* :

    The ‘considered domain’ refers to topics (things, entities) under discussion within a discipline or domain. An object is not always physical; it can also be digital, virtual, or conceptual things such as cadastral parcels, (social) activities, and processes.

How a ‘distinguishable thing’ is regarded as an object depends on the domain for which it is relevant. For example, the built environment might be regarded as a collection of buildings in one domain, while in another domain it distinguishes between individual buildings (panden). An object is relevant to a domain if its properties (characteristics) are important for the functioning of that domain.

An object is also called an instance or exemplar of an object type (many similar exemplars together are typed by an object type).

#### Data
An object has properties (also called characteristics) about which data are known.

<aside class="definition"> <dfn>Data</dfn>Data is a recorded observation or assertion about a typed property of an object. </aside> <aside class="note" title="Data"> Data is <strong>not a model element</strong> in an information model. </aside>

*Explanation* :

 Examples of data: the name of a person is 'Jan', the birthdate of Jan is ‘1-1-1970’.

Properties of an object can be observed or asserted and then recorded as data. The value alone, like '1-1-1970', is not very useful without knowing that it is the birthdate property of a specific person (the subject). The value '1-1-1970' is recorded as the birthdate of that particular person. It is therefore important which property of which specific person is concerned. Also, the meaning of the data must be clear.

Observation: an observation made about a property of an object. For example: a sensor detects that the car with license plate 'AA 1234' is driving at 120 km/h; a photo shows a bridge at a certain location on Earth; or a sound measurement records 50 decibels.

Assertion: a statement, generally intended as true but not necessarily so. For example, “My birthdate is 1-1-1970”, “The value of this house is 200,000 euros (in 2018)”. Often, who makes the assertion is relevant — e.g., a governmental authority making a decision, or a person providing data for a specific purpose. An assertion can be about something observed in reality (e.g., birthdate declaration of a baby), but it need not be (e.g., when a building permit is granted).

Recorded: data can exist once observed or asserted, but must be recorded to be usable in information provision. The recording can be on paper, digital form, a photo, a message, a database, etc.

Typed: a model does not specify the data itself. Data like '1-1-1970' is a value for an attribute of Jan. In the information model, this is called the attribute kind ‘birthdate’ or attribute type ‘date of death’ of an object type Person. That two objects have a relationship, modeled as a relationship type, is also seen as a property that can have data. The model elements to represent a typed property of an object include: attribute kind, relationship type, and external link. Data about these can be known. The datatype is important for the value, and the object type clarifies which object is concerned.

Value: the value ‘1-1-1970’ is part of the data. To ensure the data has an allowed value, it must comply with the datatype and additional rules like formal patterns or belonging to a value list. Values can be:

Simple, such as the first name ‘Jan’ or a natural person with ID ‘123’;

Structured internally, such as a geometry consisting of multiple coordinates, coordinate reference system, etc. The components (data elements) together form the value (the data elements themselves are not data but parts of it).

By recording data in information provision, a model of reality is frozen in time. Although reality never stands still, recording data can freeze it. Metadata can also be recorded with data, to track history, like validity timelines and registration timelines. This way, users know when data was or is valid, and when it was recorded on a medium. Regarding structured datatypes, it is usually not meaningful to keep history for parts of data (data elements) separately, since a part does not represent the entire value.


### Object Types and Attribute Types
#### Object Type
<aside class="definition"> <dfn>Object Type</dfn> The classification of a group of objects that are relevant within a domain and considered to be of the same kind. </aside>

*Explanation* :

Jan, Piet, and Marie are people who, from the perspective of the Civil Affairs domain, are regarded as <a>objects</a> of the «Object Type» NaturalPerson. In another domain, ‘everyday language,’ this is called Human, which is also an «Object Type». In yet another domain, Jan belongs to the «Object Type» PermitHolder, whereas Piet and Marie do not, because they have (so far) never been granted a permit.

Object types are an abstraction of reality; the goal is to describe reality as faithfully as possible within the context of the domain. This is entirely separate from recording data about objects of a type in a registry. This often requires an interpretation of that reality (and those object types) into units that can be recorded in a registry (such as records, entities, etc.) based on other considerations.

The objects recognized within the considered domain are never abstract. They always belong to a concrete «Object Type», and not to an abstract «Object Type». An abstract «Object Type» is used in modeling to indicate generalization and to define concepts. For example, the «Object Type» Building may be specified as an 'Element in the physical living environment', which itself is considered an abstract «Object Type» within our domain. More about abstract object types is described in Abstract Object Types and Concrete Objects.

#### Attribute Type
An «Attribute Type» is the metaclass used to define characteristics of an «Object Type». These are the features for which data is maintained.

<aside class="definition"> <dfn data-lt="attribute">Attribute Type</dfn> The classification of similar kinds of data that apply to an object type. </aside>

*Explanation* :

The data "Jan" and "Katrien" are considered similar and are therefore grouped under the «Attribute Type» name. You could also say that the «Object Type» Person has an attribute type name, which is suitable for holding data.

Each «Object Type» can have zero, one, or more attribute types assigned. In an information model, only the attribute types relevant for the domain are included for an object type.

Attribute types are also called characteristics or properties. While this is true, other modeling elements also fall under these terms. For example, a «Relationship Type» is also a characteristic or property.

#### Data Group
<aside class="definition"> <dfn>Data Group</dfn> A classification of a group of similar data that applies to an object type. </aside>

*Explanation* :

This modeling element manages the linkage of a <code>«<a>Data Group Type</a>»</code> to the <code>«<a>Object Type</a>»</code> to which a «Data Group Type» inherently belongs.

The group of data is a characteristic of an object. The «Data Group» is a meaningful feature of an «Object Type». The «Data Group» always has a type which is a «Data Group Type».

#### Data Group Type
<aside class="definition"> <dfn>Data Group Type</dfn> A group of related attribute types. A data group type is always the type of a data group. </aside>

*Explanation* :

An «Attribute Type» belonging to a «Data Group Type» is semantically a property of an «Object Type». However, due to their cohesive behavior (they semantically belong together, they often change simultaneously, etc.), these are grouped into a separate modeling element.

Grouping attribute types in a data group type is a modeling choice; it is not strictly necessary. When attribute types are grouped in a data group type, they remain individual characteristics of the object and thus attribute types of the object type, but organized within a data group type.

The data group as a whole is explicitly not considered to be a single attribute type of the object.

Example:
In the Land Registry (BRK), a ship has an engine, and the engine has several properties. The BRK considers a person as the owner of a ship; there can be no separate owners of the ship’s engines. An engine is therefore seen as a property of the ship object. Because the engine has multiple properties, these are grouped in a data group type.

In another information model, such as that of an engine manufacturer, the engine could be an object type because it is the main subject of discussion.

A data group type is usually the type of only one data group, since the semantics are mostly exclusive to one object type. However, reuse is possible if the definition (including description and metadata) is identical for all object types using the data group type.

A data group type can contain attribute types, relationship types, and also other data group types.

A data group type is connected to an object type through the modeling element Data Group.

### Relationships
Connections with meaning, established between model elements of the type object type to object type, or from a data group type to an object type.

Diagram: Core

There are different types of relationships, each described by specific MIM model elements.

#### Generalization
<aside class="definition"> <dfn>Generalization</dfn> The classification of the hierarchical relationship between a more generic and a more specific model element of the same kind, whereby the more specific model element inherits properties from the more generic model element. This relationship is only defined for object types and data types. </aside>

*Explanation* :

Generalization between object types:
A generalization relationship indicates that certain properties of one object type (often attribute types and/or relationship types) also apply to the related object types, and that these properties are semantically, structurally, and syntactically identical. This involves a supertype with subtypes. The generic elements are modeled in a generic object type, the supertype, and these are inherited by each subtype that establishes a «Generalization» towards this generic «Object Type».

#### Generalization between data types:
The more specific data type represents a specialization in the form of a more restrictive definition or a more restrictive pattern/formal pattern. The other data type might be, for example, a CharacterString, Integer, GM_Surface, or DMO, and serves as a base for a user-defined data type (see Defining your own data type), such as a CharacterString PostalCode, or a NonNegativeNumber. This type of generalization applies to the following data types: «Primitive data type», «Structured data type», «Reference list», «Code list», and «Enumeration».

Multiple inheritance:
A subtype can have multiple object types as generalizations. In the Core diagram, this is indicated by an «Object Type» subtype referring to 0..* «Generalizations», implying that a subtype can have zero or more supertypes.

#### Relationship Type
<aside class="definition"> <dfn>Relationship Type</dfn> The classification of the structural connection between an object of one object type and an (other) object of another (or the same) object type. </aside>

*Explanation* :



Objects have properties that can be modeled with attribute types but also with relationship types to other object types. The relationship type is the metaclass used to describe these properties. If it is important in the domain to model that property as part of another object type, the relationship type makes that property available to the first-mentioned object type.

For example, an attribute type of the object type PERSON might be ‘Name of registered partner’ (besides the attribute type ‘Name’ of PERSON). However, the name of the registered partner is also available via a relationship type from PERSON to PERSON: “has registered partnership with”. See also the previously mentioned example of SHIP and ENGINE.

When a relationship is used to link objects without recording properties about the relationship itself, this concerns the MIM metaclass «Relationship Type».

#### Relationship Class
<aside class="definition"> <dfn>Relationship Class</dfn> A relationship type with properties. </aside>

*Explanation* :



A relationship class indicates that there is a relationship between two objects, for which data about the relationship must be recorded. In this case, the relationship is treated as an object with data.

The data about the relationship exist only as long as the relationship between the two objects exists and as long as both objects themselves still exist.

Note:
The data of the relationship are recorded for one specific relationship, not for multiple relationships simultaneously. If the latter is the case, the data are recorded in an «Object Type». For example, a CONTRACT can also be an agreement between two or more SUBJECTs, where the data of the relationship are the same for all involved objects. CONTRACT is then modeled as an object type, describing what should happen if one of the SUBJECTs no longer exists.

#### External Link
<aside class="definition"> <dfn>External Link</dfn> An association by which, from the perspective of the own information model, an object type of the ‘own’ information model is linked to an object type of an external information model. The relationship itself belongs to the ‘own’ object type. </aside>

*Explanation* :



This indicates that there is a relationship to an information model from another domain. This can be direct, but it is also possible to adopt the object type from another domain into your own domain and specialize it for how you view this information from your own domain (this latter approach is also called a View).

See Linking with another information model.

#### Relationship Role
<aside class="definition"> <dfn>Relationship Role</dfn> The name describing how an object participates in a relationship with another object. </aside>

*Explanation* :



The term “relationship” here means «Relationship Type», «Relationship Class», or «External Link». It does not apply to «Generalization».

A relationship has a source end, which owns the relationship, and is directed toward the target end. The relationship role can have a Name and a Definition on both ends.

<aside class="definition"> <dfn>Source Relationship Role</dfn> The role describing the source side of the relationship. </aside> <aside class="definition"> <dfn>Target Relationship Role</dfn> The role describing the target side of the relationship. </aside>

### Value Lists
A data type whose possible values are enumerated in a list. The value of an attribute type must be one of the values from the specified value list.

There are several model elements, each describing a specific kind of value list and its components.

#### Reference List
<aside class="definition"> <dfn>Reference List</dfn> The representation of a list enumerating the possible domain values of an attribute type, managed outside the model in an external value list. The domain values in the list can be modified, extended, or removed over time without requiring changes to the information model (unlike an enumeration). The representation includes several characteristics derived from the specification of the external value list. </aside>

*Explanation* :

The reference list contains representations of objects that are not subjects within the information model as object types. The reference list is used as the type for an attribute of an object.

For example, the object type COUNTRY in the example is included in a reference list, not as an object type. However, we want to record the structure and meaning of COUNTRY so that we can refer to it. An object included in a reference list often has multiple attributes, such as name, date of origin, a description, and the ISO code, which are included in the reference list.

All attributes of referenced objects from the reference list are valid in the context of the information model, provided they are included in the «Reference List». In registrations, usually only the reference to the object is recorded, since the intention is not to duplicate all data. The data already exist in the reference list, and modeling a reference list is a deliberate choice. Therefore, the attribute of an object type that uses a reference list as its type usually contains only a reference to an object from the list.

#### Reference Element
<aside class="definition"> <dfn>Reference Element</dfn> A property of an object in a reference list, expressed as a data item. </aside>
*Explanation* :



A reference element can be unique, such as a code, and is then suitable on its own to be used as a reference (as intended in the definition of Reference List). A definition and explanation can be added to the reference element, describing how the external value list is used within the local information model.

#### Enumeration
<aside class="definition"> <dfn>Enumeration</dfn> A data type whose possible values are exhaustively listed in a static list. </aside>

*Explanation*:

In the registration, an attribute must take one of these values. The list is a static list of constants (unlike a reference list, multiple attributes are never involved).

#### Enumeration Value
<aside class="definition"> <dfn>Enumeration Value</dfn> A defined value in the form of a single, fixed constant. </aside>
*Explanation* :



The data value itself. For example: Square, Bridge, Track, M (male).
Only this value may be used.

#### Code List
<aside class="definition"> <dfn>Code List</dfn> The representation of a list enumerating the possible domain values of an attribute type, managed outside the model in an external value list. The domain values can be modified, extended, or removed over time without requiring changes to the information model. Unlike a reference list, the representation does not contain metadata describing the structure. </aside>
*Explanation* :



Both reference lists and code lists are essentially value lists. However, unlike reference lists, the structure of a code list is not described in the information model, because it does not need to be further specified in the information model.

The externally published value list represented by the Code List contains one or more attributes, always including one specific attribute holding the domain values that may or must be used in the information model. Which specific attribute this is can be found in the metadata item called "Value." In practice, a Code List is therefore analogous to an Enumeration.

If it is important to define the structure of a Code List in the model, a <code>«<a>Reference List</a>»</code> should be used instead.

### Data Types
Data Type
<aside class="definition"> <dfn>Data Type</dfn> A description of the structure that a value, i.e., the data itself, must conform to. </aside>
Explanation: See also Object Types and Attribute Types.
Each «Attribute Type» specifies the data type to which the data or value must conform. The data type is used as the type of an attribute type. Data types are often reusable in many places and can therefore be specified for various attribute types.

Diagram: Data Types

#### Primitive Data Type
<aside class="definition"> <dfn>Primitive Data Type</dfn> A data type with a simple basic structure, i.e., singular and without layering. </aside>
*Explanation* :



A primitive data type has no further structural specification. It is simple and non-composite, sometimes called a simple data type. It does not have its own model elements like a «Data Element». There is also no layering or nesting. A primitive data type may have a pattern or formal pattern that imposes further restrictions.

A primitive data type can be a standard data type such as CharacterString, Integer, etc. The metamodel follows the definitions as described in ISO standards (see §3.1).

These data types already have a name and definition from these standards, which are used as is.

These data types do not have a MIM metaclass.

A primitive data type can also be self-defined within the information model, such as a primitive data type AN: an alphanumeric CharacterString conforming to the MES-1 specification (i.e., without special characters such as emojis and without special characters from non-European languages).

This is a self-defined variant based on one of the previous standard data types, such as CharacterString. This standard data type must be clearly indicated (see generalization for data types or by specifying the default in an extension, e.g., CharacterString).

The corresponding MIM metaclass must be specified: primitive data type.

An information model defines its own data types if there is a need for a data type to be defined once and used in multiple places within the model, always with exactly the same structure and value range (see also ‘pattern’ in Domain Values or Lists). This data type, with its own name, is then used as the type of an attribute type.

Note: If the data type Postal Code is made available nationwide so it can be referenced in the model, it no longer needs to be included in the local model.

#### Structured Data Type
<aside class="definition"> <dfn>Structured Data Type</dfn> A specifically named data type that describes the structure of a data item, composed of at least two elements that together have meaningful coherence. </aside>
*Explanation* :



The value of the attribute type "sales price" with the structured data type "amount" is expressed as a combination of a sum and currency, such as 35 euros. Introducing one data type Amount, expressed as sum and currency, establishes that sum and currency are inseparably linked.

The properties within the structured data type together are identifying (a structured data type “identifies itself”), as there is by definition only one "1 liter," one "35 euros," and one date "April 6, 2017," each with the same meaning:

A can of oil contains "7 liters", costs "35 euros", and was sold on "April 6, 2017".

Piet donated "1 liter" of blood, received "35 euros" compensation, on "April 6, 2017".

The identifying property does not apply to Jan Jansen, as there are multiple people with that name, and they are different individuals (Jan Jansen is therefore a data group type Name, with first name Jan and last name Jansen, and not a structured data type).

#### Data Element
<aside class="definition"> <dfn>Data Element</dfn> A component/element of a Structured Data Type that has a data type as its type. </aside>
*Explanation* :



A data element is a property of a structured data type and describes the structure of a data item. It is not a property of an object and not the same as an attribute type. The data element, together with other data elements, describes the structure of a data item and itself has a data type. This data type is usually a primitive data type.

#### Packages
<aside class="definition"> <dfn>Package</dfn> A named and bounded collection/grouping of model elements. </aside>
There are different types of package model elements:

- Information Model
- Domain
- External
- View

Within an information model package, only domain or view packages may be included. Both can occur multiple times and their order does not matter. An external package is located outside the information model package.

Within a domain, view, or external package, the following MIM elements may be included:

- Object Type
- Data Group Type
- Data Type (all variants)
- Relationship Class
- Choice

The order is not important.

The different package types are explained below.

#### Information Model

<aside class="definition"> <dfn>Information Model</dfn> The grouping of all model elements that make up the information model. The information model as a whole. </aside>
*Explanation* :



The information model is a package, specifically the root package of the information model, under which all subpackages that describe an information model fall, such as Domain, View, and External.
The information model is further described with metadata, such as the designation of the domain modeled in the information model. It is common to start the name of the information model with "IM," but this is not mandatory.

<aside class='example'> Example: IMKAD or IMBAGLV. Each is a name of an information model. </aside>

#### Domain

An information model can be subdivided into multiple packages indicating that these contain the modeling of the domain information.

<aside class="definition"> <dfn>Domain</dfn> A grouping of model elements describing a semantically coherent part of an information model. </aside>
*Explanation* :



A domain package contains the model elements from which an information model is composed, such as the object type Person, the object type Address Number, and the relationship type residential address.
The information model is the root package and contains several domain packages as subpackages. There are multiple types of packages. To distinguish packages modeling the domain from others, this model element is named Domain. You could also say the information model consists of the following subdomains.

<aside class='example'> Example: Law or Documents. The BRK keeps these domain information in separate packages for clarity and to allow independent changes without impacting other packages. </aside>

#### External

<aside class="definition"> <dfn>External</dfn> A grouping of model elements managed and provided by an external party and used unchanged within an information model. </aside> <aside class='example'> Example: The External package NEN3610 with datatype NEN3610ID. The datatype of attribute type Road Section Identification in RSGB refers to datatype NEN3610ID as included in the External package. </aside>

#### View

<aside class="definition"> <dfn>View</dfn> A grouping of model elements specified in an external information model that provides insight from the perspective of the local information model about which data of these object types are relevant within the local information model. </aside> <aside class='example'> IMKAD-BRP. Some data from the Basic Registration Persons (BRP) are relevant for the Basic Registration Cadastre (KAD). This relevant subset is provided by the IMKAD manager in the view IMKAD-BRP. From a modeling perspective, this is seen as a view. </aside>

### Constraint and Choice

Diagram: Other

#### Constraint
<aside class="definition"> <dfn>Constraint</dfn>A condition or restriction that applies to one or more model elements in the information model. </aside>

*Explanation*: A Constraint is included to express a construct that cannot be represented by existing model elements. The Constraint is added to formally capture this additional information. Usually, a Constraint is recorded at the level of a model element with properties such as an <code><a>Object Type</a></code>, <code><a>Data Group Type</a></code>, or <code><a>Relationship Class</a></code> to define specific conditions on those properties. An example is the 11-check digit on a <code><a>Datatype</a></code> of an <code><a>Attribute Type</a></code>. A Constraint is always described in plain text and can optionally be expressed as a formal specification.

There is an important difference between involving and recording a Constraint: involving determines the model elements to which the Constraint applies, while recording determines the context of the Constraint, i.e., the model element from which the Constraint is valid. For example, a constraint that applies to allowed values of an attribute type can be recorded at the object type that uses that attribute type.

Choice
<aside class="definition"> <dfn>Choice</dfn>An enumeration of multiple model elements, where only one can be present at the same time. </aside>
Explanation: Only one option can be chosen. The Choice serves as an alternative way of modeling a constraint for certain use cases.

A Choice allows listing multiple possibilities, where in a concrete case exactly one of these possibilities is used. This can be applied in various contexts.

A key advantage of using a Choice instead of a constraint is that cardinalities can be kept clean. With a constraint, cardinalities often become optional (e.g., 0..1) for two features, which then have to be made mandatory again by the constraint for exactly one of the options.

This document describes several use cases where modeling with a Choice adds value. Without such a model construct, an explicit constraint would be necessary to indicate the choice.

The use cases involve multiple features between which a choice must be made because exactly one may be present. In MIM, this is a choice between two (or more) model elements. In set theory, this is called an XOR situation. It is especially important that, due to modeling a choice instead of a constraint, no new features are created and no features disappear. The features of the object remain the same.

**Use Case 1: A choice between datatypes**
An object type has an attribute type whose datatype is either datatype D1 or datatype D2. In MIM, we therefore model one attribute type with a datatype that is a choice between datatype D1 and datatype D2. Making this choice is mandatory.

<aside class='example'> Example: Attribute type `geometry` as a feature of an object type `Road`. This is a choice between `Datatype` `GM_Curve` or `Datatype` `GM_Surface`. The enumeration of both options is called the `Choice` `LineOrSurface`. The binding to the attribute type `geometry` is done by indicating that `LineOrSurface` is the type of `geometry`. </aside> <figure id="datatypechoice"> <img src="media/datatypekeuze-1.png" alt="" /> <figcaption>Diagram: Example of a choice between datatypes</figcaption> </figure>
In this example, LineOrSurface forms the entire Choice. The datatypes themselves are the options but remain modeled as metaclass Datatype and are not part of the metaclass Choice.

Without modeling a Choice, you would have one attribute type per datatype but with different names, although they relate to the same feature. The cardinality would also be incorrect: it would be 0..1, which does not reflect that exactly one is required and that two cannot coexist. The actual cardinality is 1..1.

**Use Case 2: A choice between two or more attribute types**
Either attribute type A1 or attribute type A2 applies. In MIM, we model a choice between the two attribute types A1 and A2. Making this choice is mandatory.

<aside class='example'> Example: For an object type `PaymentOrder`, besides the `amount`, either a `payment reference` or a `description` must be included. One of the two must be used; it is not allowed to use both. </aside> <figure id="attributetypechoice_v1"> <img src="media/attribuutkeuze-2.png" alt="" /> <figcaption>Diagram: Example of a choice between attribute types</figcaption> </figure>
We model a Choice PaymentReferenceOrDescription that contains the attribute types payment reference and description.

It is not intended to introduce a third attribute type, such as referenceOrDescription, as an attribute type of the object type. referenceOrDescription exists but is not an attribute type—it is a Choice. Its name is arbitrary because it has no meaning and does not appear in the data implementation. The binding of the Choice PaymentReferenceOrDescription is therefore to the object type, not to an attribute type.

In this example, PaymentReferenceOrDescription and its binding to the object type form the entire Choice. The attribute types themselves are the options but remain modeled as the metaclass attribute type and do not belong to the metaclass Choice.

Without a Choice, both attribute types would be optional fields on the object type, with a constraint that one must be filled. The disadvantage is that the cardinality would not be clearly modeled: it would be [0..1] for both, which does not reflect that one is mandatory and that both cannot coexist. The actual cardinality for the chosen attribute type is [1..1]. Using a constraint, this can be specified and is thus correct, but modeling as a choice is much clearer.

**Use Case 3: A choice between multiple ways to represent one meaningful attribute type of an object type**
There is attribute type A0, and additionally, a choice between attribute type A1 or attribute type A2. In MIM, we model a choice between the two attribute types A1 and A2. Making this choice is mandatory.

<aside class='example'> For an object type `PaymentOrder`, an amount and a `description` must be included. This description is meaningful as a property of the object type. Furthermore, a choice must be made between a description as a payment reference OR a description as a free text description. Both are also considered attribute types. It is not allowed to use both attributes: only a `payment reference` or only a `description`. </aside> <figure id="attributetypechoice_v2"> <img src="media/Attribuutkeuze-metBetekenis-3.png" alt="" /> <figcaption>Diagram: Example of an attribute type linked to a choice between attribute types</figcaption> </figure>
We model a Choice PaymentReferenceOrDescription containing the attribute types payment reference and description. In this use case, it is not intended to lose the attribute type description in the model. The binding of the Choice PaymentReferenceOrDescription is therefore to the attribute type. The binding of the attribute type description is done by indicating that PaymentReferenceOrDescription is the type of description.

In this example, PaymentReferenceOrDescription forms the entire Choice. The attribute types themselves are the options but remain modeled as the metaclass attribute type and do not belong to the metaclass Choice.

*Note: Use cases 2 and 3 are largely similar. The similarity is that the choice between the two attribute types payment reference and description is modeled the same way, as a choice named, for example, PaymentReferenceOrDescription. The difference lies in the binding between the choice and the object type.*

**Use Case 4: A choice between relationship targets, as a further specification of a meaningful relationship type of an object type**
There is a relationship type R0 and additionally a choice between relationship target D1 or relationship target D2. In MIM, we model a choice between the two relationship targets D1 and D2. Making this choice is mandatory.

<aside class='example'> Example: An object type `Vehicle` has an `owner`. This owner can be a `Person` or a `Company`, but not both. There is exactly one owner and a choice between relationship target `person` (to object type `Person`) and relationship target `company` (to object type `Company`). We model one relationship type `owner` and additionally a `Choice` `OwnerChoice` with two relationship targets, one to `Person` and one to `Company`. </aside>
It is not intended to introduce two new relationship types, owner_person and owner_company, nor to lose the relationship type owner. We therefore model one relationship type called owner and a Choice between relationship targets.

<figure id="relationshiptargetchoice"> <img src="media/Relatiedoelkeuze-4.png" alt="" /> <figcaption>Diagram: Example of a choice between relationship targets</figcaption> </figure>
In this example, OwnerChoice and the two relationship targets together form the entire choice. The relationship targets themselves are the options. The modeling of the relationship type owner remains unchanged and is not part of the metaclass Choice.

**Use Case 5: A choice between two or more relationship types/roles (each individually meaningful)**
There is relationship type R1 and relationship type R2. R1 targets an object of type D1 and R2 targets an object of type D2. In MIM, we model a choice with outgoing relationship types R1 and R2. Making this choice is mandatory.

<aside class='example'> Example: An object type `Vehicle` either has an `owner` or is rented from a `rental company`. Both relationship types are specific and important to name. We therefore model one *Choice (relationship)* called `RentalCompanyOrOwner`. This has two outgoing relationship types, each with a specific name and/or target to `Person` and `Organization`. </aside> <figure id="relationshiptargetchoice_withmeaning"> <img src="media/Relatiedoelkeuze-5.png" alt="" /> <figcaption>Diagram: Example of a choice between relationship types, each with distinct meaning</figcaption> </figure>
In the example, Vehicle has the mandatory choice between relationship types/roles has contact person/owner and is rented from/rental company.

### Metadata Specification
In an information model, metadata such as the name of the model element or the date recorded of the model element can be maintained. These are not properties of an object itself and are therefore not modeled as, for example, an attribute type of an object type but as metadata of an object type. In the following sections, the metadata of model elements are described in text. For each metadata item, the definition, explanation, and its application to model elements are given. In appendix [[[ #model-elements-and-metadata-as-diagram ]]] the linkage between metadata and model elements is described using UML diagrams. It also indicates whether they are mandatory or optional. In [[[ #allowed-values-metadata ]]] the value range and default values for several metadata items are provided.

### Information Model – Metadata
We distinguish a number of specific metadata at the level of the information model itself. These are described in this paragraph.

#### Metadata: **Information Domain**
<aside class="definition"> <dfn>Information Domain</dfn>Designation of the functional domain to which the information model belongs. </aside>

*Explanation*
For example: BRK. When certain definitions or identifications in the information model are not unique in the world—because another information model uses the same name for a model element or the same structure for an identifying property—it is possible to make them unique using this designation.

*Application:* Information model (mandatory)

#### Metadata: **Information Model Type**
<aside class="definition"> <dfn>Information Model Type</dfn>Description of the nature of the information model and how it should be interpreted. </aside>

*Explanation*
This can be "Conceptual" or "Logical", as intended in [[[ #typing-of-models-linked-to-view-levels ]]]. A choice must be made. This can be extended, for example, with "Technical" when there is a need to indicate level 4.

*Application*: Information model (mandatory)

#### Metadata: **Relationship Modeling Type**
<aside class="definition"> <dfn>Relationship Modeling Type</dfn>Designation of an alternative modeling approach defined in MIM and the choice made. </aside>

*Explanation*
This can be "Relationship type leading" or "Relationship role leading". This concerns the choice you make for the alternative selected in [[[ #alternatives ]]]. A choice must be made. This choice primarily applies to the model elements <code>«RelationshipType»</code> and <code>«RelationshipRole»</code> as intended in [[[ #relationships-in-uml ]]], but also applies in extension to the model element external linkage.

*Application:* Information model (mandatory)

#### Metadata: **MIM Version**
<aside class="definition"> <dfn>MIM Version</dfn>The version of the MIM specification used to express the information model. </aside>

*Explanation*
Use a MIM version currently in use by MIM. Preferably choose the most recent version possible.

Examples: "1.0.1", "1.1", or "1.1.1"

*Application*: Information model (mandatory)

#### Metadata:**MIM Extension**
<aside class="definition"> <dfn>MIM Extension</dfn>Designation of an extension on MIM. </aside>

*Explanation*
This metadata is optional and only applies if there is an extension as intended in [[[ #a-own-extension-on-the-metamodel ]]]. Use a currently used extension. Examples: "Kadaster" or "NEN3610:2022".

*Application*: Information model (optional)

#### Metadata: **MIM Language**
<aside class="definition"> <dfn>MIM Language</dfn>Designation of the language used for the model elements. </aside>

*Explanation*
For example: "NL" or "EN"

*Application*: Information model (optional)

#### Metadata: **Text Formatting**
<aside class="definition"> <dfn>Text Formatting</dfn>Specification of the formatting of a textual description in the model. </aside>
Explanation

For example: "rtf", "html".

The metadata definition and explanation contain text for which it may be useful to apply formatting. The formatting here concerns enhancing the readability of the text when the modeler of the model considers it useful or necessary. This formatting is explicitly not intended to indicate in what form the model should be published (such as in html, pdf, xml, etc.). According to the MIM philosophy, a model should be free from that consideration and can be published in any of these forms, also in multiple forms simultaneously.

The text may or may not contain some formatting. If formatting is chosen, it applies to all definitions and all explanations. Possibly, formatting is also relevant for other metadata (such as pattern, population, quality, and possibly others), but in this version of MIM formatting is only intended for definition and explanation. You may also apply this formatting to metadata from your own extension (as intended in [[[ #a-own-extension-on-the-metamodel ]]]).

*Application:* Information model (optional)

### Identification – Metadata
Information models often do not stand alone. They may contain elements that refer to external standards, where these elements have their own identification. Also, the modeled elements must be reusable in other models. Therefore, it is necessary to uniquely identify the model elements. When a MIM model is expressed as a Linked Data model, it is even essential to identify the model elements with a [[URI]]. The metadata <a>Base URI</a> and <a>Identification</a> make it possible to identify the model elements in a Linked Data model.

#### Metadata: **Base URI**
<aside class="definition"> <dfn>Base URI</dfn>The standard base URI for each element in this information model. </aside>

*Explanation:*
A Uniform Resource Identifier (URI) is a compact string of characters that identifies an abstract or physical resource. A Base URI is the common part of this string that applies to all elements in the information model. The Base URI always contains a scheme, which can be, for example, http:// or urn. It must comply with the chosen URI strategy. If no base URI is specified, it is inherited from the nearest parent package that has a base URI.

However, an information model must also be usable without established (http) URIs (for example, during the development phase). In this case, a [[URN]] can be constructed based on the package alias and the name of the model element.
If no base URI is specified, it is inherited from the nearest parent package with a base URI. If none is found, a default value is determined according to the pattern urn:modelelement: + {informationmodel.name}: + {package.name}:. The default value for the Base URI of an information model is then urn:modelelement: + informationmodel.name, for example "urn:modelelement:imbaglv".
Each subpackage also receives a default Base URI equal to the base URI of the information model followed by :package.name, for example "urn:modelelement:imbaglv:objects".
This is necessary because not all names within an information model are necessarily unique (consider an object type "Location" in a domain "Location"). The URI of an attribute type "house number" of a "number designation" in the domain "objects" from the IMBAGLV model would then be "urn:modelelement:imbaglv:objects:numberdesignation.housenumber".

*Application*: information model (mandatory), domain, view, external

<aside class="note"> When the default value of the base URI is used, there is no guarantee that a globally unique URI will be created. The default value always results in unique URIs within the information model. </aside>

#### Metadata: **Identification**

<aside class="definition"> <dfn>Identification</dfn>The identification of a model element. </aside>
The Identification can be determined based on the <a>Name</a> of the model element and the Base URI of the package in which the model element is located (at the logical level according to naming conventions). This forms the default value. In most cases, a modeler will not explicitly fill in this metadata but will assume the default value.

In some cases, the Identification of a model element cannot be determined based on the Base URI of the associated package and the Name of a model element. For example, due to the chosen URI strategy or when an <a>Attribute Type</a> from another information model is reused (e.g., nen3610-2022:identification). In such cases, the modeler will fill in the Identification metadata explicitly.

*Application*: all model elements

<!--Ende "Specification metadata informationmodel" -->

### Model Elements – Metadata
We recognize several specific metadata at the level of the model elements that make up an information model. These are described in this section.

For example, there is the Name of the model element, such as the object type with the Name "Building" and an accompanying Definition, or the Date recorded of the model element in the information model, such as 1-1-2012. Which metadata are mandatory per model element and which are not is described in the diagram Metadata per model element. This diagram is part of the specification.

Each model element has its own set of metadata that specify certain aspects of the model element. Metadata can be mandatory or optional. For example, a definition is always mandatory for each model element that describes the meaning of data, such as an attribute type or relationship type, but also for the object type which is the context of these. For most data types, the definition is optional and is only provided if necessary.

Note that some of this metadata is already included in a specification language. For example, the object type named Building is modeled in UML as a Named element with the Name Building (in UML 1.4 this was called a UML-Class with a Name property). Several other metadata, such as the aforementioned Date recorded with value "1-1-2012", are recorded as separate data; in UML this is done with a Tagged value. In Linked Data, this happens with an owl:DatatypeProperty.

Note: the metadata aspects are specific to each model element individually. So if there is a generalization in section H2.2, this metadata is not inherited (and the entered values certainly are not inherited). For example, the MIM metaclass Referentielijst does not inherit metadata such as pattern from the MIM metaclass Datatype.

For clarity, certain metadata are made mandatory to avoid ambiguity about what a missing value means. The meaning should be: 'not applicable', which is the case for optional data. This differs from 'not yet filled in', 'see default value', or 'unknown'.

Below are the general metadata first. These are metadata such as Name, Definition, and Population with a definition and explanation. In the following paragraphs, references will be made to this section. Specific metadata that occur only once are described with the model element itself and are not included in this general list.

#### Metadata: **Name**

<aside class="definition"> <dfn>Name</dfn>The name of a model element. </aside>

*Explanation*:
For example, "Building" is the name of the model element «Object Type», "year of construction" is the name of the model element «Attribute Type». The model elements are exhaustively listed in [[[#metamodel-general]]] (and optionally extra model elements are listed exhaustively in an extension).

*Application*: all model elements.

#### Metadata: **Alias**

<aside class="definition"> <dfn>Alias</dfn>The representation of a model element’s name in natural language (non-technical). </aside>

*Explanation*:

If the name of something modeled in the information model contains spaces, diacritics, or hyphens, such as an <a>Object Type</a> "Real Estate" or an <a>Attribute Type</a> "inspired by", it may be chosen to write this name in the information model in a way that is easier to work with technically. For example: "geinspireerd op" (without diacritics) or "RealEstate" (camelCase notation). When the original natural language spelling is important, it can be recorded in the metadata Alias. It is not intended to use the technical simpler name in the Alias.

The Alias is also used for an alternative representation of an <a>Enumerated Value</a>. The 'name' here is an actual value, such as "Dutch", where the name equals the value and this must remain so, but if there is a code intended for documentation purposes for this <a>Enumerated Value</a>, then this code can be recorded in the Alias.

*Application*: Object Type, Attribute Type, Data Group, Relationship Type, Relationship Role, Relationship Class, External Link, Choice, Enumeration, Primitive Data Type, Structured Data Type, Data Element — and explicitly not for Packages, Enumerated Value, and Constraint.

Note: an exception is made for UML models for UML EnumerationLiteral. The 'name' here is an actual value, where the name equals the value. It is therefore explicitly undesirable to use an Alias for this. The Alias is used here, among other reasons, only for modeling the metadata aspect Code that complements the name (not an alternative to the name).

#### Metadata: **Concept**

<aside class="definition"> <dfn>Concept</dfn>A reference to a concept, from a model element, indicating on which concept(s) the information model element is based. The reference takes the form of a term or a URI. </aside>

*Explanation*:
This indicates how an information model element relates to the concepts from the concept framework, as mentioned in [[[#typing-of-models-linked-to-levels-of-abstraction]]]. This is not a one-to-one relationship. For more information, see [[[#agreements-rules]]].

For example:

"Parcel";

"http://brk.basisregistraties.overheid.nl/id/concept/Parcel"

*Application*: all model elements with a name, except Package and Constraint.

#### Metadata: **Origin**

<aside class="definition"> <dfn>Origin</dfn>The registration or information model from which the model element is derived, or the own organization if it was added by that organization. </aside>

*Explanation*:
For example: the origin of the characteristic boundary of a Parcel has the value "BRK". BRK is explained in the accompanying documentation as the Basic Registration Cadastre.

It explicitly does not mean which information provision or registration the data was taken from. This metadata explicitly concerns from which domain or source the model element originates. For basic registrations, the origin is always the own information model. This metadata is especially important if the model element was taken over from another information model.

For example: the origin of the characteristic residential address, which may be a «Relationship Type» of a Person in the Basic Registration Persons to a Number Designation in the Basic Registration Addresses and Buildings (BAG), has as origin: "BRP" (the Basic Registration Persons). This characteristic residential address is maintained in the BRP and the source side of the relationship is in the BRP. The Number Designation itself usually has the origin: "BAG". However, if the address data do not come (directly or indirectly) from the BAG, but for example are maintained through an internal data collection process in an own registration, then the origin is not "BAG", but for example "PROV" (an abbreviation for the organization: Province).

*Application*: all model elements.

#### Metadata: **Definition**

<aside class="definition"> <dfn>Definition</dfn>A clear and unambiguous textual description of the meaning of the model element. </aside>

*Explanation*:
For example: A Pand (building unit) is the smallest unit that, at the time of its creation, is functionally and structurally independent in terms of construction, directly and permanently connected to the ground, and accessible and sealable. The definition follows, if available, the catalogue of the relevant (basic) registration or information model, provided that it defines the model element from an information and information model perspective. (Other definitions may exist from different perspectives, such as a legal perspective or the perspective of a concept model, as mentioned in the paragraph Types of Information Models. Such definitions may be identical, temporarily the same, different, or complementary to each other. It is the responsibility of the information model’s custodian to handle this carefully.)

*Application*: all model elements.

#### Metadata: **Origin definition**

<aside class="definition">
  <dfn>Resource definition</dfn>The record or information model from which the definition is taken or a designation indicating the sources from which the definition is composed.
</aside>


*Explanation*


Usually this metadata specifies ``my IM'`, for example ``BRK'` if it is the information model of the BRK.


But the origin of the definition of the attribute `address` may also have as a value `‘BAG’`. Or `"BAG and BRK"`, 
where the documentation further explains what this means, such as that the definition was adopted and then further refined within its own information model, or further split into two separate definitions.


This metadata is not intended for cases where a definition is only inspired by another definition, or the other definition is actually redefined to such an extent that the original definition no longer applies.


The point is to make it clear to users how information conforming to this information model relates to information conforming to the other information model. 
The metadata entry `Resource definition` clarifies this.


*Application*: all model elements that have the metadata `Definition`.

#### Metadata: **Explanation**

<aside class="definition">
  <dfn>Explanation</dfn>A substantive explanation of the definition, for clarification or further interpretation
</aside>

*Explanation*
For example: some striking examples (values) of the attribute of the object or an indication of what is not covered by the definition.

It is not intended to include other metadata in the explanation, such as population or term. The explanation is clear and understandable in itself and focuses on the meaning of data and/or the context of these data. The explanatory note does not focus on the collection of the data but describes the meaning of what has been collected so that it is clear to users of the data what its meaning is. It is therefore not the intention to include collection rules or frequently asked questions themselves in the explanatory notes. Of course, it is good to give knowledge "hidden" in the collection rules and answers a place in the explanatory notes.

*Application*: all model elements that have the metadata `definition`.

#### Metadata: **Date of recording**

<aside class="definition">
  <dfn>Date of recording</dfn>The date when the model element was added to the information model.
</aside>

*Explanation*
For example: `"1-1-2012"`.

*Application*: all model elements except data type elements, packages and other.

#### Metadata: **Identifying**

<aside class="definition">
  <dfn>Identifying</dfn>An indication that a characteristic or a combination of characteristics of an object type uniquely identifies all objects in the population of objects of that object type, or an indication that a reference element uniquely identifies all list items in a reference list.
</aside>

*Explanation*
 Objects in an administration or data facility often have, or receive, one identifying attribute. It may also be that a number of attributes are identifying in combination, such as two attribute types or an attribute type and a relation type. The combination with a relation type is only done for object types that do not have a unique identifier themselves and therefore need to compose them with the unique identifier of a related object type. The model element `"Reference list"` is the only type of value list that can have this metadata, because the enumeration itself is identifying and the unique identifying code of a code list is outside the information model.

*Application*: attribute type, all relationships (relationship type, relationship role, relationship class, external link), reference element.

#### Metadata: **has timeline validity**

<aside class="definition">
  <dfn>has timeline validity</dfn>Indication whether a timeline validity is maintained for this attribute and can be queried.
</aside>

*Explanation*

For example: `"Yes"`, `"No"`.

`Timeline validity` refers to recording the moment in time when a real-world change has occurred that results in a change to the value of an object's attribute. The data is considered _valid_ as of a specific point in time, and this timestamp is stored as metadata alongside the data.

It is common for a fact to be determined or decided to have been valid starting from a point in the past. Likewise, a fact may become valid only from a certain point in the (near) future. For further explanation, see [[[#appointment-rules]]].

The term "by query" refers to the ability to search the historical validity of data—that is, from when the data is considered valid and until when it is no longer considered _valid_. This metadata is only meaningful for attributes for which a value is maintained. The values to be entered are defined in [[[#allowed-values-metadata]]].

*Application*: all model elements that are or can be an attribute of an Object Type, for which data can be maintained: Attribute Type and Relationships (Relationship Type, Relationship Class, External Link).

#### Metadata: **indication of material history**

<aside class="definition">
  <dfn>Indication of material history</dfn>Indication of whether the material history of an object's attribute is tracked and can be queried.
</aside>

<aside class="note" title="Notes on 'indication of material history'">
<ol>
  <li>This metadata is equivalent to the metadata <code><a>has timeline validity</a></code>;</li>
  <li>In future versions of MIM, version 2.x and later, this metadata will be phased out. Due to backwards compatibility, it is still present in MIM 1.x.</li>
</ol>
</aside>

*Explanation*

For example: `"Yes"`, `"No"`.

"Can be queried" means that history is recorded in some way, which can also be queried in some way. This metadata is only meaningful for attributes for which data is maintained. The value to be entered comes from: see [[[#allowed-values-metadata]]].  
Material history indicates when a change has occurred in reality that has led to a change in the attribute value. For further explanation, see [[[#appointment-rules]]].  
The value to be entered comes from: see [[[#allowed-values-metadata]]].

Material history indicates when a change has occurred in reality that has led to a change in the attribute value. For further explanation, see the section [Appointments & Rules](#appointment-rules).

*Application*: all model elements that can be a characteristic of an Object Type, for which data can be maintained: Attribute type and relationships (Relationship type, Relationship class, External Link).
#### Metadata: **has timeline registration**

<aside class="definition">
  <dfn>has timeline registration</dfn>Indicates whether timeline registration is maintained and can be queried for this attribute.
</aside>

*Explanation*

For example: `"Yes"`, `"No"`.

Timeline registration refers to tracking on a timeline when a specific value for an attribute of an object is recorded, i.e., _registered_. This point in time is stored in some way as metadata alongside the data. The registration may take place on a specific medium or in the record of an information system. The moment of registration is always the moment the data is recorded in real time (the actual clock time). Each time the same data is recorded in another place, it creates a separate timestamp on the timeline that may be relevant to keep. For further explanation, see the section [Appointments & Rules](#appointments-rules).

"Can be queried" means: the time when the data was registered is recorded as history in some way, and this method is searchable. This metadata is only meaningful for attributes for which a value is maintained. Note that in practice, the moment of registration is often—but not necessarily—the same as the moment when the data becomes available to users of the information system. The value to be entered comes from: see [[[#allowed-values-metadata]]].

*Application*: all model elements that can be a characteristic of an Object Type, for which data can be maintained: Attribute type and relationships (Relationship type, Relationship class, External Link).

#### Metadata: **Indication of formal history**

<aside class="definition">
  <dfn>Indication of formal history</dfn>Indicates whether the formal history of the object's attribute is tracked and can be queried.
</aside>

<aside class="note" title="Notes on 'indication of formal history'">
<ol>
  <li>This metadata is equivalent to the metadata <code><a>has timeline registration</a></code>;</li>
  <li>In future versions of MIM, version 2.x and later, this metadata will be phased out. Due to backwards compatibility, it is still present in MIM 1.x.</li>
</ol>
</aside>

*Explanation*

For example: `"Yes"`, `"No"`.

"Can be queried" means that history is tracked in some way, which is searchable in some way. This metadata is only meaningful for attributes for which data is maintained. The value to be entered comes from: see [[[#allowed-values-metadata]]].  
Formal history indicates when a change is known and processed in the administration. For further explanation, see [[[#appointments-rules]]]. The value to be entered comes from: see [[[#allowed-values-metadata]]].

Formal history indicates when a change is known and processed in the administration. For further explanation, see [[[#appointments-rules]]].

*Application*: all model elements that can be a characteristic of an Object Type, for which data can be maintained: Attribute type and relationships (Relationship type, Relationship class, External Link).

#### Metadata: **Cardinality**

<aside class="definition">
  <dfn>Cardinality</dfn>The cardinality indicates how many times values of this attribute of an object can occur for an instance of the corresponding object type.
</aside>

*Explanation*

1. Value: `1..1`: An object always has this attribute. Example: birthdate of a person.  
1. Value: `1..*`: An object always has this attribute, and the attribute may occur multiple times. Example: number of chapters in a book (in this domain there is always at least `1`).  
1. Value: `0..1`: May not always be available. Example: surname prefix.  
1. Value: `0..*`: Not always available, but the attribute can also occur multiple times. Example: accommodation units located in a building (`garage: 0`, `house: 1`, `apartment: *`). Other numbers than `0`, `1`, and `*` are also allowed, e.g., `2..*` or `0..2`. The notation of `*` varies per modeling language. With `*` is meant _many_ (not specifically defined, but for example `10` or `100` is allowed).

If an `«AttributeType»` is part of a `«DataGroupType»`, then the cardinality of the `«AttributeType»` within the `«DataGroupType»` is specified. For the final cardinality of how often data occurs with the object, the cardinality of the data group and the cardinality of the `«AttributeType»` must both be considered.

Note that it may be the case that an object does or should have the attribute, but it has not yet been possible to collect or determine this data. It is then known that the object does have this attribute, but its value is unknown. In that case, the cardinality is not changed from `1` to `0`, but it is indicated that a value may be missing. More on this is described in [[[#appointments-rules]]].

A `«Generalization»` is a special type of relationship. The cardinality of both the source and the target is always, by definition, `1..1`. Therefore, this does not need to be indicated separately with a cardinality.

*Application*: all model elements that can be a characteristic of an ObjectType.

#### Metadata: **Cardinality relationship source**

<aside class="definition">
  <dfn>Cardinality relationship source</dfn>The cardinality of the relationship source indicates, for a relationship type, how many instances of the source object type can be connected in a relationship with one instance of the target object type.
</aside>

Example: a residential unit is located in a building. The owner of the relationship is the residential unit (the source of the relationship), and the target of the relationship is the building.

- The cardinality of the target of the relationship indicates: in how many buildings can one residential unit be located. Answer: `1..*`  
- The cardinality of the source indicates: how many residential units can be located in one building. Answer: `0..*`

This cardinality is especially useful for validation, but at the data level it (usually) does not appear, because relationships in MIM are directed.

*Explanation*

The cardinality of the source of the relationship indicates how many instances of the source can refer to a single instance of the target of the relationship. If the cardinality on the source side is not specified, there is no default value.

*Application*: relationship type, external link, and relationship class

#### Metadata: **Authoritative**

<aside class="definition">
  <dfn>Authoritative</dfn>Indication of whether the attribute concerns an authoritative data item.
</aside>

*Explanation*

Examples: `"Authoritative"`, `"Basic data"`, `"National core data"`, `"Municipal core data"`, `"Other"`.

`Authoritative` applies to, for example, the citizen service number (BSN) of a natural person. In the law governing a base registration, it is established which data are authoritative. An attribute is authoritative if the correctness (high-quality data) is guaranteed through formal acquisition processes and legal regulations. Authoritative data must be used by all government institutions mandatorily and without further investigation in the execution of public legal tasks.

The value to be filled in comes from: see [[[#allowed-values-metadata]]]

*Application*: all model elements that can be a characteristic of an ObjectType.

#### Metadata: **Indication derivable**

<aside class="definition">
  <dfn>Indication derivable</dfn>Indication that the data can be derived from other attribute and/or relationship types.
</aside>

*Explanation*

For example: the `name` of a public space, such as `"Burgemeester Baron van Voerst van Lyndenstraat"`, becomes in its shortened form the abbreviated name: `"Burg Bar v V v Lyndenstr"` – this is a derived value. Another example: the `owner` of a house can be derived from other data recorded within the information model.

The derived data itself is not a source data item and must be updated if the source data is updated. The description of the attribute will specify which data is involved and possibly how the derivation takes place.

Although the definition does not state it explicitly, the example makes it clear that this concerns data derived *within* the context of the model. In other words, the metadata is intended to indicate a *dependency* within the model.

*Application*: model elements for which a value can be provided, namely the model elements AttributeType and RelationshipType.

#### Metadata: **Indication classifying**

<aside class="definition">
  <dfn>Indication classifying</dfn>Indication that an attribute type classifies the object type it belongs to into (sub)types.
</aside>

*Explanation*

An `«ObjectType»` can be classified into subtypes using an `«AttributeType»`. For example: `building type`. `"Tower"`, `"Church"`, `"Bunker"`, `"Swimming pool"` are all types of buildings. In a level 2 model, such types can be modeled as object types and specializations of the `«ObjectType»` building. Especially at level 3, it can be relevant to structure this information explicitly by including an aspect that directly records the building type, independent of the modeling of object types.

Practically, it may then be decided not to include the underlying object types in the model anymore and only record this aspect. Also, in combination with `Indication derivable`, this aspect can be derived from the most specific `«ObjectType»`, if such object types have been modeled. The value to be filled in comes from: see [[[#allowed-values-metadata]]]

*Application*: AttributeType.

#### Metadata: **Possibly no value**

<aside class="definition">
  <dfn>Possibly no value</dfn>Indication that no value has been registered for an aspect, but it is unclear whether the value truly does not exist.
</aside>

*Explanation*

This concerns cases where it is unclear whether the value exists at all, or if it is known or expected that a value should exist, it is unclear *what* the value is. This metadata then indicates that such uncertainty is allowed (or allowed to remain). Often, this is only permitted under certain conditions, with a justification provided.

- Example: `country of origin`. Every person comes from a country, but it may be unclear at the time which country that is;
- Example: `RSIN` (Legal Entities and Partnerships Identification Number) of an organization, for data collected before the RSIN existed. The RSIN is a required field in the current information model, but for older data the value is unknown.

*Application*: model elements for which a value can be provided, i.e., the model elements AttributeType and RelationshipType.
#### Metadata: **Source**

<aside class="definition">
  <dfn>Source</dfn>Indication of the source object in a relationship between objects. A source object has a relationship with a target object via a relationship type.
</aside>

*Explanation*

Example: a person has an address. You can model this using a `«RelationshipType»` between an `«ObjectType»` `Person` and an `«ObjectType»` `Address`. The metadata `Source` of the `«RelationshipType»` then has the value: `"Person"`.

*Application*: RelationshipType and External Link.

#### Metadata: **Target**

<aside class="definition">
  <dfn>Target</dfn>Indication of the related object type that represents the endpoint of the relationship. This is the object type that is referred to.
</aside>

*Explanation*

Example: a person has an address. You can model this using a `«RelationshipType»` between an `«ObjectType»` `Person` and an `«ObjectType»` `Address`. The metadata `Target` of the `«RelationshipType»` then has the value: `"Address"`.

*Application*: RelationshipType and External Link.

#### Metadata: **Unidirectional**

<aside class="definition">
  <dfn>Unidirectional</dfn>The direction of a relationship, which gives meaning to the relationship from the perspective of the owner of the relationship.
</aside>

*Explanation*

It is common to indicate a direction. The meaning of `A` to `B` differs from that of `B` to `A`. It also indicates which `«ObjectType»` maintains the characteristic, in other words, who the owner is.

Example: a person has a mailing address. The direction of the relationship is from the `«ObjectType»` `Person` to the `«ObjectType»` `Address`. The owner of the relationship (the source, in this case: `Person`) is aware of the related object type (the target, in this case: `Address`).

In a modeling language, this is often indicated with an arrow. The arrow starts at the source and points to the related `«ObjectType»`, the target of the relationship. All relationships are always directed from the source object to the related target object.

*Application*: RelationshipType and External Link.

#### Metadata: **Aggregation Type**

<aside class="definition">
  <dfn>Aggregation Type</dfn>Indicates whether the object type that owns a relationship considers the target of the relationship as a composite part belonging to the object type, and what kind of composition the relationship represents.
</aside>

*Explanation*

An object can be composed of constituent parts that are also individually recognizable as object types within the information model. This is called aggregation. It is modeled with an `AttributeType` where this metadata is filled with an aggregation type. There are two types: a composition aggregation and a shared aggregation. Aggregation is essentially a relationship, and the aggregation type provides additional information. By default, a relationship is not an aggregation, in which case the value of this metadata is `None`.

- `"Composition"` (Dutch: _"Compositie"_): the target object is an integral part of the owning object and is not shared with others. The owner is fully responsible for managing the information about the part. If the owner ceases to exist, the parts automatically cease to exist as well. The target object cannot exist independently: it ceases to exist if the owner does. However, a part can be replaced while keeping the owner object intact.
- `"Shared"` (Dutch: _"Gedeeld"_): the part can be used and shared by multiple owners. For example: a student can be part of multiple classes.

Example: a car has various parts, including an engine. In the information model, the focus is primarily on the car, and the engine is relevant only because it is a part of the car. An engine in this case can only be used by one car, and if the car disappears, the engine also disappears. In other words, the engine is an inseparable part of a car and cannot be used by another object or exist independently—it is an aggregation of type composition (`Aggregation Type`: `"Composition"`).

*Application*: RelationshipType and External Link.

#### Metadata: **Location**

<aside class="definition">
  <dfn>Location</dfn>If the type of the attribute type is a value list, this specifies where it can be found.
</aside>

*Explanation*

The location is a published source accessible to users. If possible, this metadata is filled with a URI or URL (if a URI is not available, a URL can be used where the value list can be found based on its name), for example: `Location`: `http://www.organization.nl/schemas/valuelists/ValueListName`.

*Application*: Code list and Reference list.

#### Metadata: **Target Format**

<aside class="definition">
  <dfn>Target Format</dfn>The format in which a value list is published.
</aside>

*Explanation*

Common formats for publishing value lists include SKOS and CSV.

*Application:* Code list and Reference list.

#### Metadata: **Value Item**

<aside class="definition">
  <dfn>Value Item</dfn>The item (or element) of the list that represents the value.
</aside>

*Explanation*

If a `«CodeList»` has a structure, this metadata indicates which item in the `«CodeList»` represents the value.

*Application:* Code list

#### Metadata: **Profile Specification**

<aside class="definition">
  <dfn>Profile Specification</dfn>Reference to the profile that describes the technical implementation of the code list.
</aside>

*Explanation*

MIM does not prescribe the technical implementation of the code list. To allow referencing information about the technical implementation in the model, the `Profile Specification` metadata can be used to describe the specific technical application of the code list. Preferably, the reference is a URL.

*Application:* Code list

#### Metadata: **Type**

The domain of a value of a data item.

<aside class="definition">
  <dfn>Type</dfn>The datatype used to record values of this model element.
</aside>

*Explanation*

- For example: the `Type` of the attribute `geometry` is the `«Datatype»` `SurfaceOrMultiSurface`;
- For example: the `Type` of the attribute `surname` is the `«Datatype»` `CharacterString`.

An `«AttributeType»` uses a `«Datatype»` to specify the allowed value type. The same applies to a `«Data Element»`, a `«Reference Element»`, and a `«Choice»`. This must always conform to a datatype from this metamodel (or an extension of it) or to a `«Primitive Datatype»` external to this model. If the value comes from a dynamic value list, the name of the relevant `«Reference List»` or `«Code List»` is used as the type. If it is a value from a static enumeration, the name of the relevant `«Enumeration»` is used as the type.

*Application:* All information elements that model an attribute: AttributeType, Data Element, Reference Element, Datatype Choice, Target Choice.

#### Metadata: **Length**

<aside class="definition">
  <dfn>Length</dfn>The indication of the length of a data item, according to the specified notation.
</aside>

The notation and meaning are as follows:

For characters:

| **Notation** | **Meaning**                                                                                 |
|--------------|----------------------------------------------------------------------------------------------|
| `"1"`        | The length is exactly 1                                                                      |
| `"2.."`      | The length is at least 2 (inclusive) or more (unbounded)                                     |
| `"2..9"`     | The length is at least 2 and at most 9 (inclusive)                                           |

For numbers:

| **Notation** | **Meaning**                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------------------------|
| `"3"`        | The length is at most 3 (inclusive: 1, 2, or 3 digits) before the decimal point                               |
| `"3,2"`      | The length is at most 3 digits before the decimal point, and at most 2 digits after the decimal point         |

Numbers other than `"1"`, `"2"`, `"3"`, or `"9"` can of course be used to specify the desired length.

*Explanation*

This concerns the functional length of a data item—that is, how many characters or how many digits before and after the decimal point. The length refers to the data that a model element concerns. For an `«AttributeType»`, it refers to the length of the attribute's data. For a `«Structured Datatype»`, each `«Data Element»` gets its own length specification referring only to that `«Data Element»`.

Examples:
* A person’s name with minimum length 2 and unbounded: `CharacterString`, `length`: `"2.."`
* A street name with minimum 2 and maximum 80 characters: `CharacterString`, `length`: `"2..80"`
* An identifier as a number with maximum length 16: `Integer`, `length`: `"16"`
* An identifier of exactly 16 characters, including leading zeros: `CharacterString`, `length`: `"16"`
* A percentage with 2 digits after the decimal: `Decimal`, `length`: `"3,2"`

Previously common notations:
* `AN80` corresponds to `CharacterString`, `length`: `"1..80"`
* `N8` corresponds to `Integer`, `length`: `"8"` (i.e., from `"-99999999"` to `"+99999999"`)
* `N3,2` corresponds to `Decimal`, `length`: `"3,2"`

Common maximum values for `CharacterString` include: `"80"`, `"200"`, `"4000"`.

A number that allows leading zeros, such as a `municipalityCode`: `"0060"`, should be specified as a `CharacterString`. The _number_ `"0001"` does not exist as such; it is simply the number `"1"`.

The length applies only when there is data. Optional data should be left blank. It is not recommended to specify a minimum length of `"0"` for optional data. If the data is filled in, then the minimum length is `"1"`.

The `"-"` sign for negative numbers does not affect the length specification.

Not all constraints on a data item can be captured by the length. In those cases, use <code><a>Pattern</a></code>, <code><a>Formal Pattern</a></code>, or another way to specify minimum and/or maximum values. For example:
* One or two digits after the decimal cannot be specified with length alone;
* One or two digits before the decimal cannot be specified with length alone;
* An exact number of digits for a number (e.g., exactly 16, not 1 or 15);
* The value range of a number within the specified length;
* Whether a number may be negative or must be positive.

*Application:* AttributeType, Primitive Datatype (only if the datatype is defined in the information model itself), Data Element, Reference Element.

#### Metadata: **Pattern**

<aside class="definition">
  <dfn>Pattern</dfn>The set of values that data of this attribute type can have, i.e., the value range, expressed in a specific structure.
</aside>

*Explanation*

The structure is described in words. For example: `"Conforming to the Dutch standard for describing a postal code"`. Specifying a pattern only applies when the specification indicates that the value (directly or indirectly) concerns a `«Primitive datatype»`, such as a `CharacterString`.

*Application:* The model elements in the groups Datatype and Attribute Type.

#### Metadata: **Formal pattern**

<aside class="definition">
  <dfn>Formal pattern</dfn>Like pattern, but formally defined, expressed in a formal language recognized by the computer.
</aside>

*Explanation*

The structure is described as a regular expression.

For example: `"[1-9][0-9][0-9][0-9][A-Z][A-Z]"`

Specifying a pattern only applies when the specification indicates that the value (directly or indirectly) concerns a `«Primitive datatype»`, such as a `CharacterString`.

*Application:* The model elements in the groups Datatype and Attribute Type.

#### Metadata: **Code**

<aside class="definition">
  <dfn>Code</dfn>The unique code assigned to the enumeration value in a registry or information model.
</aside>

*Application:* Enumeration value.

#### Metadata: **Abstract object indication**

<aside class="definition">
  <dfn>Abstract object indication</dfn>An indication showing whether objects can exist that are typed as being objects (instances) of only this object type.
</aside>

<aside class="note">
  One information model may contain an abstract object type that <i>within this information model</i> is a <code>«Generalization»</code> of no other <code>«Object type»</code>. These non-abstract object types may also exist outside the information model and be specified there. This occurs in information models that define an abstract typing to which (more concrete) information models want to connect and provide further elaboration.
</aside>

*Explanation*

Non-abstract is also called _concrete_. For example, the abstract `«Object type»` `"Vehicle"`, with concrete specializations `"Car"`, `"Bicycle"`, and `"Moped"`. This means that there may not exist vehicles that are only vehicles without specifying whether it is a car, bicycle, or moped. If `"Vehicle"` is modeled as non-abstract, then vehicles can exist that are only vehicles and not specifically identifiable as a car, bicycle, or moped. In both cases, these objects can be referred to as vehicles and can be treated generally as such (as intended by a `«Generalization»`).

If an `«Object type»` is non-abstract, i.e., concrete, then objects can exist that are instances of that `«Object type»`.

If an `«Object type»` is abstract, then no objects can exist that are instances of this `«Object type»`. There must always be a concrete (non-abstract) `«Object type»` that has the abstract `«Object type»` as `«Generalization»`. Objects then are instances of the concrete `«Object type»` and not of the abstract `«Object type»`. These objects still satisfy both `«Object type»` definitions and can be treated generally as such.

See also section [[[#abstract-object-types-and-concrete-objects]]] for further explanation of the phenomenon of abstract object types.

*Application:* Object type
#### Metadata: **Population**

<aside class="definition">
  <dfn>Population</dfn>For object types that are part of a (basic) registration, this concerns the description of the instances of the defined object type that are available in the respective (basic) registration.
</aside>

*Explanation*

The definition of an `«Object type»` indicates which instances in reality are meant, namely those instances that comply with the definition. However, the metadata `Population` in a (basic) registration can be more limited in use, because not all instances that comply with the definition are registered. There are thus instances that comply with the definition but are not registered and therefore cannot be requested.

The `Population` is a _further delimitation of the definition_, a description of the _subset_ of the set of all _instances_ of this `«Object type»` that:
 - are registered or exchanged and/or
 - comply with the definition but are not registered or exchanged.
If all instances that fall under the definition are registered and/or can be exchanged, then the `Population` may be left empty.

The `Population` can also be used to indicate that not all instances of an `«Object type»` are included in the registration but only those that meet a condition. The condition has no further effect on the definition.

<aside class='example'>
    <p>The Cadastre was established in 1832 and has cadastral deeds that are registered since then. The definition of a cadastral deed includes all deeds, and these can be requested from the Cadastre, but not all deeds are available as data (digitally) from the BRK. The following is included in <code>Population</code>:</p>
    <p><code>"All cadastral deeds related to cadastral objects on which a real right existed on January 1, 1980, and all cadastral objects created thereafter are included in the BRK."</code></p>
    <p>This is an example of a condition.</p>
</aside>

<aside class='example'>
    <p>There are buildings in the Netherlands with a military function that are not desirable to include in the registration and are therefore not included based on instructions from the Ministry of Defence. The following is included in <code>Population</code>:</p>
    <p><code>"All buildings on Dutch territory that comply with the object definition, except for some military buildings, as referred to in the <a href="https://zoek.officielebekendmakingen.nl/kst-30968-3.html">explanatory memorandum to the Basic Registrations Addresses and Buildings Act</a>."</code></p>
</aside>

*Application:* Object type

#### Metadata: **Quality**

<aside class="definition">
  <dfn>Quality</dfn>Description of the degree to which objects of the relevant type recorded in the registration are complete, correct, current, accurate, and reliable.
</aside>

*Explanation*

This metadata may contain a description about the quality of data acquisition for this object type.

*Application:* Object type

#### Metadata: **Unit**

<aside class="definition">
  <dfn>Unit</dfn>Designation of the unit associated with a measurement or observation.
</aside>

*Explanation*

Essentially, there are four components that describe a measurement or an observation:

1. the _subject_ (what is measured)
2. the _value_ (the measured value)
3. the _datatype_ of that value (qualitative: `Boolean`, `CharacterString`, quantitative: `Integer`, `Real` or `Decimal`)
4. the _unit_ of the value

The first three components can be expressed using the model elements `«Attribute type»` and `«Datatype»`. For the _unit_ of a value, a separate metadata element is created, which is linked to an `«Attribute type»` or a `«Reference element»`.

For specifying the metadata `Unit`, the MIM aligns with the International System of Units [[SI]]. A modeller fills in the _unit expression_ of the unit, for example: `m` for the length measure _meter_. A code list of possible values and corresponding symbols and _unit expressions_ is available via [SI Reference Point](https://si-digital-framework.org/SI/units).

The SI system consists of seven [basiseenheden](https://nl.wikipedia.org/wiki/SI-stelsel#SI-basiseenheden). Additionally, the system allows an unlimited number of [afgeleide eenheden](https://nl.wikipedia.org/wiki/SI-stelsel#Afgeleide_SI-eenheden), which can always be expressed as a product of powers of the base units. For this purpose, [SI-prefixen](https://nl.wikipedia.org/wiki/SI-stelsel#SI-prefixen_(vermenigvuldigingsfactoren)) are defined. Besides the SI units, there are some non-SI units approved for _use in combination_ with SI units, such as: _liter_, _hour_, _minute_, and _degree Celsius_. Imperial units, such as _pound_, _inch_, and _foot_, are not approved SI units.

<aside class="example" title="Examples of units in relation to the SI system">
  <p><strong>Base units</strong>
    <ul>
      <li>second, <i>unit expression</i>: <code>s</code> (quantity: time)</li>
      <li>meter, <i>unit expression</i>: <code>m</code> (quantity: length)</li>
      <li>kilogram, <i>unit expression</i>: <code>kg</code> (quantity: mass)</li>
      <li>ampere, <i>unit expression</i>: <code>A</code> (quantity: electric current)</li>
      <li>kelvin, <i>unit expression</i>: <code>K</code> (quantity: absolute temperature)</li>
      <li>mole, <i>unit expression</i>: <code>mol</code> (quantity: amount of substance)</li>
      <li>candela, <i>unit expression</i>: <code>cd</code> (quantity: luminous intensity)</li>
    </ul>
  </p>
  <p><strong>Derived SI units</strong>
    <ul>
      <li>gram, <i>unit expression</i>: <code>g</code></li>
      <li>hertz, <i>unit expression</i>: <code>Hz</code></li>
      <li>kilometer, <i>unit expression</i>: <code>km</code></li>
    </ul>
  </p>
  <p><strong>Non-SI units accepted for use with SI units</strong>
    <ul>
      <li>day, <i>unit expression</i>: <code>d</code></li>
      <li>decibel (1/10 Bel = 1 decibel), <i>unit expression</i>: <code>dB</code></li>
      <li>hour, <i>unit expression</i>: <code>h</code></li>
      <li>liter, <i>unit expression</i>: <code>L</code></li>
      <li>minute, <i>unit expression</i>: <code>min</code></li>
    </ul>
  </p>
  <p><strong>Compound units</strong>
    <ul>
      <li>kilowatt-hour, <i>unit expression</i>: <code>kW.h</code></li>
      <li>meter per second, <i>unit expression</i>: <code>m.s</code></li>
      <li>square meter, <i>unit expression</i>: <code>m2</code></li>
    </ul>
  </p>
  <p><strong>Imperial units not accepted for use with SI units</strong>
    <ul>
      <li>pound</li>
      <li>inch</li>
      <li>foot</li>
      <li>yard</li>
      <li>mile</li>
    </ul>
  </p>
</aside>

*Application:* Attribute type, Reference element.

#### Metadata: **Minimum Value Inclusive**
<aside class="definition"> <dfn>Minimum Value Inclusive</dfn> Minimum value inclusive (`>=`) is the lower bound of the value range for an attribute type or data element typed with a primitive datatype, including that value itself. The minimum value must be of the same primitive datatype as the datatype of the model element it applies to. </aside>

*Explanation*
For example, the minimum value for a validity date.

*Application*

Use on attribute types, data elements, and reference elements with a primitive datatype of the type:

- Integer
- Decimal
- Float
- Real
- DateTime
- Date

A model element may have only one occurrence of metadata Minimum Value Inclusive or Minimum Value Exclusive.

#### Metadata: **Minimum Value Exclusive**
<aside class="definition"> <dfn>Minimum Value Exclusive</dfn> Minimum value exclusive (`>`) is the lower bound of the value range for an attribute type or data element typed with a primitive datatype, excluding that value itself. The minimum value must be of the same primitive datatype as the datatype of the model element it applies to. </aside>

*Explanation*

For example, the minimum volume of a building.
*Application*

Use on attribute types, data elements, and reference elements with a primitive datatype of the type:

- Integer
- Decimal
- Float
- Real
- DateTime
- Date

A model element may have only one occurrence of metadata Minimum Value Inclusive or Minimum Value Exclusive.

#### Metadata: **Maximum Value Inclusive**