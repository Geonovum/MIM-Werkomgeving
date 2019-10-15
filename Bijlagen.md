# Bijlagen

## Overzicht toegepaste UML metaclasses

![](media/db713545374d78b1070c439199543dc4.png)

## Modelelementen en metagegevens als diagram

Deze bijlage bevat alle modelelementen en metagegevens in één diagram.

*Kern - Relatiesoort is leidend (zie 2.3.2.1)*

![](media/KernMetMetagegevens-alt1.png)

*Kern - Relatierol is leidend (zie 2.3.2.2)*

![](media/KernMetMetagegevens-alt2.png)

*Datatypen*

![](media/DatatypenMetMetagegevens.png)

*Constraints*

![](media/ConstraintsMetMetagegevens.png)

*Packages*

![](media/PackagesMetMetagegevens.png)

## Template naamgeving conventies

| **Modelelement**               | **Naamgevingsconventie**  |   | **Voorbeeld** |
|--------------------------------|---------------------------|---|---------------|
|                                | *Objecttype*              |   |               |
| Naam objecttype                |                           |   |               |
|                                | *Attribuutsoort*          |   |               |
| Naam attribuutsoort            |                           |   |               |
|                                | *Relatiesoort*            |   |               |
| Naam relatie                   |                           |   |               |
|                                | *Gegevensgroeptype*       |   |               |
| Naam gegevensgroeptype         |                           |   |               |
|                                | *Gegevensgroep*           |   |               |
| Naam gegevensgroep             |                           |   |               |
|                                | *Externe koppeling*       |   |               |
| Naam externe koppeling         |                           |   |               |
|                                | *Relatieklasse*           |   |               |
| Naam relatieklasse             |                           |   |               |
|                                | *Referentielijst*         |   |               |
| Naam referentielijst           |                           |   |               |
|                                | *Referentie elemen*t      |   |               |
| Naam referentie element        |                           |   |               |
|                                | *Gestructureerd datatype* |   |               |
| Naam Gestructureerd datatype   |                           |   |               |
|                                | *Data element*            |   |               |
| Naam data element              |                           |   |               |
|                                | *Datatype*                |   |               |
| Naam datatype                  |                           |   |               |
|                                | *Union*                   |   |               |
| Naam Union                     |                           |   |               |
|                                | *Union element*           |   |               |
| Naam union element             |                           |   |               |
|                                | *Enumeratie*              |   |               |
| Naam enumeratie                |                           |   |               |
|                                | *Enumeratiewaarde*        |   |               |
| Code enumeratiewaarde          |                           |   |               |
| Naam enumeratiewaarde          |                           |   |               |


## Vertaling naar engels 

MIM is een specificatie die is ontstaan vanuit de behoeften van enkele basisregistraties en afnemers daarvan. Daarbij is de aansluiting bij internationale (geo)normen gewaarborgd. Echter de precieze aansluiting bij die normen is niet altijd expliciet gemaakt in MIM. 
Met name de relatie met de modelleertechnieken van de ISO 19100 serie is van belang. Deze ISO standaarden vormen de ondergrond voor o.a. Inspire en NEN3610. 

In het volgende overzicht geldt het volgende

Kolom Aard waarden:

- ST = Stereotype
- TV = Tagged value naam
- VAL =	Tagged value waarde

Kolom MIM  benaming ISO waarden:

- Als *schuin gedrukt*, dan is de naam overgenomen voor dezelfde constructie uit het General Feature Model [ISO 19109].

Kolom Reden waarden:
- Vertaling 	= Hetzelfde ding, vertaald in het Engels. De aansluiting bij ISO 19100 serie wordt daarbij expliciet gezocht.
- Precisering 	= De naam maakt de aard van het stereotype preciezer.

