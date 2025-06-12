# Introduction

This documents presents the information metamodel (MIM), for describing information models. With the meta-model, we have established a common starting point for creating information models. The model contains clear agreements on defining data specifications while accommodating different levels of modeling. A special feature of the model is that the agreements span multiple levels of government. This document was prepared with knowledge contributed by the MIM community.
Kadaster, Geonovum, VNG Realisatie, DUO and other parties contributed.

## Scope.

The metamodel provides the modeling language with which an information model can be created, read and understood. Its purpose is:

- increase the readability and unambiguity of information models;
- be able to create information models at both conceptual and logical levels (see [What is an information model](#what-is-an-information-model)) `<!-- (see Section 1.4); -->`
- be able to properly link information models on a conceptual and logical level;
- to be able to develop and (re)use tooling for and by all parties that choose this meta-model;
- to combine knowledge from different organizations;
- and by extension, to be able to establish exchange standards more quickly and predictably in a more automated manner.
- to promote interoperability between registries.

Information models described on the basis of this metamodel are:

- they can be interpreted unambiguously and compared well;
- They can be used to create or generate documentation suitable for publication;
- they can be used as a basis for (preferably model-driven generation of) derived models and products for a specific application domain such as [[NEN3610]] or the municipal domain;
- they can be used as a basis for (preferably model-driven generation of) derived models for specific services and information products (implementation schemas, registries, validation services etc.).

## Target audience.

This document is primarily intended for information modelers and information architects who create these information models; information analysts who want to know the meaning and definition of information objects, and people who continue model-driven work based on the information model and create implementations from it. Knowledge of information modeling is a requirement. Some knowledge of UML [[UML]] or [[Linked-Data]] is a plus but not required. This metamodel focuses in particular on information delivery within the government domain, although it can also be used in broader contexts.

## Reading guide

We describe the metamodel in five chapters and an appendix. Continue reading the [Introduction](#introduction) for insight into what we mean by an information model and by a metamodel, how these models relate to UML and the Object Management Group's [[OMG]] four-layer metamodel architecture, Linked Data and the W3C's Internet standards, and what other standards are applied.

The chapter [Metamodel General](#metamodel-general) contains the description of all building blocks or model elements of the metamodel, in the form of definitions and specifications. The meaning and explanation of the model elements of the metamodel forms the material with which an exhaustive model specification can be prepared. While the illustrations in this general chapter are created in UML, the metamodel is certainly not limited to UML. There are separate chapters for implementing MIM in UML and Linked Data.

The chapter [Metamodel in UML](#metamodel-in-uml) describes what the implementation of MIM in [[UML]] looks like. This chapter describes how the metamodel relates to the UML metamodel, what extensions or specializations of the UML metamodel are made.

The chapter [Metamodel in Linked Data (LD)](#metamodel-in-linked-data-ld) describes what the implementation of MIM in [[Linked-Data]] looks like. This section describes how the metamodel relates to the Linked Data metamodel. In doing so, a strict translation has been made. This means that the Linked Data model in question can only be used as a MIM model. For a model that can be used to actually express Linked Data, a translation is needed which is described in the appendix [Transformation MIM - RDFS/OWL/SHACL](#transformation-mim-rdfs-owl-shacl). In this way, such an RDFS/OWL/SHACL model can also be seen as an MIM model.

In the chapter [Agreements &amp; Rules](#agreements-rules) we go into detail on a number of aspects. It is a more comprehensive explanation, in addition to the chapter [Metamodel General](#metamodel-general), consisting of further agreements, rules, guidelines and recommendations when applying the metamodel.

Finally, a number of appendices are available. These are tools or additions to the MIM.

- The appendix [Template naming conventions](#template-naming-conventions) provides a fill-in tool to document own naming conventions, per model element mentioned in this metamodel.
- The appendix [Transformation MIM - RDFS/OWL/SHACL](#transformation-mim-rdfs-owl-shacl) describes how to transform an MIM model into an RDF model that can be used to actually express Linked Data in and vice versa (at the instance level, conforming to the specification at the information model level).

## Usage Guide

The building blocks, or model elements, described in this meta-model can be used to create an information model.  To create such an information model, it usually suffices to go through the chapter Metamodel General, choose modelling with either UML or linked data, and read the corresponding chapter.  You can treat the other chapters as reference work, for when questions arise during modelling. Next, take your favourite modelling tool and get started. Tools have been created for certain modelling tools, so you can use these tools to create the model elements by clicking on them and dragging them to a diagram, for example, and also validate whether your model correctly follows the MIM (which is automatic if you use the tools). Finally, it is possible to look at information models of organisations that have already published an MIM information model. Detailed examples will also be created for specific modelling and queries.


## What is an information model 

When we want to collect, register or exchange information on certain topics, it is important to first describe this information properly. We do this so that it is clear and unambiguous for anyone working with the information: 
- what the information is about, e.g. information about a person or a building. Person and building are called the objects, the subjects of conversation 
- that these subjects of conversation are modelled as information objects 
- the properties/characteristics themselves, whose information we keep, e.g. the name of a person or the year of construction of a building; 
- what the meaning of that information is, the semantics - how this information is structured, in terms of interrelationships and the internal structure of the data.

## Model description 

Describing reality through information modelling

Describing takes place by modelling the information about real-world objects—so-called information objects—including their characteristics and interrelationships. We elaborate on this principle using an example.

Jan and Katrien are things in reality. They have certain characteristics, such as a name and a date of birth. In an information model, Jan and Katrien themselves do not appear. Instead, they are represented by the object type Person. Even their specific data—such as Jan’s date of birth, 10-10-1970—is not included in the information model itself. The model only defines the attribute date of birth as a property of the object type Person, along with its definition and explanation.

The object type Person in the information model is a description from the perspective of the information domain in which we consider Jan and Katrien. In that domain, we see Jan and Katrien as individual instances of the object type Person—information objects. Similarly, we might characterise objects such as the Domtoren and Paleis Het Loo as instances of the object type Building.

Object types in an information model therefore represent things in reality. The information model is a model of reality, focusing on the information about that reality. Characteristics such as name and date of birth—but also identification and registration time—are modelled as attributes of the object type. These are referred to as attribute types.

Some attributes represent relationships between objects—for example, the fact that Jan lives in Paleis Het Loo. These are modelled as relation types between object types—in this case, between the object types Person and Building.

In summary:

All objects considered similar in the information model are represented as an object type.

Relationships between those objects are characterised as relation types.

Characteristics of the objects are represented as attribute types.

This is how an information model is constructed. In a registration derived from the information model, the actual instances—such as Jan and Katrien—and their specific data (e.g., date of birth 10-10-1970) can be recorded and exchanged.

The figure below visualises this for a situation in which a registration is derived from the information model.
[TODO figuur]

If another registration views the same "John from reality" from its own perspective, it will also have its own, separate object for John. In that case, John may be modelled differently in this separate information model—for example, as an "Employee" in one domain and as a "Person" or "Partner" in another. Both objects about John represent the same real-world individual, but each is viewed from the perspective of its own domain.

## Important Points to take care of

Note that we mostly refer to a registration here, as this is common in practice. However, information models can also be used in other contexts—for instance, when only data is exchanged, such as in messaging, or when there is merely a description of information, regardless of whether it is included in a registration.

An information model only describes subjects, characteristics, and relationships that are relevant to a specific domain. For example, buildings are relevant within the Topographical Registration domain, and persons within the Basic Register of Persons domain. A domain can be anything, but in the context of MIM, it refers to (policy) sectors identified and organised for administrative and management purposes. Examples include: the Environment Act, Large-Scale Topography, Cadastral Information, or the Municipal Domain.

An information model is intended to describe the meaning and definition of information itself, independent of any (technical) implementation or application environment. The goal is to ensure the meaning of the information is clear, regardless of where it is encountered or which technology is used. In other words, whether in interfaces, chains, or implementations, any technical exchange format (or database technology) can be used to express the information model. No constraints are imposed by the model regarding how data is collected, stored, managed, or exchanged.

When information is included in a registration, there is typically an ingestion process to ensure the data conforms to the information model. While this is an important process, it falls outside the scope of the information model. In other words, processes are not part of this standard, which focuses solely on the structure and meaning of the information.

## Characterisation of Models Linked to Levels of Abstraction

When modelling a domain, there are several levels of abstraction, ranging from a faithful description of the meaning and intent behind the terms people use, to a detailed specification of how data is recorded and exchanged. In the MIM framework, four distinct levels of abstraction are identified—primarily to clearly delineate the scope of MIM, which focuses on levels 2 and 3. These levels are explained below.

Level 1 – Conceptual Understanding (Out of Scope)
Modelling begins with the description of knowledge: the concepts relevant within a domain, typically expressed using domain-specific terminology. In MIM, this is referred to as abstraction level 1. At this stage, the focus is not yet on what information should be recorded or exchanged. Therefore, no information model exists yet. Instead, level 1 models represent knowledge, not information (as defined in What is an information model).
This level is out of scope for MIM.

Levels 2 and 3 – Information Modelling (In Scope for MIM)
The actual modelling of information takes place within an information model. It defines:

Which objects exist,

Their characteristics/properties, and

Whether these properties are mandatory or optional within the application domain.

This model specifies what information is to be recorded or exchanged—no more, no less. A domain may also be subdivided into several information domains, each with clearly defined information objects that are in or out of scope. In MIM, levels 2 and 3 cover this type of modelling, and the resulting models are always technology-independent.

Level 4 – Technical Implementation (Out of Scope)
The information model can be translated into various technical data models or schemas, such as XML, JSON, or specific implementations. MIM refers to this as abstraction level 4. Although this level is out of scope for MIM, the framework supports a model-driven approach, where level 4 artefacts are derived from level 2 or 3 models.

Although MIM focuses on levels 2 and 3, it is important to define all four levels and understand the relationships between them. Each level corresponds to a different type of model, serving a distinct purpose in the overall information modelling process.

## Level of Abstraction 1 - Model of Concepts
This level describes reality within the domain under abstraction (the "universe of discourse") through the description of the concepts used within it and their relationships to one another. A model of concepts represents the informational content of this level.

A concept is a term or idea that people think about and talk about. There are different ways to describe concepts, such as in a dictionary, a formal language or vocabulary, a taxonomy, or a model of concepts that indicates the interrelationships among them. However, none of these approaches constitute an information model.

The goal is for actors within a domain to understand each other and speak the same language. A model of concepts is created for use by people, particularly "the business."

This level is outside the scope of MIM and is therefore only briefly described here. Its primary purpose is to define the scope. There may be more to it than described, and further details could be added. Regarding terms and information models, and the differences between them, the main points are as follows:

A concept is a combination of a term (or word) and its definition. Concepts are used by people to mentally process and understand reality. Not all concepts will appear in the conceptual information model (see also the note in the next section).

Some terms (or "concepts") will later become properties of objects about which information is tracked. However, not all concepts will follow this path. Concepts often describe a domain much more broadly than an information model does. Some concepts will eventually be considered information objects within the model, others will become characteristics/features of these objects, and many will not be included in the information model because there will be no data associated with them.

Information tracking involves the creation of a detailed, unambiguous structure with a data-centric focus, while concept modeling has not yet reached that level of precision. In concept modeling, the connections between information are often (deliberately) more general than those between data objects in an information model.

## Abstraction Level 2 - Conceptual Information Model
This level describes the information (data with meaning and structure) that plays a role in reality within the considered domain. The conceptual information model contains this information. Here, the model is independent of the design and implementation in systems. It provides as faithful a description of that reality as possible and is formulated in natural language.

A conceptual information model focuses specifically on the semantics of things and their properties. It defines the 'what': which 'subjects of conversation' ('concepts', 'things') are distinguished in the considered reality, what they mean, how they relate to each other, and what information is relevant from them. This information is modeled as information objects with properties/characteristics, or in other words, about which data is (or will be) available and is accommodated in an information model. This information model serves as a language with which domain experts can communicate with information analysts and provides an unambiguous interpretation of that reality for the purpose of this communication.

By "conceptual" is not meant abstract or high-level; the descriptions of the information available are very precise and concrete.

A conceptual information model is prepared for use by people, so that 'the business' and ICT specialists (will) understand each other in terms of the information that is registered and/or can be exchanged in the domain.

This level is fully in the scope of MIM.

Regarding the concept model:

The topics of conversation, properties, and relationships from the conceptual information model are related to one or more concepts from the conceptual information model: in this way, it is clear which concepts (with meaning) have been used in modeling the information we want to know about the topics of conversation, as modeled in the conceptual information model.

It is not the case that every concept from a conceptual information model has to be reflected in the conceptual information model. For example, because we are not interested in information about them. The directly related concepts affect the meaning of the information. The other concepts are less relevant. Although some concepts that are indirectly related to the modeled information can still be useful for understanding the modeled information a bit better.

Regarding logical information models:

A conceptual information model is independent of data exchange standards. A logical information model does apply them (think of identifications, geometry versions, timelines of history).

A conceptual information model describes the information in an information domain and is independent of an interface or chain, i.e., is chain- or interface-transcending. A logical information model is specific to an interface or chain or a particular application (with associated implementation, database, and interfaces).

## Abstraction Level 3 - Logical Information or Data Model
This level describes how concepts are used in the interaction between systems and their users, and between systems themselves. In other words, it is a model of the representation of information about reality in digital records and in the exchange between them. The logical information model or data model represents this level. Unlike a conceptual model, it is much more about the 'how'. It bridges the gap between reality and systems but does not yet describe the implementation in those systems. Such a model is described in a formal language and is generated from the conceptual model where possible.

The logical model is prepared for ICT interoperability, particularly for use by the designers, developers, and administrators of ICT systems.

This level is fully within the scope of MIM.

Regarding physical or technical data models:

A logical information model is implementation-independent and can be implemented in multiple technical models or formats. A physical or technical data model depends on the chosen technique or tooling used and is actually implemented technically.

## Abstraction Level 4 - Physical or Technical Data Model
This level describes the structure and properties of the technology in which the information is captured or exchanged. This is highly dependent on the storage technology used, such as a specific database, or the service technology, such as [[XML]], [[GML]], [[SOAP]], REST, [[GeoJSON]], [[Linked-Data]], etc. A technical data model may also include information on how messages are 'packaged', the (Internet) protocol, and the logistics of message traffic. The technical specifications are generally generated as much as possible from the logical information model.

These specifications are prepared for 'machines' and are used by software developers.

This level is not within the scope of MIM. It is not fully described here but is included for illustrative purposes. There may be more to it than described, and additional details may follow.

## Additional Comments on the Levels of Abstraction Recognized and the Use of Different Types of Models
- Generally speaking, understanding the topics or things that play a role in a "universe of discourse" always precedes its modeling, regardless of the level of modeling or the types of models you decide to allow or exclude.

- This standard does not normatively specify an order or method for completing the four levels. For example, you can decide whether or not to define and/or model concepts. When you later create an information model, it is useful to include these as input and remain consistent with them. Note that the definitions at both levels are not always the same. The definition in the information model sometimes needs to be more precise to clarify the meaning of the registered or exchanged data.

- The present meta-model for modeling information (MIM) is intended for information models at abstraction levels 2 and 3: for a conceptual information model (2) and a logical information model (3).

- Clearly, it is always one or the other—conceptual or logical. A combination of both in a single model leads to confusion. For the same domain, the structure of the information model differs according to the type, and the logical information model contains more, especially data-oriented, specifications than a conceptual information model.

- [[#model-elements-and-metadata-as-diagram]] provides an overview of the metadata constructs and elements applicable for each type of model. It is therefore important to explicitly determine which of the two types is intended and to apply the modeling accordingly. In the description of the information model, it should be stated which of the two types is involved: conceptual or logical.

- It is obvious, but not necessarily required, for a domain to first create a conceptual and then a logical information model. Especially when multiple interfaces and/or target groups are involved, each with its own information needs, it is recommended to create a conceptual information model first, without already focusing on a specific interface or target group. When all logical information models are a correct elaboration of the conceptual information model, they can be transformed into each other via transformation specifications.

- An organization can choose to create only a logical information model or a conceptual information model as a basis and later extend it with logical aspects.

## What is the Metamodel for Information Modeling?
A metamodel is a model of a model. It defines a collection of modeling constructs in the form of building blocks, or model elements, such as an object type, relation type, and attribute type, with associated meanings and conventions on how to apply them. This can then be used to create an information model.

A metamodel, and thus also the MIM, is the modeling language in which an information model is expressed. This meta-language describes, in a sense, the grammar and syntax of the modeling language.

It is often the case that the metamodel is not explicitly described, and instead, it becomes part of the domain knowledge. The syntax and grammar then reside only in people's minds and are implicitly applied in information models. In the case of cross-domain harmonization, it becomes difficult to compare models with each other and exchange data based on that foundation. The description of the metamodel is, therefore, a prerequisite for a system of coherent information models. In other words, with only the set of modeling constructs, information models are created. By describing modeling languages (such as [[UML]]) in a meta-language (such as MOF), it is ensured that all applications of those languages are built in a standard way and are therefore universally applicable and understandable. The meta-language, in this case, describes, in a sense, the grammar of the modeling language.

The metamodel in this document, the MIM, has been developed for modeling with UML and for modeling with linked data.

## Expressing in UML
Both the metamodel and information models can be expressed in UML. Registries and users of these can use them to set up their situation-specific data management. It is important that the reader first understands what we mean by an information model and a metamodel, and further, it is essential to place the models in the correct context. We do this using the four-layer metamodel architecture of the Object Management Group (OMG). In this section, we will discuss these concepts.

Four-Layer Metamodel Architecture (OMG)
The same formal language in which information models can be described is UML. The metamodel of these information models is an extension of the basic UML metamodel.

The basic UML metamodel is a metamodel that is part of the four layers of the metamodel architecture of OMG: M0, M1, M2, and M3.

TODO translate a tabel

| **Metaniveau** | **Omschrijving**                                                       | **Elementen**                                           |
| -------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------- |
| M3                   | MOF, verzameling van constructies voor definiëren van metamodellen          | MOF klasse, MOF attribuut, MOF Associatie, MOF operatie, etc. |
| M2                   | Metamodellen (UML, CWM, etc.), bestaande uit instanties van MOF constructies | UML klasse, UML associatie, UML attribuut, etc.               |
| M1                   | Modellen, bestaande uit instanties van M2 metamodel constructies             | Klasse “Order”, klasse “Klant”, attribuut “naam” etc.   |
| M0                   | Objecten en data, de instanties van M1 model constructies                    | Order 43123, Artikel 8RB31, etc.                              |

*Tabel 1 Four levels of the metamodel OMG*


Each layer is an instance of the layer above it (with the exception of the M3 layer) and makes use of the expression capabilities specified in the next higher layer in order to form a specification in another layer. The M3 layer defines the base constructs, the language in which the underlying layer is expressed. The Metamodel Meta Object Facility (MOF) is an example of an M3 layer. MOF is the base layer for the UML layer. The metamodel layer (M2) is an instance of the M3 layer. This layer contains, among other things, the UML metamodel. In other words, UML is an instance of MOF. This layer is linguistically richer than the M3 layer. The M2 layer defines the semantics and syntax of the model constructs in the M1 layer. The M1 layer is the layer on which the information model resides to describe a business context model-based description. This M1 layer is an instance of the M2 layer. Finally, there is the M0 layer, on which the objects and data reside—the instances of the M1 model constructs that represent concrete reality at a specific point in time.

The MIM in UML is a UML profile based on the UML metamodel and resides on the M2 layer. The UML metamodel is thereby extended with special elements that are not part of the basic UML metamodel (M2). These new elements are necessary for defining the semantics and syntax of the model constructs as we use them in our information models. The information models we are talking about here in this paper are at the M1 layer. It does not matter whether they are conceptual or logical models.

The UML metamodel (M2) is a 'read-only' model. That is, we are not allowed to modify an existing metaclass or create a new base metaclass as an alternative to an existing UML metaclass. However, via Profiles (from the Infrastructure Library), existing metaclasses can be extended without having to define new metaclasses and thus without modifying the basic UML metamodel (M2). The extension mechanisms for this are stereotypes, tagged values, and constraints.

It should be emphasized that the MIM metamodel does not adopt semantics from UML. By expressing the MIM metamodel in a UML profile, it is made possible, without losing the original semantics of the MIM, to express an MIM model in UML. With this use of a UML profile, we follow the usage established by the OMG for the Ontology Definition Metamodel (ODM):

“The goal of a UML profile from the ODM perspective is to provide a bridge between the UML and knowledge representation communities on a well-grounded, semantic basis, with a broader goal of relating software and logical approaches to representing information. Profiles facilitate implementation using common notation on existing UML tools. They support renaming and specializing UML model elements in consistent ways, so that an instance of a UML model can be seen as an extended metamodel. Profiles allow a developer to leverage UML experience and tools while integrating with an ontology represented in another metamodel.” (section 8.4.2).

## Expressing in Linked Data
Both the metamodel and information models can be expressed in Linked Data. Registries and users can use them to set up their situation-specific data management. It is important that the reader first understands what we mean by an information model and a metamodel. Furthermore, it is essential to place the models in the correct context. We achieve this by using the W3C open standards for specifying an ontology.

Linked Data provides a specific interpretation of the levels in which we describe concepts and information:

- Level 1: Model of concepts is expressed in Linked Data mainly using the SKOS vocabulary.

- Abstract level 2: Conceptual model of information is expressed in Linked Data using a metamodel vocabulary. This vocabulary, the metamodel of the information model, can be proprietary (such as the MIM vocabulary) or based on existing vocabularies. In the latter case, the conceptual information model is also directly a logical information model.

- Abstract level 3: Logical information model is expressed in Linked Data using standard vocabularies like RDF/RDFS ([[RDF11-PRIMER]]), OWL ([[OWL2-PRIMER]]), and [[SHACL]]. This logical information model is also a conceptual information model. Because, in Linked Data, the representation of information is standardized based on the RDF model, there is little or no difference between the conceptual and logical information models.

If an MIM model is characterized as a "logical information model," it can only be meaningfully expressed in Linked Data if the design of the model takes into account the meaning of the model elements in the standard Linked Data vocabularies. For further details, see the Transformation of MIM models appendix. For models that require both UML and Linked Data implementations, it is better to choose the "conceptual information model" type.

### An ontology for the metamodel
By an ontology, we mean a model in which we assign meaning to the terms used in a specific domain. In the case of the MIM meta-model, this refers to the MIM domain itself. We give meaning to terms by attaching a human-readable definition to them (the "soft semantics") and by establishing relationships with previously defined terms or relationships between terms in our ontology (the "hard semantics"). Here, we primarily use the existing globally accepted Internet standards RDF, RDFS, SKOS, and OWL. Additionally, we describe which constructs we want to allow or disallow when a modeler builds an MIM model in Linked Data. For this purpose, we use the globally accepted internet standard SHACL.

### An information model
We consider the (conceptual) information model as an implementation of the MIM ontology. This means that the elements in the information model are instances of the classes defined in the MIM ontology. For example, the following model element vb:Ship is defined as an instance of the class mim:Objecttype. Thus, a vb:Ship is a mim:Objecttype.

<pre class='ex-turtle'> vb:Ship a mim:Objecttype; rdfs:label "Ship"@enl; . </pre>


### An Ontology for an Information Model
Since an information model, as an implementation of the MIM ontology, already involves instances, it is not directly possible to express Linked Data in it based on this information model alone. To achieve this, it is necessary to transform or "promote" the instances from the MIM information model to classes. For example, the following illustrates the transformation of the instance vb:Ship to the class vbo:Ship. Once transformed, it is possible to specify instances of this class, such as the Sinterklaas packaging boat.

<pre class='ex-turtle'> vbo:Ship a rdfs:Class; rdfs:seeAlso vb:Ship; . vb:Pakjesboot12 a vbo:Ship. </pre>
An information model expressed in Linked Data is considered to comply with the MIM if it meets one or both of the following criteria:

The information model is expressed in the MIM vocabulary, as described in [[[#metamodel-in-linked-data-ld]]];

The information model is expressed in RDF, RDFS, OWL, and SHACL and is transformable to the MIM vocabulary based on the transformation rules described in the appendix, [[[#transformation-mim-rdfs-owl-shacl]]].

### A Custom Extension to the Metamodel
If additional metamodel constructs are required for an information model, such as an additional metamodel element or extra metadata, then the metamodel can be extended with a supplement or extension (in the form of an additional annex) added by the relevant organization to the present document.

The ground rule for an extension is that it should not replace any topics described in this metamodel but should only include genuine extensions. If several organizations are interested in this, a model element from an extension can also be added to the metamodel.

It is also possible to specify in the extension which elements from this metamodel are not used in an information model. For example, a specific model element may not be used, or certain metadata aspects may not be extracted for specific domain information models and are therefore placed out of scope (regardless of whether they are optional or mandatory in the MIM).

An extension is managed by the domain itself and is therefore outside the MIM. For more information about a specific extension, please contact the administrator of the extension. If multiple organizations want to use metamodel constructs described in extensions, the desirability of including them in the MIM can be examined. If desired, an extension can be published to MIM management or referenced from MIM management.

<aside class='note' title="Scope of Extensions on the Metamodel Information Modelling"> A metamodel extension is explicitly not intended for additional constructs that come into play only at the implementation level, or at the level of derived technical models serving specific interfaces. These are outside the scope of this metamodel and also outside the scope of extensions to it. However, it is possible and permitted to reuse the metamodel, or parts of it, at this level. </aside>

## Alternatives
In the MIM, at one point, there is a choice between two modelling alternatives, and the modeller of an information model must choose one of the two. The chosen alternative is indicated. This concerns the relationship type and relationship role, both of which must be used, but with one being mandatory or leading [[#relations-in-uml]]. If desired, you can contact MIM administrators for clarification before making a choice.

## Management
The management of the MIM is handled by Geonovum, with support from the Kadaster. For questions, suggestions, or comments, please contact Geonovum's MIM helpdesk at mim@geonovum.nl.

## Standard References

| \#  | Naam                                                | **Referentie**        |
|-----|-----------------------------------------------------|-----------------------|
| 1.  | Unified Modeling Language (UML)                     | [[UML]]               |
| 2.  | OMG Unified Modeling Language TM versie 2.5         | [[OMG]]               |
| 3.  | RDF Concepts and abstract syntax                    | [[RDF11-CONCEPTS]]    |
| 4.  | Shape Constraint Language                           | [[SHACL]]             |
| 5.  | Stelselcatalogus                                    | [[SCAT]]              |
| 6.  | GAB                                                 | [[GAB]]               |
| 7.  | Handreiking gegevensbeschrijving (NORA)             | [[NORA]]              |
| 8.  | ISO 11404                                           | [[ISO-11404]]         |
| 9.  | ISO 8601                                            | [[ISO-8601]]          |
| 10. | Formeel patroon (Reguliere Expressies)              | [[PERLRE]]            |
| 11. | OCL                                                 | [[OCL]]               |
| 12. | NEN 3610 Basismodel Geo-informatie (vanaf /A1:2016) | [[NEN3610]]           |

The Stelselcatalogus [[SCAT]], the GAB [[GAB]], and the Handreiking gegevensbeschrijving [[NORA]] intersect in several areas, but there may be differences in the agreements made at these interfaces. For the meta-model, we therefore apply the following rule of play: the Stelselcatalogus is leading as much as possible, followed by the GAB, and lastly, the manual.

<aside class='note' title="Version number of standard references"> The versions of the listed references have deliberately not been included, to allow for the use of newer versions. When new versions of the listed standard references are released, a check is performed to see whether MIM is still in line with them. If not, work is done to bring MIM back in line, ensuring that it remains 'upward compatible'. </aside>