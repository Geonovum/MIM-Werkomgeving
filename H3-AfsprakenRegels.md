Afspraken & Regels
==================

In deze paragraaf gaan we in op een aantal aspecten van het zojuist beschreven
metamodel en afspraken en regels die van toepassing zijn voor een
informatiemodel.

Datatype(n)
-----------

Een datatype is een typering van een eigenschap. Datatypen in een
informatiemodel beschrijven de structuur waaraan de data van objecten moet
voldoen. De essentie van datatypen is dat ze gaan over de waarden die
attribuutsoorten kunnen hebben. Het specificeert de waarden die de
attribuutsoort kan aannemen en de vorm waarin deze beschikbaar zijn.

We onderscheiden de volgende soorten gedefinieerde categorieën voor datatypen:

1.  Datatypen, primitief: data zoals “Amersfoort” of “10” worden vastgelegd als
    CharacterString en Integer. Dit volgt de internationale standaarden voor
    datatypen.

2.  Datatypen (met een naam), landelijk volgens het GAB: datatypen zoals
    Postcode “1234AB”.

3.  Gestructureerde datatypen: een combinatie van data, zoals een bedrag “5
    euro”, of een GM_Surface. Deze volgen ook internationale of nationale
    standaarden.

De primitieve datatypen uit onderstaande lijst moeten gebruikt worden. De
landelijke en de Gestructureerde datatypen hoeven niet per sé gebruikt te
worden, maar het gebruik hiervan wordt wel aanbevolen. Dit metamodel voorziet er
vooral in dat dit soort datatypen gedefinieerd kunnen worden, conform de
modellering zoals het metamodel aangeeft, maar dus zonder de specifieke
datatypen voor te schrijven.

Datatypen die niet in deze paragraaf (sub paragrafen) voor-gedefinieerd zijn
worden in het eigen informatiemodel toegevoegd. Dit kan een organisatie zelf
doen, door deze expliciet te beschrijven in de eigen extensie en daarna te
gebruiken in het eigen informatiemodel. Deze gelden dan alleen voor het eigen
informatiemodel.

Het is mogelijk om specifieke(re) restricties, zoals de lengte, toe te voegen.
Dit wordt gedaan in een metagegeven lengte. De data van het attribuut moet dan
voldoen aan het datatype én aan het metagegeven lengte. De lengte wordt dus niet
in het datatype zelf vastgelegd.

### Primitive datatypes

Dit metamodel onderkend (momenteel) de volgende extern gedefinieerde primitive
datatypes. Deze zijn allemaal gebaseerd op [GAB]:

