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