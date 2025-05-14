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