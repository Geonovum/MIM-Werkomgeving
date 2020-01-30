## Afspraken & Regels

In deze paragraaf gaan we in op een aantal aspecten van het zojuist beschreven
metamodel en afspraken en regels die van toepassing zijn voor een
informatiemodel.

### Datatype(n)

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

#### Primitive datatypes

Dit metamodel onderkend (momenteel) de volgende extern gedefinieerde primitive
datatypes. Deze zijn allemaal gebaseerd op [[!GAB]]:

| **Primitive type** | **Betekenis**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CharacterString    | Zie [[!iso-19103]]. Vrij vertaald: alle alfanumerieke tekens en speciale tekens die horen bij de gekozen characterset (standaard UTF-8), dus met diakrieten, white spaces, \\-teken en newlines of HTML opmaak e.d. Mag starten met spatie. De maximale lengte is onbepaald. *Opmerking*: getallen (ISO Numbers) met voorloopnullen worden opgenomen als CharacterString, met een patroon of formeel patroon. Bij het metagegeven Waardenverzameling attribuutsoort wordt dit dan (ook) gespecificeerd. |
| Integer            | Zie [[!iso-19103]] (subtype van ISO Number). Vrij vertaald: geheel getal, lengte is minimaal 1 en maximale lengte is onbepaald, zonder voorloopnullen. *Opmerking*: t.a.v. positieve en negatieve getalen en + en – tekens: bijvoorbeeld -2,0 Het (formeel) patroon geeft aan of een + en/of - teken gebruikt mag worden in het gegeven.                                                                                                                                                                |
| Real               | Zie [[!iso-19103]] (subtype van ISO Number). Vrij vertaald: een real is een zwevendekommagetal, waarbij de precisie bepaald wordt door het aantal getoonde cijfers. Het getoonde getal is een schatting en geeft niet noodzakelijk de exacte waarde weer. *Opmerking 1*: Dit verschilt van decimal, want decimal is een exacte waarde en real is geschat. *Opmerking 2:* t.a.v. positieve en negatieve getalen en + en – tekens: zie Integer.                                                           |
| Decimal            | Zie [[!iso-19103]] (subtype van ISO Number). Vrij vertaald: een decimal is een gegevenstype waarin het getal een exacte waarde vertegenwoordigt, als een eindige weergave van een decimaal getal. Aangezien veel valuta's decimaal zijn, hebben deze weergaven de voorkeur bij het omgaan met dergelijke waarden. *Opmerking 1:* Dit verschilt van real, want real is een geschatte waarde en Decimal is exact. *Opmerking 2:* t.a.v. positieve en negatieve getalen en + en – tekens: zie Integer.       |
| Boolean            | Indicatie met mogelijke waarden True, false, 1 of 0. True en 1 hebben een identieke betekenis: Ja. False en 0 hebben een identieke betekenis: Nee. *Opmerking*: t.a.v. Ja of Nee. Wanneer u de Ja of Nee wilt gebruiken, gebruik dan bv. een Enumeratie genaamd Indicatie, of gebruik AN met een lengte en een (formeel) patroon.                                                                                                                                                                       |
|                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Date               | 4-cijferig jaar, 2-cijferig maand, 2-cijferig dag uitgedrukt in yyyy-mm-dd conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                               |
| DateTime           | yyyy-mm-ddThh:mm:ss conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Year               | 4-cijferig jaar uitgedrukt in yyyy conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Day                | 2-cijferige dag uitgedrukt in dd conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Month              | 2-cijferige maand uitgedrukt in mm conform https://en.wikipedia.org/wiki/ISO_8601                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| URI                | Unieke identificatie op internet conform RFC3986 en de URI-strategie Linked Open Data. Gestandaardiseerde manier om op het internet dingen (pagina's met informatie, objecten, datasets) uniek te identificeren.                                                                                                                                                                                                                                                                                        |

Het is mogelijk om in de eigen extensie extra primitive datatypes op te nemen,
zodat deze ook beschikbaar komen voor het informatiemodel.

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

We onderkennen twee soorten patronen: 
- *Patroon*: het metagegeven (de taggedvalue) ‘Patroon’ in *tekst* vorm. Deze 
wordt als aanvulling op het datatype (bijvoorbeeld Integer ) van het attribuut gespecificeerd. 
Het patroon bevat een specificatie waaraan een waarde moet voldoen. Bijvoorbeeld een 
postcode, met als aanduiding van het patroon: Postcode. De toegestane waarden voor 
deze patroon aanduiding worden dan vastgelegd in documentatie behorende bij het type: alle
postcodes van 1000AA tot en met 9999ZZ. 
- Formeel patroon: het metagegeven (de tagged value) ‘Formeel patroon’ in 
*formele specificatie* vorm [H1.11,referentie 6], te weten in een reguliere expressie. Bijvoorbeeld een postcode,
met de expressie: \\d{4}[A-Z]{2}

Een voorbeeld waar een patroon nodig is, is een attribuut waarvan het
waardenbereik altijd een getal is met precies de lengte 4, zoals bijvoorbeeld
0001 tot en met 9999, en dus voorloopnullen heeft. Een datatype zoals Integer
kan hiervoor niet gebruikt worden, omdat 0001 geen getal is. Het type van het
attribuut wordt in dat geval een CharacterString, met lengte (exact) =4 en het
patroon voor het attribuut specificeert dat alleen numerieke getallen zijn
toegestaan: [0-9]{4}.

#### Datatype zelf definiëren

Het is ook mogelijk om in het eigen informatiemodel een eigen datatype te
definiëren in de vorm van een «Primitief datatype», «Codelijst» of
«Referentielijst». Zelf gedefinieerde datatypes hebben altijd een eigen
definitie en optioneel een eigen patroon of formeel patroon.

