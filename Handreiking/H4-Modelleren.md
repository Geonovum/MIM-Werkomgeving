Modelleren 
===========

In dit hoofdstuk wordt een metamodel beschreven voor het opstellen van een
informatiemodel. Centraal hierin staat het metamodel voor informatiemodellering
KKG[^1]. Het metamodel omvat de informatie-elementen die in een informatiemodel
kunnen voorkomen en de beschrijvende informatie die bij die elementen hoort.
Naast het metamodel zijn er ook een aantal regels opgenomen voor
modelleerconstructies. Uitgangspunt is dat het metamodel en de constructies
leiden tot een vergelijkbare vorm van informatiemodellering binnen en tussen de
informatiehuizen.

[^1]: Metamodel voor informatiemodellen.

Metamodel – Toepassing van KKG
------------------------------

Een metamodel beschrijft de informatie-elementen op het metaniveau. Het is in
feite het informatiemodel van het informatiemodel. Het beschrijft de typen en
eigenschappen van de informatie-elementen die kunnen voorkomen in een
informatiemodel.

UML (Unified Modelling Language) is de modelleertaal die voorgeschreven wordt
voor het maken van een informatiemodel. UML bepaalt voor een deel de structuur
en informatie-elementen van het informatiemodel. Maar UML laat nog teveel
vrijheden om als algemene afspraak richtinggevend te zijn. Binnen UML kunnen en
moeten nog extra regels vastgelegd worden om de betekenis van de
informatie-elementen eenduidig vast te leggen. Dit wordt in het metamodel
beschreven. Een registratie kan in de toepassing van het metamodel nog behoefte
hebben aan nadere afspraken of uitbreidingen op het metamodel. Deze extensies
zijn mogelijk maar mogen niet in tegenspraak zijn met het metamodel.

Regel: Een informatiemodel wordt beschreven door middel van UML.

Regel: Het in dit document beschreven metamodel geldt als uitgangspunt voor de
nadere specificering van de toepassing van UML.

Regel: Extensies op het metamodel zijn mogelijk maar mogen niet in tegenspraak
zijn met het metamodel.

Het document Metamodel voor informatiemodellen, opgesteld door KING, Kadaster en
Geonovum wordt overgenomen voor toepassing binnen het DSO. Het genoemde
metamodel wordt aangeduid als metamodel KKG.

Regel: DSO gebruikt KKG metamodel voor informatiemodellen.

Het KKG onderscheidt een aantal niveaus van informatiemodellering, van
begrippenmodel, conceptueel informatiemodel, logisch informatiemodel tot
technisch gegevensmodel. Voor het metamodel in deze handreiking is het niveau
van het logisch informatiemodel van toepassing. Ter begrip hiervan is de volgens
tekst uit KKG overgenomen:

1.  *Model van begrippen*  
    Beschrijft de werkelijkheid binnen het beschouwde domein (de ‘universe of
    discourse’) d.m.v. de daarin gehanteerde begrippen en hun relaties tot
    elkaar. Doel is dat de actoren daarbinnen elkaar begrijpen en één taal
    spreken. Een model van begrippen wordt opgesteld voor gebruik door mensen,
    met name ‘de business’. De begrippen worden beschreven in een formele taal,
    een vocabulaire. Een vocabulaire is geen informatiemodel. Begrippen kunnen
    in meerdere informatiemodellen gebruikt worden.