| **Aard**| **MIM 1.1**      				| **MIM benaming  ISO**  			| **Reden** 	|
|---------|---------------------------------|-----------------------------------|---------------|
|  ST     |	Objecttype       				|	*FeatureType* (ISO 19109) GF_FeatureType					|  Vertaling	|
|  ST     |	Attribuutsoort 					|	*AttributeType*	(ISO 19109) GF_AttributeType				|  Vertaling	|
|  ST     |	Gegevensgroeptype 				|	AttributeGroupType				|  Vertaling en precisering |
|  ST     |	Gegevensgroep  					|	AttributeGroup 					| Vertaling en precisering |
|  ST     |	Relatiesoort  					|	*AssociationType* (ISO 19109) GF_AssociationType				|  Vertaling	|
|  ST     |	Relatieklasse  					|	AssociationClass				|  Vertaling	|
|  ST     |	Externe koppeling	  			|   ExternalLink					|  Vertaling	|
|  ST     |	Relatierol  					|	*AssociationRole* (ISO 19109) GF_AssociationRole			|  Vertaling	|
|  ST     |	Referentielijst  				|	ReferenceList					|  Vertaling	|
|  ST     |	Referentie element  			|	ReferenceElement				|  Vertaling	|
|  ST     |	Enumeratie  					|	Enumeration						|  Vertaling	|
|  ST     |	Enumeratiewaarde  				|	Enum							|  Vertaling	|
|  ST     |	CodeList  						|	*CodeList*  (ISO 19103)     	|   	-		|
|  ST     |	Datatype	  					|   SimpleType						|  Vertaling en precisering |
|  ST     |	Complex datatype  				|	ComplexType					  	|  Vertaling	|
|  ST     |	Data element  					|	DataElement						|  Vertaling	|
|  ST     |	Keuze  							|	Union Defines a union data type.|	    -		|
|  ST     |	Keuze element	  				|   UnionElement					|  Vertaling	|
|  ST     |	Extern  						|	External						|  Vertaling	|
|  ST     |	View  							|	View							|  Vertaling	|
|  TV     |	Beheerder  						|	Administrator					|  Vertaling	|
|  TV     |	Data locatie  					|	Data location					|  Vertaling	|
|  TV     |	Datum opname                  	|	Date recorded					|  Vertaling	|
|  TV     |	Eigenaar                     	|	Owned by						|  Vertaling	|
|  TV     |	Formeel patroon               	|	Formal pattern					|  Vertaling	|
|  TV     |	Herkomst                     	|	Source							|  Vertaling	|
|  TV     |	Herkomst definitie	         	|   Origin of definition			|  Vertaling	|
|  TV     |	Indicatie authentiek	      	|   Indication authentic			|  Vertaling	|
|  TV     |	Indicatie formele historie	  	|   Indication formal history		|  Vertaling	|
|  TV     |	Indicatie materiële historie  	|	Indication material history		|  Vertaling	|
|  TV     |	Kwaliteit	  					|   Quality							|  Vertaling	|
|  TV     |	Lengte  						|	Length							|  Vertaling	|
|  TV     |	Locatie  						|	Location						|  Vertaling	|
|  TV     |	Mogelijk geen waarde  			|	Voidable						|  Vertaling	|
|  TV     |	Patroon  						|	Pattern							|  Vertaling	|
|  TV     |	Populatie  						|	Population						|  Vertaling	|
|  TV     |	Regels  						|	Rules							|  Vertaling	|
|  TV     |	Toelichting  					|	Description						|  Vertaling	|
|  VAL    |	Ja  							|	Yes								|  Vertaling	|
|  VAL    |	Nee	  							|   No								|  Vertaling	|
|  VAL    |	Zie groep  						|	See group						|  Vertaling	|
|  VAL    |	Authentiek	  					|   Authentic						|  Vertaling	|
|  VAL    |	Basisgegeven  					| 	Base data						|  Vertaling	|
|  VAL    |	Landelijk kerngegeven  			|	National base data				|  Vertaling	|
|  VAL    |	Gemeentelijk kerngegeven  		|	Municipal base data				|  Vertaling	|
|  VAL    |	Overig	  						|   Other							|  Vertaling	|

## Versielog

In deze versie 1.1 zijn de volgende issues verwerkt:

| Issue                                                                 | Omschrijving | 
|-----------------------------------------------------------------------|--------------|
| [Issue #3](https://github.com/Geonovum/MIM-Werkomgeving/issues/3)     | Toevoegen Decimal aan primaire types in MIM |
| [Issue #12](https://github.com/Geonovum/MIM-Werkomgeving/issues/12)   | Metadata van het informatiemodel zelf en van de packages/subgroepen hierbinnen |
| [Issue #17](https://github.com/Geonovum/MIM-Werkomgeving/issues/17)   | Vertaling naar engels opnemen in een bijlage |
| [Issue #18](https://github.com/Geonovum/MIM-Werkomgeving/issues/18)   | Opnemen van een tagged value voor versies/varianten van metamodel  |
| [Issue #21](https://github.com/Geonovum/MIM-Werkomgeving/issues/21)   | Verwijzen van informatiemodel naar model van begrippen  |
| [Issue #22](https://github.com/Geonovum/MIM-Werkomgeving/issues/22)   | GegevensgroepType onderbeschreven  |
| [Issue #24](https://github.com/Geonovum/MIM-Werkomgeving/issues/24)   | hoe toevoegen locatie bij/van waardelijst (bij attribuutsoort union-element en data-element)?  |
| [Issue #38](https://github.com/Geonovum/MIM-Werkomgeving/issues/38)   | Modelaspecten versus meta-aspecten  |
| [Issue #53](https://github.com/Geonovum/MIM-Werkomgeving/issues/53)   | Aspect "naam" heeft meerdere definities |
| [Issue #57](https://github.com/Geonovum/MIM-Werkomgeving/issues/57)   | Aspect "attribuut" ontbreekt in de tekst |
| [Issue #59](https://github.com/Geonovum/MIM-Werkomgeving/issues/59)   | Waarden voor typeAggregatie c.q. subklassen |
| [Issue #61](https://github.com/Geonovum/MIM-Werkomgeving/issues/61)   | hoe modelleer je een keuze tussen attribuutsoorten en/of relatiesoorten? |
| [Issue #66](https://github.com/Geonovum/MIM-Werkomgeving/issues/66)   | herschrijven hoofdstuk 2 en 3 |
| [Issue #69](https://github.com/Geonovum/MIM-Werkomgeving/issues/69)   | MIM document implementatie neutraal maken, met hoofdstuk voor MIM-UML |
| [Issue #70](https://github.com/Geonovum/MIM-Werkomgeving/issues/70)   | MIM-LD vocabulaire maken |
| [Issue #71](https://github.com/Geonovum/MIM-Werkomgeving/issues/71)   | MIM-LD - MIM document, hoofdstuk MIM-LD toevoegen |
| [Issue #72](https://github.com/Geonovum/MIM-Werkomgeving/issues/72)   | MIM-LD - bestaand informatiemodel transformeren naar een instantieerbaar LD model |
| [Issue #74](https://github.com/Geonovum/MIM-Werkomgeving/issues/74)   | Generalisatie heeft twee definities |
| [Issue #80](https://github.com/Geonovum/MIM-Werkomgeving/issues/80)   | De definitie van "Primitief datatype" is recursief |
| [Issue #81](https://github.com/Geonovum/MIM-Werkomgeving/issues/81)   | De definitie van "Gestructureerd datatype" is recursief |
| [Issue #85](https://github.com/Geonovum/MIM-Werkomgeving/issues/85)   | Ontbreken van de waarde "Niet authentiek" |
| [Issue #86](https://github.com/Geonovum/MIM-Werkomgeving/issues/86)   | Datatype van Indicatie materiele/formele historie irt groepen |
| [Issue #87](https://github.com/Geonovum/MIM-Werkomgeving/issues/87)   | MIM document web-friendly maken |
| [Issue #90](https://github.com/Geonovum/MIM-Werkomgeving/issues/90)   | Meerdere definities voor aspecten "unidirectioneel", "objecttype", "gerelateerdObjecttype" en "typeAggregatie" |
| [Issue #96](https://github.com/Geonovum/MIM-Werkomgeving/issues/96)   | Algemeen: UML diagrammen bijwerken voor versie 1.1 |
| [Issue #97](https://github.com/Geonovum/MIM-Werkomgeving/issues/97)   | herschrijven voorwoord |
| [Issue #100](https://github.com/Geonovum/MIM-Werkomgeving/issues/100) | Aanduiding van een volgorde van kenmerken? |
| [Issue #101](https://github.com/Geonovum/MIM-Werkomgeving/issues/101) | Namen van objectentypen of kenmerken uniek binnen IM? |
| [Issue #102](https://github.com/Geonovum/MIM-Werkomgeving/issues/102) | Hoe hergebruiken van kenmerken of definities |
| [Issue #107](https://github.com/Geonovum/MIM-Werkomgeving/issues/107) | Alias en naam, of naam en alias? Wat staat er in? |

