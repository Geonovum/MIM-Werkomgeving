## Inleiding

Voor u ligt het metamodel voor het beschrijven van informatiemodellen.
Met het metamodel voor informatiemodellen (MIM) hebben we een gemeenschappelijk 
vertrekpunt opgesteld voor het maken van informatiemodellen. Het model bevat 
duidelijke afspraken over het vastleggen van gegevensspecificaties en biedt 
tegelijkertijd ruimte aan de verschillende niveaus van modellering. Bijzonder 
aan het model is dat de afspraken over meerdere bestuurslagen heen gaan.

Dit document is opgesteld met kennis die is aangedragen door de MIM-community.
Kadaster, Geonovum, VNG Realisatie, DUO, Ordina en andere partijen hebben hun bijdrage geleverd.

### Toepassingsgebied
Het metamodel biedt de modelleringstaal waarmee een informatiemodel gemaakt,
gelezen en begrepen kan worden. Het doel hiervan is:
-   de leesbaarheid en eenduidigheid van informatiemodellen te vergroten;
-   informatiemodellen op zowel conceptueel als op logisch niveau te kunnen
    opstellen (zie [Wat is een informatiemodel](#wat-is-een-informatiemodel)) <!-- (zie par. 1.4); -->
-   informatiemodellen goed aan elkaar te kunnen koppelen op conceptueel en
    logisch niveau;
-   tooling te kunnen ontwikkelen en (her)gebruiken voor resp. door alle
    partijen die kiezen voor dit metamodel;
-   kennis uit verschillende organisaties te bundelen;
-   en in het verlengde hiervan, om op een meer geautomatiseerde werkwijze
    sneller en beter voorspelbaar uitwisselingsstandaarden op kunnen stellen. en
-   om interoperabiliteit tussen registraties te bevorderen.

Voor informatiemodellen die op basis van dit metamodel zijn beschreven geldt:
-   ze zijn eenduidig te interpreteren en goed te vergelijken;
-   er kan documentatie mee opgesteld of gegenereerd worden welke geschikt is
    voor publicatie;
-   ze kunnen als basis gebruikt worden voor (bij voorkeur model-driven
    generatie van) afgeleide modellen en producten voor een specifiek
    toepassingsgebied/domein zoals bijvoorbeeld NEN3610 [[!NEN3610]] of het gemeentelijke
    domein;
-   ze kunnen als basis gebruikt worden voor (bij voorkeur model-driven
    generatie van) afgeleide modellen voor specifieke services en
    informatieproducten (implementatieschema’s, registers, validatieservices
    e.d.).

### Doelgroep
Dit document is primair bestemd voor informatiearchitecten die deze
informatiemodellen maken; informatieanalisten die willen weten wat de betekenis
en definitie van informatieobjecten is, en mensen die model-driven verder werken
op basis van het informatiemodel en er implementaties van maken. Kennis van
informatiemodellering is een vereiste. Enige kennis van UML [[!UML]] of [[!Linked-Data]] is een pré maar niet
noodzakelijk. Dit metamodel richt zich in het bijzonder op de informatievoorziening binnen 
het overheidsdomein, al is het ook in bredere context inzetbaar.

### Leeswijzer
Het metamodel beschrijven we in vijf hoofdstukken en een bijlage.

Lees de [Inleiding](#inleiding) verder voor inzicht in wat we onder een
informatiemodel en onder een metamodel verstaan, hoe deze de modellen zich
verhouden tot UML en de vier lagen metamodel architectuur van de Object
Management Group [[!OMG]], en welke standaarden worden toegepast.

Het hoofdstuk [Metamodel Algemeen](#metamodel-algemeen) bevat de beschrijving van alle 
bouwstenen c.q. de modelelementen van het metamodel, in de vorm van definities en specificaties.
De betekenis en toelichting van de modelelementen van het metamodel vormt het materiaal waarmee een uitputtende 
modelspecificatie kan worden opgesteld. De afbeeldingen in dit algemene hoofdstuk zijn weliswaar gemaakt in UML, maar het metamodel beperkt 
zich zeker niet tot UML. Er zijn aparte hoofdstukken voor de implementatie van MIM in UML en Linked Data.

Het hoofdstuk [Metamodel in UML](#metamodel-in-uml) beschrijft hoe de implementatie van MIM in
[[!UML]] er uit ziet. In dit hoofdstuk wordt beschreven hoe het metamodel zich verhoudt tot het UML
metamodel, welke uitbreidingen c.q. verbijzonderingen van het UML metamodel zijn
aangebracht. 

Het hoofdstuk [Metamodel in Linked Data (LD)](#metamodel-in-linked-data-(ld)) beschrijft hoe de implementatie van MIM in
[[!Linked-Data]] er uit ziet. In dit hoofdstuk wordt beschreven hoe het metamodel zich verhoudt tot het Linked Data
metamodel, welke uitbreidingen c.q. verbijzonderingen van het Linked Data metamodel zijn
aangebracht. 

In het hoofdstuk [Afspraken & Regels](#afspraken-regels) gaan we in detail in op een
aantal aspecten. Het is een uitgebreidere toelichting, in aanvulling op het 
hoofdstuk [Metamodel Algemeen](#metamodel-algemeen), bestaande uit nadere afspraken, regels, richtlijnen en
aanbevelingen bij het toepassen van het metamodel.

De bijlage [Template naamgeving conventies](#template-naamgeving-conventies) verschaft een overzicht van alle bouwstenen en metadata-elementen en
het al dan niet van toepassing zijn daarvan in een conceptueel dan wel een
logisch informatiemodel.

### Wat is een informatiemodel
Een informatiemodel beschrijft de structuur, semantiek en de eigenschappen van
informatie over dingen in de werkelijkheid. Met semantiek wordt de betekenis en
definitie van de informatie over ‘het ding’ bedoeld, onafhankelijk van een
mogelijke implementatie of toepassingsomgeving. Er worden dus geen regels
toegepast die gerelateerd zijn aan de manier waarop de gegevens ingewonnen,
opgeslagen, beheerd en uitgewisseld worden. Die beschrijving heeft de vorm van
een model dat een gestructureerde weergave is van die werkelijkheid. Een
dergelijk model is noodzakelijk om deze informatie te kunnen beheren en
gebruiken (door mensen en machines) bij het communiceren over deze
werkelijkheid, in <span class='note'>[registraties](#inl-n-1)</span> of anderszins, zoals het specificeren van de
tussen registraties uit te wisselen gegevens of van de te bevragen informatie
uit een registratie.

Het beschrijven vindt plaats door de informatie te modelleren naar objecttypen
en de kenmerken daarvan naar attribuutsoorten van die objecttypen en relaties
tussen die objecttypen. Alleen dingen en kenmerken die relevant zijn voor een
bepaald domein worden in het informatiemodel beschreven, zoals gebouwen binnen
het domein Basisregistratie Topografie en personen binnen het domein
Basisregistratie Personen. Een domein kan van alles zijn maar in het kader van
dit metamodel gaat het om (beleids)sectoren die omwille van bestuurlijke en
beheersmatige redenen geïdentificeerd en georganiseerd zijn. Voorbeelden:
ruimtelijke ordening, grootschalige topografie, kadastrale informatie of
gemeentelijk domein.

Objecttypen in een informatiemodel representeren dingen in de werkelijkheid. De
volgende tekst beschrijft hoe dingen in de werkelijkheid zich verhouden tot het
informatiemodel. We visualiseren dat in onderstaande figuur voor de situatie dat
er een, van het informatiemodel afgeleide, registratie is.

![](media/informatiemodel.png)

<aside class='example'>
    Jan en Katrien zijn bijvoorbeeld ‘dingen in de werkelijkheid’. Zij hebben
    bepaalde kenmerken, zoals een naam en een geboortedatum. In een informatiemodel
    komen Jan en Piet niet voor. Ook hun gegevens, zoals het feit dat 10-10-1970 de
    geboortedatum van Jan is, komt niet voor.
</aside>

In de context van het informatiemodel worden Jan en Katrien gezien als
*objecten* binnen een domein. In het informatiemodel is het *objecttype* Persoon
gedefinieerd en Jan en Piet zijn dus objecten van het objecttype Persoon.

De *kenmerken* zoals de naam en geboortedatum maar bijvoorbeeld ook
identificatie en registratietijdstip worden gezien als attributen van dit
objecttype. We noemen een dergelijk kenmerk een *attribuutsoort*. Sommige
kenmerken, zoals het gegeven dat Jan getrouwd is met Katrien, modelleren we door
middel van een relatiesoort tussen objecttypen, in dit geval van Persoon met
zichzelf.

In de van het informatiemodel afgeleide registratie kunnen vervolgens de
objecten Jan en Katrien en de gegevens ervan, zoals de geboortedatum 10-10-1970,
worden vastgelegd.

Als een andere registratie op haar eigen manier tegen dezelfde ‘Jan uit de
werkelijkheid’ aankijkt, dan is ook in die registratie een (eigen, apart) object
voor Jan aanwezig en Jan kan in dit (eigen, apart) informatiemodel anders
gemodelleerd zijn. Beide objecten Jan representeren natuurlijk dezelfde ‘Jan uit
de werkelijkheid’, vanuit het perspectief van het eigen domein bekeken.

### Typen informatiemodellen
Zoals hiervoor uiteengezet beschrijft een informatiemodel de werkelijkheid. In
de praktijk blijken hier niveaus in te bestaan, variërend van een zo getrouw
mogelijke beschrijving van die werkelijkheid tot een specificatie van de wijze
van vastlegging van die werkelijkheid in een database of uitwisselformaat.
Veelal worden vier niveaus onderscheiden [[!MDA]]

#### Niveau 1: Model van begrippen
Beschrijft de werkelijkheid binnen het beschouwde domein (de ‘universe of
discourse’) d.m.v. de daarin gehanteerde begrippen en hun relaties tot elkaar.
Doel is dat de actoren daarbinnen elkaar begrijpen en één taal spreken. Een
model van begrippen wordt opgesteld voor gebruik door mensen, met name ‘de
business’. De begrippen worden beschreven in een formele taal, een vocabulaire.
Een vocabulaire is geen informatiemodel. Begrippen kunnen in meerdere
informatiemodellen gebruikt worden.

#### Niveau 2: Conceptueel informatiemodel
Modellering van de werkelijkheid binnen het beschouwde domein, v.w.b. informatie
daarvan, onafhankelijk van ontwerp van en implementatie in systemen. Het geeft
een zo getrouw mogelijke beschrijving van die werkelijkheid en is in natuurlijke
taal geformuleerd. Een dergelijk model definieert het ‘wat’: welke ‘concepten’
(‘dingen’) worden onderscheiden (in de beschouwde werkelijkheid), wat betekenen
zij, hoe verhouden ze zich tot elkaar en welke informatie (eigenschappen) is
daarvan relevant. Het dient als taal waarmee domeinexperts kunnen communiceren
met informatie-analisten en verschaft een eenduidige interpretatie van die
werkelijkheid ten behoeve van deze communicatie. Een conceptueel informatiemodel
wordt dan ook opgesteld voor gebruik door mensen, zodat ‘de business’ en de
ICT-specialisten elkaar gaan begrijpen.

#### Niveau 3: Logisch informatie- of gegevensmodel
Beschrijft hoe de, in het conceptuele model onderscheiden, concepten gebruikt
worden bij de interactie tussen systemen en hun gebruikers en tussen systemen
onderling. Anders gezegd, een model van de representatie van informatie over de
werkelijkheid in digitale registraties en in de uitwisseling daartussen. Het
gaat hierbij, in tegenstelling tot een conceptueel model, dus veel meer om het
‘hoe’. Het slaat de brug tussen werkelijkheid en systemen maar beschrijft nog
niet de implementatie in die systemen. Een dergelijk model wordt in een formele
taal beschreven en wordt waar mogelijk gegenereerd vanuit het conceptueel model.
Het logisch model wordt opgesteld voor ICT-interoperabiliteit, voor gebruik door
met name de ontwerpers, bouwers en beheerders van ICT-voorzieningen.

#### Niveau 4: Fysiek of technisch gegevens- of datamodel
Specificeert de structuur en eigenschappen van de technologie waarin de
informatie wordt vastgelegd of uitgewisseld. Dit is sterk afhankelijk van de
gebruikte opslagtechnologie zoals een specifieke database of de
servicetechnologie zoals [[!xml]], [[!gml]], [[!SOAP]], REST, (Geo)JSON, [[!Linked-Data]] e.d. Het
kan tevens informatie bevatten over de manier waarop berichten ‘verpakt’ worden,
het (internet)protocol en de logistiek van het berichtenverkeer. De technische
specificaties worden over het algemeen zoveel als mogelijk gegenereerd uit het
logisch informatiemodel. Deze specificaties worden opgesteld voor ‘machines’, te
gebruiken door software-ontwikkelaars.

Het voorliggende metamodel kan toegepast worden op twee niveaus, niveau 2 en
niveau 3: t.b.v. een zuiver conceptueel informatiemodel (2) en t.b.v. een
logisch informatiemodel (3). Het moge duidelijk zijn dat het altijd het één of
het ander is. Een combinatie van beide in één model leidt tot verwarring. Voor
eenzelfde domein verschilt de structuur van het informatiemodel naar gelang het
type en bevat het logisch informatiemodel meer, vooral formele, specificaties
dan een conceptueel model. Het is voor de hand liggend maar niet persé
noodzakelijk om voor een domein eerst een conceptueel en daarna een logisch
informatiemodel op te stellen. Een organisatie kan er voor kiezen om alleen een
logisch informatiemodel op te stellen. Een begrippenmodel is in dat geval
dringend aanbevolen. Bijlage 3 verschaft een overzicht van de
metadata-constructen en -elementen die per type model van toepassing zijn.

Het is van belang om voorafgaand aan het opstellen van een informatiemodel
expliciet te bepalen welk van beide typen beoogd is en de modellering conform
het gekozen type te doen plaatsvinden. In de beschrijving van het
informatiemodel moet vermeld worden om welk van beide typen het gaat. Aan te
bevelen is om eerst een conceptueel model op te stellen en dit vervolgens uit te
werken naar een logisch model.

### Wat is het metamodel voor informatiemodellen
Een metamodel is een model van een model. Het definieert een verzameling van
modelleerconstructies in de vorm van bouwstenen oftewel modelelementen, met
bijbehorende betekenis en bijbehorende afspraken omtrent hoe deze toe te passen.
Een informatiemodel kan vervolgens hiermee gemaakt worden. Het metamodel is
daarmee de modelleertaal waarin een informatiemodel is uitgedrukt. Deze metataal
beschrijft als het ware de grammatica en de syntax van de modelleertaal.

Vaak zie je dat het metamodel niet expliciet beschreven is en dat het metamodel
een onderdeel van de domeinkennis is geworden. Bij domeinoverstijgende
harmonisatie wordt het dan moeilijk om modellen met elkaar te vergelijken en op
basis daarvan gegevens uit te wisselen. Beschrijving van het metamodel is daarom
een randvoorwaarde indien er sprake is van een stelsel van samenhangende
informatiemodellen. Anders gezegd, met (alleen) de in het metamodel opgenomen
set van modelleerconstructies worden informatiemodellen gemaakt. Door het
schrijven van modelleertalen (zoals [[!UML]]) in een metataal (zoals MOF) wordt
gegarandeerd dat alle toepassingen van die talen op een standaard manier zijn
opgebouwd en daardoor alom te begrijpen zijn. De metataal beschrijft als het
ware de grammatica van de modelleertaal. Het metamodel in dit document is
gebaseerd op UML.

### Uitdrukken in UML
Zowel het metamodel als informatiemodellen kan woren uitgedrukt in UML.
Registraties en afnemers hiervan kunnen deze gebruiken voor de inrichting van
hun situatiespecifieke gegevenshuishouding. Belangrijk is dat de lezer eerst
begrijpt wat we onder een informatiemodel en een metamodel verstaan en verder is
het van belang de modellen in de juiste context te plaatsen. Dit laatste doen we
aan de hand van de vier lagen metamodel architectuur van de Object Management
Group [[!OMG]]. In deze paragaaf gaan we op deze concepten in.

**Vier lagen metamodel architectuur OMG**
Voor de specificatie van het metamodel is gebruik gemaakt van dezelfde formele
taal waarin de informatiemodellen zijn beschreven, namelijk UML. Het metamodel
van deze informatiemodellen is een uitbreiding op het basale UML-metamodel.

Het basale UML-metamodel is een metamodel dat onderdeel uitmaakt van de vier
lagen metamodel architectuur van OMG namelijk M0, M1, M2 en M3. Daarbij is elke
laag een instantie van de laag daarboven (met uitzondering van de 1e laag) en
maakt de laag gebruik van een in de naast hoger gelegen laag gespecificeerde
uitdrukkingsmogelijkheden teneinde een specificatie in een andere context te
vormen. De toplaag is de metamodellaag oftewel M3 laag en definieert de
basisconstructies, m.a.w. de taal waarin de onderliggende laag is uitgedrukt.
Metamodel Meta Object Facility (MOF) is een voorbeeld van deze laag. MOF is de
basislaag voor de UML laag. De metamodel laag (M2) is een instantie van de M3
laag. Op deze laag bevindt zich onder meer het metamodel UML. M.a.w. UML is een
instantie van MOF. Deze laag is taaltechnisch rijker dan de M3 laag. De M2 laag
definieert de semantiek en syntax van de modelconstructies in de M1 laag. De M1
laag is de laag waarop zich het informatiemodel bevindt om een bedrijfscontext
modelmatig te beschrijven. Deze M1 laag is een instantie van de M2 laag.
Tenslotte is er nog de M0 laag waarop zich de objecten en data bevinden, de
instanties van de M1 modelconstructies die een representatie van de concrete
werkelijkheid op een specifiek tijdsmoment vormen.

| **Metaniveau** | **Omschrijving**                                                             | **Elementen**                                                 |
|----------------|------------------------------------------------------------------------------|---------------------------------------------------------------|
| M3             | MOF, verzameling van constructies voor definiëren van metamodellen           | MOF klasse, MOF attribuut, MOF Associatie, MOF operatie, etc. |
| M2             | Metamodellen (UML, CWM, etc.), bestaande uit instanties van MOF constructies | UML klasse, UML associatie, UML attribuut, etc.               |
| M1             | Modellen, bestaande uit instanties van M2 metamodel constructies             | Klasse “Order”, klasse “Klant”, attribuut “naam” etc          |
| M0             | Objecten en data, de instanties van M1 model constructies                    | Order 43123, Artikel 8RB31, etc.                              |

*Tabel 1 Vier lagen metamodel OMG*

De informatiemodellen waarover we het hier in dit document hebben bevinden zich
op de M1-laag.

Dit metamodel is een uitbreiding op het UML metamodel (M2). Het UML metamodel is
daarbij uitgebreid met speciale elementen, die geen onderdeel uitmaken van het
basale UML-metamodel (M2). Deze nieuwe elementen zijn noodzakelijk voor het
definiëren van de semantiek en syntax van de modelconstructies zoals we die in
onze informatiemodellen hanteren.

Het UML metamodel (M2) is een ‘read only’ model. Dat wil zeggen dat we geen
bestaande metaclass mogen aanpassen en we dus geen nieuw basis metaclass voor
een bestaande UML metaclass mogen specificeren. Maar via Profiles (van de
InfrastructureLibrary) kunnen bestaande metaclasses uitgebreid worden zonder dat
er nieuwe metaclasses gedefinieerd hoeven te worden en dus zonder aanpassing van
het basale UML-metamodel (M2). De extensiemechanismen hiervoor zijn stereotypes,
tagged values en constraints.

### Uitdrukken in Linked Data

<todo>
*HIER NOG EEN BESCHRIJVING TOEVOEGEN*  
*HIER NOG EEN BESCHRIJVING TOEVOEGEN*  
*HIER NOG EEN BESCHRIJVING TOEVOEGEN*  
*HIER NOG EEN BESCHRIJVING TOEVOEGEN*  
</todo>

### Een eigen extensie op het metamodel
Indien er extra metamodelconstructies nodig zijn voor een informatiemodel, dan
kan dit metamodel uitgebreid worden met een aanvulling oftewel extensie (in de
vorm van een extra bijlage) die door de betreffende organisatie toegevoegd wordt
aan het onderhavige document.

De spelregel bij een extensie is dat deze geen onderwerpen *vervangt* die in dit
metamodel beschreven zijn, maar alleen echte uitbreidingen behelst. Indien
meerdere organisaties hierin geïnteresseerd zijn, kan zo’n extensie ook
toegevoegd worden aan dit metamodel.
<todo>Neem dan contact op met de helpdesk (zie [voorwoord](#voorwoord)).</todo>

Het is ook mogelijk om in de extensie aan te geven welke elementen uit dit
metamodel *niet* ingezet (mogen) worden in uw informatiemodellen. Denk hierbij
bijvoorbeeld aan een bepaald modelelement. Of aan bepaalde metadata aspecten die
niet ingewonnen worden in uw informatiemodellen en daarom buiten scope worden
geplaatst (ongeacht of deze optioneel of verplicht zijn).

Voor meer informatie over een specifieke extensie kan contact opgenomen worden
met de beheerder van deze extensie.

Nota bene: een metamodel extensie is expliciet niet bedoeld voor aanvullende
constructies die alleen spelen op het niveau van implementatie, of op het niveau
van afgeleide modellen t.b.v. specifieke koppelvlakken en interfaces. Deze
vallen buiten scope van dit metamodel en ook buiten scope van extensies hierop.
Wel is het mogelijk en toegestaan om het metamodel, of delen ervan, hiervoor te
gebruiken.

### Alternatieven
In dit metamodel is op één punt sprake van een keuze tussen twee alternatieven,
waarvan de modelleur van een informatiemodel één van beide alternatieven kiest.
Welke je kiest geef je aan bij je eigen informatiemodel, in je eigen extensie
(zoals bedoeld in de vorige paragraaf).

Dit betreft: Relatiesoort en relatierol, beide te gebruiken, maar welke is
verplicht/leidend (zie [Specificatie metagegevens voor relaties](#specificatie-metagegevens-voor-relaties)).

Indien gewenst kunt u hier vragen over stellen aan de beheerders van dit
metamodel voordat u een keuze maakt.

### Beheer
Het beheer van dit metamodel vindt plaats door Geonovum met ondersteuning van het Kadaster. Voor vragen, suggesties of opmerkingen kunt
u contact opnemen met de MIM helpdesk van Geonovum: mim@geonovum.nl

<todo>TODO: Deze kan weg zodra alle referenties gerefereerd zijn</todo>

### Normreferenties

| \#  | Naam                                         | **Referentie** |
|-----|----------------------------------------------|----------------|
| 1.  | Unified Modeling Language (UML)              | [[!UML]]       |
| 2.  | OMG Unified Modeling Language TM versie 2.5  | [[!OMG]]       |
| 3.  | Stelselcatalogus                             | [[!SCAT]]      |
| 4.  | GAB                                          | [[!GAB]]       | 
| 5.  | Handreiking gegevensbeschrijving (NORA)      | [[!NORA]]      |
| 6.  | ISO 11404                                    | [[!iso-11404]] |
| 7.  | ISO 8601                                     | [[!iso-8601]]  |
| 8.  | Formeel patroon (Reguliere Expressies)       | [[!REGEXP]]    |
| 9.  | OCL                                          | [[!OCL]]       |
| 10. | NEN 3610/A1:2016 Basismodel Geo-informatie   | [[!NEN3610]]   |

De Stelselcatalogus [[!SCAT]], het GAB [[!GAB]] en de Handreiking gegevensbeschrijving 
[[!NORA]] raken elkaar op een aantal vlakken maar er kunnen op deze raakvlaken verschillen zijn 
in de gemaakte afspraken. Voor het metamodel hanteren we daarom de volgende spelregel:
de Stelselcatalogus is zoveel als mogelijk leidend, vervolgens het GAB en als
laatste de handreiking.

**Voetnoten**

<aside id='inl-n-1' class='note'>
    De opname in een *registratie* kent vaak een inwinningsproces, om
    gegevenswaarden over de feitelijke dingen in de werkelijkheid conform het
    informatiemodel in de registratie op te nemen. Dit is een belangrijk proces,
    maar valt buiten scope van het informatiemodel.
</aside>
