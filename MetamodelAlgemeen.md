# Metamodel Algemeen

Dit hoofdstuk beschrijft het metamodel in diagramvorm en in tekst. De eerste paragraaf bevat een diagram, die het overzicht van de
modelelementen aangeeft, en hun onderlinge verhouding. Hierna worden alle modelelementen beschreven en toegelicht.
Deze modelelementen worden gebruikt bij het maken van een informatiemodel.

Uitgangspunten voor het metamodel zijn:
- Elk modelelement heeft een naam en een eigen MIM metaclass, waaraan je het modelelement overal kan herkennen.
- De modelelementen worden eerst uitgelegt zonder een specifieke specificatie taal te gebruiken. Dit is zodat we hierna kunnen aangeven
hoe je het modelelement uitdrukt per specifieke specificatie taal, te weten in UML of in w3C specificatie technieken.
- Toolonafhankelijke beschrijving van het metamodel. Omdat VNG Realisatie, Kadaster en Geonovum en veel andere organisaties Sparx EA
gebruiken is er aanvullend aangegeven hoe het metamodel in Enterprise Architect toegepast wordt. Hierdoor borgen we deze relatie.
- Uniforme toepassing van het metamodel in informatiemodellen. Anders gezegd, uitbreiden mag, afwijkenniet, maak voor hetzelfde doel
geen alternatieve constructies.
- Datatypen zijn onderdeel van het metamodel en beschrijven de structuur van de data, maar niet de semantiek/betekenis. De aanbeveling is
dan ook om eerst een informatiemodel te maken zonder datatypen. De regel is dat als alle datatypen uit het model worden weggelaten, er geen semantische betekenis verloren mag gaan.

## Structuur metamodel

Deze paragraaf bevat een overzicht van het metamodel en geeft alle
modelelementen weer in diagram vorm. De beschrijving van de modelelementen in
tekst vorm staan in de volgende paragraaf.

De modelelementen zijn verdeeld over een diagrammen, die elk een eigen view op
een deel van het metamodel tonen. Elk view toont een aantal van de
modelelementen, inclusief hun onderlinge samenhang.

Alle views samen vormen het metamodel als geheel:
- KERN, met de belangrijkste modelelementen in onderlinge
samenhang.
- DATATYPEN, met de in het model te onderkennen soorten datatypen.
- OVERIGE modelelementen, die niet altijd aan de orde zijn.

Elk modelelement heeft een MIM metaclass met een naam. Hieraan is elk modelelement te herkennen in alle diagrammen en in de tekst en in elke specificatie taal die een uitdrukking is van dit metamodel.

### Kern

<todo>TODO: nieuw diagram zonder UML erin.</todo>

![](media/f12fbb3dc2e205d26a1d0d27cbd325b3.png)

Kern zonder Metagegevens

| **MIM metaclass** |
|-------------------|
| Objecttype        |
| Attribuutsoort    |
| Gegevensgroep     |
| Gegevensgroeptype |
| Generalisatie     |
| Relatiesoort      |
| Relatieklasse     |

### Datatypen

<todo>TODO: nieuw diagram, zonder UML erin.</todo>

![](media/e529a1c0a1d6183d686d5aa57d0d0c63.png)

Datatypen zonder Metagegevens

View 2: Datatypen

| **MIM metaclass**       |
|-------------------------|
| Primitief datatype      |
| Gestructureerd datatype |
| Data element            |
| Union                   |
| Union element           |
| Enumeratie              |
| Enumeratiewaarde        |
| Referentielijst         |
| Referentie element      |
| Codelist                |

### Overige

![](media/505b92a05134fb38d9aec81f23a66bad.png)

Constraint

View 3a: Constraint

| **MIM metaclass** |
|-------------------|
| Constraint        |

*Relatierol*

<todo>TODO: nieuw diagram zonder UML.</todo>
![](media/240ca39c688efb06f70b34b8ec0b36d0.png)

Relatierol

View 3b: Relatiesoort en relatierol

| **MIM metaclass**     |
|-----------------------|
| Relatierol (abstract) |
| Relatierol source     |
| Relatierol target     |

*Externe koppeling*

| **MIM metaclass** |
|-------------------|
| Externe koppeling |

View 3c: Groepering

*Packages*

| **MIM metaclass**     |
|-----------------------|
| Informatiemodel       |
| Domein                |
| Extern                |
| View                  |


## Betekenis modelelementen

In deze paragraaf staan alle modelelementen opgesomd, die gebruikt worden bij
het maken van een informatiemodel.

### Objecten en attributen

#### Objecttype *
<!-- **1. Objecttype** * -->

Een objecttype is een groep van gelijksoortige objecten. Om duidelijk te
maken wat wordt bedoeld kijken we eerst naar het begrip ‘object’.

>   **Definitie Object**

>   Een ding, een tastbaar iets, in de werkelijkheid, zoals daarnaar gekeken
>   wordt vanuit een bepaald domein.

*Toelichting:* Het wordt veelal als niet politiek correct beschouwd mensen als
objecten te zien. In dit kader, de informatievoorziening, beschouwen we evenwel
natuurlijke en niet-natuurlijke personen wel als objecten. ‘Tastbaar’ moet
hierbij ruim geïnterpreteerd worden. Het gaat niet alleen om fysiek herkenbare
objecten zoals auto’s, gebouwen en mensen, ook om zogenaamde virtuele objecten
waarover binnen het domein door betrokkenen gecommuniceerd wordt zoals
kadastrale percelen, (maatschappelijke) activiteiten en processen. Hoe een
‘tastbaar iets’ als een object beschouwd wordt, hangt af van het domein waarvoor
dat ‘tastbaar iets’ relevant is. Zo wordt de gebouwde omgeving in het ene domein
beschouwd als een verzameling gebouwen terwijl een ander domein daarin panden
onderscheidt. Een object is voor een domein relevant als eigenschappen
(kenmerken) daarvan van belang zijn voor het functioneren van dat domein.

>   **Definitie Objecttype**

>   De typering van een groep objecten (in de werkelijkheid) die binnen een
>   domein relevant zijn en als gelijksoortig worden beschouwd.

*Toelichting* Jan, Piet en Marie zijn mensen die vanuit het Burgerzaken-domein
beschouwd worden als objecten van het type ‘natuurlijk persoon’. In een ander
domein, ‘de volksmond’, noemen we dit ‘mens’ wat ook een objecttype is. In weer
een ander domein is Jan van het type ‘vergunninghouder’ en Piet en Marie niet,
omdat aan hen (nog) nooit een vergunning verleend is. Objecttypen zijn een
abstractie van de werkelijkheid oftewel we beogen hiermee de werkelijkheid zo
getrouw mogelijk te beschrijven, binnen de context van het domein. Dit staat
geheel los van het vastleggen van gegevens over objecten van een type in een
registratie. Daartoe is veelal een interpretatie nodig (van die werkelijkheid
cq. die objecttypen) naar eenheden die in een registratie vastgelegd kunnen
worden (records, entiteiten e.d.) op basis van andere overwegingen.