**Voorbeelden** hiervan, die niet tot MIM behoren, maar ter illustratie zijn
opgenomen, zijn: 
- NietNegatieve*Integer*: een Integer die alleen de waarde 0 of
groter mag hebben. Laat de naam van het primitieve type dan wel terugkomen in de
naam (dus niet NietNegatiefGetal*)*. 
- Een beperking op een Real te specificeren door Decimal op te nemen (een gebroken getal, 
met (één of meer) cijfers voor de komma en cijfers achter de komma, conform ISO11404). 
- AN. Deze is gebruikelijk bij een aantal basisregistraties. Datatype met een eigen naam, 
analoog aan CharacterString, maar met alleen ‘normale’ tekens. Dit zijn alle alfanumerieke
tekens (dus inclusief diakrieten), de koppeltekens – en \_ en spaties. De
minimale lengte is tenminste 1, de maximale lengte is onbepaald. De 1e positie
mag géén spatie bevatten. 
- Een Vlak: een verbijzondering van een GM Surface, met een eigen definitie, die bijvoorbeeld \
aangeeft dat het om een 2 dimensionale geometrie gaat.

![Datatypen Generalisatie](media/47002e9ebd60742cec8111996ea22fbc.png)

Datatypen Generalisatie

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

#### Datatypen landelijk

Wanneer op landelijk niveau afspraken zijn gemaakt (bijvoorbeeld in GAB), voor
algemene datatypen, die niet primitief zijn, zoals Postcode, dan worden deze
niet in dit MIM metamodel opgenomen. Wel geeft MIM aan hoe deze in
informatiemodellen gedefinieerd en gemodelleerd worden.

*Voorbeelden* hiervan van landelijke datatypen, die niet tot MIM behoren, maar
ter illustratie zijn opgenomen:

| Postcode | De in Nederland gangbare postcode voor een Nederlands postadres, bestaande uit een numeriek deel en een alfabetisch deel. Het numerieke deel van de postcode bestaat uit vier cijfers, het alfabetische deel van de postcode bestaat uit twee hoofdletters. Conform [GAB Postcodes].                                                        |
| DMO      | Datum mogelijk onvolledig. De keuze («Keuze») van een periode in de Gregoriaanse kalender, al naar gelang de beschikbare datumelementen, uit de onderliggende subformaten alleen Year, Year en Month of Year, Month en Day. Dit is (nog steeds) overeenkomstig met https://en.wikipedia.org/wiki/ISO_8601 en [GAB DatumMogelijkOnvolledig]. |
| DTMO     | Een volledige datum waarbij (alleen) de tijd mogelijk ontbreekt. De tijd wordt, zover bekend, ingevuld. Dus alleen de uren als de minuten onbekend zijn.                                                                                                                                                                                    |
|          | \- DateTime, als de tijd wel volledig bekend is                                                                                                                                                                                                                                                                                             |
|          | \- Date, als alleen de Date bekend is                                                                                                                                                                                                                                                                                                       |

### Gestructureerd datatype

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

### Gegevensgroeptype

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

#### Hergebruik

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

<aside class='example'>
    
Een voorbeeld van het hergebruik van een gegevensgroeptype door meerdere objecttypen is de specificatie voor het Brondocument in de basisregistratie BAG. Het gegevensgroeptype Brondocument is qua betekenis en structuur voor alle objecttypes gelijk. De definitie en specificatie ervan wordt daarom hergebruikt bij alle objecttypes. Het brondocument wordt binnen de BAG niet gezien als een van de typen objecten van de BAG, en daarom is het geen objecttype maar een gegevensgroeptype. 
    
</aside>