2.  *Conceptueel informatiemodel*  
    Modellering van de werkelijkheid binnen het beschouwde domein, v.w.b.
    informatie daarvan, onafhankelijk van ontwerp van en implementatie in
    systemen. Het geeft een zo getrouw mogelijke beschrijving van die
    werkelijkheid en is in natuurlijke taal geformuleerd. Een dergelijk model
    definieert het ‘wat’: welke ‘concepten’ (‘dingen’) worden onderscheiden (in
    de beschouwde werkelijkheid), wat betekenen zij, hoe verhouden ze zich tot
    elkaar en welke informatie (eigenschappen) is daarvan relevant. Het dient
    als taal waarmee domeinexperts kunnen communiceren met informatie-analisten
    en verschaft een eenduidige interpretatie van die werkelijkheid ten behoeve
    van deze communicatie. Een conceptueel informatiemodel wordt dan ook
    opgesteld voor gebruik door mensen, zodat ‘de business’ en de
    ICT-specialisten elkaar gaan begrijpen.

3.  *Logisch informatie- of gegevensmodel*  
    Beschrijft hoe de, in het conceptuele model onderscheiden, concepten
    gebruikt worden bij de interactie tussen systemen en hun gebruikers en
    tussen systemen onderling. Anders gezegd, een model van de representatie van
    informatie over de werkelijkheid in digitale registraties en in de
    uitwisseling daartussen. Het gaat hierbij, in tegenstelling tot een
    conceptueel model, dus veel meer om het ‘hoe’. Het slaat de brug tussen
    werkelijkheid en systemen maar beschrijft nog niet de implementatie in die
    systemen. Een dergelijk model wordt in een formele taal beschreven en wordt
    waar mogelijk gegenereerd vanuit het conceptueel model. Het logisch model
    wordt opgesteld voor ICT-interoperabiliteit, voor gebruik door met name de
    ontwerpers, bouwers en beheerders van ICT-voorzieningen.

4.  *Fysiek of technisch gegevens- of datamodel*

>   Specificeert de structuur en eigenschappen van de technologie waarin de
>   informatie wordt vastgelegd of uitgewisseld. Dit is sterk afhankelijk van de
>   gebruikte opslagtechnologie zoals een specifieke database of de
>   servicetechnologie zoals XML, GML, SOAP, REST, (Geo)JSON, LinkedData e.d.
>   Het kan tevens informatie bevatten over de manier waarop berichten ‘verpakt’
>   worden, het (internet)protocol en de logistiek van het berichtenverkeer. De
>   technische specificaties worden over het algemeen zoveel als mogelijk
>   gegenereerd uit het logisch informatiemodel. Deze specificaties worden
>   opgesteld voor ‘machines’, te gebruiken door software-ontwikkelaars

Binnen de context van deze handreiking geldt het logisch informatiemodel als het
operationele niveau waarop informatiemodellen zijn beschreven. De keuze hiervoor
is ingegeven door de overweging dat dit niveau geschikt is voor model driven
omzetting naar afgeleide producten die een digitale gegevensuitwisseling
ondersteunen.

Regel: Dit document gebruikt het logisch informatiemodel als het niveau waarop
informatiemodellen worden beschreven.

### Keuze uit alternatieven van KKG

Het metamodel KKG benoemt op enkele punten alternatieve oplossingen. Voor
toepassing binnen het DSO wordt een keuze gemaakt uit deze alternatieven.

Relatiesoort of relatierol.

KKG heeft twee alternatieven voor de modellering en metadatering van relaties
tussen objecttype. Een relatie wordt gerealiseerd door een ‘relatiesoort’.

**Alternatief 1:** gaat uit van de leidende rol van de relatiesoort, deze heeft
een naam en bevat alle metagegevens. Er is geen beschrijving van de
relatrierollen, de rollen die objecttypen in de relatie hebben.

**Alternatief 2:** gaat uit van de leidende rol van de relatierollen. Verplichte
benoeming van de ‘target rol’ en beschrijving van de metagegevens daarvan. De
relatiesoort heeft optioneel een naam.

Regel: Alternatief 2 wordt gevolgd in dit document.

Naamgevingsconventies.

KKG heeft twee alternatieven voor naamgevingsconventie van informatie-elementen.