| **Primitive type** | **Betekenis**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CharacterString    | Zie ISO 19103. Vrij vertaald: alle alfanumerieke tekens en speciale tekens die horen bij de gekozen characterset (standaard UTF-8), dus met diakrieten, white spaces, \\-teken en newlines of HTML opmaak e.d. Mag starten met spatie. De maximale lengte is onbepaald. *Opmerking*: getallen (ISO Numbers) met voorloopnullen worden opgenomen als CharacterString, met een patroon of formeel patroon. Bij het metagegeven Waardenverzameling attribuutsoort wordt dit dan (ook) gespecificeerd. |
| Integer            | Zie ISO11404 (subtype van ISO Number). Vrij vertaald: geheel getal, lengte is minimaal 1 en maximale lengte is onbepaald, zonder voorloopnullen. *Opmerking*: t.a.v. positieve en negatieve getalen en + en – tekens: bijvoorbeeld -2,0 Het (formeel) patroon geeft aan of een + en/of - teken gebruikt mag worden in het gegeven.                                                                                                                                                                 |
| Real               | Zie ISO11404 (subtype van ISO Number). Vrij vertaald: een reëel getal, oftewel een rationeel getal zoals een Integer of een Decimal, of niet rationeel getal, zoals pi of de wortel van 2. Deze bestaat uit een (oneindig) aantal getallen, al dan niet achter de komma (floating point). *Opmerking:* t.a.v. positieve en negatieve getalen en + en – tekens: zie Integer.                                                                                                                        |
| Boolean            | Indicatie met mogelijke waarden True, false, 1 of 0. True en 1 hebben een identieke betekenis: Ja. False en 0 hebben een identieke betekenis: Nee. *Opmerking*: t.a.v. Ja of Nee. Wanneer u de Ja of Nee wilt gebruiken, gebruik dan bv. een Enumeratie genaamd Indicatie, of gebruik AN met een lengte en een (formeel) patroon.                                                                                                                                                                  |
|                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Date               | 4-cijferig jaar, 2-cijferig maand, 2-cijferig dag uitgedrukt in yyyy-mm-dd conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                          |
| DateTime           | yyyy-mm-ddThh:mm:ss conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Year               | 4-cijferig jaar uitgedrukt in yyyy conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Day                | 2-cijferige dag uitgedrukt in dd conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Month              | 2-cijferige maand uitgedrukt in mm conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| URI                | Unieke identificatie op internet conform RFC3986 en de URI-strategie Linked Open Data. Gestandaardiseerde manier om op het internet dingen (pagina's met informatie, objecten, datasets) uniek te identificeren.                                                                                                                                                                                                                                                                                   |

Het is mogelijk om in de eigen extensie extra primitive datatypes op te nemen,
zodat deze ok beschikbaar komen voor het informatiemodel.

**Getallen en negatieve getallen**

Met een getal kan worden gerekend. Bijvoorbeeld: saldo, hoeveelheid, aantal,
grootte.

Een getal kan negatief zijn. Dit is inherent aan een getal. Het - of + teken
heeft geen invloed op de lengte van het getal. Als er dus een lengte wordt
gespecificeerd, tel het - of + teken dan niet mee. Als een getal niet negatief
mag zijn, geef dit dan aan in een patroon (zie NonNegativeInteger).

Aanbeveling: als er niet mee gerekend kan worden, zoals de bankrekening zelf
(waar een saldo op staat, maar die bedoelen we hier expliciet niet), gebruik dan
een CharacterString met een patroon.

**Waardenbereik en patroon**

Het waardenbereik van een attribuut kan vastgelegd worden middels de combinatie
van een primitieve en een patroon dat als restrictie is opgenomen. Bijvoorbeeld
bij een postcode, of een gemeentecode die moet bestaan uit precies 4 getallen,
waarbij het eerste getal een 0 mag zijn.

We onderkennen twee soorten patronen: - *Patroon*: het metagegeven (de tagged
value) ‘Patroon’ in *tekst* vorm. Deze wordt als aanvulling op het datatype
(bijvoorbeeld Integer ) van het attribuut gespecificeerd. Het patroon bevat een
specificatie waaraan een waarde moet voldoen. Bijvoorbeeld een postcode, met als
aanduiding van het patroon: Postcode. De toegestane waarden voor deze patroon
aanduiding worden dan vastgelegd in documentatie behorende bij het type: alle
postcodes van 1000AA tot en met 9999ZZ. - Formeel patroon: het metagegeven (de
tagged value) ‘Formeel patroon’ in *formele specificatie* vorm [H1.11,
referentie 6], te weten in een reguliere expressie. Bijvoorbeeld een postcode,
met de expressie: \\d{4}[A-Z]{2}

Een voorbeeld waar een patroon nodig is, is een attribuut waarvan het
waardenbereik altijd een getal is met precies de lengte 4, zoals bijvoorbeeld
0001 tot en met 9999, en dus voorloopnullen heeft. Een datatype zoals Integer
kan hiervoor niet gebruikt worden, omdat 0001 geen getal is. Het type van het
attribuut wordt in dat geval een CharacterString, met lengte (exact) =4 en het
patroon voor het attribuut specificeert dat alleen numerieke getallen zijn
toegestaan: [0-9]{4}.

### Datatype zelf definiëren

Het is ook mogelijk om in het eigen informatiemodel een eigen datatype te
definiëren in de vorm van een «Primitief datatype», «Codelist» of
«Referentielijst». Zelf gedefinieerde datatypes hebben altijd een eigen
definitie en optioneel een eigen patroon of formeel patroon.

**Voorbeelden** hiervan, die niet tot KKG behoren, maar ter illustratie zijn
opgenomen, zijn: - NietNegatieve*Integer*: een Integer die alleen de waarde 0 of
groter mag hebben. Laat de naam van het primitieve type dan wel terugkomen in de
naam (dus niet NietNegatiefGetal*)*. - Een beperking op een Real te specificeren
door Decimal op te nemen (een gebroken getal, met (één of meer) cijfers voor de
komma en cijfers achter de komma, conform ISO11404). - AN. Deze is gebruikelijk
bij een aantal basisregistraties. Datatype met een eigen naam, analoog aan
CharacterString, maar met alleen ‘normale’ tekens. Dit zijn alle alfanumerieke
tekens (dus inclusief diakrieten), de koppeltekens – en \_ en spaties. De
minimale lengte is tenminste 1, de maximale lengte is onbepaald. De 1e positie
mag géén spatie bevatten. - Een Vlak: een verbijzondering van een GM Surface,
met een eigen definitie, die bijvoorbeeld aangeeft dat het om een 2 dimensionale
geometrie gaat.

*OPMERKING: Afbeellding toevoegen*

De gele datatypes zijn extern aan het model.

Het type modelelement (stereotype) verandert niet door de generalisatie. Een
zelf gedefinieerd primitief datatype zal een generalisatie hebben met een ander
primitief datatype. Een zelf gedefinieerd gestructureerd datatype zal een
generalisatie hebben met een ander gestructureerd datatype.

Het komt voor dat het zelf gedefinieerde datatype een generalisatie heeft naar
een extern gedefinieerd datatype, waarvan het modelelement (stereotype) niet is
gespecificeerd. Maak dan zelf een inschatting. Let hierbij op bij een
«Gestructureerd datatype». Deze hoort altijd twee of meer data elementen te
hebben.

### Datatypen landelijk

Wanneer op landelijk niveau afspraken zijn gemaakt (bijvoorbeeld in GAB), voor
algemene datatypen, die niet primitief zijn, zoals Postcode, dan worden deze
niet in dit KKG metamodel opgenomen. Wel geeft KKG aan hoe deze in
informatiemodellen gedefinieerd en gemodelleerd worden.

*Voorbeelden* hiervan van landelijke datatypen, die niet tot KKG behoren, maar
ter illustratie zijn opgenomen:

| Postcode | De in Nederland gangbare postcode voor een Nederlands postadres, bestaande uit een numeriek deel en een alfabetisch deel. Het numerieke deel van de postcode bestaat uit vier cijfers, het alfabetische deel van de postcode bestaat uit twee hoofdletters. Conform [GAB Postcodes].                                                        |
|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DMO      | Datum mogelijk onvolledig. De keuze («union») van een periode in de Gregoriaanse kalender, al naar gelang de beschikbare datumelementen, uit de onderliggende subformaten alleen Year, Year en Month of Year, Month en Day. Dit is (nog steeds) overeenkomstig met https://en.wikipedia.org/wiki/ISO_8601 en [GAB DatumMogelijkOnvolledig]. |
| DTMO     | Een volledige datum waarbij (alleen) de tijd mogelijk ontbreekt. De tijd wordt, zover bekend, ingevuld. Dus alleen de uren als de minuten onbekend zijn.                                                                                                                                                                                    |
|          | - DateTime, als de tijd wel volledig bekend is                                                                                                                                                                                                                                                                                              |
|          | - Date, als alleen de Date bekend is                                                                                                                                                                                                                                                                                                        |

Gestructureerd datatype
-----------------------

Een «Gestructureerd datatype» is veelal specifiek binnen een informatiemodel.
Indien mogelijk wordt zoveel mogelijk hergebruik gemaakt van elders
gedefinieerde «Gestructureerd datatype»n, denk bijvoorbeeld aan de
Gestructureerd datatypen: NEN3610 identificatie (NEN3610), Kadastrale aanduiding
(BRK), Objectnummering (BAG) of Labelpositie.

Gewone datatypen staan op zichzelf en worden niet beschreven in termen van een
ander datatype. Bij een «Gestructureerd datatype» is dit wel het geval. Het is
een gestructureerd datatype dat is samengesteld uit meerdere eigenschappen.
Hiermee kunnen meerdere data-elementen, die onlosmakelijk bij elkaar horen, ook
bij elkaar gedefinieerd worden.

Bijvoorbeeld een Bedrag, dat bestaat uit een hoeveelheid en een muntsoort. Het
aantal zelf is nietszeggend, tenzij ook aangegeven wordt welke muntsoort het
betreft.

Elk data-element in een Gestructureerd datatype heeft zelf ook weer een datatype
(in zeer bijzondere gevallen kan een data-element zelf ook weer een
Gestructureerd datatype zijn).

*Gestructureerd datatype representeren als één gegevenselement  *

Soms is er de behoefte om een combinatie van gegevens samengesteld te
representeren, in één gegevenselement. Dit speelt specifiek bij gestructureerde
datatypes, omdat de data-elementen hiervan uniek identificerend zijn voor een
object. De samengestelde representatie verandert niets aan de semantische
definitie. Om een uniforme samenstelling te waarborgen, wordt er bij het
gestructureerde datatype een patroon of een formeel patroon gedefinieerd (dat
consistent is met de definities van de data-elementen uit het Gestructureerd
datatype). Als een patroon of formeel patroon gedefinieerd is op het
gestructureerde datatype (als geheel), dan worden de data-elementen van het
gestructureerde datatype altijd als één gegevenselement uitgewisseld. Als dit
patroon niet gedefinieerd is, dan worden de data-elementen als losse
gegevenselementen uitgewisseld (de standaardwijze voor een Gestructureerd
datatype).

Een uitgewerkt voorbeeld van een Gestructureerd datatype met patroon is
Objectnummering. Dit Gestructureerd datatype bestaat uit de data elementen: -
Gemeentecode (AN, lengte 4) - Objecttypecode (AN, lengte 2) - Nummer (AN, lengte
10) met daarbij een formeel patroon: [0-9]{4}\\.[0-9]{2}\\.[ 0-9]{10} of een
(tekst) patroon Gemeentecode.Objecttypecode.Nummer

Gegevensgroeptype
-----------------

Bij het modelleren van een objecttype worden attribuutsoorten toegekend aan een
objecttype. Wanneer er geconstateerd wordt dat een aantal attribuutsoorten
logisch gezien bij elkaar horen, dan kan er gekozen worden om deze onder te
brengen in een gegevensgroeptype. Het blijven dan attributen van het objecttype.
De definitie van elk afzonderlijk attribuutsoort verandert niet door de
groepering.

Richtlijn: een gegevensgroeptype bevat alleen «Attribuutsoort»en en geen
«Relatiesoort»en. Als er wel een relatie aan de orde is, dan wordt de
gegevensgroep gezien als een apart te beheren object. Er wordt dan een apart
«Objecttype» gemaakt. Het is wel mogelijk, hoewel uitzonderlijk, om binnen een
gegevensgroeptype nog een ander gegevensgroeptype te modelleren.

### Hergebruik

Het kan voorkomen dat meerdere objecttypes gebruik maken van dezelfde
gegevensgroeptype, omdat de definitie voor alle objecttypes gelijk is of moet
zijn. Het is dan modelmatig mogelijk om zo’n gegevensgroeptype te hergebruiken
Op conceptueel niveau is dit ongebruikelijk, omdat kenmerken / eigenschappen
exclusief bij een object horen, maar het is wel toegestaan. Het is hierbij
belangrijk om goed te kijken of er echt sprake is van een gegevensgroeptype, of
dat er (toch) sprake is van een objecttype. Bijvoorbeeld van een objecttype die
voor zijn bestaan afhankelijk is van een ander objecttype (en daarom via een
«Relatiesoort» met aggregatietype ‘composite’ (het gesloten wiebertje) gekoppeld
moet worden). Het is aan de modelleur om deze beoordeling te maken.

*Voorbeeld: de specificatie voor het Brondocument in de basisregistratie BAG is
qua betekenis en structuur voor alle objecttypes gelijk. Het speelt een
belangrijke rol in het totstandkomingsproces van objecten en behoort daarom in
het conceptuele model. Het wordt ingezet als een audittrail, zodat het duidelijk
op basis van welk brondocument een wijziging is doorgevoerd op een object. Het
brondocument onderscheidt twee relevante attribuutsoorten, maar het brondocument
wordt binnen de BAG niet gezien als een gespreksonderwerp waarover men gegevens
wilt communiceren. Daarom is er gekozen voor een gegevensgroeptype. Deze wordt
hergebruikt voor alle objecttypes.*

Metamodel: het gegevensgroeptype kan dus het type zijn van meerdere
gegevensgroepen. Vanwege dit hergebruik is daarom de kardinaliteit van de
relatie van gegevensgroep naar gegevensgroeptype aan de source kant 1..\*. Zie
2.1.1.

### Gegevensgroep versus Gestructureerd datatype

Een gegevensgroep is niet hetzelfde als een Gestructureerd datatype. - Een
datatype beschrijft de structuur van data, een gegevensgroep beschrijft de
semantiek van een kenmerk van een object. - Als één kenmerk van een object uit
verschillende stukjes data bestaat, dan wordt een Gestructureerd datatype
gebruikt. Dit is bijvoorbeeld het geval bij het gestructureerde datatype Bedrag.
Deze bestaat uit een ‘hoeveelheid’ en ‘muntsoort. - Als een object meerdere
kenmerken heeft, gemodelleerd als afzonderlijke attribuutsoorten, dan heeft elk
kenmerk op zichzelf betekenis. Als één kenmerk wordt weggelaten, of niet bekend
of ingewonnen is, dan verandert er niets aan de betekenis van de andere
attribuutsoorten. - Een ander goed criterium is: als het datatype wordt
weggelaten uit het informatiemodel, dan verliest het informatiemodel geen
semantiek. Alleen de structuur van een gegeven is dan niet meer bekend.

Regel: het is niet de bedoeling dat eenzelfde kenmerk van een object in het ene
model als een gegevensgroep gemodelleerd wordt en in het andere model als een
Gestructureerd datatype. Er raakt dan semantiek verloren of er ontbreekt dan
semantiek.

-   Een Gestructureerd datatype in een conceptueel informatiemodel is en blijft
    dus altijd ook een Gestructureerd datatype in een bijbehorende logisch
    informatiemodel. Een gegevensgroep in een conceptueel model is en blijft dus
    altijd ook een gegevensgroep in een logisch informatiemodel.

Keuze tussen datatypes (Union)
------------------------------

Wanneer het datatype van een attribuutsoort een keuze uit twee of meer datatypen
is, dan wordt dit gemodelleerd met het datatype Union. Elk union element van de
union heeft dan één datatype, de waarde van de attribuutsoort moet aan één van
deze datatypen voldoen.

*Voorbeeld: Attribuutsoort geometrie met als type de Union PuntOfVlak.
PuntOfVlak is daarbij een Union met union element: punt, met als type het
datatype GM_Point en union element vlak met als type het datatype GM_Surface.*

In dit voorbeeld is er enkel een keuze tussen verschillende union elementen die
zelf geen betekenisvolle context geven aan het te kiezen datatype. Er wordt in
dit geval geen definitie gespecificeerd bij het union element (de definitie is
optioneel).

In onderstaande voorbeelden is er wel sprake van een keuze tussen union
elementen die een betekenisvolle context geven aan het te kiezen datatype. Er
wordt in dit geval wel een definitie gespecificeerd bij het union element.

*Voorbeeld: Attribuutsoort hoogte met als type de Union BereikOfWaarde.
BereikOfWaarde is daarbij een Union met union element ‘bereik’, met als type het
datatype Interval en union element ‘waarde’ met als type het datatype Real.*

Regel: het is niet toegestaan dat union elementen binnen één en dezelfde union
identiek zijn. De naam van elk union element moet verschillend zijn én de
datatypen moeten op zijn minst verschillend zijn. Dus ofwel een ander datatype,
ofwel hetzelfde datatype met een verschil in het metadata aspect patroon en/of
formeel patroon hebben. Bijvoorbeeld: een keuze tussen een datatype
CharacterString en een datatype CharacterString is alleen toegestaan als er een
verschillend (formeel) patroon is gespecificeerd.

Merk op dat het mogelijk is om een eigen datatype te maken met een eigen naam en
deze te gebruiken in een union element.

Wanneer een beoogd datatype uit een extern model komt en daar geen metamodel
stereotype heeft, zoals bijvoorbeeld het geval is bij het GM package waarin een
datatype als «interface» GM_Point is opgenomen, dan heeft dit datatype niet een
KKG stereotype en mogelijk ook niet de UML-metaclass dataType. Het is dan aan de
modelleur van het informatiemodel om te beoordelen of het type dan als datatype
gebruikt kan worden. Het is niet gewenst om aan het externe model een stereotype
toe te voegen, noch om in het externe model de UML-metaclass aan te passen.

Domeinwaarden of lijsten
------------------------

In veel registraties wordt gewerkt met codetabellen om de mogelijke waarden van
een attribuutsoort te specificeren. Deze mogelijke waarden kunnen op
verschillende manieren worden opgenomen, afhankelijk van de gewenste
stabiliteit:

**Enumeraties**. Dit zijn statische lijsten, waaruit één waarde gekozen kan
worden. De registratie en bijbehorende koppelvlakken kunnen erop vertrouwen dat
er geen nieuwe waardes worden toegevoegd. Als er een nieuwe waarde bij komt
wordt dit via een modelwijziging doorgevoerd. Dit wordt vooral toegepast bij
lijsten die niet of weinig veranderen. Zo is bij het attribuutsoort Naamgebruik
een enumeratie naamgebruik opgenomen met als waarden onder meer ‘eigen’ en
‘eigen, partner’.

Als sprake is van dynamiek in de domeinwaarden wordt een **Referentielijst** of
**Codelist** gebruikt. Dit betreft de situaties waarin domeinwaarden kunnen
veranderen en/of het aantal domeinwaarden kan toe- of afnemen. De registratie en
bijbehorende koppelvlakken worden dan ingericht om hier mee om te gaan. Dit
wordt vooral toegepast bij lijsten die vaker aan verandering onderhevig zijn.

**Referentielijst.** Een lijst waarin we de betekenis en structuur van de lijst
expliciet willen specificeren. Een voorbeeld is de referentielijst LAND of
CultuurcodeOnbebouwd  
( http://www.kadaster.nl/schemas/waardelijsten/CultuurcodeOnbebouwd ).

De referentielijst is hiermee een bijzondere vorm van datatype.

De naamgeving Referentielijst kan verwarring oproepen maar in principe wordt
altijd gerefereerd naar gegevens m.b.t. één rij uit de referentielijst. In het
geval van de referentielijst LAND wordt altijd gerefereerd naar gegevens over
Nederland (NL) of gegevens over Duitsland.

Let op, wanneer er voor een bepaald attribuut in een informatiemodel of
koppelvlak van een andere organisatie gekozen is voor een referentielijst, en uw
organisatie koppelt hiermee, dan is het (meestal) onverstandig om in het eigen
informatiemodel dit te behandelen als enumeratie.

Modelleerrichtlijn: elk attribuut van een object heeft een specifieke lijst met
toegestane waarden. Modelleer daarom elke waardelijst bij voorkeur specifiek,
met een eigen naam en locatie. Het is mogelijk dat de structuur van de data
gelijk is voor een aantal lijsten. Er kan dan een generieke structuur
gemodelleerd worden, bv. een abstracte referentielijst met naam *\_Waardelijst,*
waarvan de specifieke waardelijsten overerven. Het metagegeven locatie is immers
specifiek voor één waardelijst en moet per individuele waardelijst vastgelegd
worden.

**CodeList** Gebruik een codelist als in het informatiemodel de attributen,
zoals bij een referentielijst, niet relevant zijn en je voor de definitie alleen
wilt verwijzen naar de externe waardelijst.

Abstracte objecttypes en concrete objecten
------------------------------------------

Een objecttype kan aangeduid worden als een abstract objecttype (zie paragraaf
2.3.1. door middel van indAbstract = J). Het betreft dan altijd een
generalisatie waarbij de specialisaties van dit objecttype op het laagste niveau
concrete objecttypen worden genoemd. Het is belangrijk te weten wanneer een
objecttype als abstract objecttype in een informatiemodel is te onderkennen.
Omdat een abstract objecttype altijd een generalisatie is, beantwoorden we in
deze paragraaf ook de vraag wanneer we specialisaties / generalisaties
onderkennen in een conceptueel informatiemodel en in een logisch informatiemodel

**Conceptueel informatiemodel**

*Specialisatie / generalisatie* Bovenstaande vragen beantwoorden we aan de hand
van een voorbeeld: het opleidingsinstituut.  In de beschouwde werkelijkheid
onderscheiden we onder meer als gespreksonderwerp personen. Deze personen kunnen
docenten en leerlingen zijn. Over al deze gespreksonderwerpen willen we gegevens
communiceren. Een docent heeft als kenmerk dat deze een arbeidscontract met het
opleidingsinstituut heeft afgesloten en een lesbevoegdheid heeft, terwijl een
leerling kenbaar heeft gemaakt lessen te willen gaan volgen bij het instituut en
dus geen arbeidscontract heeft afgesloten. Docenten en leerlingen zijn personen
die rechten en plichten hebben.

Docent is een specialisatie (‘subtype’) van het objecttype Persoon en Leerling
is een specialisatie van het objecttype Persoon. Een specialisatie ontstaat
derhalve doordat aan een object van een bepaald type speciale eisen wordt
gesteld. Vice versa spreken we er van dat Persoon een generalisatie is van
Docent en Leerling. Op onderdelen vertonen de onderscheiden objecttypen Docent
en Leerling hetzelfde gedrag waarbij dat gedrag essentieel van belang is voor
het te beschouwen domein en daarmee het conceptuele informatiemodel.

*Abstract / concreet* Wanneer er vanuit wordt gegaan dat binnen het te
beschouwen gebied een persoon altijd ofwel een docent ofwel leerling kan zijn
(en nooit beide tegelijk) dan definiëren we een Persoon als een abstract
objecttype. Docent en Leerling zijn dan concrete objecttypen in het conceptueel
informatiemodel.

Een concreet object kan zich alleen in de hoedanigheid als één van de
specialisaties van het abstracte objecttype op het laagste niveau voordoen. En
daarmee dus ook in de hoedanigheid van de generalisatie(s) van het concrete
objecttype.

Richtlijnen - Een abstract object is een onderwerp van gesprek binnen het
beschouwde gebied. Het heeft dus echt een betekenis 3-1 in het beschouwde
gebied. Net als een concreet object, specialisatie of generalisatie. - De
definitie van elk objecttype (dus ook een abstract objecttype) is zodanig dat
ondubbelzinnig bepaald kan worden dat een object wel of niet tot het
gedefinieerde type behoort. Dus niet een objecttype met een definitie als ‘De
gemeenschappelijke eigenschappen van een object…’ Deze definitie is op elk
objecttype van toepassing. - Houd er rekening mee dat afhankelijk van het te
beschouwen gebied een object uit de werkelijkheid in het ene informatiemodel een
concreet objecttype kan zijn en in het andere informatiemodel een abstract
objecttype.

**Logisch informatiemodel** In een logisch model gelden in principe dezelfde
regels voor abstracte of concrete objecttypen. De abstracte objecten worden
daarom in principe overgenomen. In een logisch model wordt het digitale model
van de werkelijkheid beschreven. Vanuit dit oogpunt kunnen er ook andere redenen
zijn om abstracte objecttypen te creëren, bijvoorbeeld omdat een abstract object
positieve effecten heeft voor de implementatie. Denk hierbij aan het aanbrengen
van (extra) hiërarchie,zowel in semantiek als in ordening van eigenschappen. De
enige regel die geldt is dat een abstract objecttype niet geïnstantieerd kan
worden. Elk object is altijd een instantie van een concreet objecttype.

*Algemeen* - In UML wordt een abstract objecttype aangeduid door indAbstract met
waarde “J” en wordt de naam van het abstracte objecttype cursief geschreven
(voorbeeld: *Persoon*). - Een objecttype dat een generalisatie-relatie heeft
naar een al dan niet abstract objecttype noemen we een specialisatie (van dat
objecttype). Wanneer de generalisatie een abstract objecttype is, kan de
specialisatie zelf ook abstract zijn en specialisaties hebben. De ‘onderste’
specialisaties zijn dan altijd concreet (niet abstract) - Modelleer een abstract
objecttype pas wanneer er sprake is van twee of meer specialisaties - De unieke
aanduiding kan opgenomen worden in het abstracte objecttype. De unieke
aanduiding geldt dan voor elke specialisatie van het abstract objecttype. Dit
betekent dat de unieke aanduiding uniek is binnen de verzameling van alle
objecten die als specialisatie onder het abstracte objecttype vallen. Anders
gezegd, de unieke aanduiding geldt voor alle concrete objecten die als
objecttype de unieke aanduiding erven van het abstracte objecttype.
Bijvoorbeeld: als de unieke aanduiding van *\_Kadastraal object* het
attribuutsoort Identificatie is en \_*Kadastraal Object* als specialisatie een
Perceel kent en een Leidingnetwerk, dan kan het niet zo zijn dat er een perceel
object is met identificatie ‘1’ en een leidingnetwerk met identificatie ‘1’. Als
dat wel het geval is, dan moet op beide concrete objecttypes een eigen unieke
aanduiding gedefinieerd worden.

Relatieklasse (uitzonderingen)
------------------------------

De gegevens van de relatiesoort worden altijd voor één relatiesoort vastgelegd.
Het is echter mogelijk dat dezelfde gegevens voor meerdere relaties tegelijk
gelden. Het is dan niet mogelijk om het te modelleren als relatieklasse. Wel
gewenst, maar het kan niet als UML-associationClass. Als deze uitzondering het
geval is, dan worden de relatieklasses gemodelleerd als «Objecttype», met één
inkomende relatie en één uitgaande relatie. De oorspronkelijke kardinaliteit van
de beoogde relatieklasse wordt hierbij behouden.

*Een Perceel kan vanwege een Perceel splitsing overgaan in twee of meerdere
andere Percelen. De ‘overgegaan in’ relatie wordt bijgehouden in een
relatieklasse. Gegevens over de splitsing zijn voor al deze relaties gelijk.*

Het metamodel ondersteunt (nog) geen relatieklassen tussen drie of meer
objecttypen. Dit kan in uw eigen extensie toegevoegd worden.

*Bijvoorbeeld: een CONTRACT kan bijvoorbeeld ook een afspraak zijn tussen twee
óf méér SUBJECTen, waarbij de gegevens van de relatie voor alle betrokken
objecten hetzelfde zijn. CONTRACT wordt dan gemodelleerd als objecttype, waarbij
beschreven wordt wat er moet gebeuren wanneer één van de SUBJECTen niet meer
bestaat.*

Constraint
----------

Deze paragraaf gaat dieper in op hoe een Constraint toegepast wordt.

Een Constraint wordt beschreven met een: - Naam (UML-constraint name): een naam
c.q. label, vaak in steekwoorden. - Specificatie in tekst (UML-Constraint Notes,
type invariant): een uitgebreide heldere beschrijving van de constraint in
gewone tekst.

en optioneel: - Specificatie formeel (UML-Constraint Notes, type OCL): formele
specificatie in de Object Constraint Language. De formele specificatie bevat dus
de uitgebreide heldere beschrijving van de constraint in gewone tekst EN de
formele specificatie in OCL.

Twee constraints die gedefinieerd zijn op hetzelfde modelelement mogen niet
dezelfde naam hebben.

In Enterprise architect 12.x lijkt het helaas (nog) niet mogelijk om constraints
zoals bedoeld in UML op te nemen, te weten als OpaqueExpression met een
constraint string en een aanduiding van de taal: natuurlijke taal, of OCL (of
een andere zoals Java, maar deze wordt niet toegepast in dit metamodel). EA
werkt met UML Notes en een constraint type. Het is daarnaast niet mogelijk om de
tekst en de OCL in dezelfde constraint op te nemen. Het worden dan twee aparte
constraints, 1 met tekst en 1 met OCL, met verplicht ook een andere naam.
Vandaar onderstaande aanpak:

Als de modelleur kiest om de constraint alleen in gewone taal te beschrijven,
dan als volgt: - Naam (UML-constraint name): een naam c.q. label, vaak in
steekwoorden. - Specificatie in tekst (UML-Constraint Notes, type invariant):
een uitgebreide heldere beschrijving van de constraint in gewone tekst.

Als de modelleur kiest om de constraint niet alleen in gewone taal te
beschrijven, maar ook in een formele taal (OCL), dan als volgt: - Naam
(UML-constraint name): een naam c.q. label, vaak in steekwoorden. - Specificatie
formeel (UML-Constraint Notes, type OCL): formele specificatie in de object
constraint language (OCL). De uitgebreide heldere beschrijving van de constraint
in gewone tekst wordt opgenomen als commentaar, tussen /\* \*/.

Aanbeveling: als een eigenschap van één UML-attribute, of één UML-association
met een patroon (zie patroon) of een lengte (zie metadata aspect) of een
kardinaliteit van een relatiesoort vastgelegd kan worden, gebruik dan deze en
geen UML-constraint. Als er sprake is van een eigenschap die over meerdere
informatiemodelelementen heen gaat, dan is er altijd sprake van een regel die we
modelleren met een UML-constraint.

Aanbeveling: wees terughoudend met het gebruik van constraints in het
informatiemodel wanneer de kans reëel is dat het model hierdoor gaat wijzigen of
als het niet direct over de semantiek, structuur of syntax van de te registreren
gegevens gaat. Dit is bijvoorbeeld het geval wanneer er regels bestaan rondom
informatie die elke paar jaar kan wijzigen, of die per toepassingsgebied (net)
anders toegepast moet worden. Bijvoorbeeld: wanneer een persoon 65 jaar of ouder
is, mag deze geen uitkering aanvragen. Wanneer er veel van zulke constraints in
het informatiemodel worden opgenomen, zal dit leiden tot een ongewenste dynamiek
waardoor er (te) vaak nieuwe versies moeten worden uitgebracht. De aanbeveling
is om de specificatie van dergelijke constraints buiten het informatiemodel te
specificeren, bijvoorbeeld als validatieregel.

Historie
--------

Deze paragraaf geeft in meer detail aan wat we onder de metagegevens *Indicatie
materiële historie en Indicatie formele historie* verstaan.

Aanvullend beschrijft deze paragaaf een aantal aspecten waar rekening mee
gehouden kan worden bij de uitwerking van historie in een informatiemodel op
logisch niveau. Let wel, historie is niet gestandaardiseerd over logische
informatiemodellen van registraties heen. Hoe historie in een logisch
informatiemodel wordt gemodelleerd is aan de opsteller van het logisch
informatiemodel zelf. In deze paragraaf wordt wel iets verteld over historie op
logisch niveau maar dat is niet bindend!

**Algemeen** Het aspect tijd speelt een belangrijke rol in (basis)registraties.
Daarnaast speelt tijd ook een belangrijke rol in het gebruik van de informatie
uit (basis)registraties. Afnemers hebben eigen rechtsprocedures en moeten kunnen
herleiden wanneer een gegeven als bekend mocht worden verondersteld. Als
bijvoorbeeld besluiten ter discussie worden gesteld, is het juridisch van belang
te achterhalen op basis van welke gegevens zo’n besluit is genomen. Als onjuiste
gegevens zijn gebruikt, is het relevant te weten of het juiste gegeven tijdens
de besluitvorming al bekend waren.

Dit betekent dus dat bekend moet zijn wat de waarde van een attribuut op een
bepaald moment is.

*Tijdslijnen* Er spelen twee tijdslijnen een rol bij het herleiden van
attribuutwaarden: - Wanneer is iets gebeurd, in de werkelijkheid of volgens
opgave (wanneer zijn de opgenomen gegevens geldig)? Dit valt binnen de tijdlijn
van de aangehouden werkelijkheid. - Vanaf wanneer wist de overheid (als
collectief van organisaties) dat de gegevens bekend waren? Dit valt binnen de
tijdlijn van het administratieproces of de administratieve werkelijkheid.

In de rapportage 'Architectuur van het stelsel' (Stroomlijning BasisGegevens,
2006) wordt geadviseerd om beide tijdslijnen te registreren, om de
attribuutwaarden van een bepaald moment te kunnen reconstrueren. In de diverse
registraties wordt hieraan op verschillende wijzen invulling gegeven. Dit
metamodel schrijft derhalve niet voor welke bij de tijdslijnen behorende
attributen gebruikt moeten worden voor het vastleggen van historie.

**Historie op conceptueel niveau** Op conceptueel niveau is het wel altijd
mogelijk om aan te geven dát het bijhouden van historie *aan de orde is* voor
een (elk) gegeven, dat wil zeggen een attribuut of relatie van een object, te
weten via een metagegeven. Deze metagegevens specificeren we als volgt: -
*Indicatie materiële historie*: indicatie of de materiële historie van de
attribuutsoort te bevragen is. Materiële historie geeft aan wanneer een
verandering is opgetreden in de werkelijkheid die heeft geleid tot verandering
van de attribuutwaarde. Materiële historie impliceert dat actuele, historische
en eventuele toekomstige attribuutwaarden te bevragen zijn. - *Indicatie formele
historie*: indicatie of de formele historie van de attribuutsoort te bevragen
is. Formele historie geeft aan wanneer in de administratie een verandering is
verwerkt van de attribuutwaarde (wanneer was de verandering bekend en is deze
verwerkt).

*Voorbeelden: ‘bouwjaar pand’ heeft al materiële historie in zich: het bouwjaar
is het moment waarop de wijziging in de werkelijkheid zich voordeed en wijzigt
niet. De ‘indicatie materiële historie’ ervan is daarom Nee. BSN van een Persoon
geldt voor de persoon vanaf het moment dat de persoon in de BRP is opgenomen en
wijzigt niet: ‘indicatie materiële historie’ Nee. De Achternaam van een persoon
kan wijzigen: ‘indicatie materiële historie’ Ja. Als je niet toeziet op het
daadwerkelijk kappen van een boom maar het gekapt zijn wel in een registratie
wil opnemen: ‘indicatie materiële historie’ Nee en ‘indicatie formele historie’
Ja.*

Richtlijn: op conceptueel niveau worden voor historie alléén indicatie materiële
historie en indicatie formele historie bij een attribuut of relatie vastgelegd,
en dus géén bij de tijdslijnen behorende attributen die gebruikt moeten worden
voor het vastleggen van historie. Deze bij de tijdslijn behorende attributen
worden op het logische niveau vastgelegd.

**Historie op logisch niveau** KKG schrijft3-2 geen implementatie van het
conceptuele niveau voor. Wel worden er aandachtspunten gegeven om rekening mee
te houden. Denk bij de uitwerking o.a. aan de volgende aspecten:

-   Het bijhouden van historie met specifieke attributen per objecttype, zoals
    bijvoorbeeld: bouwjaar pand, of met generieke tijdslijnattributen attributen
    die gelden voor alle objecttypes, zoals begindatum geldigheid. Denk aan de
    attribuutsoort en/of gegevensgroeptype (herbruikbaar);

-   historie bijhouden per attribuut (en relatie) of per versie van een object.
    Bij deze laatste kan de gegevensgroep gekoppeld worden aan bijvoorbeeld elk
    objecttype;

-   de status transities die een object in zijn levenscyclus doorloopt. Er kan
    ook gekozen worden om deze in een conceptueel informatiemodel op te nemen,
    als ze op dat niveau al van belang zijn;

-   status attributen, die iets zeggen *over* gegevens, zoals attributen die
    aangeven wel of niet beschouwd moet worden als onderdeel van de geldige
    gegevens van een object. Er kan ook gekozen worden om deze in een
    conceptueel informatiemodel op te nemen, als ze op dat niveau al van belang
    zijn. Voorbeeld: BAG inactief. Het kan ook van belang zijn om aan te geven
    dat een gegeven niet terug te vinden is in een brondocument (omdat er fouten
    zijn gemaakt bij de verwerking), maar niet verwijderd kan worden omdat alle
    gegevens, ook foutieve, bestendig moeten worden bewaard. Voorbeeld: BAG
    indicatieNietBAG.

Aanbeveling: het komt voor dat er binnen één domein, van één conceptueel
informatiemodel, meerdere logische informatiemodellen worden uitgewerkt. Het is
dan aan te beleven om centrale implementatie afspraken op te stellen, welke
gelden voor elk logisch informatiemodel. Dit speelt met name rondom historie,
omdat het vaak ongewenst (en erg Gestructureerdof zelfs onmogelijk) is om
verschillende implementaties naast elkaar in stand te houden en naar elkaar te
vertalen.

Opmerking: de metagegevens Indicatie materiële historie en Indicatie formele
mogen worden opgenomen in een logisch model (of worden overgenomen van het
conceptuele naar het logische informatiemodel).

Afleidbare gegevens
-------------------

In een informatiemodel kan de behoefte bestaan om afgeleide gegevens op te
nemen: dit zijn gegevens die afleidbaar zijn uit andere attribuut- en/of
relatiesoorten binnen het informatiemodel. Dit lijkt op redundantie. Toch hebben
we deze gegevens daar opgenomen waar er ten eerste vraag is naar het afgeleide
gegeven en ten tweede het gegeven niet eenvoudig af te leiden is (er moet sprake
zijn van enige mate van complexiteit). Dit wordt in UML weergegeven via
isDerived. Zie ook Attribuutsoort, §2.4.2 – is afleidbaar.

*Voorbeeld is de 'Datum vestiging in Nederland' van een Ingeschreven persoon. De
afleiding van dit gegeven is niet triviaal. Door het als afleidbaar gegeven op
te nemen kan het opgevraagd worden zonder dat de historie of andere gegevens van
het object opgevraagd hoeven te worden om daaruit dit gegeven af te leiden.*

Authentieke gegevens
--------------------

Bij een attribuutsoort of relatiesoort wordt als metagegeven ‘Authentiek’
opgenomen. Het is een aanduiding of een attribuutsoort of een als relatiesoort
gemodelleerd landelijk basisgegeven in de catalogus van de desbetreffende
registratie een authentiek gegeven betreft. Een authentiek gegeven is van
hoogwaardige kwaliteit en kan zonder nader onderzoek bij de uitvoering van
publiekrechtelijke taken worden gebruikt.

De specificatie van de waarde van het metagegeven is gebaseerd op het
onderscheid in de volgende groepen van gegevens: - Landelijke registraties met
authentieke en niet-authentieke basisgegevens (BAG, BRK, BRP, BGT e.d.); -
Landelijke sector- en domein-overstijgende informatiemodellen (IMGeo e.d.); -
Gemeentelijke sector- en domein-overstijgende informatiemodellen (RSGB, RGBZ,
ZTC); - Sector- en domein-specifieke informatiemodellen (LV-WOZ, IMRO e.d.).

| **Waardebereik authentiek** | **Betekenis**                                                                                                                                                                                                  |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Authentiek                  | Indien het een authentiek (landelijk) basisgegeven of een als relatiesoort gemodelleerd authentiek (landelijk) basisgegeven is. Basisgegevens zijn altijd gegevens afkomstig uit de landelijke *registraties*. |
| Basisgegeven                | Indien het een landelijk basisgegeven of een als relatiesoort gemodelleerd (landelijk) basisgegeven is in een landelijke *registratie*, maar in die registratie géén authentiek gegeven is.                    |
| Landelijk kerngegeven       | Indien het een gegeven of een als relatiesoort gemodelleerd gegeven is in een landelijk sector- en domein-overstijgend informatiemodel en geen authentiek gegeven en geen basisgegeven is.                     |
|                             |                                                                                                                                                                                                                |
|  Overig                     | Indien het géén van de voorgaande categorieën betreft. Veelal gaat het dan om proces-, taakveld- of domeinspecifieke gegevens.                                                                                 |

Mogelijk geen waarde
--------------------

Een attribuut kan geen waarde hebben, omdat de waarde optioneel is en er niet
is. Bijvoorbeeld bij een tussenvoegsel van een achternaam. Maar een attribuut
kan ook mogelijk geen waarde hebben, omdat de waarde niet bekend is. Dat er geen
waarde bij een attribuut geregistreerd is, wil dus niet zeggen dat er geen
betekenis aan gehecht kan worden. Zo kan het niet hebben van een waarde van de
overlijdensdatum van een persoon betekenen dat deze persoon nog leeft. Maar het
kan ook betekenen dat de persoon overleden is maar de datum waarop deze persoon
overleden is, niet bekend is.

Dit verschil is niet vast te leggen zonder onderscheid te maken en vaak is het
ook van belang om de reden waarom de waarde niet bekend is vast te leggen. Een
verplicht veld optioneel maken is daarom niet de juiste oplossing. In die
situaties waarin het hebben van geen waarde van een attribuut een betekenis kan
hebben maken we gebruik van het metagegeven ‘Mogelijk geen waarde’. Dit
metagegeven geeft op informatiemodelniveau aan dat het attribuut een gangbare
waarde kan hebben, maar dat deze waarde ook niet bekend kan zijn.

Bij de daadwerkelijke registratie kan het zo zijn dat: - De waarde van het
attribuut bekend is, te weten een waarde bij een verplicht attribuut, of geen
waarde bij een optioneel attribuut. - De waarde van het attribuut onbekend is,
en niet meer kan worden achterhaald. - De waarde van het attribuut onbekend is,
en mogelijk wel nog kan worden achterhaald.

Wat de toegestane redenen zijn voor een specifiek attribuut, is aan de beheerder
van het informatiemodel. Het is nuttig om de redenen te beperken op
informatiemodelniveau. Dit kan dan vastgelegd worden bij de attribuutsoort of
bij relatiesoort zelf, bijvoorbeeld in de UML notes. In de registratie mogen dan
alleen deze redenen worden geregistreerd.

Een attribuut dat in de werkelijkheid gewoon geen waarde kan hebben en waar
bovenstaand onderscheid niet van toepassing is duiden we niet aan met dit
metagegeven. Het betreft dan gewoon een optioneel attribuut dat niet is gevuld.
Anders gezegd, het is bekend dat het attribuut niet gevuld is en het hebben van
geen waarde heeft dan geen verdere betekenis .

Ook een relatiesoort of compositie relatie kan mogelijk geen waarde hebben
waaraan betekenis gehecht kan worden en ook daar maken we gebruik van het
metagegeven ‘Mogelijk geen waarde’.

In de registraties komen we hier en daar enumeraties tegen waarin de waarde
‘onbekend’ is opgenomen. Bijvoorbeeld de geslachtsaanduiding van een natuurlijk
persoon. De enumeratie bestaat uit de waarden man, vrouw en onbekend. In dit
metamodel stellen we dat dit niet mag c.q. niet de bedoeling is bij de
modellering van eigen gegevens in een eigen informatiemodel. Uitzondering is
wanneer het een situatie betreft waarin gegevens worden overgenomen uit een
registratie die wel de waarde ‘onbekend’ gebruikt. Dan kan er ook gekozen worden
voor het 1:1 overgenomen van de gegevensdefinitie uit deze andere registratie.

Externe schema’s (her) gebruiken
--------------------------------

In bepaalde situaties is het mogelijk dat een ander informatiemodel al één op
één de specificaties in UML bevat die relevant zijn voor het eigen
informatiemodel. Dit is in het bijzonder het geval als het andere
informatiemodel ook dit metamodel volgt, maar kan ook het geval zijn bij
gestandaardiseerde datatypes.  
Het is dan wenselijk om hiernaar te kunnen verwijzen. Dit kan door deze packages
over te nemen naar de eigen UML tool en het stereotype «extern» toe te kennen.
Deze packages worden dan wel buiten het eigen informatiemodel gehouden. Ze zijn
extern aan het eigen model. Het beheer en de definitie vindt dan ook buiten het
eigen model plaats.

In deze externe packages die aangeduid worden met het stereotype «extern» zijn
de relevante specificaties opgenomen die binnen het informatiemodel hergebruikt
worden. Deze specificaties zijn opgesteld door een externe partij die de UML (of
ook de XML) schema’s beheert en beschikbaar stelt waarnaar vanuit deze
specificaties wordt gerefereerd. De packages bevatten alleen de constructies die
ook daadwerkelijk binnen het ‘eigen’ informatiemodel wordt gebruikt.

*Voorbeeld: voor het uitwisselen van geografische informatie op basis van
NEN3610 is een tweetal externe packages onderkend waarnaar vanuit de ‘eigen’
informatiemodellen kan worden verwezen: NEN3610, of GML3.2*

Het is ook mogelijk om binnen een domein of binnen een organisatie een eigen
«extern» package te definiëren voor datatypen, om over meerdere
informatiemodellen heen hergebruik mogelijk te maken.

Naast het beschikbaar maken van het externe package kan het modelelement uit het
externe package gebruikt worden als datatype, maar er kan ook naar verwezen
worden via een relatie. Dit laatst wordt nader uitgelegd in de volgende
paragraaf.

Koppelen met ander informatiemodel (externe koppeling)
------------------------------------------------------

Bij registraties is het regelmatig noodzakelijk om te verwijzen vanuit het eigen
model naar gegevens uit een andere informatiemodel. Denk aan het opnemen van de
identificatie van een object uit een andere registratie, of aan het overnemen
van een subset van gegevens van een object uit een ander model. Hiervoor zijn de
stereotypes «view» en «externe koppeling» bedoeld.

Deze stereotypes zijn alleen van toepassing binnen een informatiemodel in
situaties waarbij het ene informatiemodel afhankelijk is van een andere
informatiemodel.

Uitgangspunten hierbij zijn dat de definitie van de structuur van gegevens van
het andere informatiemodel één op één overgenomen wordt, waarbij expliciet
gemaakt wordt welke gegevens tot het eigen model behoren en welke tot het andere
model.

Bijvoorbeeld:

*In IMKAD zit het objecttype: «Objecttype» Persoon. Hierin zitten de attributen
waarvan de basisregistratie Kadaster de gegevens zelf inwint. In IMKAD zit het
package: «view» BRP en hierin zit het «Objecttype» GeregistreerdPersoon. Hierin
zitten de attributen die de basisregistratie BRP inwint en die het Kadaster
overneemt. De relatie overstijgt de registratie, máár het blijft in het eigen
informatiemodel. De aard van de relatie is echter anders dan bij een
«relatiesoort». Daarom kennen we deze relatie het stereotype «externe koppeling»
toe.*

Het betreft in de werkelijkheid dezelfde persoon. Zowel Persoon als
GeregistreerdPersoon worden als «Objecttype» gezien. Beide objecten zijn sterk
aan elkaar gekoppeld. Dit is altijd zo bij dit soort relaties. Daarom is het
aggregatietype van deze relatie altijd Composite.

Merk op dat er ook een relatie rechtstreeks naar de BRP gelegd had kunnen
worden. Er is dan geen sprake van gegevens uit de BRP die overgenomen zijn in de
eigen registratie. Er kan dan volstaan worden met alleen de unieke aanduiding
van GeregistreerdPersoon. Dit is de BSN. Dit wordt niet gezien als een «externe
koppeling» maar als een referentie.

Stelselcatalogus en stelselafspraken voor basisregistraties
-----------------------------------------------------------

Dit metamodel ondersteunt de metadata die voorgeschreven wordt voor de
stelselcatalogus [H1.11, referentie 3]. Deze paragraaf geeft aan hoe de metadata
in dit metamodel zich verhoudt tot die van de stelselcatalogus, zodat deze
vanuit uw informatiemodel geleverd kunnen worden aan de stelselcatalogus. Er
zijn ook stelselafspraken rondom metadata. Een metadata aspect in H2.4 met
aanduiding **√** is conform stelselafspraken voor basisregistraties. Beide
gelden.

De metadata voor de stelselcatalogus en de metadata voor de stelselafspraken
zijn beide verplicht voor basisregistraties. Als het informatiemodel géén
basisregistratie is, kan je als organisatie zelf kiezen om (een aantal van) deze
metadata buiten scope te plaatsen. Dit doe je in de eigen extensie, zoals
beschreven in paragraf 1.8. De rest van deze paragraaf gaat alleen nog in op de
metadata voor de stelselcatalogus.

Het metamodel gaat als volgt met de metadata van de stelselcatalogus om: - Dit
metamodel beschrijft de stelselcatalogus metadata alleen voor de metadata die op
informatiemodel niveau speelt, niet de overige metadata. - Dit metamodel neemt
stelselcatalogus metadata altijd op met dezelfde semantiek/betekenis. Als de
betekenis van metadata anders is, dan wordt ook niet dezelfde naam gebruikt. Als
de betekenis gelijk is, dan kan het wel zo zijn dat dit metamodel een andere
naam hanteert. De vertaling wordt hieronder weergegeven. - Als de semantiek
hetzelfde is, maar het waardenbereik van het gegeven is in dit metamodel een
verdere verbijzondering (niet in strijd met) dan hanteert dit metamodel dezelfde
metadata en geeft aan hoe de waarde in dit metamodel te vertalen naar de waarde
in de stelselcatalogus. Bij automatische verwerking naar de stelselcatalogus is
het wellicht dus soms nodig deze waardes om te zetten.

| Metadata in stelselcatalogus | Komt voor in Metamodel? | Waardenbereik hetzelfde?           |
|------------------------------|-------------------------|------------------------------------|
| *Naam*                       | J                       | J                                  |
| *Definitie*                  | J                       | J                                  |
| *Toelichting*                | J                       | J                                  |
| *Populatie*                  | J                       | J                                  |
| *Herkomst*                   | J                       | J (met aanvullende afspraken)      |
| *Authentiek*                 | J                       | N (met vertaling)                  |
| *Kwaliteit*                  | J                       | J                                  |
|                              |                         |                                    |
| *Relatie*                    | N                       | n.v.t. (kan wel via een vertaling) |
| *Wetgeving*                  | N                       | n.v.t.                             |
| *Eigenaar*                   | N                       | n.v.t.                             |
| *Toegankelijkheid*           | N                       | n.v.t.                             |
| *Gebruiksvoorwaarden*        | N                       | n.v.t.                             |

Waardenbereik afspraken - *Authentiek:* als in dit metamodel ‘Authentiek’ (zie
2.4.21) dan ‘Ja’ in stelselcatalogus, anders Nee. - *Herkomst:* Zelf in te
vullen. Afspraken hierbij:  
Als zelf ingewonnen: noem de inwinnende organisatie. Bijvoorbeeld: KING of
Gemeentes.  
Als overgenomen uit andere bron, noem de directe bron. Bijvoorbeeld: BAG. -
*Relatie:* dit is geen metagegeven in dit metamodel, maar een stereotype. Deze
is wel af te leiden uit het metagegeven van relatiesoort: gerelateerd objecttype
(de target van de relatie).

Naamgevingsconventies
---------------------

Naamgevingsconventies zijn belangrijk om te specificeren. Onderstaande
beschrijft enkele punten die op het niveau van dit metamodel zijn afgesproken.
De verdere invulling van de naamgevingsconventies is aan de opsteller van het
informatiemodel zelf (zie ook bijlage 1).

### Alternatief 1: natuurlijke taal, die dichtbij de gebruiker staat

Met natuurlijke taal wordt bedoeld, zoals de gebruikers erover praten, in
normaal Nederlands. Veelal zijn dit alleen letters en cijfers, met spaties.
Koppeltekens (‘-’ of ‘_’) kunnen gebruikt worden, indien gewenst, alsmede
diakrieten.

Zo kan bijvoorbeeld gekozen worden dat de eerste letter een hoofdletter is voor
namen van de modelelementen Objecttypen, Gegevensgroeptype en Datatypen en dat
de eerste letter een kleine letter is voor attribuutsoorten,en data-elementen
e.d. Bijvoorbeeld: ‘Natuurlijk persoon’ en ‘naam’ met type CharacterString.

Regel: voor conceptuele informatiemodellen wordt altijd alternatief 1
gehanteerd.

### Alternatief 2: (ook) leesbaar door systemen

Met machine leesbare taal wordt bedoeld dat deze eenvoudig door systemen te
verwerken is. Veelal zijn dit alleen letters en cijfers, zonder spaties, zonder
diakrieten. Koppeltekens (‘-’ of ‘_’) kunnen gebruikt worden, maar dit wordt
veelal vermeden.

Zo kan bijvoorbeeld gekozen worden voor UpperCamelCase voor namen van
Objecttypen, Gegevensgroeptypen en Datatypen en lowerCamelCase voor
attribuutsoorten, relatiesoorten, relatierollen, data-elementen e.d.
Bijvoorbeeld: **n**aam in een NatuurlijkPersoon. Combineer indien nodig
verschillende woorden (uit bijvoorbeeld een begrippenkader of uit een
conceptueel informatiemodel) om precieze en begrijpelijke namen te vormen.

Als er gekozen wordt voor CamelCase, volg hierin dan hoe deze in UML ook
toegepast wordt (deze komt overeen met ISO19103): maak van de beginletter van
ieder deelwoord van namen van attribuutsoorten, relatierollen een hoofdletter,
behalve de beginletter van het eerste woord. Bij namen van objecttypen,
gegevensattributen, union, datatypen, en relaties wordt ook de beginletter een
hoofdletter.

Regel: voor logische informatiemodellen wordt altijd alternatief 2 gehanteerd.

Neem aanvullend een verwijzing op naar het betreffende modelelement in het
conceptuele model. Dit kan bijvoorbeeld met een trace of door opname van de naam
in de alias (zie 3.16.20), zodat lezers goed de overgang van conceptueel naar
logisch kunnen volgen.

### Naamgeving voor metamodel elementen

Voor stereotypes en metagegevens worden dezelfde naamgevingsconventies toegepast
als in alternatief 1 waarbij de eerste letter een hoofdletter is voor alle
stereotypes en tagged values. Echter, als een internationale standaard het
anders voorschrijft, dan wordt deze gevolgd, en niet vertaald. Bijvoorbeeld:
codeList. Deze conventies gelden ook als in een eigen extensie
metamodelelementen worden toegevoegd.

In de bijlage is een template opgenomen om de naamgevingsconventies in te
specificeren. Dit is een hulptabel, die u over kunt nemen naar uw eigen extensie
(zoals bedoeld in paragraaf 1.8) en in kunt vullen voor uw eigen informatiemodel
(of organisatie).

**Voetnoten**

3-1: nb

3-2: Hoewel het goed zou zijn om tot een standaard te komen in Nederland is KKG
niet de plek hiervoor.