#### Attribuutsoort
<!-- **2. Attribuutsoort** -->

Een attribuutsoort is een type van gelijksoortige attributen of gegevens.
Daartoe kijken we eerst naar het begrip ‘gegeven’.

>   **Definitie Gegeven**

>   De betekenisvolle formulering van een waargenomen feit, waaraan een waarde
>   kan worden toegekend.

*Toelichting:* Gegevens zijn de objectief waarneembare neerslag of registratie
van feiten op een bepaald medium, zodanig dat deze gegevens uitgewisseld en voor
langere tijd bewaard kunnen worden. Dat kan op papier, in digitale vorm, et
cetera. Met deze gegevens wordt een model (een selectief deel dus) van de
werkelijkheid vastgelegd in de tijd. Ofschoon de werkelijkheid nooit stilstaat,
kan deze door het vastleggen van de gegevens toch worden bevroren.

Voorbeelden van gegevens zijn de waardes ‘Jan’ en ‘man’ betreffende de naam en
het geslacht van een object van het type Persoon. Merk op dat een gegeven zonder
duidelijkheid over het type gegeven (naam, geslacht e.d.) geen informatie biedt.
Een gegeven wordt ook wel attribuut genoemd.

>   **Definitie Attribuutsoort**

>   De typering van gelijksoortige gegevens die voor een objecttype van
>   toepassing is.

*Toelichting* Een gegeven met stereotype attribuutsoort is een kenmerk van een
object.

Attribuutsoorten worden ook wel kenmerken of eigenschappen genoemd. Aan elk
objecttype worden nul, één of meer *«*Attribuutsoort*»*en toegekend. In een
informatiemodel worden alleen voor het domein relevante attribuutsoorten
opgenomen bij een objecttype.

<aside class='example'>
    We kunnen definiëren dat 'persoonsnaam' en 'geslachtsaanduiding'
    attribuutsoorten zijn die van toepassing zijn voor het objecttype 'persoon'.
    Wanneer ‘oogkleur’ niet relevant is voor het domein, wordt deze niet
    gemodelleerd.
</aside>

#### Gegevensgroep
<!-- **3. Gegevensgroep** -->

>   **Definitie Gegevensgroep**

>   Een typering van een groep van gelijksoortige gegevens die voor een
>   objecttype van toepassing is.

*Toelichting:* Dit modelelement verzorgt de modelmatige aankoppeling van een
gegevensgroeptype aan het objecttype waartoe een gegevensgroeptype onlosmakelijk
behoort.

De groep van gegevens is een kenmerk van een object. De gegevensgroep is een
betekenisvol kenmerk van een objecttype. De gegevensgroep heeft altijd als type
een gegevensgroeptype.

<aside class='example'>
    Een persoon heeft ogen, dit is een onmiskenbaar kernmerk van een
    persoon. De gegevensgroep noemen we daarom ‘ogen’. Elk oog heeft een kleur en
    een sterkte, waar we waardes van bij willen houden, zoals respectievelijk blauw
    en -2. Dit kan per oog verschillen, waardoor het nuttig kan zijn om deze
    kenmerken als attribuutsoorten onder te brengen in een gegevensgroeptype Oog. De
    gegevensgroep ‘ogen’ krijgt een definitie, en krijgt als type het
    Gegevensgroeptype Oog (merk op dat we het kenmerk Oog als modelelement kunnen
    definiëren, zonder dat er we er waardes van vastleggen. Alleen van kleur en
    sterkte leggen we waardes vast).
</aside>


#### Gegevensgroeptype
<!-- **4. Gegevensgroeptype** -->

>   **Definitie Gegevensgroeptype**

>   Een groep van met elkaar samenhangende attribuutsoorten. Een
>   gegevensgroeptype is altijd een type van een gegevensgroep.

*Toelichting:* De attribuutsoorten van het gegevensgroeptype zijn semantisch
gezien eigenschappen van het objecttype. Echter, vanwege samenhangend gedrag (ze
horen semantisch bij elkaar, ze wijzigen bijvoorbeeld gelijktijdig e.d.) zijn
deze ondergebracht in een apart modelelement. Het onderbrengen van
attribuutsoorten in een groep c.q. in het modelelement gegevensgroeptype, is een
keuze, het is niet perse noodzakelijk. Wanneer deze ondergebracht worden in een
gegevensgroeptype dan zijn/blijven het afzonderlijke kenmerken van het object en
dus attribuutsoorten van het objecttype, maar dan ondergebracht in een
gegevensgroeptype. De gegevensgroep als geheel wordt daarom expliciet niet
gezien als zijnde één attribuutsoort van een object.

<aside class='example'>
    Geboorte bij INGESCHREVEN NATUURLIJK PERSOON (met daarin onder
    andere de attribuutsoorten Geboortedatum en Geboortegemeente) en Motor (met
    daarin attribuutsoorten over de inhoud, vermogen, serienummer en het soort
    motor) bij een SCHIP.
</aside>

*Toelichting:* bij voorbeeld: in de BRK is een persoon eigenaar van een Schip,
niet van een Motor. In de BRK kan het eigendom van een Motor niet worden
overgedragen aan een ander persoon. In een ander informatiemodel, zoals van een
motorfabriek, zou de Motor wel een objecttype kunnen zijn, omdat het daar wel
hét onderwerp van gesprek is.\*

Een gegevensgroeptype is meestal het type van slechts één gegevensgroep, omdat
de semantiek meestal exclusief is voor één objecttype. Echter, hergebruik is
mogelijk (als de semantiek niet exclusief is voor één objecttype). Voorwaarde
voor hergebruik is dat de definitie (de definitie en toelichting, inclusief alle
metadata aspecten) dan inderdaad gelijk zijn, voor alle objecttypes die
hergebruik maken van het gegevensgroeptype.

Een gegevensgroeptype kan, naast attribuutsoorten, ook weer gegevensgroeptypen
bevatten.

Een gegevensgroeptype is verbonden met een objecttype, via het modelelement
Gegevensgroep.

### Relaties

Verbanden met betekenis, die gelegd zijn tussen modelelementen van het type objecttype naar het type objecttype, of van een gegevensgroeptype naar een objecttype.

#### Generalisatie
<!-- **5. Generalisatie:** -->

>   **Definitie Generalisatie tussen objecttypes**

>   De typering van het hiërarchische verband tussen een meer generiek object
>   van een objecttype en een meer specifiek object van een ander objecttype
>   waarbij het laatstgenoemde object eigenschappen van het eerstgenoemde object
>   overerft.

*Toelichting:* Een generalisatierelatie geeft aan dat bepaalde eigenschappen van
een objecttype (vaak attribuutsoorten en/of relatiesoorten) ook gelden voor de
gerelateerde objecttypen, én dat deze qua semantiek, structuur en syntax gelijk
zijn. We spreken dan van een supertype met subtypen. De modelelementen die
generiek gelden worden in een generiek objecttype, het supertype, gemodelleerd
en deze worden overerft door elk subtype (minimaal twee) die de generalisatie
relatie legt naar dit generieke objecttype.