**Alternatief 1**: natuurlijke taal, die dichtbij de gebruiker staat. Met
natuurlijke taal wordt bedoeld, zoals de gebruikers erover praten, in normaal
Nederlands. Veelal zijn dit alleen letters en cijfers, met spaties. Koppeltekens
(‘-’ of ‘_’) kunnen gebruikt worden, indien gewenst, alsmede diakrieten. Deze
conventie wordt in KKG verplicht gesteld voor het conceptuele niveau.

**Alternatief 2:** taal (ook) leesbaar door systemen. Met machine leesbare taal
wordt bedoeld dat deze eenvoudig door systemen te verwerken is. Veelal zijn dit
alleen letters en cijfers, zonder spaties, zonder diakrieten. Koppeltekens (‘-’
of ‘_’) kunnen gebruikt worden, maar dit wordt veelal vermeden. Deze conventie
wordt in KKG verplicht gesteld voor het logische niveau.

Regel: Alternatief 2 wordt gevolgd in dit document.

Alternatief 2 ingevuld voor deze handreiking leidt tot de volgende
naamgevingsconventies.

**Naamgevingconventies:**

1.  UML-talen zijn hoofdlettergevoelig.

2.  UML-talen mogen geen spaties bevatten.

3.  UML-talen geven een precieze en begrijpelijke technische beschrijving voor
    klassen, attributen, operaties en parameters.

4.  Combineer indien nodig verschillende woorden om precieze en begrijpelijke
    namen te vormen zonder tussenliggende karakters (“_”, “-”, of spatie).

5.  Maak van de beginletter van ieder deelwoord van namen van attributen,
    waarden in een lijst, operaties, rollen van associaties en parameters een
    hoofdletter, behalve de beginletter van het eerste woord. Bij namen van
    klassen, packages, typespecificaties en associaties wordt ook de beginletter
    een hoofdletter.

6.  Houd namen zo kort als praktisch mogelijk. Gebruik standaard afkortingen als
    ze begrijpbaar zijn, gebruik geen voorzetsels en laat werkwoorden vallen
    wanneer ze niet significant bijdragen aan de betekenis.

7.  Afgezien van sleutelwoorden die uit internationale normen komen is de
    voertaal bij voorkeur Nederlands.

Objectidentificatie
-------------------

De objectidentificatie zorgt voor het identificeren van instanties van
objecttypen. In feite dus de identificatie van de objecten in een registratie.
Dit is niet hetzelfde als de identificatie van objecten in de werkelijkheid.
Voor dat laatste zijn er andere mechanismen die voor elke registratie specifiek
kunnen zijn. De objectidentificatie is eigenlijk de elektronische pointer of
sleutel naar de objecten in de registratie. Omdat die sleutel een bruikbare
waarde moet hebben over alle registraties heen, binnen Nederland en ook
wereldwijd, is het van belang om een systematiek voor wereldwijde unieke
identificatie van objecten toe te passen.

Om dit te realiseren wordt er binnen het DSO een URI strategie ontwikkeld voor
unieke objectidentificatie. Voor de toepassing hiervan wordt verwezen naar dat
document[^2].

[^2]: Kaderstellende notitie, URI-strategie.

Temporeel model
---------------

Het bijhouden van historie en toekomst in relatie tot geldigheid van gegevens
valt onder het temporele model. KKG heeft op meta niveau een mechanisme om aan
te geven of attributen historie op bouwen. In KKG is op het logisch niveau
daarvoor geen implementatie beschreven. Binnen deze handreiking is dat ook niet
opgenomen. Voor de DSO moet worden bezien hiervoor een gestandaardiseerde
oplossing wordt ontwikkeld.

Standaard datatypen
-------------------

Regel:

Informatiemodellen maken voor basis datatypen (of waardetypen) daar waar van
toepassing gebruik van internationale standaarden.