Metamodel: het gegevensgroeptype kan dus het type zijn van meer dan 1 gegevensgroep. Vanwege dit hergebruik is daarom de kardinaliteit van de relatie van gegevensgroep naar gegevensgroeptype aan de source kant 1..\*. Zie
[Kern](#kern).

#### Gegevensgroep versus Gestructureerd datatype

Een gegevensgroep is niet hetzelfde als een Gestructureerd datatype. 
- Eendatatype beschrijft de structuur van data, een gegevensgroep beschrijft de
semantiek van een kenmerk van een object. 
- Als één kenmerk van een object uitverschillende stukjes data bestaat, dan wordt 
een Gestructureerd datatypegebruikt. Dit is bijvoorbeeld het geval bij het gestructureerde 
datatype Bedrag. Deze bestaat uit een ‘hoeveelheid’ en ‘muntsoort. 
- Als een object meerdere kenmerken heeft, gemodelleerd als afzonderlijke attribuutsoorten, 
dan heeft elk kenmerk op zichzelf betekenis. Als één kenmerk wordt weggelaten, of niet bekend
of ingewonnen is, dan verandert er niets aan de betekenis van de andere
attribuutsoorten. 
- Een ander goed criterium is: als het datatype wordt weggelaten uit het informatiemodel, dan 
verliest het informatiemodel geen semantiek. Alleen de structuur van een gegeven is dan 
niet meer bekend.

Regel: het is niet de bedoeling dat eenzelfde kenmerk van een object in het ene
model als een gegevensgroep gemodelleerd wordt en in het andere model als een
Gestructureerd datatype. Er raakt dan semantiek verloren of er ontbreekt dan
semantiek.

-   Een Gestructureerd datatype in een conceptueel informatiemodel is en blijft
    dus altijd ook een Gestructureerd datatype in een bijbehorende logisch
    informatiemodel. Een gegevensgroep in een conceptueel model is en blijft dus
    altijd ook een gegevensgroep in een logisch informatiemodel.

### Keuze tussen datatypes (Keuze)

Wanneer het datatype van een attribuutsoort een keuze uit twee of meer datatypen
is, dan wordt dit gemodelleerd met het datatype Keuze. Elk keuze element van de
keuze heeft dan één datatype, de waarde van de attribuutsoort moet aan één van
deze datatypen voldoen.

<pre class='example'>
Attribuutsoort geometrie met als type de Keuze PuntOfVlak.
PuntOfVlak is daarbij een Keuze met keuze element: punt, met als type het
datatype GM_Point en keuze element vlak met als type het datatype GM_Surface.
</pre>

In dit voorbeeld is er enkel een keuze tussen verschillende keuze elementen die
zelf geen betekenisvolle context geven aan het te kiezen datatype. Er wordt in
dit geval geen definitie gespecificeerd bij het keuze element (de definitie is
optioneel).

In onderstaande voorbeelden is er wel sprake van een keuze tussen keuze
elementen die een betekenisvolle context geven aan het te kiezen datatype. Er
wordt in dit geval wel een definitie gespecificeerd bij het keuze element.

<pre class='example'>
Attribuutsoort hoogte met als type de Keuze BereikOfWaarde.
BereikOfWaarde is daarbij een Keuze met keuze element ‘bereik’, met als type het
datatype Interval en keuze element ‘waarde’ met als type het datatype Real.
</pre>

Regel: het is niet toegestaan dat keuze elementen binnen één en dezelfde keuze
identiek zijn. De naam van elk keuze element moet verschillend zijn én de
datatypen moeten op zijn minst verschillend zijn. Dus ofwel een ander datatype,
ofwel hetzelfde datatype met een verschil in het metadata aspect patroon en/of
formeel patroon hebben. Bijvoorbeeld: een keuze tussen een datatype
CharacterString en een datatype CharacterString is alleen toegestaan als er een
verschillend (formeel) patroon is gespecificeerd.

Merk op dat het mogelijk is om een eigen datatype te maken met een eigen naam en
deze te gebruiken in een keuze element.

Wanneer een beoogd datatype uit een extern model komt en daar geen metamodel
stereotype heeft, zoals bijvoorbeeld het geval is bij het GM package waarin een
datatype als «interface» GM_Point is opgenomen, dan heeft dit datatype niet een
MIM stereotype en mogelijk ook niet de UML-metaclass dataType. Het is dan aan de
modelleur van het informatiemodel om te beoordelen of het type dan als datatype
gebruikt kan worden. Het is niet gewenst om aan het externe model een stereotype
toe te voegen, noch om in het externe model de UML-metaclass aan te passen.

### Domeinwaarden of lijsten

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
**Codelijst** gebruikt. Dit betreft de situaties waarin domeinwaarden kunnen
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

**CodeList** Gebruik een codelijst als in het informatiemodel de attributen,
zoals bij een referentielijst, niet relevant zijn en je voor de definitie alleen
wilt verwijzen naar de externe waardelijst.

### Abstracte objecttypes en concrete objecten

Een objecttype kan aangeduid worden als een abstract objecttype (zie paragraaf
[Modellering metagegevens voor objecten en attributen in UML](#modellering-metagegevens-voor-objecten-en-attributen-in-uml)) door middel van
indAbstract = J). Het betreft dan altijd een generalisatie waarbij de
specialisaties van dit objecttype op het laagste niveau concrete objecttypen
worden genoemd. Het is belangrijk te weten wanneer een objecttype als abstract
objecttype in een informatiemodel is te onderkennen. Omdat een abstract
objecttype altijd een generalisatie is, beantwoorden we in deze paragraaf ook de
vraag wanneer we specialisaties / generalisaties onderkennen in een conceptueel
informatiemodel en in een logisch informatiemodel

**Conceptueel informatiemodel**

<pre class='example'>
*Specialisatie / generalisatie*
Bovenstaande vragen beantwoorden we aan de hand van het voorbeeld van een het 
opleidingsinstituut.  In de beschouwde werkelijkheid onderscheiden we onder 
meer als gespreksonderwerp personen. Deze personen kunnen docenten en 
leerlingen zijn. Over al deze gespreksonderwerpen willen we gegevens
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

*Abstract / concreet* 
Wanneer er vanuit wordt gegaan dat binnen het te beschouwen gebied een persoon 
altijd ofwel een docent ofwel leerling kan zijn (en nooit beide tegelijk) dan 
definiëren we een Persoon als een abstract objecttype. Docent en Leerling 
zijn dan concrete objecttypen in het conceptueel informatiemodel.
</pre>

Een concreet object kan zich alleen in de hoedanigheid als één van de
specialisaties van het abstracte objecttype op het laagste niveau voordoen. En
daarmee dus ook in de hoedanigheid van de generalisatie(s) van het concrete
objecttype.

Richtlijnen - Een abstract object is een onderwerp van gesprek binnen het
beschouwde gebied. Het heeft dus echt een *betekenis* in het
beschouwde gebied. Net als een concreet object, specialisatie of generalisatie.
- De definitie van elk objecttype (dus ook een abstract objecttype) is zodanig
dat ondubbelzinnig bepaald kan worden dat een object wel of niet tot het
gedefinieerde type behoort. Dus niet een objecttype met een definitie als ‘De
gemeenschappelijke eigenschappen van een object…’ Deze definitie is op elk
objecttype van toepassing. 
- Houd er rekening mee dat afhankelijk van het te beschouwen gebied een object uit de 
werkelijkheid in het ene informatiemodel een concreet objecttype kan zijn en in het andere 
informatiemodel een abstract objecttype.

**Logisch informatiemodel** In een logisch model gelden in principe dezelfde
regels voor abstracte of concrete objecttypen. De abstracte objecten worden
daarom in principe overgenomen. In een logisch model wordt het digitale model
van de werkelijkheid beschreven. Vanuit dit oogpunt kunnen er ook andere redenen
zijn om abstracte objecttypen te creëren, bijvoorbeeld omdat een abstract object
positieve effecten heeft voor de implementatie. Denk hierbij aan het aanbrengen
van (extra) hiërarchie,zowel in semantiek als in ordening van eigenschappen. De
enige regel die geldt is dat een abstract objecttype niet geïnstantieerd kan
worden. Elk object is altijd een instantie van een concreet objecttype.

*Algemeen* 
- In UML wordt een abstract objecttype aangeduid door indAbstract met
waarde “J” en wordt de naam van het abstracte objecttype cursief geschreven
(voorbeeld: *Persoon*). 
- Een objecttype dat een generalisatie-relatie heeft naar een al dan niet abstract objecttype 
noemen we een specialisatie (van dat objecttype). Wanneer de generalisatie een abstract 
objecttype is, kan de specialisatie zelf ook abstract zijn en specialisaties hebben. De 
‘onderste’ specialisaties zijn dan altijd concreet (niet abstract) 
- Modelleer een abstract objecttype pas wanneer er sprake is van twee of meer specialisaties 
- De unieke aanduiding kan opgenomen worden in het abstracte objecttype. De unieke
aanduiding geldt dan voor elke specialisatie van het abstract objecttype. Dit betekent dat 
de unieke aanduiding uniek is binnen de verzameling van alle
objecten die als specialisatie onder het abstracte objecttype vallen. Anders
gezegd, de unieke aanduiding geldt voor alle concrete objecten die als
objecttype de unieke aanduiding erven van het abstracte objecttype.
Bijvoorbeeld: als de unieke aanduiding van *\_Kadastraal object* het
attribuutsoort Identificatie is en \_*Kadastraal Object* als specialisatie een
Perceel kent en een Leidingnetwerk, dan kan het niet zo zijn dat er een perceel
object is met identificatie ‘1’ en een leidingnetwerk met identificatie ‘1’. Als
dat wel het geval is, dan moet op beide concrete objecttypes een eigen unieke
aanduiding gedefinieerd worden.

### Relatieklasse (uitzonderingen)

De gegevens van de relatiesoort worden altijd voor één relatiesoort vastgelegd.
Het is echter mogelijk dat dezelfde gegevens voor meerdere relaties tegelijk
gelden. Het is dan niet mogelijk om het te modelleren als relatieklasse. Wel
gewenst, maar het kan niet als UML-associationClass. Als deze uitzondering het
geval is, dan worden de relatieklasses gemodelleerd als «Objecttype», met één
inkomende relatie en één uitgaande relatie. De oorspronkelijke kardinaliteit van
de beoogde relatieklasse wordt hierbij behouden.

<pre class='example'>
Een Perceel kan vanwege een Perceel splitsing overgaan in twee of meerdere
andere Percelen. De ‘overgegaan in’ relatie wordt bijgehouden in een
relatieklasse. Gegevens over de splitsing zijn voor al deze relaties gelijk.
</pre>

Het metamodel ondersteunt (nog) geen relatieklassen tussen drie of meer
objecttypen. Dit kan in uw eigen extensie toegevoegd worden.

<pre class='ex-generic'>
Een CONTRACT kan bijvoorbeeld ook een afspraak zijn tussen twee
óf méér SUBJECTen, waarbij de gegevens van de relatie voor alle betrokken
objecten hetzelfde zijn. CONTRACT wordt dan gemodelleerd als objecttype, waarbij
beschreven wordt wat er moet gebeuren wanneer één van de SUBJECTen niet meer
bestaat.
</pre>

### Constraint

Deze paragraaf gaat dieper in op hoe een Constraint toegepast wordt.

Een Constraint wordt beschreven met een: 
- Naam (UML-constraint name): een naam c.q. label, vaak in steekwoorden. 
- Specificatie in tekst (UML-Constraint Notes, type invariant): een uitgebreide heldere 
beschrijving van de constraint in gewone tekst.

en optioneel: 
- Specificatie formeel (UML-Constraint Notes, type OCL): formele
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
dan als volgt: 
- Naam (UML-constraint name): een naam c.q. label, vaak in
steekwoorden. 
- Specificatie in tekst (UML-Constraint Notes, type invariant):
een uitgebreide heldere beschrijving van de constraint in gewone tekst.

Als de modelleur kiest om de constraint niet alleen in gewone taal te
beschrijven, maar ook in een formele taal (OCL), dan als volgt: 
- Naam (UML-constraint name): een naam c.q. label, vaak in steekwoorden. 
- Specificatie formeel (UML-Constraint Notes, type OCL): formele specificatie in de object
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

### Historie

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
attribuutwaarden: 
- Wanneer is iets gebeurd, in de werkelijkheid of volgens
opgave (wanneer zijn de opgenomen gegevens geldig)? Dit valt binnen de tijdlijn
van de aangehouden werkelijkheid. 
- Vanaf wanneer wist de overheid (als collectief van organisaties) dat de gegevens bekend 
waren? Dit valt binnen de tijdlijn van het administratieproces of de administratieve werkelijkheid.

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

<pre class='example'>
‘bouwjaar pand’ heeft al materiële historie in zich: het bouwjaar is het moment 
waarop de wijziging in de werkelijkheid zich voordeed en wijzigt niet. 
De ‘indicatie materiële historie’ ervan is daarom Nee. 

BSN van een Persoon geldt voor de persoon vanaf het moment dat de persoon in de 
BRP is opgenomen en wijzigt niet: ‘indicatie materiële historie’ Nee. 

De Achternaam van een persoon kan wijzigen: ‘indicatie materiële historie’ Ja. 

Als je niet toeziet op het daadwerkelijk kappen van een boom maar het gekapt zijn 
wel in een registratie wil opnemen: ‘indicatie materiële historie’ Nee en 
‘indicatie formele historie’ Ja.
</pre>

Richtlijn: op conceptueel niveau worden voor historie alléén indicatie materiële
historie en indicatie formele historie bij een attribuut of relatie vastgelegd,
en dus géén bij de tijdslijnen behorende attributen die gebruikt moeten worden
voor het vastleggen van historie. Deze bij de tijdslijn behorende attributen
worden op het logische niveau vastgelegd.

**Historie op logisch niveau** MIM schrijft geen implementatie van het conceptuele niveau voor. 
Wel worden er aandachtspunten gegeven om rekening mee te houden. Denk bij de uitwerking o.a. aan de volgende
aspecten:

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

**Beheer** 
De enige waarden die mogelijk zijn, zijn 'Ja' of 'Nee'. Voor beheer kan 
het prettig zijn om in algemeenheid deze waarden aan te geven, bijvoorbeeld: 
voor alle eigenschappen van een modelelement, zoals van een objecttype, geldt Ja. 
De conventie hiervoor wordt opgenomen in de eigen extensie. Bijvoorbeeld: 
'zie modelelement naam' (zie gegevensgroep, zie domein, zie view, zie informatiemodel). 

### Afleidbare gegevens

In een informatiemodel kan de behoefte bestaan om afgeleide gegevens op te
nemen: dit zijn gegevens die afleidbaar zijn uit andere attribuut- en/of
relatiesoorten binnen het informatiemodel. Dit lijkt op redundantie. Toch hebben
we deze gegevens daar opgenomen waar er ten eerste vraag is naar het afgeleide
gegeven en ten tweede het gegeven niet eenvoudig af te leiden is (er moet sprake
zijn van enige mate van complexiteit). Dit wordt in UML weergegeven via
isDerived. Zie ook Attribuutsoort, §2.4.2 – is afleidbaar.

<pre class='example'>
'Datum vestiging in Nederland' van een Ingeschreven persoon. De afleiding van 
dit gegeven is niet triviaal. Door het als afleidbaar gegeven op te nemen kan 
het opgevraagd worden zonder dat de historie of andere gegevens van het object
opgevraagd hoeven te worden om daaruit dit gegeven af te leiden.
</pre>

### Authentieke gegevens

Bij een attribuutsoort of relatiesoort wordt als metagegeven ‘Authentiek’
opgenomen. Het is een aanduiding of een attribuutsoort of een als relatiesoort
gemodelleerd landelijk basisgegeven in de catalogus van de desbetreffende
registratie een authentiek gegeven betreft. Een authentiek gegeven is van
hoogwaardige kwaliteit en kan zonder nader onderzoek bij de uitvoering van
publiekrechtelijke taken worden gebruikt.

De specificatie van de waarde van het metagegeven is gebaseerd op het
onderscheid in de volgende groepen van gegevens: 
- Landelijke registraties met authentieke en niet-authentieke basisgegevens 
(BAG, BRK, BRP, BGT e.d.); 
- Landelijke sector- en domein-overstijgende informatiemodellen (IMGeo e.d.); 
- Gemeentelijke sector- en domein-overstijgende informatiemodellen (RSGB, RGBZ, ZTC); 
- Sector- en domein-specifieke informatiemodellen (LV-WOZ, IMRO e.d.).

| **Waardebereik authentiek** | **Betekenis**                                                                                                                                                                                                  |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Authentiek                  | https://www.noraonline.nl/wiki/Authentiek_gegeven. |
| Basisgegeven                | https://www.noraonline.nl/wiki/Basisgegeven |
| Wettelijk gegeven           | Gegeven behorende bij een wettelijke registratie, niet zijnde een basisregistratie |
| Landelijk kerngegeven       | Indien het een gegeven of een als relatiesoort gemodelleerd gegeven is in een landelijk sector- en domein-overstijgend informatiemodel en geen authentiek gegeven en geen basisgegeven en geen wettelijk gegeven is.|
|  Overig                     | Indien het géén van de voorgaande categorieën betreft. Veelal gaat het dan om proces-, taakveld- of domeinspecifieke gegevens.   |

### Mogelijk geen waarde

Bij het inwinnen van gegevens zal het regelmatig voorkomen dat voor een bepaald kenmerk er geen gegeven gevonden kan worden. Dit zal vaak zo zijn bij optionele gegevens. Bijvoorbeeld bij een tussenvoegsel van een achternaam. Maar het is ook mogelijk dat het gegeven er in de werkelijkheid wel is, of zou moeten zijn, maar dat waarde niet bekend is. Bijvoorbeeld omdat het gegeven niet gevonden kan worden, zoals een bouwjaar van een oud gebouw of de geboortedag van een persoon. Zo kan het niet hebben van een waarde van de overlijdensdatum van een persoon betekenen dat deze persoon nog leeft. Maar het kan ook betekenen dat de persoon is overleden, maar dat de datum waarop niet bekend is. Een ander voorbeeld is dat een registratie vroeger een bepaald gegeven niet registreerde, en tegenwoordig verplicht moet registreren. Het gegeven is dan bijvoorbeeld vanaf 1990 beschikbaar, en is daarvoor onbekend. 
Deze voorbeelden geven aan dat er in de werkelijkheid wel een gegeven kan zijn, maar dat deze onbekend is. Voor deze gevallen is ‘mogelijk geen waarde’ bedoeld. Mogelijk is de waarde er in de werkelijkheid wel, mogelijk is deze er niet. 

In de modellering is het bij mogelijk geen waarde nodig om een modelleringconstructie te gebruiken om aan te geven wat er aan de hand is. Dit wordt in het informatiemodel gemodelleerd door een metagegeven op te nemen bij het desbetreffende modelelement. Er staat dan: mogelijk geen waarde: Ja. Dit is vrijwel altijd is dit bij een attribuutsoort, maar is ook mogelijk om het op te nemen bij een element van een datatype. Een voorbeeld bij een datatype is de geboorte datum van een persoon, als het zo kan zijn dat het jaar en de maand van geboorte wel bekend is, maar de dag niet. Dit datatype is ook gestandaardiseerd, en heet Datum Mogelijk Onvolledig. 

Verder, wanneer er sprake is van mogelijk geen waarde dan het is expliciet niet de bedoeling om een verplicht veld optioneel maken. Dit is niet de juiste oplossing en kan bovendien de indruk geven dat het veld niet relevant is. De betekenis van een optioneel veld is daarom dat er inherent sprake is van dat de waarde een attribuutsoort van een objecttype mag ontbreken. Het ontbreken van een optionele waarde heeft daarom de betekenis dat het bekend is dat er in de betreffende situatie in de werkelijkheid geen waarde bestaat. Bij inherent optionele velden kan het immers ook voorkomen dat een waarde onbekend is. Het verschil tussen ‘het is bekend dat er geen waarde is’ en ‘het is onbekend of er een waarde is’ is alleen vast te leggen door onderscheid te maken. Daarom moet er expliciet worden aangegeven dat er sprake is van mogelijk geen waarde, middels het metagegeven Mogelijk geen waarde: Ja. 

Het verplicht of optioneel zijn van een waarde en het wel of niet mogen ontbreken van een waarde (die in de werkelijkheid wel bestaat) zijn dus twee verschillende en van elkaar onafhankelijke eigenschappen. In combinatie beschrijven deze eigenschappen vier mogelijkheden:
- Het attribuut heeft in de werkelijkheid altijd een waarde en die waarde moet zijn gevuld, zoals de identificatie. Waarde is verplicht, mogelijk geen waarde: Nee;
- Het attribuut heeft in de werkelijkheid altijd een waarde, maar die waarde is mogelijk onbekend, bijvoorbeeld de geboortedatum. Waarde is verplicht, mogelijk geen waarde: Ja;
- Het attribuut heeft in de werkelijkheid soms een waarde en die waarde moet dan zijn gevuld, bijvoorbeeld de officiële straatnaam. Waarde is optioneel, mogelijk geen waarde: Nee;
- Het attribuut heeft in de werkelijkheid soms een waarde, maar die waarde en zelfs het bestaan ervan hoeven niet bekend te zijn, zoals de overlijdensdatum van een persoon. Waarde is optioneel, mogelijk geen waarde: ja. 

Verder, wanneer er sprake is van mogelijk geen waarde dan kan het waardevol zijn om de reden waarom de waarde ontbreekt aan te geven. Ie beheerder van het informatiemodel bepaalt welke redenen hij of zij toestaat voor het ontbreken van waarden die in de werkelijkheid wel bestaan. Het is nuttig om deze redenen op informatiemodelniveau te beperken. Dit kan dan vastgelegd worden bij de attribuutsoort of bij relatiesoort, bijvoorbeeld in de toelichting. In de registratie mogen alleen deze redenen worden geregistreerd. Daarbij kan het zinvol zijn om te vermelden of een onbekende waarde mogelijk nog kan worden achterhaald of dat dat niet meer kan.
Sommige informatiemodellen gebruiken enumeraties met daarin een waarde zoals 'onbekend'. In dit metamodel stellen we dat dit niet de bedoeling is bij de modellering van eigen gegevens in een eigen informatiemodel. Er geldt een uitzondering wanneer het gaat om gegevens die worden overgenomen uit een andere registratie die wel de waarde 'onbekend' gebruikt. Dan kan er worden gekozen voor het een-op-een overnemen van de gegevensdefinitie uit de andere registratie. 

### Externe schema’s (her) gebruiken

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

<pre class='example'>
Voor het uitwisselen van geografische informatie op basis van NEN3610 is een 
tweetal externe packages onderkend waarnaar vanuit de ‘eigen’ informatiemodellen 
kan worden verwezen: [[!NEN3610]], of GML3.2
</pre>

Het is ook mogelijk om binnen een domein of binnen een organisatie een eigen
«extern» package te definiëren voor datatypen, om over meerdere
informatiemodellen heen hergebruik mogelijk te maken.

Naast het beschikbaar maken van het externe package kan het modelelement uit het
externe package gebruikt worden als datatype, maar er kan ook naar verwezen
worden via een relatie. Dit laatst wordt nader uitgelegd in de volgende
paragraaf.

### Koppelen met een ander informatiemodel (externe koppeling)

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

<pre class='example'>
In IMKAD zit het objecttype: «Objecttype» Persoon. Hierin zitten de attributen
waarvan de basisregistratie Kadaster de gegevens zelf inwint. In IMKAD zit het
package: «view» BRP en hierin zit het «Objecttype» GeregistreerdPersoon. Hierin
zitten de attributen die de basisregistratie BRP inwint en die het Kadaster
overneemt. De relatie overstijgt de registratie, máár het blijft in het eigen
informatiemodel. De aard van de relatie is echter anders dan bij een
«relatiesoort». Daarom kennen we deze relatie het stereotype «externe koppeling»
toe.

Het betreft in de werkelijkheid dezelfde persoon. Zowel Persoon als
GeregistreerdPersoon worden als «Objecttype» gezien. Beide objecten zijn sterk
aan elkaar gekoppeld. Dit is altijd zo bij dit soort relaties. Daarom is het
aggregatietype van deze relatie altijd Composite.

Merk op dat er ook een relatie rechtstreeks naar de BRP gelegd had kunnen
worden. Er is dan geen sprake van gegevens uit de BRP die overgenomen zijn in de
eigen registratie. Er kan dan volstaan worden met alleen de unieke aanduiding
van GeregistreerdPersoon. Dit is de BSN. Dit wordt niet gezien als een «externe
koppeling» maar als een referentie.
</pre>

### Stelselcatalogus en stelselafspraken voor basisregistraties

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
Als zelf ingewonnen: noem de inwinnende organisatie. Bijvoorbeeld: VNG
Realisatie of Gemeentes.  
Als overgenomen uit andere bron, noem de directe bron. Bijvoorbeeld: BAG. -
*Relatie:* dit is geen metagegeven in dit metamodel, maar een stereotype. Deze
is wel af te leiden uit het metagegeven van relatiesoort: gerelateerd objecttype
(de target van de relatie).

### Afspraken rondom naamgeving en definities

Naamgevingsconventies zijn belangrijk om te specificeren. Onderstaande
beschrijft enkele punten die op het niveau van dit metamodel zijn afgesproken.
De verdere invulling van de naamgevingsconventies is aan de opsteller van het
informatiemodel zelf (zie ook bijlage 1).

#### Uniekheid van namen van modelelementen 

* Objecttypes hebben een unieke naam binnen het hele informatiemodel
* Datatypes hebben een unieke naam binnen het informatiemodel 
* Kenmerken van een objecttype hebben een unieke naam binnen het objecttype (attribuutsoort, gegevensgroep, relatiesoort et cetera)
* De naam van kenmerken van een objecttype hoeven niet uniek te zijn over objecttypen heen.
* De naam van elementen van een datatype hoeven niet uniek te zijn over datatypen heen.

#### Dezelfde naam en/of definitie gebruiken voor meerdere modelelementen

Er kan sprake zijn van 1 naam en/of definitie die voor meerdere modelelementen gelijk moeten zijn, omdat er inherent hetzelfde bedoeld wordt. Generalisatie is gedefinieerd voor Datatypen en Objecttypen en Datatypen en gegevensgroeptypen kunnen op meerdere plekken gebruikt worden.

Echter, voor bijvoorbeeld voor een relatiesoort of een attribuutsoort kan het ook nodig zijn om dezelfde naam en/of definitie te specificeren. Dit is mogelijk, maar het is dan niet geheel duidelijk of er hetzelfde bedoeld wordt, of dat de (exacte) overeenkomt in een informatiemodel (zoals bv. in een UML informatiemodel) een toevalligheid is. Daarom gelden de volgende afspraken: 

* Als de **definitie** van twee of meer modelelementen EXACT hetzelfde is, dan wordt hiermee bedoeld dat het dezelfde definitie is. Bijvoorbeeld: attribuutsoort overboeking met _definitie_ "Het bedrag in euro's" en attribuutsoort koopsom met _definitie_ "Het bedrag in euro's".

* Als de **naam** _en_ de **definitie** van twee of meer modelelementen EXACT hetzelfde is, dan wordt hiermee bedoeld dat het hetzelfde kenmerk is. Bijvoorbeeld bij objecttype Huis met attribuutsoort oppervlakte: : "De oppervlakte in hele vierkante meters" en objecttype Appartement met attribuutsoort oppervlakte : "De oppervlakte in hele vierkante meters".

Dit betekent expliciet niet dat kernmerken van verschillende objecten, met dezelfde naam, ook dezelfde definitie moeten hebben. Een andere definitie of een andere naam betekent: niet hetzelfde. 

#### Naamgeving voor Alternatief 1: natuurlijke taal, die dichtbij de gebruiker staat

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

#### Naamgeving voor Alternatief 2: (ook) leesbaar door systemen

Met machine leesbare taal wordt bedoeld dat deze eenvoudig door systemen te
verwerken is. Veelal zijn dit alleen letters en cijfers, zonder spaties, zonder
diakrieten. Koppeltekens (‘-’ of ‘_’) kunnen gebruikt worden, maar dit wordt
veelal vermeden.

Zo kan bijvoorbeeld gekozen worden voor UpperCamelCase voor namen van
Objecttypen, Gegevensgroeptypen en Datatypen en lowerCamelCase voor
attribuutsoorten, relatiesoorten, relatierollen, data-elementen e.d.
Bijvoorbeeld: naam in een NatuurlijkPersoon. Combineer indien nodig
verschillende woorden (uit bijvoorbeeld een begrippenkader of uit een
conceptueel informatiemodel) om precieze en begrijpelijke namen te vormen.

Als er gekozen wordt voor CamelCase, volg hierin dan hoe deze in UML ook
toegepast wordt (deze komt overeen met ISO19103): maak van de beginletter van
ieder deelwoord van namen van attribuutsoorten, relatierollen een hoofdletter,
behalve de beginletter van het eerste woord. Bij namen van objecttypen,
gegevensattributen, keuze, datatypen, en relaties wordt ook de beginletter een
hoofdletter.

Regel: voor logische informatiemodellen wordt altijd alternatief 2 gehanteerd.

Neem aanvullend een verwijzing op naar het betreffende modelelement in het
conceptuele informatiemodel. Dit kan bijvoorbeeld met een trace of door opname van de naam
in de alias (zie 3.16.20), zodat lezers goed de overgang van conceptueel naar
logisch kunnen volgen.

#### Naamgeving voor metamodel elementen

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

### Verwijzing van een modelelement naar een begrip uit het begrippenkader

Het metadata element “begrip” uit paragraaf [Datatypen](#datatypen)
is bedoeld om de traceability tussen een modelelement in een informatiemodel en
een begrip uit een model van begrippen (zoals bedoeld in paragraaf 
[Typen Informatiemodellen](#typen-informatiemodellen)) te borgen. Anders gezegd, 
om aan te geven dát een modelelement een weergave is van het betreffende begrip op 
IM niveau. Anders gezegd, het is niet de bedoeling om te verwijzen naar een begrip als het
modellement hier slechts een beetje mee te maken heeft. De verwijzing geeft aan
dat het model element op informatiemodel niveau een invulling geeft aan het
begrip. Het begrip zelf is opgenomen in een model van begrippen. Aldaar is meer
informatie te vinden over het begrip zelf.

*Aanbeveling*: de verwijzing vanuit het eigen informatiemodel naar een begrip is
altijd een verwijzing naar een begrip dat behoort tot het eigen model van
begrippen. Voor begrippen die domein specifiek zijn is dit altijd zo en zal de
aan URI van het begrip ook te herkennen zijn dat dit zo is. Er zijn echter
situaties denkbaar waarin een begrip een URI heeft die extern is aan het eigen
model van begrippen. Het begrip is dan klaarblijkelijk wel relevant voor het
eigen domein, en behoort daarom dan ook tot het eigen model van begrippen,
ondanks dat de URI extern is. Een externe URI kan bijvoorbeeld wel voorkomen als
het eigen informatiemodel modelelementen uit een ander informatiemodel heeft
overgenomen, zoals bedoeld bij het stereotype «view» of «extern». Of
bijvoorbeeld omdat het begrip weliswaar in gebruik is binnen het eigen domein,
maar ontleent is aan een ander domein c.q. een ander model van begrippen, met
als doel om aan te geven dat de betekenis gelijk is. Dit is mogelijk en
toegestaan. In de praktijk wordt een begrip dat ontleend is van een ander model
van begrippen echter veelal met een eigen URI en een eigen beschrijving
opgenomen in het eigen model van begrippen. Dit komt doordat in het eigen domein
meestal op een eigen manier tegen het begrip wordt aangekeken, of omdat het niet
de bedoeling is dat het eigen model van begrippen automatisch meebeweegt zodra
de definitie uit het andere domein verandert. Merk op dat het MIM niet gaat over
hoe een model van begrippen wordt gemodelleerd.

Het metadata element begrip mag achteraf toegevoegd worden. Het is immers
mogelijk dat bijvoorbeeld het informatiemodel eerder opgesteld wordt dan het
model van begrippen, of dat het initieel niet bekend is wat van een modelelement
het bijbehorende begrip is, of dat een model van begrippen uitgebreid wordt met
een extra begrip. Het criterium om een begrip op te nemen in een model van
begrippen is geen onderdeel van dit metamodel. Het is zelfs mogelijk dat een
modelelement initieel niet als een begrip gezien wordt, maar dat het
modelelement op een gegeven moment zodanig een begrip wordt, dat deze wordt
opgenomen in het model van begrippen. In alle gevallen geldt, neem de metadata
op zodra dit mogelijk is. Als het metadata element begrip wordt weggelaten, of
de metadata die erin op genomen kan worden wordt leeggelaten c.q. de verwijzing
naar het begrip (nog) niet gemaakt kan worden, dan is de betekenis hiervan dat
het niet bekend is of er sprake is van een begrip. Merk op dat het achteraf
toevoegen van de verwijzing naar een begrip in principe niet iets veranderd aan
het informatiemodel zelf (afgezien van deze metadata), al kan dit wel aanleiding
geven tot het verbeteren of verhelderen van definities.

#### Term of URI

In de definitie van metadata begrip staat dat de verwijzing de vorm heeft van
een term of van een URI. - Als je kiest voor een term, vul dan de naam in van
het begrip. Bijvoorbeeld: Natuurlijk persoon. Geef indien mogelijk ook deze naam
een goede plek in de definitie en/of toelichting van het modelelement. - Als je
kiest voor een URI, kies dan voor de URI dat dit begrip identificeert. Deze zal
verwijzen naar een skos:Concept . Dit houdt in dat als iemand naar deze URI gaat
(bijvoorbeeld met een browser, dit wordt “het resolven van een URI” genoemd),
deze persoon informatie krijgt over het betreffende begrip. Bijvoorbeeld:
http://brk.basisregistraties.overheid.nl/id/begrip/Perceel

#### Verwijzen naar 0, 1 of meer begrippen

Veelal betreft één modelelement één begrip . De verwijzing naar dit begrip wordt
dan opgenomen in deze metadata.

Het is echter zeker niet zo dat elk modelelement een begrip is in het model van
begrippen. Het metadata element mag daarom weggelaten worden en de metadata mag
leeggelaten worden. Vaak kan bij objecttypes, gegevensgroepen en
attribuutsoorten wel een verwijzing opgenomen naar een begrip en is dit niet
zinvol bij datatypen, maar dit is geen harde regel. Bijvoorbeeld: een koopsom
van een huis wordt uitgedrukt met een bedrag. In het domein is de koopsom wel
een begrip, maar het modelelement bedrag bijvoorbeeld niet (en als bedrag al
geen begrip is, dan is valuta dit vermoedelijk ook niet, evenals euro, aantal en
Decimaalm). In het geval dat bijvoorbeeld bedrag niet een begrip is, wordt het
metadata element begrip weggelaten.

Bij het opnemen van het begrip streven we ernaar om, waar mogelijk, precies te
zijn. Bijvoorbeeld: het kan zijn dat in het model van begrippen een Natuurlijk
persoon en een Niet natuurlijk persoon zijn opgenomen, terwijl in het
informatiemodel alleen het modelelement Persoon is opgenomen, alsmede een
attribuutsoort ‘type persoon’. De verwijzing naar het begrip Natuurlijk persoon
hoort in dit geval gelegd te worden vanuit het attribuutsoort 'type persoon' en
niet vanuit het objecttype Persoon. Het kan ook zo zijn dat het datatype van
'type persoon' een codelijst is, met als mogelijke waarden ‘NP’ en ‘NNP’ en
‘overig’. Het is dan preciezer om de verwijzing te leggen vanuit de waarde ‘NP’.

#### Definitie van een modelelement en de definitie van een begrip

De definitie van het modelement is niet hetzelfde bedoeld als de definitie van
een begrip. De definitie van een begrip in het begrippenkader is buiten scope
van het informatiemodel, enerzijds omdat deze definitie anders kan zijn dan de
definitie van het modelelement, en anderzijds omdat de definitie van het begrip
aangepast kan worden, terwijl de informatievoorziening die het informatiemodel
implementeert automatisch meebeweegt met deze definitie. Dit gezegd hebbende,
wanneer er sprake is van een 1 op 1 relatie tussen begrip en modelelement, dan
is dit een duidelijke aanleiding om te zorgen dat deze definities goed met
elkaar overeenstemmen, of zelfs hetzelfde gehouden worden, waar mogelijk.

Bij het metadata element definitie van een modelelement mag in de beschrijving
gebruik gemaakt worden van een URI, om te verwijzen naar de nationaal of
internationaal gepubliceerde definitie. Deze kan van een begrip zijn, maar dit
hoeft niet. Let hiermee op wanneer u als beheerder van het informatiemodel deze
definitie niet zelf beheert, want lezers van het informatiemodel en gebruikers
van de informatie baseren zich wel op deze definitie. Het kan dan gebeuren dat
de definitie veranderd, en de informatievoorziening hier niet mee in
overeensteming is. De aanbeveliging is daarom een goede definitie voor het
modelelement te kiezen, en in de metadata een verwijzing op te nemen naar het
begrip en hierna handmatig de overeenstemming tussen de definities te beheren.

### Overig 

#### Volgorde van kenmerken
De volgorde van kenmerken in een objecttype, gegevensgroeptype, gestructureerd datatype in een visueel diagram van een informatiemodel kan voor de leesbaarheid van het diagram worden aangebracht, maar heeft in principe, buiten het diagram, geen betekenis.
