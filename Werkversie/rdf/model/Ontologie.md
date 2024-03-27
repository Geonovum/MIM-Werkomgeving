# Ontologie

## Klassen
- [mim:Modelelement](#Modelelement)
  - [mim:Attribuutsoort](#Attribuutsoort)
  - [mim:Constraint](#Constraint)
    - [mim:Keuzeconstraint](#KeuzeConstraint)
  - [mim:DataElement](#DataElement)
  - [mim:Datatype](#Datatype)
    - [mim:Codelijst](#Codelijst)
    - [mim:Enumeratie](#Enumeratie)
    - [mim:GestructureerdDatatype](#GestructureerdDatatype)
    - [mim:Keuze](#Keuze)
    - [mim:PrimitiefDatatype](#PrimitiefDatatype)
    - [mim:Referentielijst](#Referentielijst)
  - [mim:Enumeratiewaarde](#Enumeratiewaarde)
  - [mim:ExterneKoppeling](#ExterneKoppeling)
  - [mim:Gegevensgroep](#Gegevensgroep)
  - [mim:Gegevensgroeptype](#Gegevensgroeptype)
  - [mim:Generalisatie](#Generalisatie)
  - [mim:Objecttype](#Objecttype)
  - [mim:Package](#Package)
    - [mim:Domein](#Domein)
    - [mim:Extern](#Extern)
    - [mim:Informatiemodel](#Informatiemodel)
    - [mim:View](#View)
  - [mim:ReferentieElement](#ReferentieElement)
  - [mim:Relatierol](#Relatierol)
    - [mim:RelatierolBron](#RelatierolBron)
    - [mim:RelatierolDoel](#RelatierolDoel)
  - [mim:Relatiesoort](#Relatiesoort)
    - [mim:Relatieklasse](#Relatieklasse)

### mim:Attribuutsoort {#Attribuutsoort}

|URI|http://modellen.mim-standaard.nl/def/mim#Attribuutsoort|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|De typering van gelijksoortige gegevens die voor een objecttype van toepassing is.|
|Bron|[Sectie 2.2.2 Attribuutsoort](https://docs.geostandaarden.nl/mim/mim/#attribuutsoort)|
|Eigenschappen|[mim:alias](#alias), [mim:authentiek](#authentiek), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:eenheid](#eenheid), [mim:formeelPatroon](#formeelPatroon), [mim:heeftTijdlijnGeldigheid](#heeftTijdlijnGeldigheid), [mim:heeftTijdlijnRegistratie](#heeftTijdlijnRegistratie), [mim:herkomst](#herkomst), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:identificerend](#identificerend), [mim:indicatieAfleidbaar](#indicatieAfleidbaar), [mim:indicatieClassificerend](#indicatieClassificerend), [mim:indicatieFormeleHistorie](#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](#indicatieMaterieleHistorie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:lengte](#lengte), [mim:maximumwaardeExclusief](#maximumwaardeExclusief), [mim:maximumwaardeInclusief](#maximumwaardeInclusief), [mim:minimumwaardeExclusief](#minimumwaardeExclusief), [mim:minimumwaardeInclusief](#minimumwaardeInclusief), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:mogelijkGeenWaarde](#mogelijkGeenWaarde), [mim:naam](#naam), [mim:patroon](#patroon), [mim:toelichting](#toelichting), [mim:type](#type)|

### mim:Codelijst {#Codelijst}

|URI|http://modellen.mim-standaard.nl/def/mim#Codelijst|
|-|-|
|Specialisatie van|[mim:Datatype](#Datatype)|
|Definitie|De representatie van een lijst met een opsomming van de mogelijke domeinwaarden van een attribuutsoort, die buiten het model in een externe waardenlijst worden beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel aangepast wordt (in tegenstelling tot bij een enumeratie). De representatie bevat geen kenmerken, voor alle kenmerken wordt verwezen naar de specificatie van de externe waardelijst.|
|Bron|[Sectie 2.4.5 Codelijst](https://docs.geostandaarden.nl/mim/mim/#codelijst)|
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:locatie](#locatie), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:Constraint {#Constraint}

|URI|http://modellen.mim-standaard.nl/def/mim#Constraint|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een constraint is een conditie of een beperking, die over een of meerdere modelelementen uit het informatiemodel geldt.|
|Bron||
|Eigenschappen|[mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:specificatieFormeel](#specificatieFormeel), [mim:specificatieTekst](#specificatieTekst)|

### mim:DataElement {#DataElement}

|URI|http://modellen.mim-standaard.nl/def/mim#DataElement|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een onderdeel/element van een Gestructureerd datatype die als type een datatype heeft.|
|Bron|[Sectie 2.5.3 Gestructureerd datatype](https://docs.geostandaarden.nl/mim/mim/#data-element)|
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:formeelPatroon](#formeelPatroon), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:lengte](#lengte), [mim:maximumwaardeExclusief](#maximumwaardeExclusief), [mim:maximumwaardeInclusief](#maximumwaardeInclusief), [mim:minimumwaardeExclusief](#minimumwaardeExclusief), [mim:minimumwaardeInclusief](#minimumwaardeInclusief), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:patroon](#patroon), [mim:toelichting](#toelichting), [mim:type](#type)|

### mim:Datatype {#Datatype}

|URI|http://modellen.mim-standaard.nl/def/mim#Datatype|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een beschrijving van de structuur waaraan een waarde, oftewel de data zelf, aan moet voldoen.|
|Bron|[Sectie 2.5 Datatypen](https://docs.geostandaarden.nl/mim/mim/#datatypen-0)|

### mim:Domein {#Domein}

|URI|http://modellen.mim-standaard.nl/def/mim#Domein|
|-|-|
|Specialisatie van|[mim:Package](#Package)|
|Definitie|Een groepering van constructies die een semantisch samenhangend gedeelte van een informatiemodel beschrijven.|
|Bron|[Sectie 2.6.2 Domein](https://docs.geostandaarden.nl/mim/mim/#domein)|
|Eigenschappen|[mim:alias](#alias), [mim:basisUri](#basisUri), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam)|

### mim:Enumeratie {#Enumeratie}

|URI|http://modellen.mim-standaard.nl/def/mim#Enumeratie|
|-|-|
|Specialisatie van|[mim:Datatype](#Datatype)|
|Definitie|Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een statische lijst.|
|Bron|[Sectie 2.4.3 Enumeratie](https://docs.geostandaarden.nl/mim/mim/#enumeratie)|
|Eigenschappen|[mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting), [mim:waarde](#waarde)|

### mim:Enumeratiewaarde {#Enumeratiewaarde}

|URI|http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant gegeven.|
|Bron|[Sectie 2.4.4 Enumeratiewaarde](https://docs.geostandaarden.nl/mim/mim/#enumeratiewaarde)|
|Eigenschappen|[mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:code](#code), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:Extern {#Extern}

|URI|http://modellen.mim-standaard.nl/def/mim#Extern|
|-|-|
|Specialisatie van|[mim:Package](#Package)|
|Definitie|Een groepering van constructies die een externe instantie beheert en beschikbaar stelt aan een informatiemodel en die in het informatiemodel ongewijzigd gebruikt worden.|
|Bron|[Sectie 2.6.3 Extern](https://docs.geostandaarden.nl/mim/mim/#extern)|
|Eigenschappen|[mim:basisUri](#basisUri), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:locatie](#locatie), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:ExterneKoppeling {#ExterneKoppeling}

|URI|http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een associatie waarmee vanuit het perspectief van het eigen informatiemodel een objecttype uit het ‘eigen’ informatiemodel gekoppeld wordt aan een objecttype van een extern informatiemodel. De relatie zelf hoort bij het ‘eigen’ objecttype.|
|Bron|[Sectie 2.3.4 Externe koppeling](https://docs.geostandaarden.nl/mim/mim/#externe-koppeling)|
|Eigenschappen|[mim:aggregatietype](#aggregatietype), [mim:alias](#alias), [mim:authentiek](#authentiek), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:bron](#bron), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:doel](#doel), [mim:heeftTijdlijnGeldigheid](#heeftTijdlijnGeldigheid), [mim:heeftTijdlijnRegistratie](#heeftTijdlijnRegistratie), [mim:herkomst](#herkomst), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:indicatieAfleidbaar](#indicatieAfleidbaar), [mim:indicatieFormeleHistorie](#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](#indicatieMaterieleHistorie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:mogelijkGeenWaarde](#mogelijkGeenWaarde), [mim:naam](#naam), [mim:toelichting](#toelichting), [mim:unidirectioneel](#unidirectioneel)|

### mim:Gegevensgroep {#Gegevensgroep}

|URI|http://modellen.mim-standaard.nl/def/mim#Gegevensgroep|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een typering van een groep van gelijksoortige gegevens die voor een objecttype van toepassing is.|
|Bron|[Sectie 2.2.3 Gegevensgroep](https://docs.geostandaarden.nl/mim/mim/#gegevensgroep)|
|Eigenschappen|[mim:alias](#alias), [mim:authentiek](#authentiek), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:gegevensgroeptype](#gegevensgroeptype), [mim:herkomst](#herkomst), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:Gegevensgroeptype {#Gegevensgroeptype}

|URI|http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een groep van met elkaar samenhangende attribuutsoorten. Een gegevensgroeptype is altijd een type van een gegevensgroep.|
|Bron|[Sectie 2.2.4 Gegevensgroeptype](https://docs.geostandaarden.nl/mim/mim/#gegevensgroeptype)|
|Eigenschappen|[](http://www.w3.org/1999/02/22-rdf-syntax-ns#type), [mim:alias](#alias), [mim:attribuut](#attribuut), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:gegevensgroep](#gegevensgroep), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:Generalisatie {#Generalisatie}

|URI|http://modellen.mim-standaard.nl/def/mim#Generalisatie|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|De typering van het hiërarchische verband tussen een meer generiek en een meer specifiek modelelement van hetzelfde soort, waarbij het meer specifieke modelelement eigenschappen van het meer generieke modelelement overerft. Dit verband is alleen gedefinieerd voor objecttypen en datatypen.|
|Bron|[Sectie 2.3.1 Generalisatie](https://docs.geostandaarden.nl/mim/mim/#generalisatie)|
|Eigenschappen|[mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:mixin](#mixin), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:subtype](#subtype), [mim:supertype](#supertype)|

### mim:GestructureerdDatatype {#GestructureerdDatatype}

|URI|http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype|
|-|-|
|Specialisatie van|[mim:Datatype](#Datatype)|
|Definitie|Specifiek benoemd datatype dat de structuur van een gegeven beschrijft, samengesteld uit minimaal twee elementen die in samenhang betekenisvol zijn.|
|Bron|[Sectie 2.5.2 Gestructureerd datatype](https://docs.geostandaarden.nl/mim/mim/#gestructureerd-datatype)|
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:dataElement](#dataElement), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:formeelPatroon](#formeelPatroon), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:patroon](#patroon), [mim:toelichting](#toelichting)|

### mim:Informatiemodel {#Informatiemodel}

|URI|http://modellen.mim-standaard.nl/def/mim#Informatiemodel|
|-|-|
|Specialisatie van|[mim:Package](#Package)|
|Definitie|De groepering van alle modelelementen waaruit het informatiemodel is opgebouwd. Het informatiemodel als geheel.|
|Bron|[Sectie 2.6.1 Informatiemodel](https://docs.geostandaarden.nl/mim/mim/#informatiemodel)|
|Eigenschappen|[mim:alias](#alias), [mim:basisUri](#basisUri), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:informatiedomein](#informatiedomein), [mim:informatiemodeltype](#informatiemodeltype), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:mimextensie](#mimextensie), [mim:mimtaal](#mimtaal), [mim:mimversie](#mimversie), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:relatiemodelleringstype](#relatiemodelleringstype), [mim:tekstopmaak](#tekstopmaak)|

### mim:Keuze {#Keuze}

|URI|http://modellen.mim-standaard.nl/def/mim#Keuze|
|-|-|
|Specialisatie van|[mim:Datatype](#Datatype)|
|Definitie|Een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.|
|Bron||
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:Keuzeconstraint {#KeuzeConstraint}

|URI|http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint|
|-|-|
|Specialisatie van|[mim:Constraint](#Constraint)|
|Definitie|Een conditie met een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.|
|Bron||
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelement](#modelelement), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:Modelelement {#Modelelement}

|URI|http://modellen.mim-standaard.nl/def/mim#Modelelement|
|-|-|
|Definitie|Een modelelement uit het Metamodel voor Informatie Modellering (MIM)|

### mim:Objecttype {#Objecttype}

|URI|http://modellen.mim-standaard.nl/def/mim#Objecttype|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|De typering van een groep objecten die binnen een domein relevant zijn en als gelijksoortig worden beschouwd.|
|Bron|[Sectie 2.2.1 Objecttype](https://docs.geostandaarden.nl/mim/mim/#objecttype)|
|Eigenschappen|[](http://www.w3.org/1999/02/22-rdf-syntax-ns#type), [mim:alias](#alias), [mim:attribuut](#attribuut), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:gegevensgroep](#gegevensgroep), [mim:herkomst](#herkomst), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:indicatieAbstractObject](#indicatieAbstractObject), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kwaliteit](#kwaliteit), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:populatie](#populatie), [mim:toelichting](#toelichting)|

### mim:Package {#Package}

|URI|http://modellen.mim-standaard.nl/def/mim#Package|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een package is een benoemde en begrensde verzameling/groepering van modelelementen.|
|Bron|[Sectie 2.6 Packages](https://docs.geostandaarden.nl/mim/mim/#packages)|
|Eigenschappen|[mim:alias](#alias), [mim:basisUri](#basisUri), [mim:bevatModelelement](#bevatModelelement), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam)|

### mim:PrimitiefDatatype {#PrimitiefDatatype}

|URI|http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype|
|-|-|
|Specialisatie van|[mim:Datatype](#Datatype)|
|Definitie|Een primitief datatype is een datatype met een eenvoudige basisstructuur, oftewel enkelvoudig en zonder gelaagdheid.|
|Bron|[Sectie 2.5.1 Primitief datatype](https://docs.geostandaarden.nl/mim/mim/#primitief-datatype)|
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:formeelPatroon](#formeelPatroon), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:lengte](#lengte), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:patroon](#patroon), [mim:toelichting](#toelichting)|

### mim:ReferentieElement {#ReferentieElement}

|URI|http://modellen.mim-standaard.nl/def/mim#ReferentieElement|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|Een eigenschap van een object in een referentielijst in de vorm van een gegeven.|
|Bron|[Sectie 2.4.2 Referentie element](https://docs.geostandaarden.nl/mim/mim/#referentie-element)|
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:eenheid](#eenheid), [mim:formeelPatroon](#formeelPatroon), [mim:identificerend](#identificerend), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:lengte](#lengte), [mim:maximumwaardeExclusief](#maximumwaardeExclusief), [mim:maximumwaardeInclusief](#maximumwaardeInclusief), [mim:minimumwaardeExclusief](#minimumwaardeExclusief), [mim:minimumwaardeInclusief](#minimumwaardeInclusief), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:patroon](#patroon), [mim:toelichting](#toelichting), [mim:type](#type)|

### mim:Referentielijst {#Referentielijst}

|URI|http://modellen.mim-standaard.nl/def/mim#Referentielijst|
|-|-|
|Specialisatie van|[mim:Datatype](#Datatype)|
|Definitie|De representatie van een lijst met een opsomming van de mogelijke domeinwaarden van een attribuutsoort, die buiten het model in een externe waardenlijst worden beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel aangepast wordt (in tegenstelling tot bij een enumeratie). De representatie bevat een aantal kenmerken, die overgenomen zijn van de specificatie van de externe waardelijst.|
|Bron|[Sectie 2.4.1 Referentielijst](https://docs.geostandaarden.nl/mim/mim/#referentielijst)|
|Eigenschappen|[mim:alias](#alias), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:locatie](#locatie), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:referentieElement](#referentieElement), [mim:toelichting](#toelichting)|

### mim:Relatieklasse {#Relatieklasse}

|URI|http://modellen.mim-standaard.nl/def/mim#Relatieklasse|
|-|-|
|Specialisatie van|[mim:Relatiesoort](#Relatiesoort)|
|Definitie|Een relatiesoort met eigenschappen.|
|Bron|[Sectie 2.3.3 Relatieklasse](https://docs.geostandaarden.nl/mim/mim/#relatieklasse)|
|Eigenschappen|[mim:aggregatietype](#aggregatietype), [mim:alias](#alias), [mim:attribuut](#attribuut), [mim:authentiek](#authentiek), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:gegevensgroep](#gegevensgroep), [mim:heeftTijdlijnGeldigheid](#heeftTijdlijnGeldigheid), [mim:heeftTijdlijnRegistratie](#heeftTijdlijnRegistratie), [mim:herkomst](#herkomst), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:indicatieAfleidbaar](#indicatieAfleidbaar), [mim:indicatieFormeleHistorie](#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](#indicatieMaterieleHistorie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:mogelijkGeenWaarde](#mogelijkGeenWaarde), [mim:naam](#naam), [mim:toelichting](#toelichting), [mim:unidirectioneel](#unidirectioneel)|

### mim:RelatierolBron {#RelatierolBron}

|URI|http://modellen.mim-standaard.nl/def/mim#RelatierolBron|
|-|-|
|Specialisatie van|[mim:Relatierol](#Relatierol)|
|Definitie|De relatierol die de rol beschrijft van de bron van de relatie.|
|Bron|[Sectie 2.3.5 Relatierol](https://docs.geostandaarden.nl/mim/mim/#relatierol)|
|Eigenschappen|[mim:bron](#bron)|

### mim:RelatierolDoel {#RelatierolDoel}

|URI|http://modellen.mim-standaard.nl/def/mim#RelatierolDoel|
|-|-|
|Specialisatie van|[mim:Relatierol](#Relatierol)|
|Definitie|De relatierol die de rol beschrijft van het doel van de relatie.|
|Bron|[Sectie 2.3.5 Relatierol](https://docs.geostandaarden.nl/mim/mim/#relatierol)|
|Eigenschappen|[mim:doel](#doel)|

### mim:Relatierol {#Relatierol}

|URI|http://modellen.mim-standaard.nl/def/mim#Relatierol|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|De benaming van de manier waarop een object deelneemt aan een relatie met een ander object.|
|Bron|[Sectie 2.3.5 Relatierol](https://docs.geostandaarden.nl/mim/mim/#relatierol)|
|Eigenschappen|[mim:alias](#alias), [mim:authentiek](#authentiek), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:heeftTijdlijnGeldigheid](#heeftTijdlijnGeldigheid), [mim:heeftTijdlijnRegistratie](#heeftTijdlijnRegistratie), [mim:herkomst](#herkomst), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:identificerend](#identificerend), [mim:indicatieFormeleHistorie](#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](#indicatieMaterieleHistorie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:mogelijkGeenWaarde](#mogelijkGeenWaarde), [mim:naam](#naam), [mim:toelichting](#toelichting)|

### mim:Relatiesoort {#Relatiesoort}

|URI|http://modellen.mim-standaard.nl/def/mim#Relatiesoort|
|-|-|
|Specialisatie van|[mim:Modelelement](#Modelelement)|
|Definitie|De typering van het structurele verband tussen een object van een objecttype en een (ander) object van een ander (of hetzelfde) objecttype.|
|Bron|[Sectie 2.3.2 Relatiesoort](https://docs.geostandaarden.nl/mim/mim/#relatiesoort)|
|Eigenschappen|[mim:aggregatietype](#aggregatietype), [mim:alias](#alias), [mim:authentiek](#authentiek), [mim:begrip](#begrip), [mim:begripsterm](#begripsterm), [mim:bron](#bron), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:doel](#doel), [mim:heeftTijdlijnGeldigheid](#heeftTijdlijnGeldigheid), [mim:heeftTijdlijnRegistratie](#heeftTijdlijnRegistratie), [mim:herkomst](#herkomst), [mim:herkomstDefinitie](#herkomstDefinitie), [mim:identificerend](#identificerend), [mim:indicatieAfleidbaar](#indicatieAfleidbaar), [mim:indicatieFormeleHistorie](#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](#indicatieMaterieleHistorie), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:kardinaliteit](#kardinaliteit), [mim:kardinaliteitRelatieBron](#kardinaliteitRelatieBron), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:mogelijkGeenWaarde](#mogelijkGeenWaarde), [mim:naam](#naam), [mim:relatierol](#relatierol), [mim:toelichting](#toelichting), [mim:unidirectioneel](#unidirectioneel)|

### mim:View {#View}

|URI|http://modellen.mim-standaard.nl/def/mim#View|
|-|-|
|Specialisatie van|[mim:Package](#Package)|
|Definitie|Een groepering van objecttypen die gespecificeerd zijn in een extern informatiemodel en vanuit het perspectief van het eigen informatiemodel inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het eigen informatiemodel.|
|Bron|[Sectie 2.6.4 View](https://docs.geostandaarden.nl/mim/mim/#view)|
|Eigenschappen|[mim:basisUri](#basisUri), [mim:constraint](#constraint), [mim:datumOpname](#datumOpname), [mim:definitie](#definitie), [mim:herkomst](#herkomst), [mim:isGedefinieerdIn](#isGedefinieerdIn), [mim:locatie](#locatie), [mim:modelelementidentificatie](#modelelementidentificatie), [mim:naam](#naam), [mim:toelichting](#toelichting)|

## Eigenschappen (bindingen)

### mim:aggregatietype {#aggregatietype}

|URI|http://modellen.mim-standaard.nl/def/mim#aggregatietype|
|-|-|
|Definitie|Aanduiding of het objecttype die de eigenaar is van een relatie het doel van relatie ziet als een samen te voegen onderdeel die bij het objecttype hoort.|
|Bron|[Sectie 2.8.2.21 Metagegeven: aggregatietype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-aggregatietype)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |
|Mogelijke waarden|[Geen](http://modellen.mim-standaard.nl/def/mim#Geen)[Gedeeld](http://modellen.mim-standaard.nl/def/mim#Gedeeld)[Compositie](http://modellen.mim-standaard.nl/def/mim#Compositie)|

### mim:attribuut {#attribuut}

|URI|http://modellen.mim-standaard.nl/def/mim#attribuut|
|-|-|
|Definitie|De binding van een attribuutsoort als eigenschap aan een objecttype.|
|Bron|[Sectie 2.8.4.1 Metagegeven: heeft attribuut](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-attribuut)|
|Eigenschap van|[mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Objecttype](#Objecttype), [mim:Relatieklasse](#Relatieklasse), |
|Gerelateerde klasse|[mim:Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|

### attribuutkeuze {#attribuutkeuze}

|URI|http://modellen.mim-standaard.nl/def/mim#attribuutkeuze|
|-|-|
|Definitie|De binding van een keuze uit attributen aan een attribuutsoort of keuze.|
|Bron|[Sectie 2.8.4.12 Metagegeven: heeft keuzeattribuut](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-keuzeattribuut)|
|Eigenschap van||

### mim:authentiek {#authentiek}

|URI|http://modellen.mim-standaard.nl/def/mim#authentiek|
|-|-|
|Definitie|Aanduiding of het kenmerk een authentiek gegeven betreft.|
|Bron|[Sectie 2.8.2.14 Metagegeven: authentiek](https://docs.geostandaarden.nl/mim/mim/#metagegeven-authentiek)|
|Eigenschap van|[mim:Gegevensgroep](#Gegevensgroep), [mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |
|Mogelijke waarden|[Authentiek](http://modellen.mim-standaard.nl/def/mim#Authentiek)[Overige authenticiteit](http://modellen.mim-standaard.nl/def/mim#OverigeAuthenticiteit)[Wettelijk gegeven](http://modellen.mim-standaard.nl/def/mim#WettelijkGegeven)[Basisgegeven](http://modellen.mim-standaard.nl/def/mim#Basisgegeven)[LandelijkKerngegeven](http://modellen.mim-standaard.nl/def/mim#LandelijkKerngegeven)|

### mim:begrip {#begrip}

|URI|http://modellen.mim-standaard.nl/def/mim#begrip|
|-|-|
|Definitie|Verwijzing naar een begrip, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.|
|Bron|[Sectie 2.8.2.3 Metagegeven: begrip](https://docs.geostandaarden.nl/mim/mim/#metagegeven-begrip)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Codelijst](#Codelijst), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |
|Gerelateerde klasse||

### mim:bevatModelelement {#bevatModelelement}

|URI|http://modellen.mim-standaard.nl/def/mim#bevatModelelement|
|-|-|
|Eigenschap van|[mim:Package](#Package), |
|Gerelateerde klasse|[mim:Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|

### mim:bron {#bron}

|URI|http://modellen.mim-standaard.nl/def/mim#bron|
|-|-|
|Definitie|Aanduiding van het bronobject in een relatie tussen objecten. Een bronobject heeft middels een relatiesoort een relatie met een doelobject.|
|Bron|[Sectie 2.8.2.18 Metagegeven: bron](https://docs.geostandaarden.nl/mim/mim/#metagegeven-bron)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:RelatierolBron](#RelatierolBron), [mim:ExterneKoppeling](#ExterneKoppeling), |

### mim:constraint {#constraint}

|URI|http://modellen.mim-standaard.nl/def/mim#constraint|
|-|-|
|Definitie|De binding van een constraint aan een modelelement.|
|Bron|[Sectie 2.8.4.14 Metagegeven: heeft constraint](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-constraint)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Generalisatie](#Generalisatie), [mim:Domein](#Domein), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Extern](#Extern), [mim:Relatierol](#Relatierol), [mim:Enumeratie](#Enumeratie), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Informatiemodel](#Informatiemodel), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |
|Gerelateerde klasse|[mim:Constraint](http://modellen.mim-standaard.nl/def/mim#Constraint)|

### mim:dataElement {#dataElement}

|URI|http://modellen.mim-standaard.nl/def/mim#dataElement|
|-|-|
|Definitie|De binding van een data element aan een gestructureerd datatype.|
|Bron|[Sectie 2.8.4.8 Metagegeven: heeft data element](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-data-element)|
|Eigenschap van|[mim:GestructureerdDatatype](#GestructureerdDatatype), |
|Gerelateerde klasse|[mim:DataElement](http://modellen.mim-standaard.nl/def/mim#DataElement)|

### datatypekeuze {#datatypekeuze}

|URI|http://modellen.mim-standaard.nl/def/mim#datatypekeuze|
|-|-|
|Definitie|De binding van een keuze uit datatypen aan een attribuutsoort.|
|Bron|[Sectie 2.8.4.11 Metagegeven: heeft datatypekeuze](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-datatypekeuze)|
|Eigenschap van||

### mim:doel {#doel}

|URI|http://modellen.mim-standaard.nl/def/mim#doel|
|-|-|
|Definitie|Aanduiding van het gerelateerde objecttype die het eindpunt van de relatie aangeeft. Naar objecten van dit objecttype wordt verwezen.|
|Bron|[Sectie 2.8.2.19 Metagegeven: doel](https://docs.geostandaarden.nl/mim/mim/#metagegeven-doel)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:RelatierolDoel](#RelatierolDoel), [mim:ExterneKoppeling](#ExterneKoppeling), |
|Gerelateerde klasse|[mim:Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)|

### doelkeuze {#doelkeuze}

|URI|http://modellen.mim-standaard.nl/def/mim#doelkeuze|
|-|-|
|Definitie|De binding van een keuze uit relatiedoelen aan een objecttype.|
|Bron|[Sectie 2.8.4.13 Metagegeven: heeft keuzerelatiedoel](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-keuzerelatiedoel)|
|Eigenschap van||

### mim:eenheid {#eenheid}

|URI|http://modellen.mim-standaard.nl/def/mim#eenheid|
|-|-|
|Definitie|Aanduiding van de eenheid die bij een meting of waarneming hoort.|
|Bron||
|Eigenschap van|[mim:ReferentieElement](#ReferentieElement), [mim:Attribuutsoort](#Attribuutsoort), |

### equivalent {#equivalent}

|URI|http://modellen.mim-standaard.nl/def/mim#equivalent|
|-|-|
|Definitie|Geeft aan dat een mim metamodel-element equivalent is met een meta-element uit een Linked Data vocabulaire|
|Eigenschap van||

### mim:gegevensgroep {#gegevensgroep}

|URI|http://modellen.mim-standaard.nl/def/mim#gegevensgroep|
|-|-|
|Definitie|De binding van een gegevensgroep als groep van eigenschappen aan een objecttype of gegevensgroeptype.|
|Bron|[Sectie 2.8.4.2 Metagegeven: heeft gegevensgroep](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-gegevensgroep)|
|Eigenschap van|[mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Objecttype](#Objecttype), [mim:Relatieklasse](#Relatieklasse), |
|Gerelateerde klasse|[mim:Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)|

### mim:gegevensgroeptype {#gegevensgroeptype}

|URI|http://modellen.mim-standaard.nl/def/mim#gegevensgroeptype|
|-|-|
|Definitie|De binding van een gegevensgroeptype als waardetype aan een gegevensgroep.|
|Bron|[Sectie 2.8.4.3 Metagegeven: heeft gegevensgroeptype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-gegevensgroeptype)|
|Eigenschap van|[mim:Gegevensgroep](#Gegevensgroep), |
|Gerelateerde klasse|[mim:Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)|

### mim:modelelement {#modelelement}

|URI|http://modellen.mim-standaard.nl/def/mim#modelelement|
|-|-|
|Eigenschap van|[mim:Keuzeconstraint](#KeuzeConstraint), |
|Gerelateerde klasse|[mim:Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)|

### mim:referentieElement {#referentieElement}

|URI|http://modellen.mim-standaard.nl/def/mim#referentieElement|
|-|-|
|Definitie|De binding van een referentie element aan een referentielijst.|
|Bron|[Sectie 2.8.4.10 Metagegeven: bevat referentie element](https://docs.geostandaarden.nl/mim/mim/#metagegeven-bevat-referentie-element)|
|Eigenschap van|[mim:Referentielijst](#Referentielijst), |
|Gerelateerde klasse|[mim:ReferentieElement](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)|

### mim:relatiemodelleringstype {#relatiemodelleringstype}

|URI|http://modellen.mim-standaard.nl/def/mim#relatiemodelleringstype|
|-|-|
|Definitie|Aanduiding van een in MIM gedefinieerd alternatief voor een modelleringswijze, en welke keuze hierbij is gemaakt.|
|Bron|[Sectie 2.8.1.3 Metagegeven: relatiemodelleringstype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-relatiemodelleringstype)|
|Eigenschap van|[mim:Informatiemodel](#Informatiemodel), |
|Mogelijke waarden|[Relatiesoort leidend](http://modellen.mim-standaard.nl/def/mim#RelatiesoortLeidend)[Relatierol leidend](http://modellen.mim-standaard.nl/def/mim#RelatierolLeidend)|

### mim:relatierol {#relatierol}

|URI|http://modellen.mim-standaard.nl/def/mim#relatierol|
|-|-|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), |
|Gerelateerde klasse|[mim:Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### mim:subtype {#subtype}

|URI|http://modellen.mim-standaard.nl/def/mim#subtype|
|-|-|
|Definitie|Het objecttype dat een specialisatie is van een (ander) objecttype.|
|Eigenschap van|[mim:Generalisatie](#Generalisatie), |

### mim:supertype {#supertype}

|URI|http://modellen.mim-standaard.nl/def/mim#supertype|
|-|-|
|Definitie|De binding van een supertype aan een subtype middels een generalisatie.|
|Bron|[Sectie 2.8.4.4 Metagegeven: verwijst naar supertype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-verwijst-naar-supertype)|
|Eigenschap van|[mim:Generalisatie](#Generalisatie), |

### mim:type {#type}

|URI|http://modellen.mim-standaard.nl/def/mim#type|
|-|-|
|Definitie|Het datatype waarmee waarden van dit modelelement worden vastgelegd.|
|Bron|[Sectie 2.8.2.27 Metagegeven: type](https://docs.geostandaarden.nl/mim/mim/#metagegeven-type-domein-van-een-waarde-een-gegeven)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:Attribuutsoort](#Attribuutsoort), |
|Gerelateerde klasse|[mim:Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|

### mim:waarde {#waarde}

|URI|http://modellen.mim-standaard.nl/def/mim#waarde|
|-|-|
|Definitie|De binding van een enumeratiewaarde aan een enumeratie.|
|Bron|[Sectie 2.8.4.9 Metagegeven: bevat enumeratiewaarde](https://docs.geostandaarden.nl/mim/mim/#metagegeven-bevat-enumeratiewaarde)|
|Eigenschap van|[mim:Enumeratie](#Enumeratie), |
|Gerelateerde klasse|[mim:Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)|

## Eigenschappen (metagegevens)

### mim:basisUri {#basisUri}

|URI|http://modellen.mim-standaard.nl/def/mim#basisUri|
|-|-|
|Definitie|De standaard basis-URI voor elk element in dit informatiemodel.|
|Bron|[Metagegeven: Basis-URI](https://docs.geostandaarden.nl/mim/mim/#metagegeven-basis-uri)|
|Datatype|[anyURI](http://www.w3.org/2001/XMLSchema#anyURI)|
|Eigenschap van|[mim:Domein](#Domein), [mim:Extern](#Extern), [mim:Informatiemodel](#Informatiemodel), [mim:View](#View), [mim:Package](#Package), |

### mim:indicatieFormeleHistorie {#indicatieFormeleHistorie}

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie|
|-|-|
|Definitie|Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is.|
|Bron|[Sectie 2.8.2.11 Metagegeven: indicatie formele historie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-formele-historie)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |

### mim:indicatieMaterieleHistorie {#indicatieMaterieleHistorie}

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie|
|-|-|
|Definitie|Indicatie of de materiële historie van het kenmerk van het object te bevragen is.|
|Bron|[Sectie 2.8.2.10 Metagegeven: indicatie materiële historie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-materiele-historie)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |

### mim:mimextensie {#mimextensie}

|URI|http://modellen.mim-standaard.nl/def/mim#mimextensie|
|-|-|
|Definitie|De aanduiding van een extensie op MIM.|
|Bron||
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Informatiemodel](#Informatiemodel), |

### mim:mimtaal {#mimtaal}

|URI|http://modellen.mim-standaard.nl/def/mim#mimtaal|
|-|-|
|Definitie|De aanduiding van de taal die gebruikt is voor de modelelementen.|
|Bron||
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Informatiemodel](#Informatiemodel), |

### mim:mimversie {#mimversie}

|URI|http://modellen.mim-standaard.nl/def/mim#mimversie|
|-|-|
|Definitie|De versie van de MIM specificatie die gebruikt is om het informatiemodel in uit te drukken.|
|Bron||
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Informatiemodel](#Informatiemodel), |

### mim:modelelementidentificatie {#modelelementidentificatie}

|URI|http://modellen.mim-standaard.nl/def/mim#modelelementidentificatie|
|-|-|
|Definitie|De identificatie van een modelelement.|
|Bron|[Metagegeven: Modelelementidentificatie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-modelelementidentificatie)|
|Datatype|[anyURI](http://www.w3.org/2001/XMLSchema#anyURI)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Generalisatie](#Generalisatie), [mim:Domein](#Domein), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Constraint](#Constraint), [mim:Extern](#Extern), [mim:Relatierol](#Relatierol), [mim:Enumeratie](#Enumeratie), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Informatiemodel](#Informatiemodel), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Package](#Package), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:isGedefinieerdIn {#isGedefinieerdIn}

|URI|http://modellen.mim-standaard.nl/def/mim#isGedefinieerdIn|
|-|-|
|Definitie|De package waarin het modelelement gedefinieerd is.|
|Bron|[Metagegeven: is gedefinieerd in](https://docs.geostandaarden.nl/mim/mim/#metagegeven-is-gedefinieerd-in)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Generalisatie](#Generalisatie), [mim:Domein](#Domein), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Constraint](#Constraint), [mim:Extern](#Extern), [mim:Relatierol](#Relatierol), [mim:Enumeratie](#Enumeratie), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Informatiemodel](#Informatiemodel), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Package](#Package), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:tekstopmaak {#tekstopmaak}

|URI|http://modellen.mim-standaard.nl/def/mim#tekstopmaak|
|-|-|
|Definitie|De specificatie van de opmaak van een tekstuele beschrijving in het model.|
|Bron|[Metagegeven: Tekstopmaak](https://docs.geostandaarden.nl/mim/mim/#metagegeven-teksopmaak)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Informatiemodel](#Informatiemodel), |

### mim:alias {#alias}

|URI|http://modellen.mim-standaard.nl/def/mim#alias|
|-|-|
|Definitie|De weergave van de naam van een modelelement in natuurlijke taal (niet technisch).|
|Bron|[Sectie 2.8.2.2 Metagegeven: alias](https://docs.geostandaarden.nl/mim/mim/#metagegeven-alias)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Domein](#Domein), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Informatiemodel](#Informatiemodel), [mim:Codelijst](#Codelijst), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Package](#Package), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:begripsterm {#begripsterm}

|URI|http://modellen.mim-standaard.nl/def/mim#begripsterm|
|-|-|
|Definitie|Verwijzing naar een begrip in de vorm van een term, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.|
|Bron|[Sectie 2.8.2.3 Metagegeven: begrip](https://docs.geostandaarden.nl/mim/mim/#metagegeven-begrip)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Codelijst](#Codelijst), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:code {#code}

|URI|http://modellen.mim-standaard.nl/def/mim#code|
|-|-|
|Definitie|De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code|
|Bron|[Sectie 2.8.2.31 Metagegeven: code](https://docs.geostandaarden.nl/mim/mim/#metagegeven-code)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Enumeratiewaarde](#Enumeratiewaarde), |

### mim:datumOpname {#datumOpname}

|URI|http://modellen.mim-standaard.nl/def/mim#datumOpname|
|-|-|
|Definitie|De datum waarop het modelelement is opgenomen in het informatiemodel.|
|Bron|[Sectie 2.8.2.8 Metagegeven: datum opname](https://docs.geostandaarden.nl/mim/mim/#metagegeven-datum-opname)|
|Datatype|[date](http://www.w3.org/2001/XMLSchema#date)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Generalisatie](#Generalisatie), [mim:Domein](#Domein), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Extern](#Extern), [mim:Relatierol](#Relatierol), [mim:Enumeratie](#Enumeratie), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Informatiemodel](#Informatiemodel), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:definitie {#definitie}

|URI|http://modellen.mim-standaard.nl/def/mim#definitie|
|-|-|
|Definitie|De beschrijving van de betekenis van dit modelelement.|
|Bron|[Sectie 2.8.2.5 Metagegeven: definitie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-definitie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string), [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Relatierol](#Relatierol), [mim:DataElement](#DataElement), [mim:Gegevensgroep](#Gegevensgroep), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Extern](#Extern), [mim:Enumeratie](#Enumeratie), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:formeelPatroon {#formeelPatroon}

|URI|http://modellen.mim-standaard.nl/def/mim#formeelPatroon|
|-|-|
|Definitie|Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door de computer wordt herkend.|
|Bron|[Sectie 2.8.2.30 Metagegeven: formeel patroon](https://docs.geostandaarden.nl/mim/mim/#metagegeven-formeel-patroon)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:GestructureerdDatatype](#GestructureerdDatatype), |

### mim:heeftTijdlijnGeldigheid {#heeftTijdlijnGeldigheid}

|URI|http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnGeldigheid|
|-|-|
|Definitie|Indicatie of voor dit kenmerk een tijdlijn geldigheid bijgehouden wordt en te bevragen is.|
|Bron|[Metagegeven: heeft tijdlijn geldigheid](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-tijdlijn-geldigheid)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |

### mim:heeftTijdlijnRegistratie {#heeftTijdlijnRegistratie}

|URI|http://modellen.mim-standaard.nl/def/mim#heeftTijdlijnRegistratie|
|-|-|
|Definitie|Indicatie of voor dit kenmerk een tijdlijn registratie bijgehouden wordt en te bevragen is.|
|Bron|[Metagegeven: heeft tijdlijn registratie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-tijdlijn-registratie)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |

### mim:herkomstDefinitie {#herkomstDefinitie}

|URI|http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie|
|-|-|
|Definitie|De registratie of het informatiemodel waaruit de definitie is overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de definitie is samengesteld.|
|Bron|[Sectie 2.8.2.6 Metagegeven: herkomst definitie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-herkomst-definitie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string), [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:Gegevensgroep](#Gegevensgroep), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Gegevensgroeptype](#Gegevensgroeptype), |

### mim:herkomst {#herkomst}

|URI|http://modellen.mim-standaard.nl/def/mim#herkomst|
|-|-|
|Definitie|De registratie of het informatiemodel waaraan het modelelement ontleend is dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is.|
|Bron|[Sectie 2.8.2.4 Metagegeven: naam](https://docs.geostandaarden.nl/mim/mim/#metagegeven-naam)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:Gegevensgroep](#Gegevensgroep), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Extern](#Extern), [mim:Relatierol](#Relatierol), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:identificerend {#identificerend}

|URI|http://modellen.mim-standaard.nl/def/mim#identificerend|
|-|-|
|Definitie|Een aanduiding dat een kenmerk of een combinatie van kenmerken van een objecttype uniek identificerend is voor alle objecten in de populatie van objecten van dit objecttype, of de aanduiding dat een referentie element uniek identificerend is voor alle lijst items in een referentielijst.|
|Bron|[Sectie 2.8.2.9 Metagegeven: identificerend](https://docs.geostandaarden.nl/mim/mim/#metagegeven-identificerend)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), |

### mim:indicatieAbstractObject {#indicatieAbstractObject}

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieAbstractObject|
|-|-|
|Definitie|Een indicatie die aangeeft of er objecten kunnen bestaan die getypeerd worden als zijnde objecten (instanties) van alleen dit objecttype. Een abstract objecttype moet altijd de generalisatie zijn van één of meerdere objecttypes die niet abstract zijn.|
|Bron|[Sectie 2.8.2.32 Metagegeven: indicatie abstract object](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-abstract-object)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Objecttype](#Objecttype), |

### mim:indicatieAfleidbaar {#indicatieAfleidbaar}

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar|
|-|-|
|Definitie|Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of relatiesoorten.|
|Bron|[Sectie 2.8.2.15 Metagegeven: indicatie afleidbaar](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-afleidbaar)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |

### mim:indicatieClassificerend {#indicatieClassificerend}

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieClassificerend|
|-|-|
|Definitie|Indicatie dat een attribuutsoort het objecttype waar het bij hoort classificeert in (sub)typen.|
|Bron|[Sectie 2.8.2.16 Metagegeven: identificatie classificerend](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-classificerend)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Attribuutsoort](#Attribuutsoort), |

### mim:informatiedomein {#informatiedomein}

|URI|http://modellen.mim-standaard.nl/def/mim#informatiedomein|
|-|-|
|Definitie|Aanduiding van het functionele domein waartoe het informatiemodel behoort.|
|Bron|[Sectie 2.8.1.1 Metagegeven: informatiedomein](https://docs.geostandaarden.nl/mim/mim/#metagegeven-informatiedomein)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Informatiemodel](#Informatiemodel), |

### mim:informatiemodeltype {#informatiemodeltype}

|URI|http://modellen.mim-standaard.nl/def/mim#informatiemodeltype|
|-|-|
|Definitie|De beschrijving van de aard van het informatiemodel, hoe het geïnterpreteerd moet worden.|
|Bron|[Sectie 2.8.1.2 Metagegeven: informatiemodeltype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-informatiemodel-type)|
|Eigenschap van|[mim:Informatiemodel](#Informatiemodel), |

### mim:kardinaliteitRelatieBron {#kardinaliteitRelatieBron}

|URI|http://modellen.mim-standaard.nl/def/mim#kardinaliteitRelatieBron|
|-|-|
|Definitie|De kardinaliteit relatie bron geeft bij een relatiesoort aan hoeveel instanties van het bron objecttype in een relatie met één instantie van het doel objecttype verbonden kunnen zijn.|
|Bron|[Sectie 2.8.2.13 Metagegeven: kardinaliteit relatie bron](https://docs.geostandaarden.nl/mim/mim/#metagegeven-kardinaliteit-relatie-bron)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), |

### mim:kardinaliteit {#kardinaliteit}

|URI|http://modellen.mim-standaard.nl/def/mim#kardinaliteit|
|-|-|
|Definitie|De kardinaliteit geeft aan hoeveel keer waarden van dit kenmerk van een object kunnen voorkomen bij een object van het betreffende objecttype.|
|Bron|[Sectie 2.8.2.12 Metagegeven: kardinaliteit](https://docs.geostandaarden.nl/mim/mim/#metagegeven-kardinaliteit)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroep](#Gegevensgroep), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Attribuutsoort](#Attribuutsoort), |

### mim:kwaliteit {#kwaliteit}

|URI|http://modellen.mim-standaard.nl/def/mim#kwaliteit|
|-|-|
|Definitie|Beschrijving van de mate waarin in de registratie opgenomen objecten van het desbetreffende type volledig, juist, actueel, nauwkeurig en betrouwbaar zijn.|
|Bron|[Sectie 2.8.2.34 Metagegeven: kwaliteit](https://docs.geostandaarden.nl/mim/mim/#metagegeven-kwaliteit)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Objecttype](#Objecttype), |

### mim:lengte {#lengte}

|URI|http://modellen.mim-standaard.nl/def/mim#lengte|
|-|-|
|Definitie|De aanduiding van de lengte van een gegeven, volgens de aangegeven notatiewijze.|
|Bron|[Sectie 2.8.2.28 Metagegeven: lengte](https://docs.geostandaarden.nl/mim/mim/#metagegeven-lengte)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), |

### mim:locatie {#locatie}

|URI|http://modellen.mim-standaard.nl/def/mim#locatie|
|-|-|
|Definitie|Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de locatie waar deze te vinden is opgegeven.|
|Bron|[Sectie 2.8.2.22 Metagegeven: locatie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-locatie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Extern](#Extern), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:Referentielijst](#Referentielijst), |

### mim:maximumwaardeExclusief {#maximumwaardeExclusief}

|URI|http://modellen.mim-standaard.nl/def/mim#maximumwaardeExclusief|
|-|-|
|Definitie|Maximumwaarde exclusief (`<`) is de bovengrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, exclusief die waarde zelf. De maximumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.|
|Bron|[Sectie 2.8.2.39 Metagegeven: maximumwaarde exclusief](https://docs.geostandaarden.nl/mim/mim/#metagegeven-maximumwaarde-exclusief)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:Attribuutsoort](#Attribuutsoort), |

### mim:maximumwaardeInclusief {#maximumwaardeInclusief}

|URI|http://modellen.mim-standaard.nl/def/mim#maximumwaardeInclusief|
|-|-|
|Definitie|Maximumwaarde inclusief (`<=`) is de bovengrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, inclusief die waarde zelf. De maximumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.|
|Bron|[Sectie 2.8.2.38 Metagegeven: maximumwaarde inclusief](https://docs.geostandaarden.nl/mim/mim/#metagegeven-maximumwaarde-inclusief)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:Attribuutsoort](#Attribuutsoort), |

### mim:minimumwaardeExclusief {#minimumwaardeExclusief}

|URI|http://modellen.mim-standaard.nl/def/mim#minimumwaardeExclusief|
|-|-|
|Definitie|Minimumwaarde exclusief (`>`) is de ondergrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, exclusief die waarde zelf. De minimumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.|
|Bron|[Sectie 2.8.2.37 Metagegeven: minimumwaarde exclusief](https://docs.geostandaarden.nl/mim/mim/#metagegeven-minimumwaarde-exclusief)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:Attribuutsoort](#Attribuutsoort), |

### mim:minimumwaardeInclusief {#minimumwaardeInclusief}

|URI|http://modellen.mim-standaard.nl/def/mim#minimumwaardeInclusief|
|-|-|
|Definitie|Minimumwaarde inclusief (`>=`) is de ondergrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, inclusief die waarde zelf. De minimumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.|
|Bron|[Sectie 2.8.2.36 Metagegeven: minimumwaarde inclusief](https://docs.geostandaarden.nl/mim/mim/#metagegeven-minimumwaarde-inclusief)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:Attribuutsoort](#Attribuutsoort), |

### mim:mixin {#mixin}

|URI|http://modellen.mim-standaard.nl/def/mim#mixin|
|-|-|
|Definitie|Metagegeven om bij een generalisatie aan te geven dat bij een implementatie die geen multiple inheritance ondersteunt de eigenschappen van de superklasse worden overgenomen door de subklasse. De superklasse zelf komt niet in de implementatie voor.|
|Bron|[Metagegeven: Mixin](https://docs.geostandaarden.nl/mim/mim/#metagegeven-mixin)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Generalisatie](#Generalisatie), |

### mim:mogelijkGeenWaarde {#mogelijkGeenWaarde}

|URI|http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde|
|-|-|
|Definitie|Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk is of de waarde er werkelijk ook niet is.|
|Bron|[Sectie 2.8.2.17 Metagegeven: mogelijk geen waarde](https://docs.geostandaarden.nl/mim/mim/#metagegeven-mogelijk-geen-waarde)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:Attribuutsoort](#Attribuutsoort), [mim:Relatierol](#Relatierol), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |

### mim:naam {#naam}

|URI|http://modellen.mim-standaard.nl/def/mim#naam|
|-|-|
|Definitie|De naam van een modelelement.|
|Bron|[Sectie 2.8.2.1 Metagegeven: naam](https://docs.geostandaarden.nl/mim/mim/#metagegeven-naam)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string), [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Domein](#Domein), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Constraint](#Constraint), [mim:Extern](#Extern), [mim:Relatierol](#Relatierol), [mim:Enumeratie](#Enumeratie), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Informatiemodel](#Informatiemodel), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Package](#Package), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), [mim:Codelijst](#Codelijst), |

### mim:patroon {#patroon}

|URI|http://modellen.mim-standaard.nl/def/mim#patroon|
|-|-|
|Definitie|De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur.|
|Bron|[Sectie 2.8.2.29 Metagegeven: patroon](https://docs.geostandaarden.nl/mim/mim/#metagegeven-patroon)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:ReferentieElement](#ReferentieElement), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:GestructureerdDatatype](#GestructureerdDatatype), |

### mim:populatie {#populatie}

|URI|http://modellen.mim-standaard.nl/def/mim#populatie|
|-|-|
|Definitie|Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.|
|Bron|[Sectie 2.8.2.33 Metagegeven: populatie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-populatie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Objecttype](#Objecttype), |

### mim:specificatieFormeel {#specificatieFormeel}

|URI|http://modellen.mim-standaard.nl/def/mim#specificatieFormeel|
|-|-|
|Definitie|De beschrijving van de constraint in een formele specificatietaal, in OCL|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[mim:Constraint](#Constraint), |

### mim:specificatieTekst {#specificatieTekst}

|URI|http://modellen.mim-standaard.nl/def/mim#specificatieTekst|
|-|-|
|Definitie|De specificatie van de constraint in normale tekst.|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:Constraint](#Constraint), |

### mim:toelichting {#toelichting}

|URI|http://modellen.mim-standaard.nl/def/mim#toelichting|
|-|-|
|Definitie|Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding.|
|Bron|[Sectie 2.8.2.7 Metagegeven: toelichting](https://docs.geostandaarden.nl/mim/mim/#metagegeven-toelichting)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[mim:DataElement](#DataElement), [mim:Gegevensgroeptype](#Gegevensgroeptype), [mim:Gegevensgroep](#Gegevensgroep), [mim:Enumeratiewaarde](#Enumeratiewaarde), [mim:Objecttype](#Objecttype), [mim:Relatiesoort](#Relatiesoort), [mim:ReferentieElement](#ReferentieElement), [mim:Keuzeconstraint](#KeuzeConstraint), [mim:PrimitiefDatatype](#PrimitiefDatatype), [mim:Attribuutsoort](#Attribuutsoort), [mim:Extern](#Extern), [mim:Relatierol](#Relatierol), [mim:Enumeratie](#Enumeratie), [mim:GestructureerdDatatype](#GestructureerdDatatype), [mim:Codelijst](#Codelijst), [mim:View](#View), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), [mim:Keuze](#Keuze), [mim:Referentielijst](#Referentielijst), |

### mim:unidirectioneel {#unidirectioneel}

|URI|http://modellen.mim-standaard.nl/def/mim#unidirectioneel|
|-|-|
|Definitie|De richting van een relatie, welke betekenis geeft aan de relatie vanuit het perspectief van de eigenaar van de relatie.|
|Bron|[Sectie 2.8.2.20 Metagegeven: unidirectioneel](https://docs.geostandaarden.nl/mim/mim/#metagegeven-unidirectioneel)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[mim:Relatiesoort](#Relatiesoort), [mim:ExterneKoppeling](#ExterneKoppeling), [mim:Relatieklasse](#Relatieklasse), |

