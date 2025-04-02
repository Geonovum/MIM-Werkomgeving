# Introduction

Before you is the information modeling metamodel (MIM), for describing information models. With the meta-model, we have established a common starting point for creating information models. The model contains clear agreements on defining data specifications while accommodating different levels of modeling. A special feature of the model is that the agreements span multiple levels of government. This document was prepared with knowledge contributed by the MIM community.
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

The chapter [Metamodel in UML]](#metamodel-in-uml) describes what the implementation of MIM in [[UML]] looks like. This chapter describes how the metamodel relates to the UML metamodel, what extensions or specializations of the UML metamodel are made.

The chapter [Metamodel in Linked Data (LD)]](#metamodel-in-linked-data-ld) describes what the implementation of MIM in [[Linked-Data]] looks like. This section describes how the metamodel relates to the Linked Data metamodel. In doing so, a strict translation has been made. This means that the Linked Data model in question can only be used as a MIM model. For a model that can be used to actually express Linked Data, a translation is needed which is described in the appendix [Transformation MIM - RDFS/OWL/SHACL](#transformation-mim-rdfs-owl-shacl). In this way, such an RDFS/OWL/SHACL model can also be seen as an MIM model.

The chapter []()