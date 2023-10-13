# Inleiding

Voor u ligt het metamodel voor informatiemodellering (MIM), voor het beschrijven van informatiemodellen. Met het metamodel hebben we een gemeenschappelijk vertrekpunt opgesteld voor het maken van informatiemodellen. Het model bevat duidelijke afspraken over het vastleggen van gegevensspecificaties en biedt tegelijkertijd ruimte aan de verschillende niveaus van modellering. Bijzonder aan het model is dat de afspraken over meerdere bestuurslagen heen gaan. Dit document is opgesteld met kennis die is aangedragen door de MIM-community.
Kadaster, Geonovum, VNG Realisatie, DUO en andere partijen hebben hun bijdrage geleverd.

## Toepassingsgebied
Het metamodel biedt de modelleringstaal waarmee een informatiemodel gemaakt, gelezen en begrepen kan worden. Het doel hiervan is:
-   de leesbaarheid en eenduidigheid van informatiemodellen te vergroten;
-   informatiemodellen op zowel conceptueel als op logisch niveau te kunnen opstellen (zie [Wat is een informatiemodel](#wat-is-een-informatiemodel)) <!-- (zie par. 1.4); -->
-   informatiemodellen goed aan elkaar te kunnen koppelen op conceptueel en logisch niveau;
-   tooling te kunnen ontwikkelen en (her)gebruiken voor resp. door alle partijen die kiezen voor dit metamodel;
-   kennis uit verschillende organisaties te bundelen;
-   en in het verlengde hiervan, om op een meer geautomatiseerde werkwijze sneller en beter voorspelbaar uitwisselingsstandaarden op kunnen stellen. en
-   om interoperabiliteit tussen registraties te bevorderen.

Voor informatiemodellen die op basis van dit metamodel zijn beschreven geldt:
-   ze zijn eenduidig te interpreteren en goed te vergelijken;
-   er kan documentatie mee opgesteld of gegenereerd worden welke geschikt is voor publicatie;
-   ze kunnen als basis gebruikt worden voor (bij voorkeur model-driven generatie van) afgeleide modellen en producten voor een specifiek toepassingsgebied/domein zoals bijvoorbeeld [[NEN3610]] of het gemeentelijke domein;
-   ze kunnen als basis gebruikt worden voor (bij voorkeur model-driven generatie van) afgeleide modellen voor specifieke services en informatieproducten (implementatieschema’s, registers, validatieservices e.d.).

## Doelgroep
Dit document is primair bestemd voor informatiemodelleurs en informatiearchitecten  die deze informatiemodellen maken; informatieanalisten die willen weten wat de betekenis en definitie van informatieobjecten is, en mensen die model-driven verder werken op basis van het informatiemodel en er implementaties van maken. Kennis van informatiemodellering is een vereiste. Enige kennis van UML [[UML]] of [[Linked-Data]] is een pré maar niet noodzakelijk. Dit metamodel richt zich in het bijzonder op de informatievoorziening binnen het overheidsdomein, al is het ook in bredere context inzetbaar.

## Leeswijzer
Het metamodel beschrijven we in vijf hoofdstukken en een bijlage. Lees de [Inleiding](#inleiding) verder voor inzicht in wat we onder een informatiemodel en onder een metamodel verstaan, hoe deze modellen zich verhouden tot UML en de vier lagen metamodel architectuur van de Object Management Group [[OMG]], Linked Data en de internetstandaarden van de W3C en welke overige standaarden worden  oegepast. 

Het hoofdstuk [Metamodel Algemeen](#metamodel-algemeen) bevat de beschrijving van alle bouwstenen c.q. de modelelementen van het metamodel, in de vorm van definities en specificaties. De betekenis en toelichting van de modelelementen van het metamodel vormt het materiaal waarmee een uitputtende modelspecificatie kan worden opgesteld. De afbeeldingen in dit algemene hoofdstuk zijn weliswaar gemaakt in UML,  aar het metamodel beperkt zich zeker niet tot UML. Er zijn aparte hoofdstukken voor de implementatie van MIM in UML en Linked Data.

Het hoofdstuk [Metamodel in UML](#metamodel-in-uml) beschrijft hoe de implementatie van MIM in [[UML]] er uit ziet. In dit hoofdstuk wordt beschreven hoe het metamodel zich verhoudt tot het UML metamodel, welke uitbreidingen c.q. verbijzonderingen van het UML metamodel zijn aangebracht.

Het hoofdstuk [Metamodel in Linked Data (LD)](#metamodel-in-linked-data-ld) beschrijft hoe de implementatie van MIM in [[Linked-Data]] er uit ziet. In dit hoofdstuk wordt beschreven hoe het metamodel zich verhoudt tot het Linked Data metamodel. Daarbij is een strikte vertaling gemaakt. Dit betekent dat het betreffende Linked Data model alleen als MIM model te gebruiken is. Voor een model dat gebruikt kan worden om daadwerkelijk Linked Data in uit te drukken, is een vertaalslag nodig die beschreven is in de bijlage [Transformatie MIM - RDFS/OWL/SHACL](#transformatie-mim-rdfs-owl-shacl). Op deze wijze kan een dergelijk RDFS/OWL/SHACL model ook gezien worden als een MIM model.

In het hoofdstuk [Afspraken & Regels](#afspraken-regels) gaan we in detail in op een aantal aspecten. Het is een uitgebreidere toelichting, in aanvulling op het hoofdstuk [Metamodel Algemeen](#metamodel-algemeen), bestaande uit nadere afspraken, regels, richtlijnen en aanbevelingen bij het toepassen van het metamodel.

Tot slot zijn er een aantal bijlagen beschikbaar. Dit zijn hulpmiddelen of aanvullingen op het MIM.
- De bijlage [Template naamgevingsconventies](#template-naamgevingsconventies) verschaft een invulmogelijkheid om eigen naamgevingsconventies te documenteren, per in dit metamodel genoemd modelelement.
- De bijlage [Transformatie MIM - RDFS/OWL/SHACL](#transformatie-mim-rdfs-owl-shacl) beschrijft hoe een MIM model getransformeerd kan worden naar een RDF model dat gebruikt kan worden om daadwerkelijk Linked Data in uit te drukken en vice versa (op instantie niveau, waarbij dit in overeenstemming is met de specificatie op informatiemodel niveau).
 
## Gebruikswijzer 
Met de bouwstenen oftewel de modelelementen die in dit metamodel beschreven zijn is een informatiemodel te maken.  Om zo'n informatiemodel te maken volstaat het veelal om het hoofdstuk [Metamodel Algemeen](#metamodel-algemeen) door te nemen, te kiezen voor modellering met ofwel UML ofwel linked data, en het bijbehorende hoofdstuk te lezen.  De andere hoofdstukken kan je behandelen als naslagwerk, voor als er tijdens het modelleren vragen ontstaan. Neem vervolgens uw favoriete modelleertool en ga aan de slag. Voor bepaalde modelleertools zijn er hulpmiddelen gemaakt, zodat je met deze hulpmiddelen de modelelementen kan aanmaken door erop te klikken en bijvoorbeeld naar een diagram kan slepen en ook kan valideren of je model correct het MIM volgt (wat automatisch gaat als je de hulpmiddelen gebruikt). Tot slot is het mogelijk om naar informatiemodellen te kijken van organisaties die al een MIM informatiemodel hebben gepubliceerd. Voor specifieke modelleringen en vragen zullen er ook uitgewerkte voorbeelden worden gemaakt. 

## Wat is een informatiemodel
Wanneer we informatie over bepaalde onderwerpen willen inwinnen, registreren of uitwisselen, dan is het van belang om deze informatie  eerst goed te beschrijven. We doen dit zodat het voor eenieder die met de informatie aan de slag gaat helder en eenduidig is:
- waarover de informatie gaat, bv. informatie over een persoon of een gebouw, we noemen dit de objecten, de onderwerpen van gesprek
- dat deze onderwerpen van gesprek gemodelleerd zijn als informatieobjecten 
- de eigenschappen/kenmerken zelf, waarvan we informatie bijhouden, bv. de naam van een persoon of het bouwjaar van een gebouw
- wat de betekenis is van die informatie, de semantiek
- hoe deze informatie qua structuur in elkaar zit, qua onderlinge relaties en qua interne structuur van de data

We doen dit door een model te maken van de informatie. Een informatiemodel beschrijft daarom de structuur, semantiek en de eigenschappen van informatie over dingen in de werkelijkheid. De beschrijving van de informatie heeft de vorm van een model dat een gestructureerde weergave is van die werkelijkheid. Een dergelijk model is noodzakelijk om deze informatie te kunnen beheren en gebruiken (door mensen en machines) bij het communiceren over deze werkelijkheid, in registraties of anderszins, zoals het specificeren van de tussen registraties uit te wisselen gegevens of van de te bevragen informatie uit een registratie.

### Uitwerking Modelbeschrijving van dingen in de werkelijkheid
Het beschrijven vindt plaats door de informatie van de objecten die we beschouwden te modelleren als informatieobjecten, met hun kenmerken en hun onderlinge relaties. Aan de hand van een voorbeeld werken we dit principe verder uit.

<aside class='example' title="Modelbeschrijving van dingen in de werkelijkheid">
    <p>Jan en Katrien zijn bijvoorbeeld ‘dingen in de werkelijkheid’. Zij hebben bepaalde kenmerken, zoals een naam en een geboortedatum. In een informatiemodel komen Jan en Katrien zelf niet zelf voor. Zij worden in het informatiemodel gemodelleerd als een <code>Persoon</code>. Ook hun gegevens, zoals het feit dat 10-10-1970 de geboortedatum van Jan is, komen niet voor in het informatiemodel. In het informatiemodel is alleen het kenmerk <code>geboortedatum</code> gemodelleerd, als een kenmerk van een <code>Persoon</code>, met een definitie een toelichting.</p> 
    <p>De persoon in het informatiemodel is een beschrijving vanuit het perspectief van het informatiedomein van waaruit we Jan en Katrien beschouwen. We bekijken Jan en Katrien dan ook wel als een van de objecten binnen een domein, die we vervolgens gaan modelleren als informatieobjecten. In het informatiemodel is hiervoor het objecttype <code>Persoon</code> gedefinieerd en Jan en Katrien zijn dus objecten van het objecttype <code>Persoon</code>. De objecten 'Domtoren' en 'Paleis Het Loo' kunnen we typeren tot het objecttype <code>Gebouw</code>.Objecttypen in een informatiemodel <i>representeren</i> dus de dingen in de werkelijkheid. Het informatiemodel is een model van de werkelijkheid en richt zich op de informatie erover.</p>
    <p>De kenmerken zoals de <code>naam</code> en <code>geboortedatum</code>, maar bijvoorbeeld ook <code>identificatie</code> en <code>registratietijdstip</code>, worden gezien als attributen van dit objecttype. We noemen een dergelijk kenmerk een <code>Attribuutsoort</code>. Sommige kenmerken geven relaties tussen objecten weer, zoals het gegeven dat Jan in Paleis Het Loo woont. Deze modelleren we door middel van een <code>Relatiesoort</code>, tussen objecttypen, in dit geval tussen de informatieobjecten <code>Persoon</code> en <code>Gebouw</code>.</p>
    <p>Samengevat beschouwen we alle objecten die we als gelijksoortig beschouwen in het informatiemodel als een objecttype, de relaties tussen de objecten typeren we in het informatiemodel als een relatiesoort en de kenmerken van de objecten typeren we in het informatiemodel als attribuutsoorten. Op deze manier ontstaat een informatiemodel. In de van het informatiemodel afgeleide registratie kunnen vervolgens de objecten Jan en Katrien en de gegevens ervan, zoals de geboortedatum 10-10-1970, worden vastgelegd, en vervolgens uitgewisseld. We visualiseren dit in onderstaande figuur, voor de situatie dat er een, van het informatiemodel afgeleide, registratie is.</p>
    <figure id="informatiemodel">
      <img src="media/informatiemodel.png" alt="" />
      <figcaption>Wat beschrijft een informatiemodel</figcaption>
    </figure>
    <p>Als een andere registratie op haar eigen manier tegen dezelfde ‘Jan uit de werkelijkheid’ aankijkt, dan is ook in die registratie een (eigen, apart) object voor Jan aanwezig en Jan kan in dit (eigen, aparte) informatiemodel anders gemodelleerd zijn. Bijvoorbeeld in het ene domein als <code>Werknemer</code> en in het andere domein als <code>Persoon</code> of <code>Partner</code>. Beide objecten Jan representeren natuurlijk dezelfde ‘Jan uit de werkelijkheid’, elk vanuit het perspectief van het eigen domein bekeken.</p>
</aside>

### Belangrijke aandachtspunten
Merk op dat we hier veelal spreken over een registratie, omdat dit in de praktijk vaak voorkomt. Er zijn echter ook toepassingen van een informatiemodel waarin er alleen gegevens worden uitgewisseld, of waarbij er sprake is van gewoon de beschrijving van informatie, ongeacht of deze wel of niet in een registratie is opgenomen.

Alleen dingen en kenmerken die relevant zijn voor een bepaald domein worden in het informatiemodel beschreven, zoals gebouwen binnen het domein Basisregistratie Topografie en personen binnen het domein Basisregistratie Personen. Een domein kan van alles zijn maar in het kader van dit metamodel gaat het om (beleids-)sectoren die omwille van bestuurlijke en beheersmatige redenen geïdentificeerd en georganiseerd zijn. Voorbeelden: ruimtelijke ordening, grootschalige topografie, kadastrale informatie of gemeentelijk domein.

Het is de bedoeling dat een informatiemodel de betekenis en definitie van de informatie zelf beschrijft, onafhankelijk van een mogelijke (technische) implementatie of toepassingsomgeving. Zodat het primair helder is wat de informatie betekent, ongeacht waar je deze informatie tegenkomt en ongeacht de gebruikte techniek. Anders gezegd, in koppelvlakken, ketens en implementaties is het vrij om de elk technisch uitwisselingsformaat of bijvoorbeeld database-technologie te kiezen, door het informatiemodel daarin uit te drukken. Er worden geen regels toegepast die gerelateerd zijn aan de manier waarop de gegevens ingewonnen, opgeslagen, beheerd en uitgewisseld worden.

De opname in een registratie kent vaak een inwinningsproces om gegevenswaarden over de feitelijke dingen in de werkelijkheid conform het informatiemodel in de registratie op te nemen. Dit is een belangrijk proces, maar valt buiten scope van het informatiemodel (scheiding proces en informatie, het proces is niet in scope van deze standaard).

## Typering van modellen en wat wel en niet in scope is van deze standaard
Bij het modelleren van een domein zijn er een aantal beschouwingsniveaus, variërend van een zo getrouw mogelijke beschrijving van de betekenis en bedoeling van de woorden en termen die mensen gebruiken als ze het ergens over hebben tot een specificatie van de wijze van registratie en uitwisseling van data. In het MIM onderscheiden we variaties in vier verschillende niveaus. Dit is vooral bedoeld om de scope van MIM duidelijk af te bakenen. Het MIM concentreert zich namelijk op het tweede en derde niveau. Hieronder lichten we de verschillende niveaus verder toe.

De modellering van een bepaald domein start in principe met het beschrijven van kennis, te weten de begrippen die een rol spelen in een domein, uitgedrukt in een (meestal)  domein specifieke terminologie. In MIM wordt dit niveau 1 genoemd en voor MIM heeft dit  niveau 1 niet de focus en is dit niveau buiten scope. Op dit niveau is de notie van  welke informatie er geregistreerd en uitgewisseld moet worden nog niet aanwezig of op de achtergrond. Op dit niveau is er nog geen sprake van een informatiemodel, omdat deze  modellen kennis modelleren en zich (nog) niet richten op het modelleren van informatie (informatie, zoals bedoeld in [Wat is een informatiemodel](#wat-is-een-informatiemodel)).

Het modelleren van informatie gebeurt met en in een informatiemodel. Hierin wordt aangegeven welke objecten welke kenmerken/eigenschappen hebben en of deze kenmerken/eigenschappen in het beschouwde domein verplicht zijn of optioneel zijn enzovoorts. Het informatiemodel geeft  hierbij aan welke informatie wordt geregistreerd of uitgewisseld kan worden. Het beschrijft alle informatie, en het beschrijft ook niet meer dan dat. Hierbij kan er ook gekozen worden om het domein te onderverdelen in meerdere informatie domeinen en voor een informatiedomein scherp te definiëren, meestal door aan te geven welke informatieobjecten in scope zijn van een informatiemodel en welke niet. In MIM valt een informatiemodel onder niveau 2 of 3. MIM richt zich primair op niveau 2 en 3.  Het informatiemodel is hierbij altijd techniek onafhankelijk.

Het informatiemodel kan vervolgens uitgewerkt worden in verschillende soorten technische datamodellen en schema's (zoals XML of JSON of specifieke invullingen hiervan). In MIM wordt dit niveau 4 genoemd. Dit niveau heeft voor MIM niet de focus en valt buiten de scope. Wel staat MIM een model-gedreven werkwijze voor waarbij de modellen van niveau 4 gegenereerd kunnen worden vanuit niveau 2 of 3.

### Niveau 1: Model van begrippen 

Dit niveau beschrijft de werkelijkheid binnen het beschouwde domein (de ‘universe of discourse’) 
door middel van de beschrijving van de daarin gehanteerde begrippen en hun relaties tot elkaar. 
Een begrip wordt ook wel een _concept_ genoemd, iets waar mensen aan denken en over praten. 
Er zijn verschillende manieren om begrippen te beschrijven, zoals in een woordenboek, of in 
een formele taal of vocabulaire, of in een taxonomie of in een model van begrippen waarin 
de onderlinge samenhang is aangegeven en er zijn nog andere manieren - maar geen van allen zijn een informatiemodel. 

> Het doel is dat actoren binnen een domein elkaar begrijpen en dezelfde taal spreken. Een model van begrippen wordt opgesteld voor gebruik door mensen, met name ‘de business’.

Dit niveau valt **niet** binnen de scope van MIM. Dit niveau wordt om die reden slechts beknopt beschreven. Het dient vooral ter afbakening van de scope. Er kan meer in zitten dan hier beschreven en er gaat meer aan vooraf. Ten aanzien van begrippen en informatiemodellen en het verschil hiertussen zijn de belangrijkste punten:

- Een begrip is de combinatie van een term of woord en een definitie. Begrippen worden door mensen gebruikt om mentaal de werkelijkheid te beschouwen en te begrijpen. Een begrip omvat niet de betekenis en structuur van data. 
- Van een aantal begrippen ('concepten') zal later blijken dat het een eigenschap is van een object waarover we informatie zullen gaan bijgehouden, maar dit zal zeker niet voor alle begrippen zo zijn, begrippen beschrijven een domein vaak veel breder dan een informatiemodel dit doet. Een aantal begrippen zullen in het informatiemodel beschouwd gaan worden als informatieobjecten, een aantal begrippen worden een kenmerk/eigenschap van deze informatieobjecten, en een heel aantal begrippen zullen geen rol spelen in het informatiemodel omdat er geen data van is of komt.  
- Voor het bijhouden van informatie wordt een gedetailleerde eenduidige structuur en betekenis aangebracht die data gericht is, maar bij het modelleren van begrippen wordt dit nog niet gedaan. De samenhang tussen informatie is hierbij vaak (bewust) beperkter dan de samenhang tussen begrippen. 

### Niveau 2: Conceptueel informatiemodel

Een conceptueel informatiemodel beschrijft de modellering van de werkelijkheid binnen het beschouwde domein door 
middel van de beschrijving van welke informatie (data met betekenis en structuur) een rol speelt. 
Een conceptueel informatiemodel is hierbij onafhankelijk van het ontwerp van en de implementatie in systemen. 
Het geeft een zo getrouw mogelijke beschrijving van die werkelijkheid en is in natuurlijke taal geformuleerd. 

Een dergelijk model definieert het ‘wat’: welke 'onderwerpen van gesprek' ('concepten', 'dingen’) 
worden onderscheiden in de beschouwde werkelijkheid. Wat betekenen zij, hoe verhouden ze zich tot elkaar en 
welke informatie is daarvan relevant. Deze informatie wordt gemodelleerd als informatieobjecten met eigenschappen/kenmerken, oftewel waarvoor data 
beschikbaar is (of zal zijn) en wordt ondergebracht in een informatiemodel. Dit informatiemodel dient als taal waarmee domeinexperts kunnen 
communiceren met informatieanalisten en verschaft een eenduidige interpretatie van die werkelijkheid ten behoeve van deze 
communicatie. 

Met conceptueel wordt niet bedoeld abstract of hoog over, de beschrijvingen van de informatie die beschikbaar is zijn heel precies en concreet.

*Een conceptueel informatiemodel wordt opgesteld voor gebruik door mensen,
zodat ‘de business’ en de ICT-specialisten elkaar (gaan) begrijpen voor wat betreft 
de informatie die in het domein wordt geregistreerd en/of kan worden uitgewisseld.*

Dit niveau is volledig in scope van MIM. 

Ten aanzien van logische informatiemodellen:
- Een conceptueel informatiemodel is onafhankelijk van standaarden voor gegevensuitwisseling.
  Een logisch informatiemodel past deze wel toe (denk aan identificaties, geometrie versies, tijdslijnen van historie)  
- Een conceptueel informatiemodel beschrijft de informatie in een informatiemdomen en is onafhankelijk van een koppelvlak of keten, 
oftewel is keten of koppelvlak overstijgend. Een logisch informatiemodel is specifiek voor een koppelvlak of keten of een 
bepaalde toepassing (met bijbehorende implementatie, database en interfaces).

### Niveau 3: Logisch informatie- of gegevensmodel

Beschrijft hoe de, in het conceptuele informatiemodel onderscheiden, concepten gebruikt
worden bij de interactie tussen systemen en hun gebruikers en tussen systemen
onderling. Anders gezegd, een model van de representatie van informatie over de
werkelijkheid in digitale registraties en in de uitwisseling daartussen. Het
gaat hierbij, in tegenstelling tot een conceptueel model, dus veel meer om het
**‘hoe’**. Het slaat de brug tussen werkelijkheid en systemen maar beschrijft nog
niet de implementatie in die systemen. Een dergelijk model wordt in een formele
taal beschreven en wordt waar mogelijk gegenereerd vanuit het conceptueel model.  

*Het logisch model wordt opgesteld voor ICT-interoperabiliteit, voor gebruik door
met name de ontwerpers, ontwikkelaars en beheerders van ICT-voorzieningen.*

Dit niveau is volledig in scope van MIM. 

Ten aanzien van fysieke of technische datamodellen:
- Een logisch informatiemodel is implementatie onafhankelijk en kan in meerdere technische modellen of formaten worden geïmplementeerd.
  Een fysiek of technisch datamodel is afhankelijk van de gekozen techniek of tooling die wordt gebruikt en wordt daadwerkelijk technische geïmplementeerd.

### Niveau 4: Fysiek of technisch gegevens- of datamodel
Specificeert de structuur en eigenschappen van de technologie waarin de
informatie wordt vastgelegd of uitgewisseld. Dit is sterk afhankelijk van de
gebruikte opslagtechnologie zoals een specifieke database of de
servicetechnologie zoals [[xml]], [[gml]], [[SOAP]], REST, [[GeoJSON]],
[[Linked-Data]] e.d. Het kan tevens informatie bevatten over de manier waarop
berichten ‘verpakt’ worden, het (internet)protocol en de logistiek van het
berichtenverkeer. De technische specificaties worden over het algemeen zoveel
als mogelijk gegenereerd uit het logisch informatiemodel.  

*Deze specificaties worden opgesteld voor ‘machines’, te gebruiken door softwareontwikkelaars.*

Dit niveau is **niet** in scope van MIM. Dit niveau is niet volledig beschreven maar is ter illustratie 
in deze paragraaf opgenomen. Er kan meer in zitten dan hier beschreven en er kan meer na volgen.   

### Aanvullende opmerkingen bij de onderkende niveaus

- In algemeenheid geldt dat het begrijpen van onderwerpen of dingen die een rol spelen in een 'universe of discourse' altijd vooraf gaat aan de modellering ervan, welk niveau deze modellering ook betreft en welke modellen je  besluit om wel of niet toe te maken of op te leveren. 
- Deze standaard geeft niet normatief een volgorde of werkwijze aan voor de invulling van de 4 niveaus. Je kan bijvoorbeeld besluiten om wel of niet begrippen te definiëren en/of te modelleren. Wanneer je dan later een informatiemodel gaat maken dan is het nuttig om deze hierbij mee te nemen als input en hiermee consistent te blijven. Let wel, de definities op beide niveaus zijn niet altijd hetzelfde. De definitie in het informatiemodel moet soms preciezer zijn om preciezer de betekenis van de geregistreerde of uitgewisselde data te definiëren. 
- Het voorliggende metamodel voor het modelleren van informatie (MIM) is bedoeld voor niveau 2 en 
niveau 3: t.b.v. een zuiver conceptueel informatiemodel (2) en t.b.v. een logisch informatiemodel (3). 
Het moge duidelijk zijn dat het altijd het één of het ander is, conceptueel of logisch. Een combinatie van 
beide in één model leidt tot verwarring. Voor eenzelfde domein verschilt de structuur van het informatiemodel 
naar gelang het type en bevat het logisch informatiemodel meer, vooral datagerichte, specificaties dan een 
conceptueel informatiemodel. 
- Bijlage 3 verschaft een overzicht van de metadata-constructen en -elementen die per type model van toepassing zijn.
Het is daarom van belang om voorafgaand aan het opstellen van een informatiemodel expliciet te bepalen welk van 
beide typen beoogd is en de modellering conform het gekozen type te doen plaatsvinden. In de beschrijving van het
informatiemodel moet vermeld worden om welk van beide typen het gaat. 
- Het is voor de hand liggend maar niet persé noodzakelijk om voor een domein eerst een conceptueel 
en daarna een logisch informatiemodel op te stellen. Met name bij een informatievoorziening 
waarbij er meerdere koppelvlakken en/of doelgroepen betrokken zijn met elk eigen informatiebehoeftes is het 
aan te bevelen om eerst een conceptueel informatiemodel te maken, zonder zich al te richten naar een specifiek 
koppelvlak of een specifieke doelgroep. Wanneer alle logische informatiemodellen een correcte uitwerking zijn van 
het conceptuele informatiemodel dan zijn ze allemaal naar elkaar transformeerbaar via transformatie specificaties. 
- Een organisatie kan er voor kiezen om alleen een logisch informatiemodel op te stellen of om een conceptueel 
informatiemodel als basis te nemen en enkel uit te breiden met logische aspecten. 

## Wat is het metamodel voor informatiemodellering
Een metamodel is een model van een model. Het definieert een verzameling van
modelleerconstructies in de vorm van bouwstenen, oftewel modelelementen zoals een objecttype, 
relatiesoort en attribuutsoort, met bijbehorende betekenis en met bijbehorende afspraken 
omtrent hoe deze toe te passen. Een informatiemodel kan vervolgens hiermee gemaakt worden. 
Het metamodel is daarmee de modelleertaal waarin een informatiemodel is uitgedrukt. 
Deze metataal beschrijft als het ware de grammatica en de syntax van de modelleertaal.

Vaak zie je dat het metamodel niet expliciet beschreven is en dat het metamodel
een onderdeel van de domeinkennis is geworden. Bij domein overstijgende
harmonisatie wordt het dan moeilijk om modellen met elkaar te vergelijken en op
basis daarvan gegevens uit te wisselen. Beschrijving van het metamodel is daarom
een randvoorwaarde indien er sprake is van een stelsel van samenhangende
informatiemodellen. Anders gezegd, met (alleen) de in het metamodel opgenomen
set van modelleerconstructies worden informatiemodellen gemaakt. Door het
schrijven van modelleertalen (zoals [[UML]]) in een metataal (zoals MOF) wordt
gegarandeerd dat alle toepassingen van die talen op een standaard manier zijn
opgebouwd en daardoor alom te begrijpen zijn. De metataal beschrijft als het
ware de grammatica van de modelleertaal. Het metamodel in dit document is
uitgewerkt voor modellering met UML en voor modellering met linked data.

## Uitdrukken in UML
Zowel het metamodel als informatiemodellen kan worden uitgedrukt in UML.
Registraties en afnemers hiervan kunnen deze gebruiken voor de inrichting van
hun situatiespecifieke gegevenshuishouding. Belangrijk is dat de lezer eerst
begrijpt wat we onder een informatiemodel en een metamodel verstaan en verder is
het van belang om de modellen in de juiste context te plaatsen. Dit laatste doen we
aan de hand van de vier lagen metamodel architectuur van de Object Management
Group [[OMG]]. In deze paragaaf gaan we op deze concepten in.

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
| M1             | Modellen, bestaande uit instanties van M2 metamodel constructies             | Klasse “Order”, klasse “Klant”, attribuut “naam” etc.          |
| M0             | Objecten en data, de instanties van M1 model constructies                    | Order 43123, Artikel 8RB31, etc.                              |

*Tabel 1 Vier lagen metamodel OMG*

De informatiemodellen waarover we het hier in dit document hebben bevinden zich op de M1-laag. Dit metamodel is een UML profiel op basis van het UML metamodel (M2). Het UML metamodel is daarbij uitgebreid met speciale elementen, die geen onderdeel uitmaken van het basale UML-metamodel (M2). Deze nieuwe elementen zijn noodzakelijk voor het definiëren van de semantiek en syntax van de modelconstructies zoals we die in onze informatiemodellen hanteren. 

Zo is bijvoorbeeld de ene class de andere class niet. Bijvoorbeeld als een Persoon het onderwerp van gesprek is waarover we een aantal eigenschappen willen bijhouden dan modelleer je de Persoon als een class met als duiding dat dit een objecttype is, en bijvoorbeeld een  groepering van eigenschappen zoals geboortedatum en een geboorteplaats als een Class genaamd geboortegegevens met als duiding dat dit geen objecttype is. In veel specificatietalen, 
met name de generiekere en de technische, gaat dit onderscheid verloren.

Het UML metamodel (M2) is een ‘read only’ model. Dat wil zeggen dat we geen
bestaande metaclass mogen aanpassen en we dus geen nieuw basis metaclass voor
een bestaande UML metaclass mogen specificeren. Maar via Profiles (van de
InfrastructureLibrary) kunnen bestaande metaclasses uitgebreid worden zonder dat
er nieuwe metaclasses gedefinieerd hoeven te worden en dus zonder aanpassing van
het basale UML-metamodel (M2). De extensiemechanismen hiervoor zijn stereotypes,
tagged values en constraints.

Nadrukkelijk moet daarbij worden vermeld dat het MIM metamodel **geen** semantiek overneemt van UML.
Met het uitdrukken van het MIM metamodel in een UML profiel wordt het alleen mogelijk
gemaakt om, zonder verlies van de originele semantiek van het MIM, een MIM model uit
te drukken in UML. Met dit gebruik van een UML profiel volgen wij het gebruik van een UML profiel
zoals de OMG zelf heeft op gesteld voor het Ontology Definition Metamodel [[ODM]]:

> *The goal of a UML profile from the ODM perspective is to provide a bridge between the UML and knowledge representation communities on a well-grounded, semantic basis, with a broader goal of relating software and logical approaches to representing information. Profiles facilitate implementation using common notation on existing UML tools. They support renaming and specializing UML model elements in consistent ways, so that an instance of a UML model can be seen as an extended metamodel. Profiles allow a developer to leverage UML experience and tools while moving to integrating with an ontology represented in another metamodel.*" (sectie 8.4.2).

## Uitdrukken in Linked Data

Zowel het metamodel als informatiemodellen kan worden uitgedrukt in Linked Data.
Registraties en afnemers hiervan kunnen deze gebruiken voor de inrichting van
hun situatie specifieke gegevenshuishouding. Belangrijk is dat de lezer eerst
begrijpt wat we onder een informatiemodel en een metamodel verstaan en verder is
het van belang de modellen in de juiste context te plaatsen. Dit laatste doen we
aan de hand van de W3C open standaarden voor het specificeren van een ontologie.

Ook geeft Linked Data een specifieke invulling aan de niveaus waarin we informatiemodellen beschrijven:

1. **Niveau 1: model van begrippen** wordt in Linked Data uitgedrukt met behulp van vooral de SKOS vocabulaire.
2. **Niveau 2: conceptueel informatiemodel** wordt in Linked Data uitgedrukt met behulp van een metamodel vocabulaire. Deze vocabulaire, het metamodel van het informatiemodel, kan een eigen vocabulaire zijn (zoals de MIM-vocabulaire) of uitgaan van de bestaande vocabulaires. In deze laatste situatie, is het conceptueel informatiemodel ook direct een logisch informatiemodel.
3. **Niveau 3: logisch informatiemodel** wordt in Linked Data uitgedrukt met behulp van de standaard vocabulaires RDF/RDFS ([[RDF11-PRIMER]]), OWL ([[OWL2-PRIMER]]) en [[SHACL]]. Daarbij geldt dat dit logisch informatiemodel OOK een conceptueel informatiemodel is. Doordat in Linked Data de representatie van informatie is gestandaardiseerd op basis van het RDF model, is er feitelijk geen of nauwelijks verschil tussen het conceptueel of logisch informatiemodel.

Indien een MIM model wordt getypeerd als "logisch informatiemodel" dan kan dit model slechts zinvol in Linked Data worden uitgedrukt indien bij de opzet van dit model rekening gehouden is met de betekenis die dergelijke modelelementen in de standaard Linked Data vocabulaires hebben. Zie hiervoor de bijlage Transformatie van MIM modellen. Voor modellen die zowel een UML als een Linked Data implementatie vereisen kan beter gekozen worden voor het type "conceptueel informatiemodel".

### Een ontologie voor het metamodel
Met een ontologie bedoelen we een model waarin we betekenis geven aan de termen die
in een specifiek domein worden gebruikt. In geval van het MIM metamodel betreft dit het MIM-domein zelf. We geven betekenis aan de termen door enerzijds een voor mensen leesbare definitie te koppelen aan een term (de "zachte semantiek") en anderzijds door relaties te leggen naar eerder gedefinieerde termen of relaties tussen termen in onze ontologie (de
"harde semantiek"). We maken hierbij vooral gebruik van de bestaande wereldwijd geaccepteerde internetstandaarden [RDF](https://www.w3.org/TR/rdf11-primer), [RDFS](https://www.w3.org/TR/rdf-schema), [SKOS](https://www.w3.org/TR/skos-reference) en [OWL](https://www.w3.org/TR/owl2-primer). Daarnaast beschrijven we ook welke constructies we wel en niet willen toestaan op het moment dat een modelleur een MIM model in Linked Data opstelt. Hiervoor maken we gebruik van de wereldwijd geaccepteerde internetstandaard [SHACL](https://www.w3.org/TR/shacl).

### Een informatiemodel
Het (conceptueel) informatiemodel zien we als een invulling van de MIM ontologie. Dit betekent dat de elementen in het informatiemodel exemplaren zijn van de klassen die in de MIM ontologie
zijn gedefinieerd. Zo is onderstaand voorbeeld een voorbeeld waarin het modelelement
`vb:Schip` wordt gedefinieerd als exemplaar van de klasse `mim:Objecttype`. Een `vb:Schip`
*is* dus een `mim:Objecttype`.

<pre class='ex-turtle'>
vb:Schip a mim:Objecttype;
  rdfs:label "Schip"@nl;
.
</pre>

### Een ontologie voor een informatiemodel
Omdat een informatiemodel als invulling van de MIM ontologie zelf al exemplaren betreft, is het niet direct mogelijk om op basis van dit informatiemodel ook daadwerkelijk Linked Data in uit te drukken. Hiervoor is het nodig om de exemplaren uit het MIM informatiemodel zelf te transformeren, te "promoveren", naar klassen. Zo is onderstaand voorbeeld een voorbeeld van de transformatie van het exemplaar `vb:Schip` naar de klasse `vbo:Schip`. Vervolgens is het mogelijk om exemplaren van deze klasse te specificeren, zoals bijvoorbeeld de
pakjesboot van Sinterklaas.

<pre class='ex-turtle'>
vbo:Schip a rdfs:Class;
  rdfs:seeAlso vb:Schip;
.

vb:Pakjesboot12 a vbo:Schip.
</pre>

Een informatiemodel uitgedrukt in Linked Data wordt geacht te voldoen aan het MIM als sprake is van één of beide van onderstaande criteria:

1. Het informatiemodel is uitgedrukt in de MIM vocabulaire, zoals beschreven in [[[#metamodel-in-linked-data-ld]]];
2. Het informatiemodel is uitgedrukt in RDF, RDFS, OWL en SHACL en is te transformeren naar de MIM vocabulaire op basis van de transformatieregels beschreven in bijlage, [[[#transformatie-mim-rdfs-owl-shacl]]].

## Een eigen extensie op het metamodel
Indien er extra metamodelconstructies nodig zijn voor een informatiemodel, 
zoals een extra metamodel element of extra metagegevens, dan
kan dit metamodel uitgebreid worden met een aanvulling oftewel extensie (in de
vorm van een extra bijlage) die door de betreffende organisatie toegevoegd wordt
aan het onderhavige document. 

De spelregel bij een extensie is dat deze geen onderwerpen vervangt die in dit
metamodel beschreven zijn, maar alleen echte uitbreidingen behelst. Indien
meerdere organisaties hierin geïnteresseerd zijn, kan een modelelement uit een 
extensie ook toegevoegd worden aan dit metamodel.

Het is ook mogelijk om in de extensie aan te geven welke elementen uit dit
metamodel *niet* ingezet worden in uw informatiemodellen. Denk hierbij 
bijvoorbeeld aan een bepaald modelelement die niet gebruikt wordt. Of aan bepaalde 
metadata aspecten die niet ingewonnen worden voor uw informatiemodellen 
en daarom buiten scope worden geplaatst (ongeacht of deze optioneel of verplicht zijn in MIM).

U beheert uw eigen extensie. Voor meer informatie over een specifieke extensie kan contact opgenomen worden
met de beheerder van deze extensie. Wanneer meerdere organisaties gebruik willen maken van metamodel constructies 
die in extensies beschreven zijn dan kan er gekeken worden of het wenselijk is om deze op te nemen in MIM. 
Desgewenst kan een extensie gepubliceerd worden bij MIM-beheer of kan ernaar verwezen worden vanuit MIM-beheer. 

<aside class='note' title="Scope van extensies op het metamodel informatiemodelleren">
    Een metamodelextensie is expliciet niet bedoeld voor aanvullende constructies
    die alleen spelen op het niveau van implementatie, of op het niveau van afgeleide
    technische modellen t.b.v. specifieke interfaces. Deze vallen buiten scope van dit
    metamodel en ook buiten scope van extensies hierop. Wel is het mogelijk en toegestaan 
    om het metamodel, of delen ervan, te hergebruiken op dit niveau.
</aside>

## Alternatieven
In dit metamodel is op één punt sprake van een keuze tussen twee alternatieven, waarvan de modelleur van een informatiemodel één van beide alternatieven kiest. Welke je kiest geef je aan bij je eigen informatiemodel, in je eigen extensie (zoals bedoeld in de vorige paragraaf). Dit betreft: Relatiesoort en relatierol, beide te gebruiken, maar welke is verplicht/leidend (zie [Specificatie metagegevens voor relaties](#specificatie-metagegevens-voor-relaties)). Indien gewenst kun je hier vragen over stellen aan de beheerders van dit metamodel voordat je een keuze maakt.

## Beheer
Het beheer van dit metamodel vindt plaats door Geonovum met ondersteuning van het Kadaster. 
Voor vragen, suggesties of opmerkingen kunt u contact opnemen met de MIM helpdesk van Geonovum: mim@geonovum.nl

## Normreferenties

| \#  | Naam                                                | **Referentie**        |
|-----|-----------------------------------------------------|-----------------------|
| 1.  | Unified Modeling Language (UML)                     | [[UML]]               |
| 2.  | OMG Unified Modeling Language TM versie 2.5         | [[OMG]]               |
| 3.  | RDF Concepts and abstract syntax                    | [[RDF11-CONCEPTS]]    |
| 4.  | Shape Constraint Language                           | [[SHACL]]             |
| 5.  | Stelselcatalogus                                    | [[SCAT]]              |
| 6.  | GAB                                                 | [[GAB]]               |
| 7.  | Handreiking gegevensbeschrijving (NORA)             | [[NORA]]              |
| 8.  | ISO 11404                                           | [[ISO 11404]]         |
| 9.  | ISO 8601                                            | [[ISO 8601]]          |
| 10. | Formeel patroon (Reguliere Expressies)              | [[PERLRE]]            |
| 11. | OCL                                                 | [[OCL]]               |
| 12. | NEN 3610 Basismodel Geo-informatie (vanaf /A1:2016) | [[NEN3610]]           |

De Stelselcatalogus [[SCAT]], het GAB [[GAB]] en de Handreiking gegevensbeschrijving
[[NORA]] raken elkaar op een aantal vlakken maar er kunnen op deze raakvlakken verschillen zijn
in de gemaakte afspraken. Voor het metamodel hanteren we daarom de volgende spelregel:
de Stelselcatalogus is zoveel als mogelijk leidend, vervolgens het GAB en als
laatste de handreiking.

<aside class='note' title="Versienummer normreferenties">
    De versies van de genoemde referenties zijn bewust niet opgenomen, zodat het mogelijk is om gebruik te maken van nieuwere versies van deze referenties. Wanneer er nieuwe versies uitkomen van de genoemde normreferenties dan wordt er gecheckt of MIM hier nog mee in lijn is. Wanneer dit niet zo is, dan wordt eraan gewerkt om dit weer met elkaar in lijn te brengen, zodat MIM 'upward compatible' is en blijft.
</aside>