Eén van de onderdelen waarop relatief eenvoudig gestandaardiseerd kan worden is
de semantiek en syntax van datatypen en specifiek de basis waardetypen.
Voorbeelden hiervan zijn ‘numerieke waarde’, ‘alfanumerieke waarde’, ‘geheel
getal’, ‘datum’. Internationaal zijn de equivalenten hiervan gestandaardiseerd.
Hiermee wordt geharmoniseerd over de informatiemodellen van de leefomgeving
doormiddel van het aansluiten op internationale standaarden.

Voorbeelden van standaarddatatypen zijn: characterString, integer, real en ook
date, dataTime, Surface, Point

Referentie voor standaard typen is:

-   ISO/IEC 19501:2005 Information technology – Open distributed Processing
    Modelling Language (UML) Version 1.4.2

-   ISO/IEC 11404: Information technology – General Purpose Datatypes (GPD)

-   ISO 19107: Geographic information – Spatial schema

Geen waarde
-----------

ISO/IEC 11404 definieert void (geen waarde) als een object waarvan de
aanwezigheid syntactisch of semantisch nodig is maar in bepaalde voorkomens
(instanties) geen waarde heeft.

Een element in de inhoud van een bericht heeft in de regel een waarde. Het XML
principe is ook dat een element zonder waarde niet wordt uitgewisseld. Toch is
het zinvol om de reden dat iets geen waarde heeft kenbaar te kunnen maken. Het
kan bijvoorbeeld zijn dat de waarde er wel is maar de aanvrager niet
geautoriseerd is, of dat de waarde er niet is omdat ze niet wordt ondersteund
door de registratie. Zo zijn verschillende redenen die mogelijk van belang
kunnen zijn om aan te geven. Voor het specificeren van het informatiemodel kan
het van belang zijn om de ‘geen waarde’ constructie expliciet bij
informatie-elementen aan te geven. In overeenstemming met ISO/IEC 11404 wordt
daarmee aangegeven dat het informatie-element semantisch nodig is maar in
bepaalde gevallen niet kan worden opgenomen of uitgewisseld. Het is dan
duidelijk voor welke elementen de constructie wel of niet gebruikt mag worden.
KKG geeft dit aan door bij die elementen een ‘indicatie mogelijk geen waarde’ op
te nemen. Het kan toegepast worden bij attributen en associatierollen.

Voor de redenen dat een element niet is ingevuld is een afgesproken lijst
ontwikkeld. Omdat niet alle redenen van te voren zijn te bepalen is dit een open
lijst.

Regel: Voor de redenen voor invullen geen waarde wordt een gestandaardiseerde
lijst gehanteerd.

| Waarde              | Definitie                                                                                                                                                                                                                                                            |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| nietOndersteund     | Zender houdt in zijn registratie geen waardes voor dit element bij.                                                                                                                                                                                                  |
| nietGeautoriseerd   | Zender vindt dat de ontvanger niet geautoriseerd is om de waarde van dit attribuut te kennen                                                                                                                                                                         |
| geenWaarde          | Het attribuut heeft in de werkelijkheid geen waarde. (om expliciet te maken dat er in de werkelijkheid echt geen waarde is)                                                                                                                                          |
| waardeBestaat       | Er bestaat een gangbare waarde voor het attribuut. Bijvoorbeeld toepassen op element overlijdensdatum als zender weet dát de persoon is overleden, maar niet weet wanneer.                                                                                           |
| waardeOnbekend      | Of er een gangbare waarde is en zo ja, wat die waarde is voor dit attribuut, is bij de zender niet bekend.                                                                                                                                                           |
| vastgesteldOnbekend | Er is een gangbare waarde voor het attribuut, maar het is vastgesteld dat die waarde van het attribuut onbekend is en niet meer kan worden achterhaald (bijvoorbeeld omdat een object in de werkelijkheid niet meer bestaat het gegeven niet meer is te achterhalen) |

Deze UML constructie wordt in XML geïmplementeerd middels een ‘nillable’ type
met ‘nilreason’.
