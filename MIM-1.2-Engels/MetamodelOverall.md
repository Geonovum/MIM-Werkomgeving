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
Explanation:
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