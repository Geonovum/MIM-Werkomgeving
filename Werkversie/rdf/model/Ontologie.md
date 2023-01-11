# Ontologie

## Klassen
- [mim:Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)
  - [mim:Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)
  - [mim:Constraint](http://modellen.mim-standaard.nl/def/mim#Constraint)
    - [mim:Keuzeconstraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)
  - [mim:DataElement](http://modellen.mim-standaard.nl/def/mim#DataElement)
  - [mim:Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)
    - [mim:Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)
    - [mim:Enumeratie](http://modellen.mim-standaard.nl/def/mim#Enumeratie)
    - [mim:GestructureerdDatatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)
    - [mim:Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)
    - [mim:PrimitiefDatatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)
    - [mim:Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)
  - [mim:Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)
  - [mim:ExterneKoppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)
  - [mim:Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)
  - [mim:Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)
  - [mim:Generalisatie](http://modellen.mim-standaard.nl/def/mim#Generalisatie)
  - [mim:Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)
  - [mim:Package](http://modellen.mim-standaard.nl/def/mim#Package)
    - [mim:Domein](http://modellen.mim-standaard.nl/def/mim#Domein)
    - [mim:Extern](http://modellen.mim-standaard.nl/def/mim#Extern)
    - [mim:Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)
    - [mim:View](http://modellen.mim-standaard.nl/def/mim#View)
  - [mim:ReferentieElement](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)
  - [mim:Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)
    - [mim:RelatierolBron](http://modellen.mim-standaard.nl/def/mim#RelatierolBron)
    - [mim:RelatierolDoel](http://modellen.mim-standaard.nl/def/mim#RelatierolDoel)
  - [mim:Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)
    - [mim:Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)

### Attribuutsoort

|URI|http://modellen.mim-standaard.nl/def/mim#Attribuutsoort|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|De typering van gelijksoortige gegevens die voor een objecttype van toepassing is.|
|Bron|[Sectie 2.2.2 Attribuutsoort](https://docs.geostandaarden.nl/mim/mim/#attribuutsoort)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:authentiek](http://modellen.mim-standaard.nl/def/mim#authentiek), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:formeelPatroon](http://modellen.mim-standaard.nl/def/mim#formeelPatroon), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:identificerend](http://modellen.mim-standaard.nl/def/mim#identificerend), [mim:indicatieAfleidbaar](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar), [mim:indicatieClassificerend](http://modellen.mim-standaard.nl/def/mim#indicatieClassificerend), [mim:indicatieFormeleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:lengte](http://modellen.mim-standaard.nl/def/mim#lengte), [mim:mogelijkGeenWaarde](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:patroon](http://modellen.mim-standaard.nl/def/mim#patroon), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting), [mim:type](http://modellen.mim-standaard.nl/def/mim#type)|

### Codelijst

|URI|http://modellen.mim-standaard.nl/def/mim#Codelijst|
|-|-|
|Specialisatie van|[Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|
|Definitie|De representatie van een lijst met een opsomming van de mogelijke domeinwaarden van een attribuutsoort, die buiten het model in een externe waardenlijst worden beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel aangepast wordt (in tegenstelling tot bij een enumeratie). De representatie bevat geen kenmerken, voor alle kenmerken wordt verwezen naar de specificatie van de externe waardelijst.|
|Bron|[Sectie 2.4.5 Codelijst](https://docs.geostandaarden.nl/mim/mim/#codelijst)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:locatie](http://modellen.mim-standaard.nl/def/mim#locatie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Constraint

|URI|http://modellen.mim-standaard.nl/def/mim#Constraint|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een constraint is een conditie of een beperking, die over een of meerdere modelelementen uit het informatiemodel geldt.|
|Bron||
|Metagegevens|[mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:specificatieFormeel](http://modellen.mim-standaard.nl/def/mim#specificatieFormeel), [mim:specificatieTekst](http://modellen.mim-standaard.nl/def/mim#specificatieTekst)|

### Data element

|URI|http://modellen.mim-standaard.nl/def/mim#DataElement|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een onderdeel/element van een Gestructureerd datatype die als type een datatype heeft.|
|Bron|[Sectie 2.5.3 Gestructureerd datatype](https://docs.geostandaarden.nl/mim/mim/#data-element)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:formeelPatroon](http://modellen.mim-standaard.nl/def/mim#formeelPatroon), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:lengte](http://modellen.mim-standaard.nl/def/mim#lengte), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:patroon](http://modellen.mim-standaard.nl/def/mim#patroon), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting), [mim:type](http://modellen.mim-standaard.nl/def/mim#type)|

### Datatype

|URI|http://modellen.mim-standaard.nl/def/mim#Datatype|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een beschrijving van de structuur waaraan een waarde, oftewel de data zelf, aan moet voldoen.|
|Bron|[Sectie 2.5 Datatypen](https://docs.geostandaarden.nl/mim/mim/#datatypen-0)|

### Domein

|URI|http://modellen.mim-standaard.nl/def/mim#Domein|
|-|-|
|Specialisatie van|[Package](http://modellen.mim-standaard.nl/def/mim#Package)|
|Definitie|Een groepering van constructies die een semantisch samenhangend gedeelte van een informatiemodel beschrijven.|
|Bron|[Sectie 2.6.2 Domein](https://docs.geostandaarden.nl/mim/mim/#domein)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam)|

### Enumeratie

|URI|http://modellen.mim-standaard.nl/def/mim#Enumeratie|
|-|-|
|Specialisatie van|[Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|
|Definitie|Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een statische lijst.|
|Bron|[Sectie 2.4.3 Enumeratie](https://docs.geostandaarden.nl/mim/mim/#enumeratie)|
|Metagegevens|[mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting), [mim:waarde](http://modellen.mim-standaard.nl/def/mim#waarde)|

### Enumeratiewaarde

|URI|http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant gegeven.|
|Bron|[Sectie 2.4.4 Enumeratiewaarde](https://docs.geostandaarden.nl/mim/mim/#enumeratiewaarde)|
|Metagegevens|[mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:code](http://modellen.mim-standaard.nl/def/mim#code), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Extern

|URI|http://modellen.mim-standaard.nl/def/mim#Extern|
|-|-|
|Specialisatie van|[Package](http://modellen.mim-standaard.nl/def/mim#Package)|
|Definitie|Een groepering van constructies die een externe instantie beheert en beschikbaar stelt aan een informatiemodel en die in het informatiemodel ongewijzigd gebruikt worden.|
|Bron|[Sectie 2.6.3 Extern](https://docs.geostandaarden.nl/mim/mim/#extern)|
|Metagegevens|[mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:locatie](http://modellen.mim-standaard.nl/def/mim#locatie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Externe koppeling

|URI|http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een associatie waarmee vanuit het perspectief van het eigen informatiemodel een objecttype uit het ‘eigen’ informatiemodel gekoppeld wordt aan een objecttype van een extern informatiemodel. De relatie zelf hoort bij het ‘eigen’ objecttype.|
|Bron|[Sectie 2.3.4 Externe koppeling](https://docs.geostandaarden.nl/mim/mim/#externe-koppeling)|
|Metagegevens|[mim:aggregatietype](http://modellen.mim-standaard.nl/def/mim#aggregatietype), [mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:authentiek](http://modellen.mim-standaard.nl/def/mim#authentiek), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:bron](http://modellen.mim-standaard.nl/def/mim#bron), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:doel](http://modellen.mim-standaard.nl/def/mim#doel), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:indicatieAfleidbaar](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar), [mim:indicatieFormeleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:mogelijkGeenWaarde](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting), [mim:unidirectioneel](http://modellen.mim-standaard.nl/def/mim#unidirectioneel)|

### Gegevensgroep

|URI|http://modellen.mim-standaard.nl/def/mim#Gegevensgroep|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een typering van een groep van gelijksoortige gegevens die voor een objecttype van toepassing is.|
|Bron|[Sectie 2.2.3 Gegevensgroep](https://docs.geostandaarden.nl/mim/mim/#gegevensgroep)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:authentiek](http://modellen.mim-standaard.nl/def/mim#authentiek), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#gegevensgroeptype), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:indicatieFormeleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Gegevensgroeptype

|URI|http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een groep van met elkaar samenhangende attribuutsoorten. Een gegevensgroeptype is altijd een type van een gegevensgroep.|
|Bron|[Sectie 2.2.4 Gegevensgroeptype](https://docs.geostandaarden.nl/mim/mim/#gegevensgroeptype)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:attribuut](http://modellen.mim-standaard.nl/def/mim#attribuut), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:constraint](http://modellen.mim-standaard.nl/def/mim#constraint), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:gegevensgroep](http://modellen.mim-standaard.nl/def/mim#gegevensgroep), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Generalisatie

|URI|http://modellen.mim-standaard.nl/def/mim#Generalisatie|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|De typering van het hiërarchische verband tussen een meer generiek en een meer specifiek modelelement van hetzelfde soort, waarbij het meer specifieke modelelement eigenschappen van het meer generieke modelelement overerft. Dit verband is alleen gedefinieerd voor objecttypen en datatypen.|
|Bron|[Sectie 2.3.1 Generalisatie](https://docs.geostandaarden.nl/mim/mim/#generalisatie)|
|Metagegevens|[mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:subtype](http://modellen.mim-standaard.nl/def/mim#subtype), [mim:supertype](http://modellen.mim-standaard.nl/def/mim#supertype)|

### Gestructureerd datatype

|URI|http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype|
|-|-|
|Specialisatie van|[Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|
|Definitie|Specifiek benoemd datatype dat de structuur van een gegeven beschrijft, samengesteld uit minimaal twee elementen die in samenhang betekenisvol zijn.|
|Bron|[Sectie 2.5.2 Gestructureerd datatype](https://docs.geostandaarden.nl/mim/mim/#gestructureerd-datatype)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:dataElement](http://modellen.mim-standaard.nl/def/mim#dataElement), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:formeelPatroon](http://modellen.mim-standaard.nl/def/mim#formeelPatroon), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:patroon](http://modellen.mim-standaard.nl/def/mim#patroon), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Informatiemodel

|URI|http://modellen.mim-standaard.nl/def/mim#Informatiemodel|
|-|-|
|Specialisatie van|[Package](http://modellen.mim-standaard.nl/def/mim#Package)|
|Definitie|De groepering van alle modelelementen waaruit het informatiemodel is opgebouwd. Het informatiemodel als geheel.|
|Bron|[Sectie 2.6.1 Informatiemodel](https://docs.geostandaarden.nl/mim/mim/#informatiemodel)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:informatiedomein](http://modellen.mim-standaard.nl/def/mim#informatiedomein), [mim:informatiemodeltype](http://modellen.mim-standaard.nl/def/mim#informatiemodeltype), [mim:mimextensie](http://modellen.mim-standaard.nl/def/mim#mimextensie), [mim:mimtaal](http://modellen.mim-standaard.nl/def/mim#mimtaal), [mim:mimversie](http://modellen.mim-standaard.nl/def/mim#mimversie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:relatiemodelleringstype](http://modellen.mim-standaard.nl/def/mim#relatiemodelleringstype)|

### Keuze

|URI|http://modellen.mim-standaard.nl/def/mim#Keuze|
|-|-|
|Specialisatie van|[Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|
|Definitie|Een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.|
|Bron||
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Keuze constraint

|URI|http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint|
|-|-|
|Specialisatie van|[Constraint](http://modellen.mim-standaard.nl/def/mim#Constraint)|
|Definitie|Een conditie met een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.|
|Bron||
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:modelelement](http://modellen.mim-standaard.nl/def/mim#modelelement), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Modelelement

|URI|http://modellen.mim-standaard.nl/def/mim#Modelelement|
|-|-|
|Definitie|Een modelelement uit het Metamodel voor Informatie Modellering (MIM)|

### Objecttype

|URI|http://modellen.mim-standaard.nl/def/mim#Objecttype|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|De typering van een groep objecten die binnen een domein relevant zijn en als gelijksoortig worden beschouwd.|
|Bron|[Sectie 2.2.1 Objecttype](https://docs.geostandaarden.nl/mim/mim/#objecttype)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:attribuut](http://modellen.mim-standaard.nl/def/mim#attribuut), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:constraint](http://modellen.mim-standaard.nl/def/mim#constraint), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:gegevensgroep](http://modellen.mim-standaard.nl/def/mim#gegevensgroep), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:indicatieAbstractObject](http://modellen.mim-standaard.nl/def/mim#indicatieAbstractObject), [mim:kwaliteit](http://modellen.mim-standaard.nl/def/mim#kwaliteit), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:populatie](http://modellen.mim-standaard.nl/def/mim#populatie), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Package

|URI|http://modellen.mim-standaard.nl/def/mim#Package|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een package is een benoemde en begrensde verzameling/groepering van modelelementen.|
|Bron|[Sectie 2.6 Packages](https://docs.geostandaarden.nl/mim/mim/#packages)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:bevatModelelement](http://modellen.mim-standaard.nl/def/mim#bevatModelelement), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam)|

### Primitief datatype

|URI|http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype|
|-|-|
|Specialisatie van|[Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|
|Definitie|Een primitief datatype is een datatype met een eenvoudige basisstructuur, oftewel enkelvoudig en zonder gelaagdheid.|
|Bron|[Sectie 2.5.1 Primitief datatype](https://docs.geostandaarden.nl/mim/mim/#primitief-datatype)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:formeelPatroon](http://modellen.mim-standaard.nl/def/mim#formeelPatroon), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:lengte](http://modellen.mim-standaard.nl/def/mim#lengte), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:patroon](http://modellen.mim-standaard.nl/def/mim#patroon), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Referentie element

|URI|http://modellen.mim-standaard.nl/def/mim#ReferentieElement|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|Een eigenschap van een object in een referentielijst in de vorm van een gegeven.|
|Bron|[Sectie 2.4.2 Referentie element](https://docs.geostandaarden.nl/mim/mim/#referentie-element)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:formeelPatroon](http://modellen.mim-standaard.nl/def/mim#formeelPatroon), [mim:identificerend](http://modellen.mim-standaard.nl/def/mim#identificerend), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:lengte](http://modellen.mim-standaard.nl/def/mim#lengte), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:patroon](http://modellen.mim-standaard.nl/def/mim#patroon), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting), [mim:type](http://modellen.mim-standaard.nl/def/mim#type)|

### Referentielijst

|URI|http://modellen.mim-standaard.nl/def/mim#Referentielijst|
|-|-|
|Specialisatie van|[Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|
|Definitie|De representatie van een lijst met een opsomming van de mogelijke domeinwaarden van een attribuutsoort, die buiten het model in een externe waardenlijst worden beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel aangepast wordt (in tegenstelling tot bij een enumeratie). De representatie bevat een aantal kenmerken, die overgenomen zijn van de specificatie van de externe waardelijst.|
|Bron|[Sectie 2.4.1 Referentielijst](https://docs.geostandaarden.nl/mim/mim/#referentielijst)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:locatie](http://modellen.mim-standaard.nl/def/mim#locatie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:referentieElement](http://modellen.mim-standaard.nl/def/mim#referentieElement), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Relatieklasse

|URI|http://modellen.mim-standaard.nl/def/mim#Relatieklasse|
|-|-|
|Specialisatie van|[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)|
|Definitie|Een relatiesoort met eigenschappen.|
|Bron|[Sectie 2.3.3 Relatieklasse](https://docs.geostandaarden.nl/mim/mim/#relatieklasse)|
|Metagegevens|[mim:aggregatietype](http://modellen.mim-standaard.nl/def/mim#aggregatietype), [mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:attribuut](http://modellen.mim-standaard.nl/def/mim#attribuut), [mim:authentiek](http://modellen.mim-standaard.nl/def/mim#authentiek), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:constraint](http://modellen.mim-standaard.nl/def/mim#constraint), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:gegevensgroep](http://modellen.mim-standaard.nl/def/mim#gegevensgroep), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:indicatieAfleidbaar](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar), [mim:indicatieFormeleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:mogelijkGeenWaarde](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting), [mim:unidirectioneel](http://modellen.mim-standaard.nl/def/mim#unidirectioneel)|

### Relatierol

|URI|http://modellen.mim-standaard.nl/def/mim#Relatierol|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|De benaming van de manier waarop een object deelneemt aan een relatie met een ander object.|
|Bron|[Sectie 2.3.5 Relatierol](https://docs.geostandaarden.nl/mim/mim/#relatierol)|
|Metagegevens|[mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:authentiek](http://modellen.mim-standaard.nl/def/mim#authentiek), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:identificerend](http://modellen.mim-standaard.nl/def/mim#identificerend), [mim:indicatieFormeleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:mogelijkGeenWaarde](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

### Relatierol bron

|URI|http://modellen.mim-standaard.nl/def/mim#RelatierolBron|
|-|-|
|Specialisatie van|[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|
|Definitie|De relatierol die de rol beschrijft van de bron van de relatie.|
|Bron|[Sectie 2.3.5 Relatierol](https://docs.geostandaarden.nl/mim/mim/#relatierol)|
|Metagegevens|[mim:bron](http://modellen.mim-standaard.nl/def/mim#bron)|

### Relatierol doel

|URI|http://modellen.mim-standaard.nl/def/mim#RelatierolDoel|
|-|-|
|Specialisatie van|[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|
|Definitie|De relatierol die de rol beschrijft van het doel van de relatie.|
|Bron|[Sectie 2.3.5 Relatierol](https://docs.geostandaarden.nl/mim/mim/#relatierol)|
|Metagegevens|[mim:doel](http://modellen.mim-standaard.nl/def/mim#doel)|

### Relatiesoort

|URI|http://modellen.mim-standaard.nl/def/mim#Relatiesoort|
|-|-|
|Specialisatie van|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|
|Definitie|De typering van het structurele verband tussen een object van een objecttype en een (ander) object van een ander (of hetzelfde) objecttype.|
|Bron|[Sectie 2.3.2 Relatiesoort](https://docs.geostandaarden.nl/mim/mim/#relatiesoort)|
|Metagegevens|[mim:aggregatietype](http://modellen.mim-standaard.nl/def/mim#aggregatietype), [mim:alias](http://modellen.mim-standaard.nl/def/mim#alias), [mim:authentiek](http://modellen.mim-standaard.nl/def/mim#authentiek), [mim:begrip](http://modellen.mim-standaard.nl/def/mim#begrip), [mim:begripsterm](http://modellen.mim-standaard.nl/def/mim#begripsterm), [mim:bron](http://modellen.mim-standaard.nl/def/mim#bron), [mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:doel](http://modellen.mim-standaard.nl/def/mim#doel), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:herkomstDefinitie](http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie), [mim:identificerend](http://modellen.mim-standaard.nl/def/mim#identificerend), [mim:indicatieAfleidbaar](http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar), [mim:indicatieFormeleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie), [mim:indicatieMaterieleHistorie](http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie), [mim:kardinaliteit](http://modellen.mim-standaard.nl/def/mim#kardinaliteit), [mim:kardinaliteitRelatieBron](http://modellen.mim-standaard.nl/def/mim#kardinaliteitRelatieBron), [mim:mogelijkGeenWaarde](http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:relatierol](http://modellen.mim-standaard.nl/def/mim#relatierol), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting), [mim:unidirectioneel](http://modellen.mim-standaard.nl/def/mim#unidirectioneel)|

### View

|URI|http://modellen.mim-standaard.nl/def/mim#View|
|-|-|
|Specialisatie van|[Package](http://modellen.mim-standaard.nl/def/mim#Package)|
|Definitie|Een groepering van objecttypen die gespecificeerd zijn in een extern informatiemodel en vanuit het perspectief van het eigen informatiemodel inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het eigen informatiemodel.|
|Bron|[Sectie 2.6.4 View](https://docs.geostandaarden.nl/mim/mim/#view)|
|Metagegevens|[mim:datumOpname](http://modellen.mim-standaard.nl/def/mim#datumOpname), [mim:definitie](http://modellen.mim-standaard.nl/def/mim#definitie), [mim:herkomst](http://modellen.mim-standaard.nl/def/mim#herkomst), [mim:locatie](http://modellen.mim-standaard.nl/def/mim#locatie), [mim:naam](http://modellen.mim-standaard.nl/def/mim#naam), [mim:toelichting](http://modellen.mim-standaard.nl/def/mim#toelichting)|

## Eigenschappen (Bindingen)

### aggregatietype

|URI|http://modellen.mim-standaard.nl/def/mim#aggregatietype|
|-|-|
|Definitie|Aanduiding of het objecttype die de eigenaar is van een relatie het doel van relatie ziet als een samen te voegen onderdeel die bij het objecttype hoort.|
|Bron|[Sectie 2.8.2.21 Metagegeven: aggregatietype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-aggregatietype)|
|Eigenschap van|[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)|
|Mogelijke waarden|[Geen](http://modellen.mim-standaard.nl/def/mim#Geen)[Gedeeld](http://modellen.mim-standaard.nl/def/mim#Gedeeld)[Compositie](http://modellen.mim-standaard.nl/def/mim#Compositie)|

### attribuut

|URI|http://modellen.mim-standaard.nl/def/mim#attribuut|
|-|-|
|Definitie|De binding van een attribuutsoort als eigenschap aan een objecttype.|
|Bron|[Sectie 2.8.4.1 Metagegeven: heeft attribuut](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-attribuut)|
|Eigenschap van|[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)|
|Gerelateerde klasse|[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|

### attribuutkeuze

|URI|http://modellen.mim-standaard.nl/def/mim#attribuutkeuze|
|-|-|
|Definitie|De binding van een keuze uit attributen aan een attribuutsoort of keuze.|
|Bron|[Sectie 2.8.4.12 Metagegeven: heeft keuzeattribuut](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-keuzeattribuut)|
|Eigenschap van||

### authentiek

|URI|http://modellen.mim-standaard.nl/def/mim#authentiek|
|-|-|
|Definitie|Aanduiding of het kenmerk een authentiek gegeven betreft.|
|Bron|[Sectie 2.8.2.14 Metagegeven: authentiek](https://docs.geostandaarden.nl/mim/mim/#metagegeven-authentiek)|
|Eigenschap van|[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|
|Mogelijke waarden|[Authentiek](http://modellen.mim-standaard.nl/def/mim#Authentiek)[Overige authenticiteit](http://modellen.mim-standaard.nl/def/mim#OverigeAuthenticiteit)[Wettelijk gegeven](http://modellen.mim-standaard.nl/def/mim#WettelijkGegeven)[Basisgegeven](http://modellen.mim-standaard.nl/def/mim#Basisgegeven)[LandelijkKerngegeven](http://modellen.mim-standaard.nl/def/mim#LandelijkKerngegeven)|

### begrip

|URI|http://modellen.mim-standaard.nl/def/mim#begrip|
|-|-|
|Definitie|Verwijzing naar een begrip, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.|
|Bron|[Sectie 2.8.2.3 Metagegeven: begrip](https://docs.geostandaarden.nl/mim/mim/#metagegeven-begrip)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|
|Gerelateerde klasse||

### bevat modelelement

|URI|http://modellen.mim-standaard.nl/def/mim#bevatModelelement|
|-|-|
|Eigenschap van|[Package](http://modellen.mim-standaard.nl/def/mim#Package)|
|Gerelateerde klasse|[Modelelement](http://modellen.mim-standaard.nl/def/mim#Modelelement)|

### bron

|URI|http://modellen.mim-standaard.nl/def/mim#bron|
|-|-|
|Definitie|Aanduiding van het bronobject in een relatie tussen objecten. Een bronobject heeft middels een relatiesoort een relatie met een doelobject.|
|Bron|[Sectie 2.8.2.18 Metagegeven: bron](https://docs.geostandaarden.nl/mim/mim/#metagegeven-bron)|
|Eigenschap van|[Relatierol bron](http://modellen.mim-standaard.nl/def/mim#RelatierolBron)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)|

### constraint

|URI|http://modellen.mim-standaard.nl/def/mim#constraint|
|-|-|
|Definitie|De binding van een constraint aan een modelelement.|
|Bron|[Sectie 2.8.4.14 Metagegeven: heeft constraint](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-constraint)|
|Eigenschap van|[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)|
|Gerelateerde klasse|[Constraint](http://modellen.mim-standaard.nl/def/mim#Constraint)|

### data element

|URI|http://modellen.mim-standaard.nl/def/mim#dataElement|
|-|-|
|Definitie|De binding van een data element aan een gestructureerd datatype.|
|Bron|[Sectie 2.8.4.8 Metagegeven: heeft data element](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-data-element)|
|Eigenschap van|[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)|
|Gerelateerde klasse|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)|

### datatypekeuze

|URI|http://modellen.mim-standaard.nl/def/mim#datatypekeuze|
|-|-|
|Definitie|De binding van een keuze uit datatypen aan een attribuutsoort.|
|Bron|[Sectie 2.8.4.11 Metagegeven: heeft datatypekeuze](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-datatypekeuze)|
|Eigenschap van||

### doel

|URI|http://modellen.mim-standaard.nl/def/mim#doel|
|-|-|
|Definitie|Aanduiding van het gerelateerde objecttype die het eindpunt van de relatie aangeeft. Naar objecten van dit objecttype wordt verwezen.|
|Bron|[Sectie 2.8.2.19 Metagegeven: doel](https://docs.geostandaarden.nl/mim/mim/#metagegeven-doel)|
|Eigenschap van|[Relatierol doel](http://modellen.mim-standaard.nl/def/mim#RelatierolDoel)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)|
|Gerelateerde klasse|[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)|

### doelkeuze

|URI|http://modellen.mim-standaard.nl/def/mim#doelkeuze|
|-|-|
|Definitie|De binding van een keuze uit relatiedoelen aan een objecttype.|
|Bron|[Sectie 2.8.4.13 Metagegeven: heeft keuzerelatiedoel](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-keuzerelatiedoel)|
|Eigenschap van||

### equivalent

|URI|http://modellen.mim-standaard.nl/def/mim#equivalent|
|-|-|
|Definitie|Geeft aan dat een mim metamodel-element equivalent is met een meta-element uit een Linked Data vocabulaire|
|Eigenschap van||

### gegevensgroep

|URI|http://modellen.mim-standaard.nl/def/mim#gegevensgroep|
|-|-|
|Definitie|De binding van een gegevensgroep als groep van eigenschappen aan een objecttype of gegevensgroeptype.|
|Bron|[Sectie 2.8.4.2 Metagegeven: heeft gegevensgroep](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-gegevensgroep)|
|Eigenschap van|[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)|
|Gerelateerde klasse|[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)|

### gegevensgroeptype

|URI|http://modellen.mim-standaard.nl/def/mim#gegevensgroeptype|
|-|-|
|Definitie|De binding van een gegevensgroeptype als waardetype aan een gegevensgroep.|
|Bron|[Sectie 2.8.4.3 Metagegeven: heeft gegevensgroeptype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-heeft-gegevensgroeptype)|
|Eigenschap van|[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)|
|Gerelateerde klasse|[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)|

### modelelement

|URI|http://modellen.mim-standaard.nl/def/mim#modelelement|
|-|-|
|Eigenschap van|[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)|
|Gerelateerde klasse|[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)|

### referentie element

|URI|http://modellen.mim-standaard.nl/def/mim#referentieElement|
|-|-|
|Definitie|De binding van een referentie element aan een referentielijst.|
|Bron|[Sectie 2.8.4.10 Metagegeven: bevat referentie element](https://docs.geostandaarden.nl/mim/mim/#metagegeven-bevat-referentie-element)|
|Eigenschap van|[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)|
|Gerelateerde klasse|[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)|

### relatiemodelleringstype

|URI|http://modellen.mim-standaard.nl/def/mim#relatiemodelleringstype|
|-|-|
|Definitie|Aanduiding van een in MIM gedefinieerd alternatief voor een modelleringswijze, en welke keuze hierbij is gemaakt.|
|Bron|[Sectie 2.8.1.3 Metagegeven: relatiemodelleringstype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-relatiemodelleringstype)|
|Eigenschap van|[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)|
|Mogelijke waarden|[Relatiesoort leidend](http://modellen.mim-standaard.nl/def/mim#RelatiesoortLeidend)[Relatierol leidend](http://modellen.mim-standaard.nl/def/mim#RelatierolLeidend)|

### relatierol

|URI|http://modellen.mim-standaard.nl/def/mim#relatierol|
|-|-|
|Eigenschap van|[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)|
|Gerelateerde klasse|[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### subtype

|URI|http://modellen.mim-standaard.nl/def/mim#subtype|
|-|-|
|Definitie|Het objecttype dat een specialisatie is van een (ander) objecttype.|
|Eigenschap van|[Generalisatie](http://modellen.mim-standaard.nl/def/mim#Generalisatie)|

### supertype

|URI|http://modellen.mim-standaard.nl/def/mim#supertype|
|-|-|
|Definitie|De binding van een supertype aan een subtype middels een generalisatie.|
|Bron|[Sectie 2.8.4.4 Metagegeven: verwijst naar supertype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-verwijst-naar-supertype)|
|Eigenschap van|[Generalisatie](http://modellen.mim-standaard.nl/def/mim#Generalisatie)|

### type

|URI|http://modellen.mim-standaard.nl/def/mim#type|
|-|-|
|Definitie|Het datatype waarmee waarden van dit modelelement worden vastgelegd.|
|Bron|[Sectie 2.8.2.23 Metagegeven: type](https://docs.geostandaarden.nl/mim/mim/#metagegeven-type-domein-van-een-waarde-een-gegeven)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|
|Gerelateerde klasse|[Datatype](http://modellen.mim-standaard.nl/def/mim#Datatype)|

### waarde

|URI|http://modellen.mim-standaard.nl/def/mim#waarde|
|-|-|
|Definitie|De binding van een enumeratiewaarde aan een enumeratie.|
|Bron|[Sectie 2.8.4.9 Metagegeven: bevat enumeratiewaarde](https://docs.geostandaarden.nl/mim/mim/#metagegeven-bevat-enumeratiewaarde)|
|Eigenschap van|[Enumeratie](http://modellen.mim-standaard.nl/def/mim#Enumeratie)|
|Gerelateerde klasse|[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)|

## Eigenschappen (metagegevens)

### Indicatie formele historie

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieFormeleHistorie|
|-|-|
|Definitie|Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is.|
|Bron|[Sectie 2.8.2.11 Metagegeven: indicatie formele historie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-formele-historie)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### Indicatie materiële historie

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieMaterieleHistorie|
|-|-|
|Definitie|Indicatie of de materiële historie van het kenmerk van het object te bevragen is.|
|Bron|[Sectie 2.8.2.10 Metagegeven: indicatie materiële historie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-materiele-historie)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### MIM extensie

|URI|http://modellen.mim-standaard.nl/def/mim#mimextensie|
|-|-|
|Definitie|De aanduiding van een extensie op MIM.|
|Bron||
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)|

### MIM taal

|URI|http://modellen.mim-standaard.nl/def/mim#mimtaal|
|-|-|
|Definitie|De aanduiding van de taal die gebruikt is voor de modelelementen.|
|Bron||
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)|

### MIM versie

|URI|http://modellen.mim-standaard.nl/def/mim#mimversie|
|-|-|
|Definitie|De versie van de MIM specificatie die gebruikt is om het informatiemodel in uit te drukken.|
|Bron||
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)|

### alias

|URI|http://modellen.mim-standaard.nl/def/mim#alias|
|-|-|
|Definitie|De weergave van de naam van een modelelement in natuurlijke taal (niet technisch).|
|Bron|[Sectie 2.8.2.2 Metagegeven: alias](https://docs.geostandaarden.nl/mim/mim/#metagegeven-alias)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Package](http://modellen.mim-standaard.nl/def/mim#Package)[Domein](http://modellen.mim-standaard.nl/def/mim#Domein)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### begripsterm

|URI|http://modellen.mim-standaard.nl/def/mim#begripsterm|
|-|-|
|Definitie|Verwijzing naar een begrip in de vorm van een term, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.|
|Bron|[Sectie 2.8.2.3 Metagegeven: begrip](https://docs.geostandaarden.nl/mim/mim/#metagegeven-begrip)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### code

|URI|http://modellen.mim-standaard.nl/def/mim#code|
|-|-|
|Definitie|De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code|
|Bron|[Sectie 2.8.2.27 Metagegeven: code](https://docs.geostandaarden.nl/mim/mim/#metagegeven-code)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)|

### datum opname

|URI|http://modellen.mim-standaard.nl/def/mim#datumOpname|
|-|-|
|Definitie|De datum waarop het modelelement is opgenomen in het informatiemodel.|
|Bron|[Sectie 2.8.2.8 Metagegeven: datum opname](https://docs.geostandaarden.nl/mim/mim/#metagegeven-datum-opname)|
|Datatype|[date](http://www.w3.org/2001/XMLSchema#date)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Enumeratie](http://modellen.mim-standaard.nl/def/mim#Enumeratie)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[View](http://modellen.mim-standaard.nl/def/mim#View)[Generalisatie](http://modellen.mim-standaard.nl/def/mim#Generalisatie)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Domein](http://modellen.mim-standaard.nl/def/mim#Domein)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Extern](http://modellen.mim-standaard.nl/def/mim#Extern)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### definitie

|URI|http://modellen.mim-standaard.nl/def/mim#definitie|
|-|-|
|Definitie|De beschrijving van de betekenis van dit modelelement.|
|Bron|[Sectie 2.8.2.5 Metagegeven: definitie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-definitie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string), [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Enumeratie](http://modellen.mim-standaard.nl/def/mim#Enumeratie)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[View](http://modellen.mim-standaard.nl/def/mim#View)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Extern](http://modellen.mim-standaard.nl/def/mim#Extern)|

### formeel patroon

|URI|http://modellen.mim-standaard.nl/def/mim#formeelPatroon|
|-|-|
|Definitie|Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door de computer wordt herkend.|
|Bron|[Sectie 2.8.2.26 Metagegeven: formeel patroon](https://docs.geostandaarden.nl/mim/mim/#metagegeven-formeel-patroon)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|

### herkomst

|URI|http://modellen.mim-standaard.nl/def/mim#herkomst|
|-|-|
|Definitie|De registratie of het informatiemodel waaraan het modelelement ontleend is dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is.|
|Bron|[Sectie 2.8.2.4 Metagegeven: naam](https://docs.geostandaarden.nl/mim/mim/#metagegeven-naam)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[View](http://modellen.mim-standaard.nl/def/mim#View)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Extern](http://modellen.mim-standaard.nl/def/mim#Extern)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### herkomst definitie

|URI|http://modellen.mim-standaard.nl/def/mim#herkomstDefinitie|
|-|-|
|Definitie|De registratie of het informatiemodel waaruit de definitie is overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de definitie is samengesteld.|
|Bron|[Sectie 2.8.2.6 Metagegeven: herkomst definitie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-herkomst-definitie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string), [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)|

### identificerend

|URI|http://modellen.mim-standaard.nl/def/mim#identificerend|
|-|-|
|Definitie|Een aanduiding dat een kenmerk of een combinatie van kenmerken van een objecttype uniek identificerend is voor alle objecten in de populatie van objecten van dit objecttype, of de aanduiding dat een referentie element uniek identificerend is voor alle lijst items in een referentielijst.|
|Bron|[Sectie 2.8.2.9 Metagegeven: identificerend](https://docs.geostandaarden.nl/mim/mim/#metagegeven-identificerend)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### indicatie abstract object

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieAbstractObject|
|-|-|
|Definitie|Een indicatie die aangeeft of er objecten kunnen bestaan die getypeerd worden als zijnde objecten (instanties) van alleen dit objecttype. Een abstract objecttype moet altijd de generalisatie zijn van één of meerdere objecttypes die niet abstract zijn.|
|Bron|[Sectie 2.8.2.28 Metagegeven: indicatie abstract object](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-abstract-object)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)|

### indicatie afleidbaar

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieAfleidbaar|
|-|-|
|Definitie|Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of relatiesoorten.|
|Bron|[Sectie 2.8.2.15 Metagegeven: indicatie afleidbaar](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-afleidbaar)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)|

### indicatie classificerend

|URI|http://modellen.mim-standaard.nl/def/mim#indicatieClassificerend|
|-|-|
|Definitie|Indicatie dat een attribuutsoort het objecttype waar het bij hoort classificeert in (sub)typen.|
|Bron|[Sectie 2.8.2.16 Metagegeven: identificatie classificerend](https://docs.geostandaarden.nl/mim/mim/#metagegeven-indicatie-classificerend)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|

### informatiedomein

|URI|http://modellen.mim-standaard.nl/def/mim#informatiedomein|
|-|-|
|Definitie|Aanduiding van het functionele domein waartoe het informatiemodel behoort.|
|Bron|[Sectie 2.8.1.1 Metagegeven: informatiedomein](https://docs.geostandaarden.nl/mim/mim/#metagegeven-informatiedomein)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)|

### informatiemodeltype

|URI|http://modellen.mim-standaard.nl/def/mim#informatiemodeltype|
|-|-|
|Definitie|De beschrijving van de aard van het informatiemodel, hoe het geïnterpreteerd moet worden.|
|Bron|[Sectie 2.8.1.2 Metagegeven: informatiemodeltype](https://docs.geostandaarden.nl/mim/mim/#metagegeven-informatiemodel-type)|
|Eigenschap van|[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)|

### kardinaliteit

|URI|http://modellen.mim-standaard.nl/def/mim#kardinaliteit|
|-|-|
|Definitie|De kardinaliteit geeft aan hoeveel keer waarden van dit kenmerk van een object kunnen voorkomen bij een object van het betreffende objecttype.|
|Bron|[Sectie 2.8.2.12 Metagegeven: kardinaliteit](https://docs.geostandaarden.nl/mim/mim/#metagegeven-kardinaliteit)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|

### kardinaliteit relatie bron

|URI|http://modellen.mim-standaard.nl/def/mim#kardinaliteitRelatieBron|
|-|-|
|Definitie|De kardinaliteit relatie bron geeft bij een relatiesoort aan hoeveel instanties van het bron objecttype in een relatie met één instantie van het doel objecttype verbonden kunnen zijn.|
|Bron|[Sectie 2.8.2.13 Metagegeven: kardinaliteit relatie bron](https://docs.geostandaarden.nl/mim/mim/#metagegeven-kardinaliteit-relatie-bron)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)|

### kwaliteit

|URI|http://modellen.mim-standaard.nl/def/mim#kwaliteit|
|-|-|
|Definitie|Beschrijving van de mate waarin in de registratie opgenomen objecten van het desbetreffende type volledig, juist, actueel, nauwkeurig en betrouwbaar zijn.|
|Bron|[Sectie 2.8.2.30 Metagegeven: kwaliteit](https://docs.geostandaarden.nl/mim/mim/#metagegeven-kwaliteit)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)|

### lengte

|URI|http://modellen.mim-standaard.nl/def/mim#lengte|
|-|-|
|Definitie|De aanduiding van de lengte van een gegeven, volgens de aangegeven notatiewijze.|
|Bron|[Sectie 2.8.2.24 Metagegeven: lengte](https://docs.geostandaarden.nl/mim/mim/#metagegeven-lengte)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|

### locatie

|URI|http://modellen.mim-standaard.nl/def/mim#locatie|
|-|-|
|Definitie|Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de locatie waar deze te vinden is opgegeven.|
|Bron|[Sectie 2.8.2.22 Metagegeven: locatie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-locatie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[View](http://modellen.mim-standaard.nl/def/mim#View)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Extern](http://modellen.mim-standaard.nl/def/mim#Extern)|

### mogelijk geen waarde

|URI|http://modellen.mim-standaard.nl/def/mim#mogelijkGeenWaarde|
|-|-|
|Definitie|Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk is of de waarde er werkelijk ook niet is.|
|Bron|[Sectie 2.8.2.17 Metagegeven: mogelijk geen waarde](https://docs.geostandaarden.nl/mim/mim/#metagegeven-mogelijk-geen-waarde)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### naam

|URI|http://modellen.mim-standaard.nl/def/mim#naam|
|-|-|
|Definitie|De naam van een modelelement.|
|Bron|[Sectie 2.8.2.1 Metagegeven: naam](https://docs.geostandaarden.nl/mim/mim/#metagegeven-naam)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string), [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Enumeratie](http://modellen.mim-standaard.nl/def/mim#Enumeratie)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Informatiemodel](http://modellen.mim-standaard.nl/def/mim#Informatiemodel)[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)[View](http://modellen.mim-standaard.nl/def/mim#View)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Package](http://modellen.mim-standaard.nl/def/mim#Package)[Domein](http://modellen.mim-standaard.nl/def/mim#Domein)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Constraint](http://modellen.mim-standaard.nl/def/mim#Constraint)[Extern](http://modellen.mim-standaard.nl/def/mim#Extern)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### patroon

|URI|http://modellen.mim-standaard.nl/def/mim#patroon|
|-|-|
|Definitie|De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur.|
|Bron|[Sectie 2.8.2.25 Metagegeven: patroon](https://docs.geostandaarden.nl/mim/mim/#metagegeven-patroon)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)|

### populatie

|URI|http://modellen.mim-standaard.nl/def/mim#populatie|
|-|-|
|Definitie|Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.|
|Bron|[Sectie 2.8.2.29 Metagegeven: populatie](https://docs.geostandaarden.nl/mim/mim/#metagegeven-populatie)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)|

### specificatie formeel

|URI|http://modellen.mim-standaard.nl/def/mim#specificatieFormeel|
|-|-|
|Definitie|De beschrijving van de constraint in een formele specificatietaal, in OCL|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string)|
|Eigenschap van|[Constraint](http://modellen.mim-standaard.nl/def/mim#Constraint)|

### specificatie tekst

|URI|http://modellen.mim-standaard.nl/def/mim#specificatieTekst|
|-|-|
|Definitie|De specificatie van de constraint in normale tekst.|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Constraint](http://modellen.mim-standaard.nl/def/mim#Constraint)|

### toelichting

|URI|http://modellen.mim-standaard.nl/def/mim#toelichting|
|-|-|
|Definitie|Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding.|
|Bron|[Sectie 2.8.2.7 Metagegeven: toelichting](https://docs.geostandaarden.nl/mim/mim/#metagegeven-toelichting)|
|Datatype|[string](http://www.w3.org/2001/XMLSchema#string) of [langString](http://www.w3.org/1999/02/22-rdf-syntax-ns#langString)|
|Eigenschap van|[Data element](http://modellen.mim-standaard.nl/def/mim#DataElement)[Gegevensgroeptype](http://modellen.mim-standaard.nl/def/mim#Gegevensgroeptype)[Gegevensgroep](http://modellen.mim-standaard.nl/def/mim#Gegevensgroep)[Enumeratie](http://modellen.mim-standaard.nl/def/mim#Enumeratie)[Gestructureerd datatype](http://modellen.mim-standaard.nl/def/mim#GestructureerdDatatype)[Enumeratiewaarde](http://modellen.mim-standaard.nl/def/mim#Enumeratiewaarde)[Codelijst](http://modellen.mim-standaard.nl/def/mim#Codelijst)[View](http://modellen.mim-standaard.nl/def/mim#View)[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Objecttype](http://modellen.mim-standaard.nl/def/mim#Objecttype)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Referentie element](http://modellen.mim-standaard.nl/def/mim#ReferentieElement)[Keuze constraint](http://modellen.mim-standaard.nl/def/mim#KeuzeConstraint)[Primitief datatype](http://modellen.mim-standaard.nl/def/mim#PrimitiefDatatype)[Attribuutsoort](http://modellen.mim-standaard.nl/def/mim#Attribuutsoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)[Keuze](http://modellen.mim-standaard.nl/def/mim#Keuze)[Referentielijst](http://modellen.mim-standaard.nl/def/mim#Referentielijst)[Extern](http://modellen.mim-standaard.nl/def/mim#Extern)[Relatierol](http://modellen.mim-standaard.nl/def/mim#Relatierol)|

### unidirectioneel

|URI|http://modellen.mim-standaard.nl/def/mim#unidirectioneel|
|-|-|
|Definitie|De richting van een relatie, welke betekenis geeft aan de relatie vanuit het perspectief van de eigenaar van de relatie.|
|Bron|[Sectie 2.8.2.20 Metagegeven: unidirectioneel](https://docs.geostandaarden.nl/mim/mim/#metagegeven-unidirectioneel)|
|Datatype|[boolean](http://www.w3.org/2001/XMLSchema#boolean)|
|Eigenschap van|[Externe koppeling](http://modellen.mim-standaard.nl/def/mim#ExterneKoppeling)[Relatiesoort](http://modellen.mim-standaard.nl/def/mim#Relatiesoort)[Relatieklasse](http://modellen.mim-standaard.nl/def/mim#Relatieklasse)|