<aside class='example'>
    PERCEEL is specialisatie van KADASTRAAL ONROERENDE ZAAK,
    APPARTEMENTSRECHT is specialisatie van KADASTRAAL ONROERENDE ZAAK. PERCEEL en
    APPARTEMENTSRECHT hebben beide ‘Kadastrale aanduiding’ en een ‘relatie met
    ONROERENDE ZAAK FILIATIE’.
</aside>

>   **Definitie Generalisatie tussen datatypes**

>   De typering van het hiërarchische verband tussen een meer generieke
>   structuur van data in de vorm van een datatype, en een meer specifieke
>   structuur van data in de vorm van een ander datatype, waarbij het
>   laatstgenoemde datatype de eigenschappen van het eerstgenoemde datatype
>   overerft, én een verbijzondering hierin aanbrengt in de vorm van een meer
>   restrictieve definitie, of een meer restrictief patroon/formeel patroon.

*Toelichting:* Het andere datatype is bijvoorbeeld een CharacterString, Integer,
GM Surface of DMO en dient als basis voor een zelf te definiëren datatype
(zie [Datatype zelf definiëren](#datatype-zelf-definieren)). <!-- (zie 3.1.2.) -->
deze generalisatie is van toepassing op de volgende datatypes:
«Primitief datatype», «Gestructureerd datatype», «Referentielijst», «Codelist»,
«Enumeratie».

#### Relatiesoort
<!-- **6. Relatiesoort** -->

>   **Definitie Relatiesoort**

>   De typering van het structurele verband tussen een object van een objecttype
>   en een (ander) object van een ander (of hetzelfde) objecttype.

*Toelichting:* Objecten hebben eigenschappen die gemodelleerd kunnen worden met
attribuutsoorten maar ook met relatiesoorten naar andere objecttypen. Als het
voor het desbetreffende domein van belang is om die eigenschap te modelleren als
onderdeel van een ander objecttype, dan maakt de relatiesoort die eigenschap
beschikbaar voor het eerstgenoemde objecttype. Bijvoorbeeld, een attribuutsoort
van het objecttype PERSOON zou kunnen zijn ‘Naam geregistreerd partner’ (naast
de attribuutsoort ‘Naam’ van PERSOON). De naam van de geregistreerde partner
komt evenwel ook beschikbaar met een relatiesoort van PERSOON naar PERSOON:
“heeft geregistreerd partnerschap met”. Zie ook het eerder genoemde voorbeeld
van SCHIP en MOTOR.

<aside class='example'>
    Relatiesoorten: "VERBLIJFSOBJECT is gelegen in een PAND" en "SUBJECT
    heeft als correspondentieadres WOONPLAATS", of korter, "gelegen in",
    "postadres".
</aside>

Wanneer een relatie gebruikt wordt om objecten aan elkaar te verbinden, zonder dat er eigenschappen over deze relatie worden vastgelegd, dan betreft dit de MIM-metaclass «Relatiesoort».

#### Relatieklasse
<!-- **7. Relatieklasse** -->

>   **Definitie Relatieklasse**

>   Een relatiesoort met eigenschappen.

*Toelichting:* De relatieklasse geeft aan dat er een relatie is tussen twee
objecten, waarbij er gegevens over deze relatie vastgelegd moeten worden. De
relatie wordt in dit geval behandeld als een object, met gegevens. De gegevens
over de relatie bestaan alleen zolang de relatie tussen beide objecten bestaat
en zolang elk van beide objecten zelf (nog) bestaan.

<aside class='example'>
    Relatieklasse FUNCTIONARIS (een PERSOON is benoemd als de
    FUNCTIONARIS voor een AFDELING en heeft bijvoorbeeld een benoemingsdatum als
    attribuut).
</aside>

*Opmerking*: de gegevens van de relatie worden voor één relatie vastgelegd en
niet voor meerdere relaties tegelijk. Als dit laatste het geval is, dan worden
de gegevens vastgelegd in een «Objecttype». Een CONTRACT kan bijvoorbeeld ook
een afspraak zijn tussen twee óf méér SUBJECTen, waarbij de gegevens van de
relatie voor alle betrokken objecten hetzelfde zijn. CONTRACT wordt dan
gemodelleerd als objecttype, waarbij beschreven wordt wat er moet gebeuren
wanneer één van de SUBJECTen niet meer bestaat.

#### Externe Koppeling
<!-- **8. Externe koppeling** -->

>   **Definitie Externe koppeling**

>   Een associatie waarmee vanuit het perspectief van het eigen informatiemodel
>   een objecttype uit het ‘eigen’ informatiemodel gekoppeld wordt aan een
>   objecttype van een extern informatiemodel. De relatie zelf hoort bij het
>   ‘eigen’ objecttype.

In [Koppelen met ander informatiemodel](#koppelen-met-ander-informatiemodel-externe-koppeling) wordt beschreven hoe een externe koppeling kan worden gemodelleerd.

#### Relatierol
<!-- **9. Relatierol** -->

>   **Definitie Relatierol**

>   De benaming van de manier waarop een object deelneemt aan een relatie met
>   een ander object.

*Toelichting:* Met relatie wordt in deze de volgende bedoeld:
*«Relatiesoort»*, *«Relatieklasse»* of *«Externe koppeling»*. Voor
*«*Generalisatie*»* speelt het niet. Een relatie heeft een source kant, die de
eigenaar is van de relatie, en is gericht naar de target kant. De relatierol kan
aan beide kanten een naam en een definitie krijgen.

<aside class='example'>
    Een kind-ouder relatie. Een PERSOON heeft in de rol ‘ouder van’
    een relatie met PERSOON, 0, 1 of meerdere keren. Andersom is de rol ‘kind van’.
    Een EIGENDOM kan overgedragen worden van de ene PERSOON naar de andere PERSOON.
    De relatie krijgt de naam ‘overdracht’ , met de source rol ‘vervreemder’ en de
    target rol ‘verkrijger’.
</aside>

### Waardenlijsten

Een datatype waarvan de mogelijke waarden zijn opgesomd in een lijst. De waarde
van een attribuutsoort moet één van de waarden zijn uit de gespecificeerde
waardenlijst.

#### Referentielijst
<!-- **10. Referentielijst** -->

>   **Definitie Referentielijst**

>   Een lijst met een opsomming van de mogelijke domeinwaarden van een
>   attribuutsoort, die buiten het model in een externe waardenlijst worden
>   beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd
>   aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel
>   aangepast wordt (in tegenstelling tot bij een enumeratie).

<aside class='example'>
    Referentielijst LAND, referentielijst NATIONALITEIT. Een
    NATUURLIJK PERSOON heeft een attribuut geboorteland, van het type LAND.
</aside>

De referentielijst bevat representaties van objecten, die in het informatiemodel
niet als een objecttype onderwerp van gesprek zijn. De referentielijst wordt
gebruikt als type van een attribuut van een object.

Het objecttype LAND uit het voorbeeld is opgenomen in een referentielijst en
niet als objecttype. Maar we willen wel de structuur en betekenis van LAND
vastleggen, zodat we er naar kunnen refereren. Een object dat is opgenomen in
een referentielijst heeft daarom veelal meerdere attributen, zoals de naam, de
ontstaansdatum, een omschrijving en de ISO code, die zijn opgenomen in de
referentie lijst.

Alle attributen van gerefereerde objecten uit de referentielijst gelden in de
context van het informatiemodel, mits opgenomen in de *«Referentielijst»*. In de
registratie wordt vaak alleen de referentie ernaartoe opgenomen, omdat het niet
de bedoeling is om alle gegevens over te nemen. De gegevens staan immers al in
de referentielijst en er is bewust gekozen om een referentielijst te modelleren.
Het attribuut van een objecttype dat als type een referentielijst heeft bevat in
de registratie daarom (vaak) alleen een referentie naar een object uit de lijst.

#### Referentie element
<!-- **11. Referentie element** -->

>   **Definitie Referentie element**

>   Een eigenschap van een object in een referentielijst in de vorm van een
>   gegeven.

<aside class='example'>
    Referentielijst LAND kent de referentie-elementen Landcode ISO en
    Landnaam, referentielijst NATIONALITEIT kent referentie-element
    Nationaliteitcode.
</aside>

Een referentie element kan uniek zijn, zoals een code, en is dan op zichzelf
geschikt om gebruikt te worden als referentie (zoals bedoeld in de definitie van
Referentielijst).

#### Enumeratie
<!-- **12. Enumeratie** -->

>   **Definitie Enumeratie**

>   Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een
>   statische lijst.

*Toelichting:* In de registratie krijgt een attribuut één van deze waarden. De
lijst is een statische lijst met constanten (meerdere attributen, zoals bij een
referentielijst, zijn nooit aan de orde).

<aside class='example'>
    Geslacht (man, vrouw, overig), de typering van een openbare
    ruimte (spoorbaan, plein, straat).
</aside>

#### Enumeratiewaarde
<!-- **13. Enumeratiewaarde** -->

>   **Definitie Enumeratiewaarde**

>   Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant gegeven.

<aside class='example'>
    Geslacht: man, vrouw, overig, type openbare ruimte: spoorbaan, plein, straat.
</aside>

#### Stereotype Codelist
<!-- **14. Stereotype** «**Codelist** -->

>   **Definitie Codelist**

>   De definitie van een codelist is gelijk aan de definitie van een
>   referentielijst.

Er is wel een verschil in modellering; zie hiervoor de toelichting.

<aside class='example'>
    Codelist LAND met daarin (alleen) het attribuut ‘naam’ (de
    externe gepubliceerde waardenlijst bevat naast de naam ook de ISO code en de
    ontstaansdatum).
</aside>

*Toelichting:* Zowel referentielijsten als codelists zijn in feite
waardenlijsten. In tegenstelling echter tot de referentielijst wordt een
codelist *niet* in het informatiemodel beschreven, omdat de definitie en
semantiek geheel in de externe waardenlijst staat en niet (nader) geduid hoeft
te worden in het informatiemodel zelf. Een codelist heeft in het informatiemodel
daarom geen attributen (en zou voor de definitie alleen hoeven te refereren naar
de definitie bij de extern gepubliceerde waardenlijst, maar voor het gemak is de
definitie wel opgenomen als metagegeven in dit metamodel). De extern
gepubliceerde waardenlijst bevat, naast gewone attributen, ook altijd één
specifiek attribuut, met daarin de domeinwaarden die gebruikt mogen/moeten
worden in de registratie. In het gebruik is een Codelist daarom analoog aan een
Enumeratie. Welk specifiek attribuut dit is en wat de betekenis daarvan is staat
in de codelist zelf gedefinieerd.

### Datatypen

Een datatype die de structuur beschrijft waaraan een waarde (zie [Objecten en attributen](#objecten-en-attributen)) <!-- (zie 2.2.1 Objecten -->
en attributen) moet voldoen.

Bij elke «Attribuutsoort» wordt gespecificeerd aan welk datatype de data c.q. de
waarde die hiervoor vastgelegd wordt moet voldoen. Het datatype wordt gebruikt
als type van een attribuutsoort.

Anders gezegd, Datatypes zijn veelal herbruikbaar en kunnen gespecificeerd
worden bij diverse «Attribuutsoort»-en.

####  Primitief datatype
<!-- **15. Primitief datatype** -->

**PrimitiveType** Een standaard datatype, zoals bekend in vele
specificatietalen, dat de structuur van een gegeven beschrijft. Het metamodel
volgt waar mogelijk de definities zoals beschreven in ISO standaarden (zie
§3.1). Deze datatypes hebben altijd al een naam en definitie gekregen vanuit
deze standaarden en deze worden gebruikt. Deze worden niet door de modelleur
gecreëerd en hebben daarom geen MIM metaclass.

<aside class='example'>
    CharacterString, Integer, DateTime.
</aside>

>   **Definitie Primitief datatype**

>   Een in het eigen model gedefinieerd primitieve datatype. Deze worden wel
>   door de modelleur gecreëerd, met een eigen naam en een eigen definitie (en
>   eigen metagegevens).

<aside class='example'>
    Documentnummer, Postcode. In het geval van Postcode is de landelijke
    definitie in tekst vastgelegd buiten het informatiemodel zelf, waarbij in het
    eigen model een modelelement is gemaakt in de vorm van het datatype <span class='note'>[Postcode](#alg-n-1)</span>.
</aside>    

*Toelichting:* Een primitief datatype is een datatype zonder verdere
specificatie over de structuur. Dit datatype is enkelvoudig, oftewel niet samengesteld, en wordt
ook wel simpel datatype genoemd. Dit datatype kent daarom zelf geen eigen modelelementen
zoals een «Data element».

Wanneer een Primitief datatype wordt gespecificeerd, dan heeft deze standaard
als primitive datatype een CharacterString.

Een informatiemodel definieert datatypes als er behoefte is aan een datatype dat
eenmalig gedefinieerd wordt en op meerdere plekken in het model gebruikt moet
kunnen worden met altijd exact dezelfde structuur en waardenbereik (zie ook
‘patroon’ in [Domeinwaarden of lijsten](#domeinwaarden-of-lijsten)<!-- 3.5 -->).
Dit datatype, met een eigen naam, wordt vervolgens gebruikt als type van een attribuutsoort.

#### Gestructureerd datatype
<!-- **16. Gestructureerd datatype** -->

>   **Definitie Gestructureerd datatype**

>   Specifiek benoemd gestructureerd datatype dat de structuur van een gegeven
>   beschrijft, samengesteld uit minimaal twee elementen.

*Toelichting:*

De waarde van het attribuutsoort verkoopprijs met datatype bedrag is uitgedrukt
in een combinatie van een som en valuta zoals 35 euro. De introductie van één
datatype Bedrag, uitgedrukt in som en valuta, legt dus vast dat som en valuta
onlosmakelijk met elkaar zijn verbonden.

De eigenschappen in het Gestructureerd datatype tezamen zijn identificerend (een
Gestructureerd datatype “identificeert zichzelf”, zoals er maar per definitie
één “1 liter” bestaat, één 35 euro en één datum 6 april 2017, met per definitie
altijd dezelfde betekenis:

-   Een blik olie heeft een inhoud van **7 liter**, kost **35 euro**, en is
    verkocht op **6 april 2017**.

-   Piet heeft **1 liter** bloed gedoneerd, daarvoor **35 euro** vergoeding
    gekregen, op **6 april 2017**.

Het identificerend zijn geldt bijvoorbeeld niet voor Jan Jansen. Er zijn
meerdere personen met deze naam en dat zijn verschillende personen (Jan Jansen
is dan ook een gegevensgroeptype Naam met voornaam Jan en achternaam Jansen en
geen Gestructureerd datatype).

<aside class='example'>
    Gestructureerd datatype Bedrag bestaat uit de data-elementen som en valuta.
</aside>

#### Data element
<!-- **17. Data element** -->

>   **Definitie Data element**

>   Een onderdeel/element van een Gestructureerd datatype die als type een
>   datatype heeft.

*Toelichting:* Het data element is een eigenschap van een Gestructureerd
datatype en beschrijft de structuur van een gegeven. Het is niet een eigenschap
van een object en niet hetzelfde als een attribuutsoort.

Het data element beschrijft in combinatie met andere data-elementen de structuur
van een gegeven en heeft zelf een datatype. Dit datatype is meestal een
primitief datatype.

#### Union
<!-- **18. Union** -->

>   **Definitie Union**

>   Gestructureerd datatype, waarmee wordt aangegeven dat er meer dan één
>   mogelijkheid is voor het datatype van een attribuut. Het attribuut zelf
>   krijgt als datatype de union. De union biedt een keuze uit verschillende
>   datatypes, elk afzonderlijk beschreven in een union element.

<aside class='example'>
    Union LineOrPolygon. Deze biedt een keuze uit Union element Line of Union element Polygon.
</aside>

#### Union element
<!-- **19. Union element** -->

>   **Definitie Union element**

>   Een type dat gebruikt kan worden voor het attribuut zoals beschreven in de
>   definitie van Union. Het union element is een onderdeel van een Union,
>   uitgedrukt in een eigenschap (attribute) van een union, die als keuze binnen
>   de Union is gerepresenteerd..

<aside class='example'>
    Union element Line en union element Polygon zijn beiden onderdeel van Union LineOrPolygon.
</aside>

### Packages

Een package is een benoemde en begrensde verzameling/groepering van
modelelementen.

#### Extern
<!-- **20. Extern** -->

>   **Definitie Extern**

>   Een groepering van constructies die een externe instantie beheert en
>   beschikbaar stelt aan een informatiemodel en die in het informatiemodel
>   ongewijzigd gebruikt worden.

<div class='example'>
    Voorbeeld: het Externe package NEN3610 met datatype NEN3610ID. Het datatype van
    attribuutsoort Identificatie wegdeel in RSGB verwijst naar het datatype
    NEN3610ID zoals opgenomen in het Externe package.
</div>

#### View
<!-- **21. View** -->

>   **Definitie View**

>   Een groepering van objecttypen die gespecificeerd zijn in een extern
>   informatiemodel en vanuit het perspectief van het eigen informatiemodel
>   inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het
>   eigen informatiemodel.

<aside class='example'>
    IMKAD-BRP. Een aantal van de gegevens uit BAG objecten uit de
    basisregistratie BAG zijn relevant voor de basisregistratie Kadaster. De
    definities van de BAG worden gevolgd. Vanuit modelleringsperspectief wordt dit
    gezien als een view.
</aside>

### Overig

#### Identificerend
<!-- **22. Identificerend** -->

>   **Definitie Identificerend**

>   Een kenmerk van een objecttype die aangeeft of deze eigenschap uniek
>   identificerend is voor alle objecten in de populatie van objecten van dit
>   objecttype.

*Toelichting:* objecten hebben, of krijgen, in een administatie of
gegevensvoorziening vaak één identificerend kenmerk. Het kan ook zijn dat een aantal kenmerken in combinatie
identificerend zijn, zoals twee attibuutsoorten of een attribuutsoort en een
relatiesoort. De combinatie met een relatiesoort wordt alleen gedaan voor
objecttypes die zelf geen unieke aanduiding hebben en daarom deze moeten
samenstellen met de unieke aanduiding van een gerelateerde objecttype.

<aside class='example'>
    ‘burger service nummer’ van een PERSOON, of ‘identificatie’ van
    PAND. Een combinatie van ‘postcode’, ‘huisnummer’, ‘huisnummertoevoeging’ en
    ‘huisletter’ van een NUMMERAANDUIDING. Een BUURT, deze heeft zelf geen unieke
    identificatie. Een BUURT ligt in een WIJK en binnen die WIJK is de BUURT wel
    uniek. De WIJK zelf heeft een unieke identificatie. De unieke identificatie van
    BUURT is daarom samengesteld uit het attribuut Buurtcode van BUURT en de
    verwijzing naar de WIJK (de identificatie van WIJK).
</aside>

#### Constraint
<!-- **23. Constraint** -->

>   **Definitie Constraint**

>   Een constraint is een conditie of een beperking, die over een of meerdere
>   modelelementen uit het informatiemodel geldt.

*Toelichting:*

Een constraint kan vastgelegd worden bij alle modelelementen. Echter, meestal komt een constraint voor bij een objecttype, om te aan te geven dat de constraint geldt voor 2 (of meer) kenmerken van een objecttype:

<aside class='example'>
    Een conditionele afhankelijkheid ‘als (optioneel) attribuut 1
    leeg is, dan is (optioneel) attribuut 2 verplicht.
</aside>

, of om een bijzondere specificatie toe te voegen die niet via de bestaande modelelementen gelegd kan worden.

<aside class='example'>
    ‘de 11-proef is van toepassing op dit attribuut’.
</aside>

Een constraint wordt altijd in gewone tekst omschreven en optioneel als formele


## Specificatie metagegevens

Elk modelelement kent een aantal metagegevens, die bepaalde aspecten van het
modelelement specificeren. Zo is er de *naam* van het modelelement, bijvoorbeeld
het objecttype met als *naam* Pan den een bijbehorende *definitie*, of de *Datum
opname* van het modelelement in het informatiemodel, bijvoorbeeld *Datum opname*
1-1-2012.

Merk op dat een aantal van deze metagegevens al meegenomen worden in een specificatie taal.

Bijvoorbeeld het objecttype met de naam Pand wordt in UML gemodelleerd als ‘*Named element’* met als
‘*Name’* Pand (in UML 1.4 heette dit nog UML-Class, met een propery ‘*Name’*).

Een aantal andere metagegevens, zoals de eerder genoemde *Datum opname* met
waarde 1-1-2012. worden als aparte data vastgelegd, in UML gebeurd dit in een ‘*Tagged value*’.

<todo>TODO: voorbeeld ook opnemen voor W3C.</todo>

Merk op, de metadata aspecten zijn specifiek voor elk modelelement apart. Dus als
er in H2.2 sprake is van een generalisatie, dan worden deze metadata niet
overerft (en de ingevulde waardes worden uiteraard zeker niet overerft). De MIM
metaclass Union erft dus geen metagegevens, zoals patroon, van MIM metaclass
Datatype.

Voor de duidelijkheid zijn een aantal metagegevens verplicht gemaakt, om te
voorkomen dat een niet ingevulde waarde verschillende betekenissen heeft, zoals:
niet aan de orde (wat zo is bij optionele gegevens), nog niet ingevuld, leeg
betekent zie default waarde, of dat het onbekend is welk van deze voorgaande
betekenissen het is.

Hieronder volgen eerst de algemene metagegevens. Dit zijn metagegevens zoals
*Naam*, *Definitie* en *Datum opname*, en deze komen bij meerdere modelelementen
voor. De definitie en toelichting van deze metagegevens worden in deze paragraaf
gespecificeerd. In de paragrafen hierna wordt vervolgens naar deze paragraaf
verwezen. Specifieke metagegevens die maar één keer voorkomen zijn bij het
modelelement zelf beschreven.

Metagegeven: **Naam**

>   **Definitie Naam**

De naam van een modelelement.

*Toelichting*

Bijvoorbeeld: Pand is de naam van het modelelement objecttype, bouwjaar is de
naam van het modelelement attribuutsoort. De modelelementen zijn limitatief
opgesomd in het hoofdstuk [Betekenis modelelementen](#betekenis-modelelementen).  
(en eventueel zijn in een uitbreiding extra modelelementen limitatief opgesomd).

*Toepassing*: alle modelelementen.

Metagegeven: **Definitie**

>   **Definitie Definitie**

De beschrijving van de betekenis van dit modelelement.

*Toelichting*

Bijvoorbeeld: Een Pand is de kleinste, bij de totstandkoming functioneel en
bouwkundig-constructief zelfstandige eenheid die direct en duurzaam met de aarde
is verbonden en betreedbaar en afsluitbaar is.

De definitie volgt, indien aanwezig, de catalogus van de desbetreffende
(basis)registratie of informatiemodel, mits deze het modelelement definieert
vanuit een informatie en informatiemodel perspectief (er zijn ook andere
definities mogelijk vanuit andere perspectieven, zoals vanuit een juridisch
perspectief, of vanuit het perspectief van een model van begrippen, zoals
genoemd in de paragraaf [Typen informatiemodellen](#typen-informatiemodellen).
Dergelijke definities kunnen hetzelfde zijn, of op het
moment hetzelfde, of verschillend, of aanvullend op elkaar. Het is aan de
beheerder van het informatiemodel om hier zorgvuldig mee om te gaan).

*Toepassing*: alle modelelementen.

Metagegeven: **Alias**

>   **Definitie Alias**

De alternatieve weergave van de naam.

*Toelichting*

Als de naam van het modelelement in het informatiemodel kan bijvoorbeeld zonder
spaties is geschreven, dan kan in de alias de naam in natuurlijke taal worden
opgenomen. Bijvoorbeeld: OnroerendeZaak heeft als alias Onroerende zaak. De
alias is bedoeld als alternatieve schrijfwijze, en heeft verder geen andere
betekenis. De alias is optioneel (zie verder ook [Naamgevingsconventies](#naamgevingsconventies)). <!-- 3.16). -->

Bijvoorbeeld: OnroerendeZaak heeft als alias Onroerende zaak.

*Toepassing*: alle modelelementen die een naam hebben, uitgezonderd de <span class='note'>[Enumeratiewaarde](#alg-n-4)</span>.

Metagegeven: **Definitie**

>   **Definitie Definitie**

De beschrijving van de betekenis van dit modelelement.

*Toelichting*

Bijvoorbeeld: Een Pand is de kleinste, bij de totstandkoming functioneel en
bouwkundig-constructief zelfstandige eenheid die direct en duurzaam met de aarde
is verbonden en betreedbaar en afsluitbaar is.

De definitie volgt, indien aanwezig, de catalogus van de desbetreffende
(basis)registratie of informatiemodel, mits deze het modelelement definieert
vanuit een informatie en informatiemodel perspectief (er zijn ook andere
definities mogelijk vanuit andere perspectieven, zoals vanuit een juridisch
perspectief, of vanuit het perspectief van een model van begrippen, zoals
genoemd in paragraaf 1.5. Dergelijke definities kunnen hetzelfde zijn, of op het
moment hetzelfde, of verschillend, of aanvullend op elkaar. Het is aan de
beheerder van het informatiemodel om hier zorgvuldig mee om te gaan).

*Toepassing*: alle modelelementen.

Metagegeven: **Toelichting**

>   **Definitie Toelichting**

Een inhoudelijke toelichting op de definitie, ter verheldering of nadere
duiding.

*Toelichting*

Bijvoorbeeld: een aantal treffende voorbeelden (waardes) van het kenmerk van het
object.

*Toepassing*: alle modelelementen met een definitie.

Metagegeven: **Herkomst**

>   **Definitie Herkomst**

De registratie of het informatiemodel waaraan het modelelement ontleend is dan
wel de eigen organisatie indien het door de eigen organisatie toegevoegd is.

*Toelichting*

Bijvoorbeeld: de herkomst van het kenmerk *begrenzing* van een Perceel heeft als
waarde: ‘BRK’. BRK staat dan bijvoorbeeld in de bijbehorende documentatie
uitgelegd als: de basisregistratie Kadaster.

Er wordt expliciet niet bedoeld van welke informatievoorziening of registratie
de *data* is overgenomen. Het gaat er bij dit metagegeven expliciet om uit welk
domein of bron het modelelement zijn herkomst vindt. Voor basisregistraties is
de herkomst altijd het eigen informatiemodel. Dit metagegeven is vooral van
belang als het modelelement is overgenomen uit een ander informatiemodel.

Bijvoorbeeld: de herkomst van het kenmerk *woonadres*, wat bijvoorbeeld een
«Relatiesoort» is van een Persoon in de basisregistratie Personen naar een
Nummeraanduiding in de basisregistratie Adressen en Gebouwen (BAG), heeft als
herkomst: ‘BRP’ (de basisregistratie Kadaster). Dit kenmerk *woonadres* wordt
bijgehouden in de BRP en de source kant van de relatie zit in de BRP. De
Nummeraanduiding zelf heeft in de BAG veelal als herkomst: BAG. Mochten echter
de adresgegevens niet (direct of indirect) uit de BAG komen, maar bijvoorbeeld
via een eigen inwinningsproces in een eigen registratie worden bijgehouden, dan
de herkomst niet de BAG.

Deze definitie omvat ook de definite van herkomst van de stelselcatalogus (De
registratie in wiens catalogus het objecttype is gespecificeerd (oftewel de
registratie waar het objecttype deel van uitmaakt). Deze specificatie is
toegevoegd omdat het wel duidelijk moet zijn in welke (basis)registratie of
informatiemodel het objecttype).

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van objecttype
(objecttype zelf heeft een eigen definitie van herkomst) en in het
informatiemodel gedefinieerde datatypes (maar niet bij elementen van datatypes).

Metagegeven: **Herkomst definitie**

>   **Definitie Herkomst definitie**

De registratie of het informatiemodel waaruit de **definitie** is overgenomen
dan wel een aanduiding die aangeeft uit welke bronnen de definitie is
samengesteld.

*Toelichting*

Meestal staat in dit metagegeven aangegeven '\<mijn IM\>', bijvoorbeeld BRK als
het om het informatiemodel van de BRK gaat.

Maar de herkomst van de definitie van het kenmerk *adres* kan ook als waarde
hebben: ‘BAG’. Of ‘BAG en BRK’, waarbij in de documentatie verder uitgelegd
wordt wat dit betekent, zoals dat de definitie is overgenomen en vervolgens
binnen het eigen informatiemodel verder aangescherpt is, of nader opgesplitst is
in twee aparte definities.

Dit metagegeven is niet bedoeld voor gevallen waarin een definitie alleen
geïnspireerd is door een andere definitie, of de andere definitie daadwerkelijke
dermate herdefinieerd dat de oorspronkelijke definitie niet meer van toepassing
is.

Het gaat erom dat het voor gebruikers helder is hoe informatie die aan dit
informatiemodel voldoet zich verhoudt tot informatie die aan het andere
informatiemodel voldoet. Het metagegeven *herkomst definitie* schept hier
duidelijkheid in.

*Toepassing*: alle modelelementen die het metagegeven **definitie** kennen.

Metagegeven: **Datum opname**

>   **Definitie Datum opname**

De datum waarop het modelelement is opgenomen in het informatiemodel.

*Toelichting*

Bijvoorbeeld: 1-1-2012.

*Toepassing*: alle modelelementen, uitgezonderd datatype elementen, packages en
overig.

Metagegeven: **Indicatie materiële historie**

>   **Definitie Indicatie materiele historie**

Indicatie of de materiële historie van het kenmerk van het object te bevragen
is.

*Toelichting*

Bijvoorbeeld: Ja. Met te bevragen wordt bedoeld, er wordt historie bijgehouden
op enerlei wijze, welke op enerlei wijze te bevragen is.

De in te vullen waarde komt uit: zie Tagged values en waardenbereik tagged
values.

Materiele historie geeft aan wanneer in de administratie een verandering bekend
is, en is verwerkt. Verdere toelichting, zie het hoofdstuk [Afspraken & Regels](#afspraken-regels)

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype.

Metagegeven: **Indicatie formele historie**

>   **Definitie Indicatie formele historie**

Indicatie of de materiële historie van het kenmerk van het object bijgehouden
wordt en te bevragen is.

*Toelichting*

Bijvoorbeeld: Nee. Met te bevragen wordt bedoeld, er wordt historie bijgehouden
op enerlei wijze, welke op enerlei wijze te bevragen is.

De in te vullen waarde komt uit: zie Tagged values en waardenbereik tagged
values.

Formele historie geeft aan wanneer in de administratie een verandering bekend
is, en is verwerkt. Verdere toelichting, zie het hoofdstuk [Afspraken & Regels](#afspraken-regels).

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype.

Metagegeven: **Kardinaliteit**

>   **Definitie Kardinaliteit**

De kardinaliteit geeft aan hoeveel keer waarden van dit kenmerk van een object
kunnen voorkomen bij een object van het betreffende objecttype.

*Toelichting*

1 : een object heeft altijd dit kenmerk. Bijvoorbeeld: geboortedatum persoon.

1..\*: een object heeft altijd dit kenmerk, het kenmerk kan meerdere malen
voorkomen. Bijvoorbeeld: aantal hoofdstukken in een boek (in dit domein is dat
er altijd minimaal 1).

0..1: is soms niet beschikbaar. Bijvoorbeeld: tussenvoegsel achternaam.

0..\*: is niet altijd beschikbaar, kan meerdere malen voorkomen.  
Bijvoorbeeld: verblijfsobjecten die gelegen zijn in een pand (garagebox 0, huis
1, flat \*).

Indien een attribuutsoort deel uit maakt van een gegevensgroeptype, dan wordt de
kardinaliteit vermeld van het attribuutsoort binnen het gegevensgroeptype. Voor
de uiteindelijke kardinaliteit van hoe vaak een gegeven voorkomt bij het object
moet rekening gehouden worden met de kardinaliteit van de gegevensgroep en met
de kardinaliteit van de attribuutsoort.

Merk op dat het zo kan zijn dat een object het kenmerk wel degelijk heeft/zou
moeten hebben, maar dat het vooralsnog niet gelukt is om dit gegeven in te
winnen of te achterhalen. Het is dan bekend dat het object dit kenmerk wel
degelijk heeft, maar de waarde ervan is onbekend. De kardinaliteit wordt dan
niet van 1 naar 0 gezet, maar er wordt aangegeven dat er sprake is van mogelijk
geen waarde. Meer hierover is beschreven in het hoofdstuk [Afspraken & Regels](#afspraken-regels).

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype.

Metagegeven: **Authentiek**

>   **Definitie Authentiek**

Aanduiding of het kenmerk een authentiek gegeven betreft.

*Toelichting*

Bijvoorbeeld: authentiek.

Dit is zo voor bijvoorbeeld het burger service nummer van een natuurlijk
persoon. In de wet van bijvoorbeeld een basisregistratie ligt vast welke
gegevens authentiek zijn.

Een kenmerk is authentiek indien de juistheid (hoogwaardige kwaliteit) van het
gegeven gewaarborgd wordt via formele inwinningsprocessen en wettelijk
regelingen. Authentieke gegevens moeten door alle overheidsinstellingen
verplicht en zonder nader onderzoek, worden gebruikt bij de uitvoering van
publiekrechtelijke taken.

De in te vullen waarde komt uit: zie Tagged values en waardenbereik tagged
values.

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype.

Metagegeven: **indicatie afleidbaar**

>   **Definitie indicatie afleidbaar**

Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of relatiesoorten.

*Toelichting*

Bijvoorbeeld: de ‘naam’ van een openbare ruimte, zoals *Burgemeester Baron van
Voerst van Lyndenstraat* , wordt in de verkorte schrijfwijze de ‘verkorte naam’
*Burg Bar v V v Lyndenstr* – dit is een afgeleid gegeven. Bijvoorbeeld de
‘eigenaar’ van een huis kan worden afgeleid uit bepaalde andere gegevens die
binnen het informatiemodel zijn vastgelegd. Het afgeleide gegeven is zelf geen
brongegeven, en moet aangepast worden als de brongegevens aangepast worden. In
de beschrijving van het kenmerk zal aangegeven zijn om welke gegevens het gaat
en eventueel hoe de afleiding plaatsvindt.

*Toepassing*: de modelelementen waarvoor een waarde ingevuld kan worden, te
weten de modelelementen attribuutsoort en relatiesoort.

Metagegeven: **mogelijk geen waarde**

>   **Definitie indicatie afleidbaar**

Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk
is of de waarde er werkelijk ook niet is.

*Toelichting*

Bijvoorbeeld: land van herkomst. Elk mens komt uit een land, maar het kan op het
moment onduidelijk zijn welk land dit is. Bijvoorbeeld: RSIN van een
organisatie, voor gegevens in de registratie die ingewonnen zijn voordat het
RSIN bestond. Het RSIN is een verplicht veld in het actuele informatiemodel,
maar voor oude gegevens is de waarde onbekend.

Het gaat er hier om dat het onduidelijk is of de waarde er is, of als het wel
duidelijk is dat er een waarde is/zou moeten zijn, dat het onduidelijk is wat de
waarde dan is. Dit metagegeven geeft dan aan dat het toegestaan is dat deze
onduidelijkheid mag (blijven) bestaan. Veelal mag dit alleen onder bepaalde
voorwaarden, met een opgaaf van reden.

*Toepassing*: de modelelementen waarvoor een waarde ingevuld kan worden, te
weten de modelelementen attribuutsoort en relatiesoort.

Metagegeven: **Locatie**

>   **Definitie Locatie**

Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de
locatie waar deze te vinden is opgegeven.

*Toelichting*

Indien mogelijk is de verwijzing een URI of een URL (als er geen URI is, dan kan
dit een URL zijn, waar de waardenlijst op basis van de naam van de waardenlijst
te vinden is).

Bijvoorbeeld: <http://www.organisatie.nl/schemas/waardelijsten/NaamWaardelijst>

*Toepassing*: de modelelementen die een waardelijst zijn.

Metagegeven: **Type** (domein van een waarde een gegeven)

>   **Definitie Type**

Het datatype waarmee waarden van deze attribuutsoort worden vastgelegd.

*Toelichting*

Dit is altijd conform een datatype uit dit metamodel (of een extensie ervan) of
een primitief datatype die extern is aan dit model. Betreft het een waarde uit
een dynamische waardentabel, dan wordt de naam van de desbetreffende
referentielijst of codelist als type vermeld. Indien het een waarde uit een
statische opsomming van waarden betreft, dan wordt de naam van de desbetreffende
enumeratie als type vermeld.

Bijvoorbeeld: VlakOfMultivlak, CharacterString

*Toepassing*: attribuutsoort, primitief datatype (in het IM gedefinieerd), data
element, union element, referentie element.

Metagegeven: **Lengte** (domein van een waarde van een gegeven)

>   **Definitie Lengte**

De aanduiding van de lengte van een gegeven.

*Toelichting*

Getallen kunnen altijd positief of negatief zijn.

<aside class='example'>
    ‘1’ als de lengte exact 1 is; ‘1..2’ als de lengte 1 tot en met 2 lang kan zijn;  
    '‘1,2’ voor Decimale getallen met 1 cijfer voor de komma en 2 erna.* Dit is van -9,99
    tot +9,99; Dit is verder toegelicht in het hoofdstuk [Afspraken & Regels](#afspraken-regels).
</aside>

*Toepassing*: attribuutsoort, primitief datatype (in het IM gedefinieerd), data
element, union element, referentie element.

Metagegeven: **Patroon**

>   **Definitie Patroon**

De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben,
oftewel het waardenbereik, uitgedrukt in een specifieke structuur.

*Toelichting*

De structuur is in woorden beschreven.

Bijvoorbeeld: conform de Nederlandse standaard voor het beschrijven van een
postcode.

Het specificeren van een patroon is alleen van toepassing wanneer de
specificatie aangeeft dat de waarde (direct of indirect) een primitief datatype
betreft, zoals een CharacterString.

| *Toepassing*: de modelelementen uit de groep datatype en attribuutsoort. Metagegeven: **Formeel patroon** |
|-----------------------------------------------------------------------------------------------------------|


>   **Definitie Formeel patroon**

Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door de
computer wordt herkend.

*Toelichting*

De structuur is in een reguliere expressie beschreven.

Bijvoorbeeld: [1-9][0-9][0-9][0-9][A-Z][A-Z]

Het specificeren van een patroon is alleen van toepassing wanneer de
specificatie aangeeft dat de waarde (direct of indirect) een primitief datatype
betreft, zoals een CharacterString.

*Toepassing*: de modelelementen uit de groep datatype en attribuutsoort.


#### Toegestane waarden voor (bepaalde) metadata gegevens

Tagged values zijn altijd van het datatype CharacterString. Aanvullend geldt:

-   Voor lengtes geldt dat er alleen getallen in mogen (van het datatype
    Integer).

-   Voor datums geldt dat deze het volgende patroon volgen: jjjjmmdd

| **Tagged value**             | **Waardenbereik**                                                                          |
|------------------------------|--------------------------------------------------------------------------------------------|
| Indicatie materiële historie | Ja, Nee, zie Groep                                                                         |
| Indicatie formele historie   | Ja, Nee, zie Groep                                                                         |
| Mogelijk geen waarde         | Ja, Nee                                                                                    |
| Type aggregratie             | composite, aggregate, of geen/leeg/niet gebruikt                                           |
| <span class='note'>[Authentiek](#alg-n-2)</span>| Authentiek, Basisgegeven, Landelijk kerngegeven, Gemeentelijk kerngegeven, <span class='note'>[Overig](#alg-n-3)</span>|


** Voetnoten **

<aside id='alg-n-1' class='note'>
    Wanneer het datatype Postcode landelijk zodanig beschikbaar is
    gemaakt zodat hier gebruik van gemaakt kan worden in het model, dan hoeft
    Postcode niet meer in het eigen model opgenomen te worden.
</aside>

<aside id='alg-n-2' class='note'>
    Voor toelichting, zie paragraaf over [Authentieke gegevens](#authentieke-gegevens).
</aside>

<aside id='alg-n-3' class='note'>
    Geef bij overig in uw eigen informatiemodel aan wat u er onder verstaat.
</aside>

<aside id='alg-n-4' class='note'>
    Een uitzondering is gemaakt voor UML modellen voor de UML-EnumerationLiteral.
    De ‘naam’ betreft hier een daadwerkelijk waarde, waarin de naam gelijk staat aan de waarde.
    Het is daarom expliciet ongewenst om hiervoor een alternatieve naamgeving te gebruiken. De alias wordt hier, mede
    daarom, gebruikt voor (alleen) de modellering van het metadata aspect Code,
    welke aanvullend is op naam (niet een alternatief van naam).
</aside>
