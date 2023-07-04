# Metamodel Algemeen

Dit hoofdstuk beschrijft het metamodel in diagramvorm en in tekst.

Het metamodel beschrijft de modelelementen die worden gebruikt bij het maken van een informatiemodel. Voorbeelden van modelelementen zijn: objecttype, attribuutsoort, relatiesoort, maar denk ook datatypen of aan metagegevens. In de paragrafen hierna worden alle modelelementen beschreven en toegelicht.

Bijvoorbeeld: in de basisregistratie Kadaster wordt een perceel gemodelleerd als een objecttype. De grens van een perceel wordt gemodelleerd als een attribuutsoort. Objecttype en attribuutsoort zijn de modelelementen op metamodel niveau, het perceel en de grens zijn de modelleringen van het informatiemodel niveau. Door 'perceel' een _objecttype_ te noemen en 'begrenzing' een _attribuutsoort_ is het bij elk duidelijk hoe deze geïnterpreteerd moet worden. 

- De eerste paragraaf bevat diagrammen, die kort een overzicht geven van de modelelementen die op metamodel niveau worden onderkend, alsmede hun onderlinge verhouding
- De paragrafen erna bevat de beschrijvingen in tekst van de modelelementen die op metamodel niveau worden onderkend. Wanneer u liever de beschrijvingen eerst leest, kunt u ook met deze paragraaf starten. Dit begint bij [Objecttypen en attribuutsoorten](#objecttypen-en-attribuutsoorten)
- De laatste paragraaf bevat de metagegevens die worden bijgehouden over de modelelementen in een informatiemodel. Dit metamodel geeft aan welke metagegevens er zijn.  

**Uitgangspunten voor het metamodel**

- Elk modelelement heeft een naam en een eigen MIM metaclass, waaraan je het modelelement overal kan herkennen.
- De modelelementen worden eerst uitgelegd zonder een specifieke specificatietaal te
gebruiken. Dit is zodat we hierna kunnen aangeven hoe je het modelelement uitdrukt per specifieke specificatietaal, te weten in UML of in W3C-specificatietechnieken.
- Een toolonafhankelijke beschrijving van het metamodel.
Verder is er, omdat VNG Realisatie, Kadaster en Geonovum en veel andere organisaties Sparx EA
gebruiken, aanvullend aangegeven hoe het metamodel in Enterprise Architect
toegepast wordt. Hierdoor borgen we deze relatie.
- Uniforme toepassing van het metamodel in informatiemodellen. Anders gezegd, uitbreiden mag, afwijken niet,
maak voor hetzelfde doel geen alternatieve constructies.
- Datatypen zijn onderdeel van het metamodel en beschrijven de structuur van de data, maar niet
de semantiek/betekenis. De aanbeveling is dan ook om eerst een informatiemodel
te maken zonder datatypen. De regel is dat als alle datatypen uit het model.
worden weggelaten, er geen semantische betekenis verloren mag gaan.

*Toelichting metaclass*   
Alle modelelementen zijn een metaklasse in het metamodel. Hiermee wordt aangegeven dat het niet een klasse betreft
in een informatiemodel, zoals de klasse Persoon, maar dat het om de classificatie gaat dat de Persoon een Objecttype is,
oftewel dat de klasse Persoon van de metaklasse Objecttype is. Vandaar de term metaclass.

De metaklassen worden ook gebruikt om aan te geven hoe deze zich verhouden tot de metaklassen
van UML en W3C, in de volgende hoofdstukken.

Bij het maken van een informatiemodel modelleer je in feite gewoon met de modelelementen, en geef je aan dat een Persoon een Objecttype is en een geboortedatum een attribuutsoort.  

Hierna volgen eerst diagrammen met de modelelementen, als overzicht. In de paragrafen erna wordt de betekenis van elk van deze modelelementen beschreven, met een definitie en een toelichting en een voorbeeld. Tot slot volgt een paragraaf met metadata die bijgehouden wordt, of kan worden, bij een modelelement.

## Structuur metamodel

Deze paragraaf bevat een overzicht van het metamodel voor informatiemodellen, kortweg MIM, en geeft alle
modelelementen weer. De beschrijving van de modelelementen staat in de volgende paragraaf.

De modelelementen zijn verdeeld over een aantal diagrammen, die elk een eigen
view op een deel van het metamodel tonen. Elk view toont een aantal van de
modelelementen, inclusief hun onderlinge samenhang.

Alle views samen vormen het metamodel als geheel:
- KERN, met de belangrijkste modelelementen in onderlinge samenhang.
- DATATYPEN, met de in het model te onderkennen soorten datatypen.
- OVERIGE modelelementen, die niet altijd aan de orde zijn

Elk modelelement heeft een MIM metaclass met een naam. Hieraan is elk
modelelement te herkennen in alle diagrammen en in de tekst en in elke
specificatietaal die een uitdrukking is van dit metamodel.

Bij de modelelementen zijn in deze diagrammen geen beschrijvende kenmerken opgenomen, de
metagegevens zoals naam, definitie enzovoorts. In de diagrammen in de bijlage zijn deze wel
opgenomen.

### Kern

View 1: De kern van een informatiemodel. Deze bestaat uit de volgende modelelementen:

| **MIM metaclass** |
|-------------------|
| Objecttype        |
| Attribuutsoort    |
| Gegevensgroep     |
| Gegevensgroeptype |
| Generalisatie     |
| Relatiesoort      |
| Relatieklasse     |
| Relatierol        |
| Relatierol doel   |
| Datatypen         |

De betekenis van deze modelelementen en de beschrijvingen ervan staat in [Objecttypen en attribuutsoorten](#Objecttypen-en-attribuutsoorten) en in [Relaties](#Relaties) en in [Datatypen](#datatypen-0).

In diagramvorm:

<figure id="KernZonderUML">
  <img src="media/KernZonderUML.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Kern zonder Metagegevens

De verbindingen tussen de modelelementen geven aan welke combinaties kunnen voorkomen op metamodelniveau, oftewel welke modelelementen in een informatiemodel met elkaar gecombineerd kunnen worden. Bijvoorbeeld:
- Een objecttype kan verbonden worden met een attribuutsoort. In een informatiemodel kan je attribuutsoorten dus aan een objecttype toekennen. Een attribuutsoort kan in het informatiemodel vervolgens weer als type een datatype krijgen.
- Een objecttype kan verbonden worden met een relatiesoort en deze relatiesoort kan weer verbonden worden met een objecttype. Dit geeft aan dat de relatiesoort een modelelement is dat twee objecttypen met elkaar verbindt. Een objecttype kan dus *niet* rechtstreeks verbonden worden met een ander objecttype.
- Een objecttype kan verbonden worden met een gegevensgroep en deze gegevensgroep kan weer verbonden worden met een gegevensgroeptype. Een objecttype kan dus *niet* rechtstreeks verbonden worden met een gegevensgroeptype. In een informatiemodel is een gegevensgroep een eigenschap van het objecttype en kan je aangeven dat deze gegevensgroep als type een gegevensgroeptype heeft.


### Datatypen

View 2: Datatypen. De verschillende soorten datatypen en bijbehorende modelelementen:

| **MIM metaclass**       |
|-------------------------|
| Primitief datatype      |
| Gestructureerd datatype |
| Data element            |
| Enumeratie              |
| Enumeratiewaarde        |
| Referentielijst         |
| Referentie element      |
| Codelijst               |

De betekenis van deze modelelementen en de beschrijvingen ervan staan in [Datatypen](#datatypen-1) en in [Waardelijsten](#waardelijsten).

In diagramvorm:

<figure id="DatatypenZonderUML">
  <img src="media/DatatypenZonderUML.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: Datatypen zonder Metagegevens

### Overige

View 3a: constraint en keuze.

| **MIM metaclass** |
|-------------------|
| Constraint        |
| Keuze             |

De betekenis van deze modelelementen en de beschrijvingen ervan staan in [Overige modelelementen](#Overige-modelelementen)

In diagram vorm:
<figure id="ConstraintsZonderUML">
  <img src="media/ConstraintsZonderUML.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: Constraint

**Keuze**

Er zijn vier situaties/use cases waarin een keuze toegepast wordt:

Beschrijving: [Keuze](#keuze)

Keuze tussen:
- Use case 1: een keuze tussen datatypen
- Use case 2: een keuze tussen 2 of meer attribuutsoorten
- Use case 3: een keuze tussen meerdere manieren om 1 betekenisvol attribuutsoort in te vullen
- Use case 4: een keuze tussen relatiedoelen, als nadere invulling van 1 betekenisvolle relatiesoort

Voor elk geldt een eigen subset van het metamodel.

Merk op dat een keuze tussen relatiesoorten ook een mogelijke keuze is, maar deze is vooralsnog niet uitgewerkt en daarom nog niet opgenomen in deze versie.

In diagramvorm:

*Use case 1: Keuze tussen datatypen*

Dit diagram is uitgewerkt voor Objecttype. Voor Gegevensgroeptype en Relatieklasse geldt hetzelfde patroon.

1 attribuutsoort heeft normaal 1 datatype. Als er sprake is van een keuze, dan is het attribuutsoort gekoppeld met een keuze en de keuze geeft 2 of meer datatypen aan.

<figure id="KeuzeDatatype1">
  <img src="media/KeuzeDatatype1.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: Keuze tussen datatypen

*Use case 2: Keuze tussen 2 of meer attribuutsoorten*

Dit diagram is uitgewerkt voor Objecttype. Voor Gegevensgroeptype en Relatieklasse geldt hetzelfde patroon.

Een objecttype of gegevensgroep kan normaal een attribuutsoort hebben met een datatype (de lijn links onder). Als een objecttype meerdere op zichzelf staande attribuutsoorten heeft en er sprake is van een keuze tussen een aantal van deze attribuutsoorten, dan is het objecttype gekoppeld met een keuze (de lijn links boven) en de keuze geeft 2 of meer attribuutsoorten aan (met elk een eigen datatype).

<figure id="KeuzeAttribuutsoort2">
  <img src="media/KeuzeAttribuutsoort2.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: Keuze tussen attribuutsoorten. Patroon geldt ook voor Gegevensgroeptype en Relatieklasse

*Use case 3: Keuze tussen meerdere manieren om 1 betekenisvol attribuutsoort in te vullen*

Dit diagram is uitgewerkt voor Objecttype. Voor Gegevensgroeptype en Relatieklasse geldt hetzelfde patroon.

Een objecttype of gegevensgroep kan normaal een attribuutsoort hebben met een datatype (de lijn links). Als er sprake is van een attribuutsoort die op meerdere manieren ingevuld kan worden met een keuze hiertussen, dan is het attribuutsoort niet gekoppeld met een datatype, maar dan is het attribuutsoort gekoppeld met een keuze en de keuze geeft 2 of meer attribuutsoorten aan (met elk een eigen datatype).

<figure id="KeuzeAttribuutsoort3">
  <img src="media/KeuzeAttribuutsoort3.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: Keuze tussen attribuutsoorten binnen een attribuutsoort. Patroon geldt ook voor Gegevensgroeptype en Relatieklasse

*Use case 4: Keuze tussen relatiedoelen, als nadere invulling van 1 betekenisvolle relatiesoort*

Dit diagram is uitgewerkt voor Objecttype. Voor Gegevensgroeptype geldt hetzelfde patroon, behalve dat een Gegevensgroeptype geen doel mag zijn van een Relatiesoort.

Een objecttype of gegevensgroep kan normaal een relatiesoort hebben, die gekoppeld is aan een objecttype. Als er sprake is van een relatiesoort met een keuze, dan is het relatiedoel van de relatiesoort niet gekoppeld aan 1 objecttype, maar dan is het objecttype gekoppeld aan een keuze en deze keuze geeft 2 of meer relatiedoelen aan.

<figure id="KeuzeRelatiedoel4">
  <img src="media/KeuzeRelatiedoel4.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: Keuze tussen relatiedoelen. Patroon geldt ook voor Gegevensgroeptype, behalve dat een Gegevensgroeptype geen doel mag zijn van een Relatiesoort.

*Relatierol*

View 3b: Relatiesoort en relatierol

| **MIM metaclass**     |
|-----------------------|
| Relatierol (abstract) |
| Relatierol bron       |
| Relatierol doel       |

In diagramvorm:

<figure id="AssociatierollenZonderUml">
  <img src="media/AssociatierollenZonderUml.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: Relatierol

*Externe koppeling*

View 3c: Externe koppelingen. Deze bestaat uit de volgende modelelementen:

| **MIM metaclass** |
|-------------------|
| Externe koppeling |

In diagramvorm:

*Groepering*

View 3d: Groepering. Deze bestaat uit de volgende modelelementen:


| **MIM metaclass** |
|-------------------|
| Informatiemodel   |
| Domein            |
| Extern            |
| View              |

De betekenis van deze modelelementen en de beschrijvingen ervan staan in [Packages](#packages).

In diagramvorm:

<figure id="PackageZonderUml">
  <img src="media/PackageZonderUml.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>

Diagram: groepering

## Modelelementen

### Objecttypen en attribuutsoorten  
In deze paragraaf staan alle modelelementen gespecificeerd die gebruikt worden bij
het maken van een informatiemodel. Bij elk modelelement is een definitie en een toelichting opgenomen.

Voordat het modelelement objecttype gedefinieerd wordt, en andere modelelementen,
wordt eerst beschreven wat objecten en gegevens zijn en hoe deze zich verhouden tot modelelementen.

**Object en gegeven**

Een objecttype is een groep van gelijksoortige objecten. Zo zijn `Jan` en `Katrien` allebei objecten die gelijksoortig zijn en beide getypeerd kunnen worden als `persoon`. Het zijn allebei personen, oftewel het objecttype van beiden is `Persoon`. In het informatiemodel nemen we `Persoon` op met behulp van het modelelement `Objecttype`.

Diagram: [Kern](#kern)

Om duidelijk(er) te maken wat wordt bedoeld kijken we eerst naar het begrip ‘object’.

**Object**

>   **Definitie Object**  
>   Een ding, een tastbaar iets, in de werkelijkheid, zoals daarnaar gekeken
>   wordt vanuit een bepaald domein.

NB. **Een object is geen modelelement** in een informatiemodel. Die worden aangeduid met het MIM-stereotype [«Objecttype»](#objecttype).

*Toelichting:* Met in de werkelijkheid wordt bedoeld dat het om de daadwerkelijke onderwerpen van gesprek gaat, de verzameling van de concrete tastbare dingen waarover we het hebben. Bijvoorbeeld, de persoon Jan, Paleis 't Loo. Het wordt veelal als niet politiek correct beschouwd mensen als objecten te zien. In dit kader, de informatievoorziening, beschouwen we evenwel natuurlijke en niet-natuurlijke personen wel als objecten. ‘Tastbaar’ moet hierbij ruim geïnterpreteerd worden. Het gaat niet alleen om fysiek herkenbare objecten zoals auto’s, gebouwen en mensen, ook om zogenaamde virtuele objecten waarover binnen het domein door betrokkenen gecommuniceerd wordt zoals kadastrale percelen, (maatschappelijke) activiteiten en processen. Hoe een ‘tastbaar iets’ als een object beschouwd wordt, hangt af van het domein waarvoor dat ‘tastbaar iets’ relevant is. Zo wordt de gebouwde omgeving in het ene domein beschouwd als een verzameling gebouwen terwijl een ander domein daarin panden onderscheidt. Een object is voor een domein relevant als eigenschappen (kenmerken) daarvan van belang zijn voor het functioneren van dat domein.

**Gegeven**

Een object heeft kenmerken waarover gegevens bekend zijn.

>   **Definitie Gegeven**  
>   De betekenisvolle formulering van een waargenomen feit, waaraan een waarde
>   kan worden toegekend.

NB. **Een gegeven is geen modelelement in een informatiemodel**.

*Toelichting:*

Voorbeelden van gegevens zijn de waardes ‘Jan’ en ‘1-1-1970’ betreffende de naam en de geboortedatum van een object van het type Persoon. Een informatiemodel specificeert niet de gegevens zelf. Een gegeven zoals '1-1-1970' noemen we een attribuut van Jan. In het informatiemodel wordt dit het attribuutsoort 'geboortedatum' of 'overlijdensdatum' van een objecttype Persoon. Merk op dat een gegeven ‘1-1-1970’ zonder duidelijkheid over het soort gegeven c.q. het attribuutsoort 'geboortedatum' of 'overlijdensdatum' geen informatie biedt.

Gegevens zijn de objectief waarneembare neerslag of registratie van feiten op een bepaald medium, zodanig dat deze gegevens uitgewisseld en voor langere tijd bewaard kunnen worden. Dat kan op papier, in digitale vorm, et cetera. Met deze gegevens wordt een model (een selectief deel dus) van de werkelijkheid vastgelegd in de tijd. Ofschoon de werkelijkheid nooit stilstaat, kan deze door het vastleggen van de gegevens toch worden bevroren. 
Het waargenomen feit dat twee objecten een relatie hebben wordt ook gezien als een gegeven.

#### Objecttype

>   **Definitie Objecttype**  
>   De typering van een groep objecten die binnen een
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

De objecten die in het beschouwde domein onderkend worden zijn zelf nooit abstract. Ze behoren altijd tot een concreet objecttype, en niet tot een abstract objecttype. Abstracte objecttypes worden wel gebruikt in de modellering, om generalisaties aan te duiden en de definitie. Zo kan bij het objecttype Pand bijvoorbeeld aangegeven worden dat dit een 'Element in de fysieke leefomgeving' is, en dat deze laatste als een abstract objecttype gezien moet worden (in ons domein). Meer over abstracte objecttypes is beschreven in [Abstracte objecttypes en concrete objecten](#abstracte-objecttypes-en-concrete-objecten).  

#### Attribuutsoort  

Een attribuutsoort is de metaklasse waarmee kenmerken van een objecttype worden vastgelegd. Het zijn de kenmerken waarvoor gegevens worden bijgehouden.  
Voordat we attribuutsoort definiëren kijken we eerst naar het begrip ‘gegeven’.

>   **Definitie Attribuutsoort**  
>   De typering van gelijksoortige gegevens die voor een objecttype van
>   toepassing is.

*Toelichting*
De gegevens Jan en Katrien worden als gelijksoortig gezien en worden daarom ondergebracht in attribuutsoort 'naam'.
Je kan ook zeggen, het objecttype Persoon heeft een attribuutsoort 'naam' en deze is geschikt om gegevens in te plaatsen.

Aan elk objecttype worden nul, één of meer Attribuutsoorten toegekend. In een informatiemodel
worden alleen voor het domein relevante attribuutsoorten opgenomen bij een objecttype.

Attribuutsoorten worden ook wel kenmerken of eigenschappen genoemd. Dit zijn het ook, maar er zijn
andere kenmerken, zo is een relatiesoort ook een kenmerk of eigenschap.  

#### Gegevensgroep

>   **Definitie Gegevensgroep**  
>   Een typering van een groep van gelijksoortige gegevens die voor een
>   objecttype van toepassing is.

*Toelichting:* Dit modelelement verzorgt de modelmatige aankoppeling van een
gegevensgroeptype aan het objecttype waartoe een gegevensgroeptype onlosmakelijk
behoort.

De groep van gegevens is een kenmerk van een object. De gegevensgroep is een
betekenisvol kenmerk van een objecttype. De gegevensgroep heeft altijd als type
een gegevensgroeptype.

#### Gegevensgroeptype

>   **Definitie Gegevensgroeptype**  
>   Een groep van met elkaar samenhangende attribuutsoorten. Een
>   gegevensgroeptype is altijd een type van een gegevensgroep.

*Toelichting:* De attribuutsoorten van het gegevensgroeptype zijn semantisch
gezien eigenschappen van het objecttype. Echter, vanwege samenhangend gedrag (ze
horen semantisch bij elkaar, ze wijzigen bijvoorbeeld gelijktijdig e.d.) zijn
deze ondergebracht in een apart modelelement. Het onderbrengen van
attribuutsoorten in een groep c.q. in het modelelement gegevensgroeptype, is een
modelleerkeuze, het is niet perse noodzakelijk. Wanneer deze ondergebracht worden in een
gegevensgroeptype dan zijn/blijven het afzonderlijke kenmerken van het object en
dus attribuutsoorten van het objecttype, maar dan ondergebracht in een
gegevensgroeptype. De gegevensgroep als geheel wordt daarom expliciet niet
gezien als zijnde één attribuutsoort van een object.

*Toelichting:* bijvoorbeeld: in de BRK heeft een schip een motor en de motor en de motor heeft een aantal eigenschappen. De BRK beschouwt een persoon als eigenaar van een schip, er kunnen geen afzonderlijke eigenaren zijn van elk van de motoren van een schip. In de BRK kan het eigendom van een Motor dan ook niet worden overgedragen aan een ander persoon. Een motor wordt daarom gezien als een eigenschap van het object schip, en omdat de motor meerdere eigenschappen heeft, worden deze ondergebracht in een gegevensgroeptype. In een ander informatiemodel, zoals van een motorfabriek, zou de Motor wel een objecttype kunnen zijn, omdat het daar wel hét onderwerp van gesprek is.

Een gegevensgroeptype is meestal het type van slechts één gegevensgroep, omdat
de semantiek meestal exclusief is voor één objecttype. Echter, hergebruik is
mogelijk (als de semantiek niet exclusief is voor één objecttype). Voorwaarde
voor hergebruik is dat de definitie (de definitie en toelichting, inclusief alle
metadata aspecten) dan inderdaad gelijk zijn, voor alle objecttypes die
hergebruik maken van het gegevensgroeptype.

Een gegevensgroeptype kan, naast attribuutsoorten en relatiesoorten, ook zelf weer gegevensgroeptypen
bevatten.

Een gegevensgroeptype is verbonden met een objecttype, via het modelelement
Gegevensgroep.

### Relaties

Verbanden met betekenis, die gelegd zijn tussen modelelementen van het type
objecttype naar het type objecttype, of van een gegevensgroeptype naar een
objecttype.

Diagram: [Kern](#kern)

#### Generalisatie

>   **Definitie Generalisatie tussen objecttypes**  
>   De typering van het hiërarchische verband tussen een meer generiek en een
>   meer specifiek modelelement van hetzelfde soort, waarbij het meer specifieke
>   modelelement eigenschappen van het meer generieke modelelement overerft. Dit
>   verband is alleen gedefinieerd voor objecttypen en datatypen.

*Toelichting:*

Generalisatie tussen objecttypes:

Een generalisatierelatie geeft aan dat bepaalde eigenschappen van een objecttype
(vaak attribuutsoorten en/of relatiesoorten) ook gelden voor de gerelateerde
objecttypen, én dat deze qua semantiek, structuur en syntax gelijk zijn. We
spreken dan van een supertype met subtypen. De modelelementen die generiek
gelden worden in een generiek objecttype, het supertype, gemodelleerd en deze
worden overerft door elk subtype (minimaal twee) die de generalisatie relatie
legt naar dit generieke objecttype.

Generalisatie tussen datatypen:

Het meer specifieke datatype brengt een verbijzondering aan in de vorm van een
meer restrictieve definitie, of een meer restrictief patroon/formeel patroon.

Het andere datatype is bijvoorbeeld een CharacterString, Integer, GM Surface of
DMO en dient als basis voor een zelf te definiëren datatype (zie [Datatype zelf
definiëren](#datatype-zelf-definieren)), zoals een CharacterString Postcode, of
een NietNegatiefGetal.

Deze generalisatie is van toepassing op de volgende datatypen: «Primitief
datatype», «Gestructureerd datatype», «Referentielijst», «Codelijst»,
«Enumeratie».

Meervoudige overerving of multiple-inheritance:

Een subtype kan meerdere objecttypen als generalisatie hebben. In het diagram [Kern](#kern) is dit aangegeven door een Objecttype als subtype naar o..* Generalisaties te laten verwijzen. Dat impliceert dat een subtype 0..* supertypen kan hebben.



#### Relatiesoort

>   **Definitie Relatiesoort**  
>   De typering van het structurele verband tussen een object van een objecttype
>   en een (ander) object van een ander (of hetzelfde) objecttype.

*Toelichting:* Objecten hebben eigenschappen die gemodelleerd kunnen worden met
attribuutsoorten maar ook met relatiesoorten naar andere objecttypen. Relatiesoort is de metaklasse waarmee deze eigenschappen worden beschreven. Als het
voor het desbetreffende domein van belang is om die eigenschap te modelleren als
onderdeel van een ander objecttype, dan maakt de relatiesoort die eigenschap
beschikbaar voor het eerstgenoemde objecttype. Bijvoorbeeld, een attribuutsoort
van het objecttype PERSOON zou kunnen zijn ‘Naam geregistreerd partner’ (naast
de attribuutsoort ‘Naam’ van PERSOON). De naam van de geregistreerde partner
komt evenwel ook beschikbaar met een relatiesoort van PERSOON naar PERSOON:
“heeft geregistreerd partnerschap met”. Zie ook het eerder genoemde voorbeeld
van SCHIP en MOTOR.

Wanneer een relatie gebruikt wordt om objecten aan elkaar te verbinden, zonder
dat er eigenschappen over deze relatie worden vastgelegd, dan betreft dit de
MIM-metaclass «Relatiesoort».

#### Relatieklasse

>   **Definitie Relatieklasse**  
>   Een relatiesoort met eigenschappen.

*Toelichting:* De relatieklasse geeft aan dat er een relatie is tussen twee
objecten, waarbij er gegevens over deze relatie vastgelegd moeten worden. De
relatie wordt in dit geval behandeld als een object, met gegevens. De gegevens
over de relatie bestaan alleen zolang de relatie tussen beide objecten bestaat
en zolang elk van beide objecten zelf (nog) bestaan.

*Opmerking*: de gegevens van de relatie worden voor één relatie vastgelegd en
niet voor meerdere relaties tegelijk. Als dit laatste het geval is, dan worden
de gegevens vastgelegd in een «Objecttype». Een CONTRACT kan bijvoorbeeld ook
een afspraak zijn tussen twee óf méér SUBJECTen, waarbij de gegevens van de
relatie voor alle betrokken objecten hetzelfde zijn. CONTRACT wordt dan
gemodelleerd als objecttype, waarbij beschreven wordt wat er moet gebeuren
wanneer één van de SUBJECTen niet meer bestaat.

#### Externe Koppeling

>   **Definitie Externe koppeling**  
>   Een associatie waarmee vanuit het perspectief van het eigen informatiemodel
>   een objecttype uit het ‘eigen’ informatiemodel gekoppeld wordt aan een
>   objecttype van een extern informatiemodel. De relatie zelf hoort bij het
>   ‘eigen’ objecttype.

*Toelichting:*  
Hiermee wordt aangegeven dat er een relatie ligt naar een informatiemodel van een ander domein.
Dit kan rechtstreeks zijn, maar het is ook mogelijk om het objecttype van een ander domein
over te nemen naar het eigen domein, en specifiek te maken voor hoe je deze informatie ziet
vanuit je eigen domein (dit laatste noemen we ook wel een [View](#view).

Zie [Koppelen met een ander informatiemodel](#koppelen-met-een-ander-informatiemodel-externe-koppeling).


#### Relatierol

>   **Definitie Relatierol**  
>   De benaming van de manier waarop een object deelneemt aan een relatie met
>   een ander object.

*Toelichting:* Met relatie wordt in deze de volgende bedoeld: *«Relatiesoort»*,
*«Relatieklasse»* of *«Externe koppeling»*. Voor *«*Generalisatie*»* speelt het
niet. Een relatie heeft een bron kant, die de eigenaar is van de relatie, en
is gericht naar de doel kant. De relatierol kan aan beide kanten een naam en
een definitie krijgen.

>   **Definitie Relatierol bron**  
>   De relatierol die de rol beschrijft van de bron van de relatie.

>   **Definitie Relatierol doel**  
>   De relatierol die de rol beschrijft van het doel van de relatie.


### Waardelijsten

Een datatype waarvan de mogelijke waarden zijn opgesomd in een lijst. De waarde
van een attribuutsoort moet één van de waarden zijn uit de gespecificeerde
waardenlijst.

#### Referentielijst

>   **Definitie Referentielijst**  
>   De representatie van een lijst met een opsomming van de mogelijke domeinwaarden van een
>   attribuutsoort, die buiten het model in een externe waardenlijst worden
>   beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd
>   aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel
>   aangepast wordt (in tegenstelling tot bij een enumeratie).
>   De representatie bevat een aantal kenmerken, die overgenomen zijn van de specificatie van de externe waardelijst.

*Toelichting:*
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

>   **Definitie Referentie element**  
>   Een eigenschap van een object in een referentielijst in de vorm van een gegeven.

*Toelichting:*
Een referentie element kan uniek zijn, zoals een code, en is dan op zichzelf
geschikt om gebruikt te worden als referentie (zoals bedoeld in de definitie van
Referentielijst). Bij het referentie element kan een definitie en toelichting worden opgenomen, die aangeven hoe de externe waardelijst in het eigen informatiemodel gebruikt wordt.

#### Enumeratie

>   **Definitie Enumeratie**  
>   Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een statische lijst.

*Toelichting:* In de registratie krijgt een attribuut één van deze waarden. De
lijst is een statische lijst met constanten (meerdere attributen, zoals bij een
referentielijst, zijn nooit aan de orde).

#### Enumeratiewaarde

>   **Definitie Enumeratiewaarde**  
>   Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant gegeven.

*Toelichting:*
De waarde van de data zelf. Bijvoorbeeld: Plein, Brug, Spoor, M (man).  
Alleen deze waarde mag gebruiken worden.


#### Codelijst

>   **Definitie Codelijst**  
>   De representatie van een lijst met een opsomming van de mogelijke domeinwaarden van een
>   attribuutsoort, die buiten het model in een externe waardenlijst worden
>   beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd
>   aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel
>   aangepast wordt (in tegenstelling tot bij een enumeratie).
>   De representatie bevat geen kenmerken, voor alle kenmerken wordt verwezen naar de specificatie van de externe waardelijst.

*Toelichting:* Zowel referentielijsten als codelijsten zijn in feite
waardenlijsten. In tegenstelling echter tot de referentielijst wordt een
codelijst *niet* in het informatiemodel beschreven, omdat de definitie en
semantiek geheel in de externe waardenlijst staat en niet (nader) geduid hoeft
te worden in het informatiemodel zelf. Een codelijst heeft in het informatiemodel
daarom geen attributen (en zou voor de definitie alleen hoeven te refereren naar
de definitie bij de extern gepubliceerde waardenlijst, maar voor het gemak is de
definitie wel opgenomen als metagegeven in dit metamodel). De extern
gepubliceerde waardenlijst bevat, naast gewone attributen, ook altijd één
specifiek attribuut, met daarin de domeinwaarden die gebruikt mogen/moeten
worden in de registratie. In het gebruik is een Codelijst daarom analoog aan een
Enumeratie. Welk specifiek attribuut dit is en wat de betekenis daarvan is staat
in de codelijst zelf gedefinieerd.


### Datatypen

>   **Definitie Datatype**  
>   Een beschrijving van de structuur waaraan een waarde, oftewel de data zelf, aan moet voldoen.

*Toelichting:* Zie ook [Objecttypen en attribuutsoorten](#objecttypen-en-attribuutsoorten).
Bij elke «Attribuutsoort» wordt gespecificeerd aan welk datatype de data c.q. de
waarde die hiervoor vastgelegd wordt moet voldoen. Het datatype wordt gebruikt
als type van een attribuutsoort.

Datatypen zijn veelal op vele plekken (her)bruikbaar en kunnen daarom gespecificeerd
worden bij diverse «Attribuutsoort»-en.

Diagram: [Datatypen](#datatypen)

#### Primitief datatype

>   **Definitie Primitief datatype**  
>   Een primitief datatype is een datatype met een eenvoudige basisstructuur, oftewel enkelvoudig en zonder gelaagdheid.

*Toelichting:* Een primitief datatype is een datatype zonder verdere
specificatie over de structuur. Dit datatype is enkelvoudig, oftewel niet
samengesteld en wordt ook wel simpel datatype genoemd. Dit datatype kent daarom
zelf geen eigen modelelementen zoals een «Data element». Ook is er geen sprake van een gelaagdheid, ook wel nesting genoemd. Een primitief datatype kan wel een patroon of formeel patroon hebben, die een nadere restrictie legt.

Een primitief datatype kan een standaard datatype zijn, zoals CharacterString, Integer enz. Het metamodel volgt hierbij de definities zoals beschreven in de ISO standaarden (zie
§3.1).
* Deze datatypen hebben altijd al een naam en definitie gekregen vanuit deze standaarden en deze worden gebruikt.
* Deze datatypen hebben geen MIM metaclass.

Een primitief datatype kan ook in het eigen informatiemodel zelf gedefinieerd zijn, zoals bijvoorbeeld een primitief datatype AN: een alfanumerieke CharacterString conform de MES-1 specificatie (oftewel zonder bijzondere karakters zoals een smiley en zonder bijzondere tekens uit niet Europese talen).
* Dit is een zelf gedefinieerde variant die als basis een van de voorgaande standaard datatypen heeft, zoals CharacterString. Dit standaard datatype moet eenduidig aangegeven worden (zie generalisatie bij datatypen, of door in een extensie aan te geven wat de default is, bv. CharacterString).
* Hierbij hoort de MIM metaclass gespecificeerd te worden: `primitief datatype`.

Een informatiemodel definieert zelf datatypen als er behoefte is aan een datatype dat
eenmalig gedefinieerd wordt en op meerdere plekken in het model gebruikt moet
kunnen worden met altijd exact dezelfde structuur en waardenbereik (zie ook
‘patroon’ in [Domeinwaarden of lijsten](#domeinwaarden-of-lijsten)). Dit
datatype, met een eigen naam, wordt vervolgens gebruikt als type van een
attribuutsoort.

NB: Wanneer het datatype Postcode landelijk zodanig beschikbaar is gemaakt zodat
hier gebruik van gemaakt kan worden in het model, middels een verwijzing, dan hoeft Postcode niet meer
in het eigen model opgenomen te worden.

#### Gestructureerd datatype

>   **Definitie Gestructureerd datatype**  
>   Specifiek benoemd datatype dat de structuur van een gegeven beschrijft,
>   samengesteld uit minimaal twee elementen die in samenhang betekenisvol zijn.

*Toelichting:*

De waarde van het attribuutsoort verkoopprijs met gestructureerd datatype bedrag
is uitgedrukt in een combinatie van een som en valuta zoals 35 euro. De
introductie van één datatype Bedrag, uitgedrukt in som en valuta, legt dus vast
dat som en valuta onlosmakelijk met elkaar zijn verbonden.

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

#### Data element

>   **Definitie Data element**  
>   Een onderdeel/element van een Gestructureerd datatype die als type een datatype heeft.

*Toelichting:* Het data element is een eigenschap van een Gestructureerd
datatype en beschrijft de structuur van een gegeven. Het is niet een eigenschap
van een object en niet hetzelfde als een attribuutsoort.

Het data element beschrijft in combinatie met andere data-elementen de structuur
van een gegeven en heeft zelf een datatype. Dit datatype is meestal een
primitief datatype.

### Packages

>   **Definitie Package**  
>   Een package is een benoemde en begrensde verzameling/groepering van modelelementen.

Er zijn verschillende modelelementen van het type package:
- Informatiemodel
- Domein
- Extern
- View

In een informatiemodel package mogen alleen domein of view packages opgenomen worden. Beide kunnen meertallig voorkomen en de volgorde is hierbij niet van belang. Een extern package bevindt zich buiten het package informatiemodel.

In een domein, view of extern package mogen de volgende MIM-elementen worden opgenomen:

- Objecttype
- Gegevensgroeptype
- Datatype (alle varianten)
- Relatieklasse
- Keuze

De volgorde is hierbij niet van belang.

De verschillende package-typen worden hier beneden uitgelegd.

#### Informatiemodel

>   **Definitie Informatiemodel**  
>   De groepering van alle modelelementen waaruit het informatiemodel is opgebouwd. Het informatiemodel als geheel.

*Toelichting:*
Het informatiemodel is een package, te weten het hoofdpackage van het informatiemodel, waar alle
subpackages die een informatiemodel beschrijven onder vallen, zoals Domein en View en extern.
Het informatiemodel wordt verder beschreven met metadata, zoals de aanduiding van het domein wat in het informatiemodel is gemodelleerd. Het is gangbaar om de naam van het informatiemodel te beginnen met IM, maar dit is niet verplicht.    

<aside class='example'>
    Voorbeeld: IMKAD, of IMBAGLV. Elk van deze is een naam van een informatiemodel.
</aside>

#### Domein
Een informatiemodel kan onderverdeeld worden in meerdere packages, waarbij aangegeven wordt dat
deze de modellering van de informatie van het domein bevatten.

>   **Definitie Domein**  
>   Een groepering van constructies die een semantisch samenhangend gedeelte van
>   een informatiemodel beschrijven.

*Toelichting:*
Een domein package bevat de modelelementen waaruit een informatiemodel is samengesteld, zoals het objecttype Persoon en het objecttype Nummeraanduiding en de relatiesoort woonadres. Een informatiemodel is het hoofdpackage, en kent een aantal domein packages als subpackage. Er zijn meerdere soorten packages. Om onderscheid te maken tussen packages waarin het domein gemodelleerd is, en andere packages, heeft dit modelelement de naam Domein gekregen. Je zou ook kunnen zeggen, het informatiemodel bestaat uit de volgende subdomeinen.

<aside class='example'>
    Voorbeeld: Recht, of Stukken. De BRK houdt deze domeininformatie in aparte packages apart bij, voor het overzicht, en om de packages afzonderlijke te kunnen aanpassen, zonder impact op de andere packages.     
</aside>


#### Extern

>   **Definitie Extern**  
>   Een groepering van constructies die een externe instantie beheert en
>   beschikbaar stelt aan een informatiemodel en die in het informatiemodel
>   ongewijzigd gebruikt worden.

<aside class='example'>
    Voorbeeld: het Externe package NEN3610 met datatype NEN3610ID. Het datatype van
    attribuutsoort Identificatie wegdeel in RSGB verwijst naar het datatype
    NEN3610ID zoals opgenomen in het Externe package.
</aside>

#### View

>   **Definitie View**  
>   Een groepering van objecttypen die gespecificeerd zijn in een extern
>   informatiemodel en vanuit het perspectief van het eigen informatiemodel
>   inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het
>   eigen informatiemodel.

<aside class='example'>
    IMKAD-BRP. Een aantal van de gegevens uit de basisregistratie personen (BRP) zijn relevant voor de basisregistratie Kadaster. Deze relevante subset is door de beheerder van IMKAD ondergebracht in de view IMKAD-BRP. Vanuit modelleringsperspectief wordt dit
    gezien als een view.
</aside>

### Overige modelelementen

Diagram: [Overige](#overige)

#### Constraint

>   **Definitie Constraint**  
>   Een constraint is een conditie of een beperking, die over een of meerdere
>   modelelementen uit het informatiemodel geldt.

*Toelichting:* Een constraint kan vastgelegd worden bij alle modelelementen. Echter, meestal
komt een constraint voor bij een objecttype, om te aan te geven dat de
constraint geldt voor 2 (of meer) eigenschappen van een objecttype, of om een
bijzondere specificatie toe te voegen die niet via de bestaande modelelementen gelegd kan worden zoals een 11-proef.

Een constraint wordt altijd in gewone tekst omschreven en kan optioneel als formele specificatie worden aangegeven.

#### Keuze

Een *Keuze* is een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.

*Toelichting:* Er kan altijd maar één van de mogelijkheden gekozen worden. De keuze is voor een aantal use cases een alternatieve manier voor het modelleren van een constraint.

Een *Keuze* kan op meerdere plekken gebruikt worden, en maakt het mogelijk waar in het metamodel normaal gesproken maar één mogelijkheid bestaat, een opsomming te geven van meerdere mogelijkheden, waarbij in een concreet geval altijd precies één van deze mogelijkheden wordt gebruikt.

Een belangrijk voordeel van deze modellering is dat de kardinaliteiten zuiver gehouden kunnen worden. Anders gezegd, er kan mee voorkomen worden dat een kardinaliteit van bijvoorbeeld twee kenmerken eerst optioneel gemaakt moet worden en dat hierna via een constraint deze toch weer verplicht gemaakt moeten worden, voor precies één van de mogelijkheden. Het is aan de modelleur om te kiezen voor een constraint of een Keuze.

Dit document beschrijft een aantal use cases waarin het modelleren met een *Keuze* van toegevoegde waarde is. Zonder een dergelijke modelconstructie zou het nodig moeten zijn om met een expliciete constraint de keuze aan te geven.

Bij de use cases gaat het over meerdere kenmerken, waartussen een keuze gemaakt moet worden omdat er van precies 1 sprake is/mag zijn. Dit is in MIM een keuze tussen twee (of meer) modelelementen. In de verzamelingenleer noemen we dit een XOR situatie. Hierbij is het vooral van belang dat er als gevolg van de modellering van een keuze in plaats van constraint er geen nieuwe kenmerken mogen ontstaan en ook geen kenmerken mogen wegvallen. De kenmerken van het object blijven gelijk.

**Use case 1: een keuze tussen datatypen**  
Een objecttype heeft een attribuutsoort en het datatype hiervan is ofwel datatype D1 ofwel datatype D2. In MIM modelleren we daarom 1  attribuutsoort met als datatype een keuze tussen het datatype D1 en het datatype D2. Het maken van deze keuze is verplicht.

<aside class='example'>
Voorbeeld: *Attribuutsoort* geometrie als kenmerk van een objecttype. Dit is een keuze uit *Datatype* Line of *Datatype* Polygon. De opsomming van beide keuzemogelijkheden noemen we de *Keuze* LineOrPolygon. De aanhaking aan het attribuutsoort geometrie gebeurt door aan te geven dat LineOrPolygon het type is van geometrie.
</aside>

In dit voorbeeld vormt LineOrPolygon de *Keuze* als geheel. De datatypen zelf zijn de keuze mogelijkheden, maar blijven in de modellering van de metaclass datatype en behoren in deze zin niet tot de modellering van de metaclass keuze.  

Het is niet de bedoeling om twee attribuutsoorten te modelleren met elk een datatype en de attribuutsoorten optioneel te maken.

Zonder de mogelijkheid van keuze, zou je te maken krijgen met twee attribuutsoorten met bijbehorend datatype. Echter, in dat geval mogen de attribuutsoorten niet dezelfde naam hebben, aangezien deze bij hetzelfde objecttype horen. Ook zou de kardinaliteit niet kloppen: die zou dan [0..1] moeten worden, maar dat doet geen recht aan het feit dat er één verplicht aanwezig moet zijn, en er ook geen twee naast elkaar mogen zijn. De werkelijke kardinaliteit is [1..1].


**Use case 2: een keuze tussen 2 of meer attribuutsoorten**  
Er is sprake van ofwel attribuutsoort A1 ofwel attribuutsoort A2. In MIM modelleren we daarom een keuze tussen de 2 attribuutsoorten A1 en A2. Het maken van deze keuze is verplicht.

<aside class='example'>
Voorbeeld: bij een objecttype "Betalingsopdracht" moet naast het bedrag ook een betalingskenmerk worden opgenomen of een omschrijving. Eén van beide moet worden ingevuld. Het is niet toegestaan dat beide velden worden ingevuld.
</aside>

We modelleren daarom een *Keuze* 'BetalingskenmerkOfOmschrijving' met daarin een *Attribuutsoort* betalingskenmerk en een *Attribuutsoort* omschrijving.

Het is bij deze use case niet de bedoeling om een derde attribuutsoort, zoals BetalingskenmerkOfOmschrijving, te introduceren als attribuutsoort van het objecttype. De aanhaking van de *Keuze* 'BetalingskenmerkOfOmschrijving' is daarom aan het objecttype.

In dit voorbeeld vormt BetalingskenmerkOfOmschrijving en de aanhaking ervan op het objecttype de *Keuze* als geheel. De attribuutsoorten zelf zijn de keuze mogelijkheden, maar blijven in de modellering van de metaclass attribuutsoort en behoren in deze zin niet tot de modellering van de metaclass keuze.  

Zonder de mogelijkheid van keuze zouden beide attribuutsoorten opgenomen zijn bij het objecttype als optionele velden, met een constraint dat een van beide gevuld moet zijn. Nadeel hiervan is dat de kardinaliteit dan niet erg duidelijk gemodelleerd is: die zou dan voor beide attribuutsoorten [0..1] moeten worden, maar dat doet geen recht aan het feit dat er één verplicht aanwezig moet zijn, en er ook geen twee naast elkaar mogen zijn. De werkelijke kardinaliteit voor een gekozen attribuutsoort is [1..1]. Met een constraint is dit te specificeren en derhalve ook op zich wel correct te modelleren, maar met een modellering van een keuze is dit veel duidelijker.


**Use case 3: een keuze tussen meerdere manieren om invulling te geven aan 1 betekenisvol attribuutsoort van een objecttype**  
Er is sprake van ofwel attribuutsoort A0 en aanvullend hierbij een keuze tussen ofwel attribuutsoort A1 ofwel attribuutsoort A2. In MIM modelleren we daarom voor A1 en A2 een keuze tussen de 2 attribuutsoorten. Het maken van deze keuze is verplicht.

<aside class='example'>
Bij een objecttype "Betalingsopdracht" moet een bedrag en een *beschrijving* worden opgenomen. Deze beschrijving heeft betekenis voor het objecttype, als eigenschap. Verder moet er voor de beschrijving aanvullend een keuze worden gemaakt tussen een *beschrijving in de vorm van een betalingskenmerk* OF een *beschrijving in de vorm van een omschrijving*. Beide worden (ook) gezien als attribuutsoorten. Het is niet toegestaan dat beide velden worden ingevuld: alleen een betalingskenmerk, of alleen een omschrijving.
</aside>

We modelleren daarom een *Keuze* 'BetalingskenmerkOfOmschrijving' met daarin een *Attribuutsoort* betalingskenmerk en een *Attribuutsoort* omschrijving. Het is bij deze use case niet de bedoeling om het attribuutsoort beschrijving kwijt te raken in de modellering. De aanhaking van de *Keuze* 'BetalingskenmerkOfOmschrijving' is daarom aan het **attribuutsoort**. De aanhaking aan het attribuutsoort beschrijving gebeurt door aan te geven dat BetalingskenmerkOfOmschrijving het type is van beschrijving.

In dit voorbeeld vormt BetalingskenmerkOfOmschrijving de *Keuze* als geheel. De attribuutsoorten zelf zijn de keuze mogelijkheden, maar blijven in de modellering van de metaclass attribuutsoort en behoren in deze zin niet tot de modellering van de metaclass keuze.  

*Opmerking: use case 2 en 3 zijn voor een groot deel overeenkomstig. De overeenkomst is dat de keuze tussen de twee attribuutsoorten betalingskenmerk en omschrijving hetzelfde gemodelleerd wordt, als een keuze, met bijvoorbeeld de naam BetalingskemerkOfOmschrijving. Het verschil zit in de aanhaking.*


**Use case 4: een keuze tussen relatiedoelen, als nadere invulling van een betekenisvolle relatiesoort van een objecttype**  
Er is sprake van een relatiesoort R0 en aanvullend hierbij een keuze tussen relatiedoel D1 of relatiedoel D2. In MIM modelleren we daarom een keuze tussen de 2 relatiedoelen D1 en D2. Het maken van deze keuze is verplicht.

<aside class='example'>
Voorbeeld: een objecttype "Vervoermiddel" heeft een eigenaar. Dit kan een persoon zijn, of een bedrijf, maar niet beiden. Er is sprake van één eigenaar" en een keuze tussen relatiedoel persoon (naar objecttype Persoon) en relatiedoel bedrijf (naar objecttype Bedrijf). We modelleren daarom 1 *Relatiesoort* eigenaar en aanvullend met een *Keuze* EigenaarKeuze met twee relatiedoelen, een naar persoon en een naar bedrijf.  
</aside>

Het is bij deze use case niet de bedoeling om twee nieuwe relatiesoorten, eigenaar_persoon en eigenaar_bedrijf, te introduceren en al zeker niet om de relatiesoort eigenaar kwijt te raken. We modelleren daarom 1 relatiesoort met de naam eigenaar en een *Keuze* tussen relatiedoelen.

<figure id="relatiedoelkeuze">
  <img src="media/relatiedoelkeuze.png" alt="" />
  <figcaption>[BIJSCHRIFT OPNEMEN]</figcaption>
</figure>


Diagram: Voorbeeld van keuze tussen relatiedoelen uitgewerkt in een UML diagram.

In het voorbeeld vormen EigenaarKeuze en de twee relatiedoelen tezamen de keuze als geheel. De relatiedoelen zelf zijn de keuze mogelijkheden. De modellering van de relatiesoort eigenaar blijft hetzelfde en behoort niet tot de modellering van de metaclass keuze.   

## Specificatie metagegevens

Bij de modelelementen in een informatiemodel kunnen metagegevens, zoals 'naam' van het modelelement, of 'datum opname' van het modelelement, worden bijgehouden. Dit zijn geen eigenschappen van een object en worden daarom niet als bijvoorbeeld een attribuutsoort van een objecttype gemodelleerd. In de volgende paragrafen worden de metagegevens in tekst beschreven. Bij elk metagegeven is de definitie opgenomen, een toelichting en de toepassing ervan bij modelelementen. In [bijlage 6.1.2](#modelelementen-en-metagegevens-als-diagram) is de koppeling tussen metagegevens en de modelelementen beschreven door middel van UML diagrammen. Er is daarin ook opgenomen of ze verplicht of optioneel zijn. In [paragraaf 2.9](#toegestane-waarden-voor-bepaalde-metagegevens) is het waardebereik en defaultwaarden voor een aantal metagegevens opgenomen.

### Informatiemodel - metagegevens

We onderkennen een aantal specifieke metagegevens op het niveau van het informatiemodel zelf. Deze staan beschreven in deze paragaaf.   

#### Metagegeven: **Informatiedomein**

>   **Definitie Informatiedomein**  
>   Aanduiding van het functionele domein waartoe het informatiemodel behoort.

*Toelichting* Bijvoorbeeld: BRK. Wanneer bepaalde definities of identificaties van het informatiemodel in de wereld niet uniek zijn, omdat een ander informatiemodel dezelfde naam hanteert voor een modelelement, of eenzelfde structuur voor een identificerende eigenschap, dan is het mogelijk om deze uniek te maken met behulp van deze aanduiding.   

*Toepassing*: informatiemodel (verplicht)

#### Metagegeven: **Informatiemodel type**

>   **Definitie Informatiemodel type**  
>   De beschrijving van de aard van het informatiemodel, hoe het geïnterpreteerd
>   moet worden.

*Toelichting*
Dit kan zijn: "conceptueel" of "logisch". Zoals bedoeld in: [Typen Informatiemodellen](#typen-informatiemodellen). Er moet een keuze gemaakt worden.

Dit kan bijvoorbeeld uitgebreid worden met: "technisch" wanneer er behoefte is om niveau 4 aan te geven.

*Toepassing*: informatiemodel (verplicht)

#### Metagegeven: **Relatiemodelleringstype**

>   **Definitie Relatiemodelleringstype**  
>   Aanduiding van een in MIM gedefinieerd alternatief voor een
>   modelleringswijze, en welke keuze hierbij is gemaakt.

*Toelichting*
Dit kan zijn "Relatiesoort leidend" of "Relatierol leidend". Dit
betreft de keuze die je maakt voor het in paragraaf [Alternatieven](#alternatieven) gekozen
alternatief. Er moet een keuze gemaakt worden. Deze keuze geldt primair voor de modelelementen relatiesoort en relatiedoel zoals bedoeld in 3.2.2. maar geldt in het verlengde hiervan voor het modelelement externe koppeling.

*Toepassing*: informatiemodel (verplicht)

#### Metagegeven: **MIM versie**

>   **Definitie MIM versie**  
>   De versie van de MIM specificatie die gebruikt is om het informatiemodel in
>   uit te drukken.

*Toelichting* Neem hiervoor een door MIM in gebruik zijnde MIM-versie.
Kies bij voorkeur een zo recent mogelijke versie.

Bijvoorbeeld: 1.0.1 of 1.1 of 1.1.1

*Toepassing*: informatiemodel (verplicht)

#### Metagegeven: **MIM extensie**

>   **Definitie MIM extensie**  
>   De aanduiding van een extensie op MIM.

*Toelichting* Dit metagegeven is optioneel en alleen van toepassing als er sprake is van een extensie zoals bedoeld in
[Een eigen extensie](#een-eigen-extensie-op-het-metamodel).

Neem hiervoor een in gebruik zijnde extensie.

Bijvoorbeeld: Kadaster of NEN3610:2020

*Toepassing*: informatiemodel (optioneel)

#### Metagegeven: **MIM taal**

>   **Definitie MIM taal**  
>   De aanduiding van de taal die gebruikt is voor de modelelementen.

*Toelichting* Bijvoorbeeld: NL, EN

*Toepassing*: informatiemodel (optioneel)

### Modelelementen - metagegevens

We onderkennen een aantal specifieke metagegevens op het niveau van de modelelementen waarmee
een informatiemodel wordt samengesteld. Deze staan beschreven in deze paragaaf.    

Zo is er de *naam* van het modelelement, bijvoorbeeld
het objecttype met als *naam* Pand en een bijbehorende *definitie*, of de *Datum
opname* van het modelelement in het informatiemodel, bijvoorbeeld 1-1-2012.

Welke metagegevens verplicht zijn per modelelement en welke niet staat beschreven
in het diagram in [Metagegevens per modelelement](#modelelementen-en-metagegevens-als-diagram).
Dit diagram is een onderdeel van de specificatie.

Elk modelelement kent een eigen set van metagegevens, die bepaalde aspecten van het
modelelement specificeren. Metagegevens kunnen dus verplicht zijn en kunnen optioneel zijn.
Zo is een definitie altijd verplicht voor elk modelelement die de betekenis van
gegevens omschrijft, zoals een attribuutsoort of relatiesoort, maar ook voor
het objecttype die de context hiervan is. Bij de meeste datatypen is de definitie
daarentegen optioneel, deze worden alleen ingevuld indien nodig.

Merk op dat een aantal van deze metagegevens al meegenomen worden in een
specificatietaal. Bijvoorbeeld het objecttype met de naam Pand wordt in UML gemodelleerd als
‘*Named element’* met als ‘*Name’* Pand (in UML 1.4 heette dit nog UML-Class, met een property ‘*Name’*).

Een aantal andere metagegevens, zoals de eerder genoemde *Datum opname* met
waarde 1-1-2012. worden als aparte data vastgelegd, in UML gebeurt dit in een
‘*Tagged value*’. In Linked data gebeurt dit met een ‘*owl:DatatypeProperty*’.

Merk op, de metadata aspecten zijn specifiek voor elk modelelement apart. Dus
als er in H2.2 sprake is van een generalisatie, dan worden deze metadata niet
overerft (en de ingevulde waardes worden uiteraard zeker niet overerft). De MIM
metaclass Referentielijst erft dus geen metagegevens, zoals patroon, van MIM metaclass
Datatype.

Voor de eenduidigheid zijn een aantal metagegevens verplicht gemaakt om te
voorkomen dat het onduidelijk is wat een niet ingevulde waarde betekent.
De betekenis hoort te zijn: 'niet aan de orde', wat zo is bij optionele gegevens.
Wat iets anders is dan: 'nog niet ingevuld', 'zie default waarde', of 'onbekend'.

Hieronder volgen eerst de algemene metagegevens. Dit zijn metagegevens zoals
*Naam*, *Definitie* en *Populatie* met een definitie en een toelichting.
In de paragrafen hierna wordt vervolgens naar deze paragraaf
verwezen. Specifieke metagegevens die maar één keer voorkomen zijn bij het
modelelement zelf beschreven en zijn niet opgenomen in deze algemene lijst.


#### Metagegeven: **Naam**

>   **Definitie Naam**  
>   De naam van een modelelement.

*Toelichting*

Bijvoorbeeld: Pand is de naam van het modelelement objecttype, bouwjaar is de
naam van het modelelement attribuutsoort. De modelelementen zijn limitatief
opgesomd in het hoofdstuk [Betekenis modelelementen](#betekenis-modelelementen).  
(en eventueel zijn in een uitbreiding extra modelelementen limitatief opgesomd).

*Toepassing*: alle modelelementen.


#### Metagegeven: **Alias**

>   **Definitie Alias**  
>   De weergave van de naam van een modelelement in natuurlijke taal (niet technisch).

*Toelichting*

Als de naam van iets wat in het informatiemodel gemodelleerd wordt spaties, diakrieten of verbindingstreepjes bevat, zoals een objecttype 'Onroerende zaak' of een attribuutsoort 'geïnspireerd op', dan kan er gekozen worden om deze naam in het informatiemodel zo op te schrijven dat hier in de techniek makkelijker mee te werken is. Denk aan: 'geinspireerd op' (geen diakrieten) of 'OnroerendeZaak' (camelcase notatiewijze). Wanneer de originele schrijfwijze in natuurlijke taal van belang is kan deze worden opgenomen in het metagegeven alias.

Het is niet de bedoeling om (andersom) in de alias de technische makkelijkere naam op te nemen.

De alias wordt ook gebruikt voor een alternatieve weergave van een enumeratie waarde. De ‘naam’ betreft hier een daadwerkelijk waarde, zoals 'Nederlands', waarin de naam gelijk staat aan de waarde en dit moet zo blijven, maar als er sprake is van een voor documentatie doeleinden bedoelde codering van deze enumeratie waarde dan kan deze code in de alias worden opgenomen.

Toepassing: objecttype, attribuutsoort, gegevensgroep, relatiesoort, relatierol, relatieklasse, externe koppeling, keuze, enumeratie, primitief datatype, gestructureerd datatype, dataelement en expliciet niet voor packages, enumeratiewaarde, en constraint.

Opmerking: een uitzondering is gemaakt voor UML modellen voor de UML-EnumerationLiteral.
De ‘naam’ betreft hier een daadwerkelijk waarde, waarin
de naam gelijk staat aan de waarde. Het is daarom expliciet ongewenst om
hiervoor een _alias_ te gebruiken. De alias wordt hier, mede
daarom, gebruikt voor (alleen) de modellering van het metadata aspect Code,
welke aanvullend is op naam (niet een alternatief van naam).

#### Metagegeven: **Begrip**

>   **Definitie Begrip**  
>   Verwijzing naar een begrip, vanuit een modelelement, waarmee wordt
>   aangegeven op welk begrip, of begrippen, het informatiemodel element is
>   gebaseerd. De verwijzing heeft de vorm van een term of een URI.

*Toelichting*

Hiermee wordt aangegeven hoe een informatiemodel element zich verhoudt tot de
begrippen uit het begrippenkader, zoals genoemd in paragraaf [Typen Informatiemodellen](#typen-informatiemodellen).
Dit is niet een 1 op 1 relatie. Voor meer informatie hierover, zie hoofdstuk [Afspraken & Regels](#afspraken-regels).

Bijvoorbeeld: Perceel of
http://brk.basisregistraties.overheid.nl/id/begrip/Perceel

*Toepassing*: alle modelelementen met een naam, met uitzondering van packages en
constraint.


#### Metagegeven: **Herkomst**

>   **Definitie Herkomst**  
>   De registratie of het informatiemodel waaraan het modelelement ontleend is
>   dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is.

*Toelichting*

Bijvoorbeeld: de herkomst van het kenmerk *begrenzing* van een Perceel heeft als
waarde: ‘BRK’. BRK staat dan bijvoorbeeld in de bijbehorende documentatie
uitgelegd als: de basisregistratie Kadaster.

Er wordt expliciet niet bedoeld van welke informatievoorziening of registratie
de *data* is overgenomen. Het gaat er bij dit metagegeven expliciet om uit welk
domein of bron het **modelelement** zijn herkomst vindt. Voor basisregistraties is
de herkomst altijd het eigen informatiemodel. Dit metagegeven is vooral van
belang als het modelelement is overgenomen uit een ander informatiemodel.

Bijvoorbeeld: de herkomst van het kenmerk *woonadres*, wat bijvoorbeeld een
«Relatiesoort» is van een Persoon in de basisregistratie Personen naar een
Nummeraanduiding in de basisregistratie Adressen en Gebouwen (BAG), heeft als
herkomst: ‘BRP’ (de basisregistratie Kadaster). Dit kenmerk *woonadres* wordt
bijgehouden in de BRP en de bron kant van de relatie zit in de BRP. De
Nummeraanduiding zelf heeft in de BAG veelal als herkomst: BAG. Mochten echter
de adresgegevens niet (direct of indirect) uit de BAG komen, maar bijvoorbeeld
via een eigen inwinningsproces in een eigen registratie worden bijgehouden, dan
de herkomst niet de BAG.

Deze definitie omvat ook de definitie van herkomst van de stelselcatalogus (De
registratie in wiens catalogus het objecttype is gespecificeerd (oftewel de
registratie waar het objecttype deel van uitmaakt). Deze specificatie is
toegevoegd omdat het wel duidelijk moet zijn in welke (basis)registratie of
informatiemodel het objecttype).

*Toepassing*: alle modelelementen.

#### Metagegeven: **Definitie**

>   **Definitie Definitie**  
>   De beschrijving van de betekenis van dit modelelement.

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
Dergelijke definities kunnen hetzelfde zijn, of op het moment hetzelfde, of
verschillend, of aanvullend op elkaar. Het is aan de beheerder van het
informatiemodel om hier zorgvuldig mee om te gaan).

*Toepassing*: alle modelelementen.

#### Metagegeven: **Herkomst definitie**

>   **Definitie Herkomst definitie**  
>   De registratie of het informatiemodel waaruit de **definitie** is
>   overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de
>   definitie is samengesteld.

*Toelichting*

Meestal staat in dit metagegeven aangegeven 'mijn IM', bijvoorbeeld BRK als
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

#### Metagegeven: **Toelichting**

>   **Definitie Toelichting**  
>   Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding.

*Toelichting*

Bijvoorbeeld: een aantal treffende voorbeelden (waardes) van het kenmerk van het
object of een aanduiding van wat er niet onder de definitie valt.

Het is niet de bedoeling om andere metagegevens in de toelichting op te nemen, zoals populatie of begrip.

De toelichting is op zichzelf helder en te begrijpen en is gericht op de betekenis
van gegevens en/of de context van deze gegevens. De toelichting is niet gericht op
de inwinning van de gegevens maar beschrijft de betekenis van hetgeen wat ingewonnen
is, zodat het voor de gebruikers van de gegevens helder is wat de betekenis ervan is.
Het is daarom niet de bedoeling om inwinregels of veelgestelde vragen zelf in de
toelichting op te nemen. Uiteraard is het wel goed om kennis die in de inwinregels
en antwoorden "verborgen" zit een plek te geven in de toelichting.

*Toepassing*: alle modelelementen die het metagegeven **definitie** kennen.

#### Metagegeven: **Datum opname**

>   **Definitie Datum opname**  
>   De datum waarop het modelelement is opgenomen in het informatiemodel.

*Toelichting*

Bijvoorbeeld: 1-1-2012.

*Toepassing*: alle modelelementen, uitgezonderd datatype elementen, packages en
overig.

#### Metagegeven: **Identificerend**

>   **Definitie Identificerend**  
>	Een aanduiding dat een kenmerk of een combinatie van kenmerken van een
>	objecttype uniek identificerend is voor alle objecten in de populatie van
>	objecten van dit objecttype, of de aanduiding dat een referentie element
>	uniek identificerend is voor alle lijst items in een referentielijst.

Toelichting: objecten hebben, of krijgen, in een administratie of gegevensvoorziening vaak één identificerend kenmerk. Het kan ook zijn dat een aantal kenmerken in combinatie identificerend zijn, zoals twee attribuutsoorten of een attribuutsoort en een relatiesoort. De combinatie met een relatiesoort wordt alleen gedaan voor objecttypes die zelf geen unieke aanduiding hebben en daarom deze moeten samenstellen met de unieke aanduiding van een gerelateerde objecttype.

Referentielijsten is het enige type waardelijst die dit metagegeven kan hebben, omdat de enumeratie zelf identificerend is en de uniek identificerende code van een codelijst zich buiten het informatiemodel bevindt.

Toepassing: attribuutsoort, alle relaties (relatiesoort, relatierol, relatieklasse, externe koppeling), referentie element.

#### Metagegeven: **Indicatie materiële historie**

>   **Definitie Indicatie materiele historie**  
>   Indicatie of de materiële historie van het kenmerk van het object te
>   bevragen is.

*Toelichting*

Bijvoorbeeld: Ja.

Met te bevragen wordt bedoeld, er wordt historie bijgehouden
op enerlei wijze, welke op enerlei wijze te bevragen is.

Dit metagegeven is alleen betekenisvol voor kenmerken waarvoor data wordt bijgehouden.

De in te vullen waarde komt uit: zie [Tagged values en waardenbereik tagged
values](#toegestane-waarden-voor-bepaalde-metadata-gegevens)

Materiële historie geeft aan wanneer een verandering is opgetreden in de werkelijkheid die heeft
geleid tot verandering van de attribuutwaarde. Verdere toelichting,
zie het hoofdstuk [Afspraken & Regels](#afspraken-regels)

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype, waarvoor data kan worden bijgehouden: attribuutsoort en relaties (relatiesoort of relatiedoel, relatieklasse, externe koppeling).

#### Metagegeven: **Indicatie formele historie**

>   **Definitie Indicatie formele historie**  
>   Indicatie of de formele historie van het kenmerk van het object
>   bijgehouden wordt en te bevragen is.

*Toelichting*

Bijvoorbeeld: Nee.

Met te bevragen wordt bedoeld, er wordt historie bijgehouden
op enerlei wijze, welke op enerlei wijze te bevragen is.

Dit metagegeven is alleen betekenisvol voor kenmerken waarvoor data wordt bijgehouden.

De in te vullen waarde komt uit: zie [Tagged values en waardenbereik tagged
values](#toegestane-waarden-voor-bepaalde-metadata-gegevens)

Formele historie geeft aan wanneer in de administratie een verandering bekend
is, en is verwerkt. Verdere toelichting, zie het hoofdstuk [Afspraken &Regels](#afspraken-regels).

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype waarvoor data kan worden bijgehouden: attribuutsoort en relaties (relatiesoort of relatiedoel, relatieklasse, externe koppeling).

#### Metagegeven: **Kardinaliteit**

>   **Definitie Kardinaliteit**  
>   De kardinaliteit geeft aan hoeveel keer waarden van dit kenmerk van een
>   object kunnen voorkomen bij een object van het betreffende objecttype.

*Toelichting*

1 : een object heeft altijd dit kenmerk. Bijvoorbeeld: geboortedatum persoon.

1..\*: een object heeft altijd dit kenmerk, het kenmerk kan meerdere malen
voorkomen. Bijvoorbeeld: aantal hoofdstukken in een boek (in dit domein is dat
er altijd minimaal 1).

0..1: is soms niet beschikbaar. Bijvoorbeeld: tussenvoegsel achternaam.

0..\*: is niet altijd beschikbaar, kan meerdere malen voorkomen.  
Bijvoorbeeld: verblijfsobjecten die gelegen zijn in een pand (garagebox 0, huis
1, flat \*).

Andere getallen dan 0, 1 en * zijn ook toegestaan, bijvoorbeeld 2 .. * of 0 .. 2
De notatie van * verschilt per modelleertaal. Met * wordt bedoeld, veel of vele (niet nader gespecificeerd maar bijvoorbeeld 10 of 100 is toegestaan).

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

Een generalisatie is een bijzondere vorm van een relatie. De kardinaliteit van de bron en van het doel is hier altijd en per definitie 1..1. Dit hoeft daarom nooit via een aanduiding van een kardinaliteit te worden aangegeven.

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype.

#### Metagegeven: **Kardinaliteit relatie bron**

>   **Definitie Kardinaliteit relatie bron**  
De kardinaliteit relatie bron geeft bij een relatiesoort aan hoeveel instanties van het bron objecttype in een relatie met één instantie van het doel objecttype verbonden kunnen zijn.

Voorbeeld: een verblijfsobject ligt in een pand. De eigenaar van de relatie is het verblijfsobject (de bron van de relatie) en het doel van de relatie is een pand.

- De kardinaliteit van het doel van de relatie geeft aan: in hoeveel panden kan 1 verblijfsobject liggen. Antwoord: 1..*
- De kardinaliteit van de bron geeft aan: hoeveel verblijfsobjecten kunnen er in 1 pand liggen. Antwoord: 0..*

Deze kardinaliteit is vooral nuttig voor controles, deze komt op data niveau echter (meestal) niet terug omdat relaties in MIM gericht zijn.  

*Toelichting*

De kardinaliteit van de bron van de relatie geeft aan hoeveel instanties van de bron van de relatie kunnen verwijzen naar één instantie van het doel van de relatie. Wanneer de kardinaliteit aan de bronkant van de relatie niet is gespecificeerd dan is er geen sprake van een defaultwaarde.

Toepassing: relatiesoort, externe koppeling en relatieklasse

#### Metagegeven: **Authentiek**

>   **Definitie Authentiek**  
>   Aanduiding of het kenmerk een authentiek gegeven betreft.

*Toelichting*

Bijvoorbeeld: Authentiek, Basisgegeven, Landelijk kerngegeven, Gemeentelijk
kerngegeven, Overig.

Authentiek is van toepassing voor bijvoorbeeld het burger service nummer van een
natuurlijk persoon. In de wet van bijvoorbeeld een basisregistratie ligt vast
welke gegevens authentiek zijn. Een kenmerk is authentiek indien de juistheid
(hoogwaardige kwaliteit) van het gegeven gewaarborgd wordt via formele
inwinningsprocessen en wettelijk regelingen. Authentieke gegevens moeten door
alle overheidsinstellingen verplicht en zonder nader onderzoek, worden gebruikt
bij de uitvoering van publiekrechtelijke taken.

De in te vullen waarde komt uit: zie [Tagged values en waardenbereik tagged
values](#toegestane-waarden-voor-bepaalde-metadata-gegevens)

*Toepassing*: alle modelelementen die een kenmerk (kunnen) zijn van een
objecttype.

#### Metagegeven: **Indicatie afleidbaar**

>   **Definitie Indicatie afleidbaar**  
>   Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of
>   relatiesoorten.

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

#### Metagegeven: **Indicatie classificerend**

>   **Definitie Indicatie classificerend**  
>   Indicatie dat een attribuutsoort het objecttype waar het bij hoort classificeert in (sub)typen.

*Toelichting*

Een objecttype kan middels een attribuutsoort geclassificeerd worden in subtypen.
Bijvoorbeeld: type gebouw. Een toren, kerk, bunker, zwembad zijn allemaal typen gebouwen.
In een model op niveau 2 kunnen dergelijke typen als objecttypen en specialisaties van het
objecttype gebouw zijn gemodelleerd. Met name op niveau 3 kan het relevant zijn om deze informatie
daadwerkelijk te structureren door expliciet een aspect op te nemen waarmee direct
het type gebouw kan worden vastgelegd, los van de modellering van objecttypen.

Praktisch gezien kan vervolgens gekozen worden om de onderliggende objecttypen niet meer in het model
op te nemen, en slechts dit aspect op te nemen. Ook kan, in combinatie met **indicatie afleidbaar**
dit aspect afgeleid worden uit het meest concrete objecttype, indien dergelijke objecttypen wel zijn gemodelleerd.

De in te vullen waarde komt uit: zie [Tagged values en waardenbereik tagged
values](#toegestane-waarden-voor-bepaalde-metadata-gegevens)

*Toepassing*: attribuutsoort.

#### Metagegeven: **Mogelijk geen waarde**

>   **Definitie Mogelijk geen waarde**  
>   Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat
>   onduidelijk is of de waarde er werkelijk ook niet is.

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

#### Metagegeven: **Bron**

>   **Definitie Bron**  
>   Aanduiding van het bronobject in een relatie tussen objecten. Een bronobject
>   heeft middels een relatiesoort een relatie met een doelobject.

*Toelichting*

Bijvoorbeeld: een persoon heeft een postadres. Het postadres is een kenmerk van
een persoon. De persoon is in deze het bronobject van de relatie. Het postadres
is de naam van het kenmerk c.q. de relatie tussen een persoon en een adres en
geeft betekenis aan deze relatie. Het adres is er gewoon en wie hem allemaal
gebruikt als adres en of dit als postadres is of als woonadres of nog iets
anders is voor het adres niet van belang.

*Toepassing*: relaties, oftewel de modelelementen Relatiesoort en Externe
koppeling.

#### Metagegeven: **Doel**

>   **Definitie Doel**  
>   Aanduiding van het gerelateerde objecttype die het eindpunt van de relatie
>   aangeeft. Naar objecten van dit objecttype wordt verwezen.

*Toelichting*

Bijvoorbeeld: een persoon heeft een postadres. Het postadres is de naam van de
relatie tussen een persoon en een adres. Het adres is het doel van deze relatie.

Dit metagegeven wordt vaak ook relatiedoel genoemd (Engels: target).   

*Toepassing*: relaties, oftewel de modelelementen Relatiesoort en Externe
koppeling.

#### Metagegeven: **Unidirectioneel**

>   **Definitie Unidirectioneel**  
>   De richting van een relatie, welke betekenis geeft aan de relatie vanuit het
>   perspectief van de eigenaar van de relatie.

*Toelichting*

Bijvoorbeeld: een persoon heeft een postadres. De richting van de relatie is van
persoon naar adres. De eigenaar van de relatie (de bron) heeft kennis van de
het gerelateerde objecttype (het doel). In een modelleertaal wordt dit vaak
aangegeven met een pijl. De pijl heeft als vertrekpunt de bron en heeft als
pijlpunt, waar de relatie naar wijst, het gerelateerde objecttype. Alle relaties
zijn altijd gericht van het objecttype (bron) naar het gerelateerde objecttype
(doel).

Het is gebruikelijk om een richting aan te geven, enerzijds omdat de betekenis
van A naar B een andere is dan van B naar A, anderzijds omdat het van belang is
bij welke objecttype het kenmerk wordt bijgehouden, oftewel wie de eigenaar is.

*Toepassing*: relaties, oftewel de modelelementen Relatiesoort en Externe
koppeling.

#### Metagegeven: **Aggregatietype**

>   **Definitie Aggregatietype**  
>   Aanduiding of het objecttype die de eigenaar is van een relatie het doel van
>   relatie ziet als een samen te voegen onderdeel die bij het objecttype hoort.

*Toelichting* Bijvoorbeeld: een auto heeft verschillende onderdelen, waaronder
een motor. In het informatiemodel gaat het vooral om de auto en is de motor
alleen relevant vanuit het perspectief van dat het een onderdeel is van de auto.

De aggregatie is in de basis een relatie en het aggregratietype geeft aanvullend hierop extra informatie.

Standaard is er bij een relatie geen sprake van een aggregatie, (aggregatietype "Geen").
Er is dan sprake van een relatie tussen objecten van beide objecttypes,
en deze kan conditioneel zijn, maar de objecten worden gezien als dat ze zelfstandig
bestaansrecht hebben en daarnaast ook een relatie met elkaar hebben en verder niets.

Als er wel sprake is van een aggregatie, dan geeft het aggregratietype aan dat het objecttype die doel is van
de relatie, in functionele zin en in aanvulling op de relatie zelf, ook een onderdeel (component)
is van het objecttype die de eigenaar is van de relatie. De eigenaar geeft hierbij aan hoe de
aggregatie in gezien moet worden. Dit kan zijn:

- 'Compositie' (Engels: composite): het doel object is een integraal onderdeel van het eigenaar object
en dit onderdeel wordt niet gedeeld met anderen. De eigenaar is volledig verantwoordelijk voor het beheer
van de bijhouding van informatie over het onderdeel. Als de eigenaar vervalt, dan vervallen automatisch
ook de onderdelen mee. Het doel object kan als onderdeel niet zelfstandig bestaan: het doel vervalt als de eigenaar vervalt.
Wel kan je een onderdeel vervangen met behoud van het eigenaar object.
- 'Gedeeld' (Engels: shared): het onderdeel kan gebruikt en gedeeld worden door meerdere eigenaren.
Bijvoorbeeld: een betaalrekening.

*Toepassing*: relaties, oftewel de modelelementen Relatiesoort en Externe
koppeling.

#### Metagegeven: **Locatie**

>   **Definitie Locatie**  
>   Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de
>   locatie waar deze te vinden is opgegeven.

*Toelichting*

Indien mogelijk is de verwijzing een URI of een URL (als er geen URI is, dan kan
dit een URL zijn, waar de waardenlijst op basis van de naam van de waardenlijst
te vinden is).

Bijvoorbeeld: 'http://www.organisatie.nl/schemas/waardelijsten/NaamWaardelijst'

*Toepassing*: de modelelementen die een waardelijst zijn.

#### Metagegeven: **Doelformaat**

>   **Definitie Doelformaat**  
Het fomaat waarin een waardelijst is gepubliceerd.

*Toelichting*

Voor de hand liggende formaten waarin een waardelijst is gepubliceerd zijn onder andere SKOS en CSV.

*Toepassing:* Codelijst

#### Metagegeven: **Datatype**

>   **Definitie Datatype**  
Datatype van de waarden in een waardelijst

*Toelichting*

Voorbeelden hiervan zijn characterstring , integer

*Toepassing:* Codelijst

#### Metagegeven: **Waarde item**

>   **Definitie Waarde item**  
Het item (of element) van de lijst dat de waarde representeert.

*Toelichting*

Als een Codelijst een structuur heeft wordt hiermee aangegeven welke item in de codelijst de waarde representeert.

*Toepassing:* Codelijst

#### Metagegeven: **Profielspecificatie**

>   **Definitie Profielspecificatie**  
Referentie naar het profiel dat de technische implementatie van de codelijst beschrijft.

*Toelichting*

Mogelijk is er een profielspecificatie die de specifieke technische toepassing van de codelijst beschrijft. Bij voorkeur is de referentie door middel van een url.

*Toepassing:* Codelijst

#### Metagegeven: **Type** (domein van een waarde een gegeven)

>   **Definitie Type**  
>   Het datatype waarmee waarden van dit modelelement worden vastgelegd.

*Toelichting*

Bijvoorbeeld: het type van het kenmerk geometrie is het datatype VlakOfMultivlak, het type van het kenmerk achternaam is het datatype CharacterString

Een attribuutsoort heeft een datatype voor de specificatie van het toegestane
waardetype. Hetzelfde geldt voor een data element, een referentie element en
keuze elementen.

Dit is altijd conform een datatype uit dit metamodel (of een extensie ervan) of
een primitief datatype die extern is aan dit model. Betreft het een waarde uit
een dynamische waardentabel, dan wordt de naam van de desbetreffende
referentielijst of codelijst als type vermeld. Indien het een waarde uit een
statische opsomming van waarden betreft, dan wordt de naam van de desbetreffende
enumeratie als type vermeld.

*Toepassing*: Alle informatie elementen die een attribuut modelleren:
attribuutsoort, data element, referentie element, datatypekeuze, doelkeuze.

#### Metagegeven: **Lengte**

>   **Definitie Lengte**  
>   De aanduiding van de lengte van een gegeven, volgens de aangegeven notatiewijze.

De notatiewijze en de betekenis is als volgt:

Voor karakters:  

| **Notatie** | **Betekenis**                                                                              |
|-------------|--------------------------------------------------------------------------------------------|
| 1           | De lengte is precies 1                                                                     |
| 2..         | De lengte is minimaal 2 (inclusief 2) of meer (onbegrensd)                                 |
| 2..9        | De lengte is minimaal 2 en maximaal 9 (inclusief 9)                                        |

Voor getallen:

| **Notatie** | **Betekenis**                                                                              |
|-------------|--------------------------------------------------------------------------------------------|
| 3           | De lengte is maximaal 3 (inclusief 3, dus 1, 2 of 3) voor de komma      |  
| 3,2         | De lengte is maximaal 3 (inclusief 3, dus 1, 2 of 3) voor de komma, en maximaal 2 getallen na de komma  |    

Andere getallen dan 1 of 2 of 3 of 9 kunnen uiteraard gebruikt worden om er de lengte mee te specificeren.

*Toelichting*

Het gaat bij deze lengte om hoe lang een gegeven in functionele zin mag zijn. Dus, hoeveel karakters en hoeveel getallen voor en na de komma.

De lengte heeft betrekking op data waar een modelelement over gaat. Bij een attribuutsoort gaat het om de lengte van de data van het attribuut. Bij een gestructureerd datatype krijgt elk data element een eigen lengte en gaat het om de lengte van alleen dit data element.  

Bijvoorbeeld:
* Een naam van een persoon met minimale lengte 2 en onbegrensd: CharacterString, lengte 2..
* Een naam van een openbare ruimte met minimale lengte 2 en maximale lengte 80: CharacterString, lengte 2..80
* Een identificatie als getal, van maximaal lengte 16: Integer, lengte 16
* Een identificatie van precies lengte 16, met voorloopnullen: CharacterString, lengte 16
* Een percentage met 2 getallen achter de komma: Decimal, lengte 3,2

Voorheen vaak gebruikt:
* AN80 komt overeen met CharacterString, lengte 1..80  
* N8 komt overeen met Integer, lengte 8 (dus van -99999999 tot en met +99999999)
* N3,2 komt overeen met Decimal, lengte 3,2

Veel voorkomende maximum waarden voor CharacterString zijn: 80, 200, 4000.

Een getal wat voorloopnullen mag hebben, zoals gemeentecode 0060, wordt gespecificeerd als een CharacterString. Het getal 0001 bestaat niet, dit is het getal 1.

De lengte geldt voor gegevens _indien_ er sprake is van een gegeven. Gegevens die optioneel zijn worden leeggelaten, het is daarom niet de bedoeling om voor optionele gegevens een lengte van minimaal 0 te specificeren. Specificeer: als het gegeven ingevuld is, dan is de lengte minimaal 1.  

Het - teken bij een negatief heeft geen gevolgen voor de specificatie van de lengte.

Niet alle eisen aan een gegevens kunnen gespecificeerd worden met een lengte. Gebruik dan een patroon of formeel patroon of een andere specificatie van de minimale en/of maximale waarde. Bijvoorbeeld:
* 1 of 2 cijfers achter de komma kan niet gespecificeerd worden met lengte
* 1 of 2 cijfers voor de komma kan niet gespecificeerd worden met lengte  
* een exacte lengte voor een getal, oftewel lengte precies 16 waarbij lengte 1 of 15 niet mag
* het waardenbereik van een gegeven, "binnen" deze lengte
* of een getal negatief of positief mag zijn.

*Toepassing*: Attribuutsoort, primitief datatype (alleen als dit datatype in het IM zelf gedefinieerd is), data
element, referentie element.

#### Metagegeven: **Patroon**

>   **Definitie Patroon**  
>   De verzameling van waarden die gegevens van deze attribuutsoort kunnen
>   hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur.

*Toelichting*

De structuur is in woorden beschreven.

Bijvoorbeeld: conform de Nederlandse standaard voor het beschrijven van een
postcode.

Het specificeren van een patroon is alleen van toepassing wanneer de
specificatie aangeeft dat de waarde (direct of indirect) een primitief datatype
betreft, zoals een CharacterString.

*Toepassing*: De modelelementen uit de groep datatype en attribuutsoort.

#### Metagegeven: **Formeel patroon**

>   **Definitie Formeel patroon**  
>   Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door
>   de computer wordt herkend.

*Toelichting*

De structuur is in een reguliere expressie beschreven.

Bijvoorbeeld: [1-9][0-9][0-9][0-9][A-Z][A-Z]

Het specificeren van een patroon is alleen van toepassing wanneer de
specificatie aangeeft dat de waarde (direct of indirect) een primitief datatype
betreft, zoals een CharacterString.

*Toepassing*: De modelelementen uit de groep datatype en attribuutsoort.

#### Metagegeven: **Code**

>   **Definitie Code**  
>   De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code

#### Metagegeven: **Indicatie abstract object**

>   **Defin#itie Indicatie abstract object**  
>   Een indicatie die aangeeft of er objecten _kunnen_ bestaan die getypeerd worden als zijnde objecten (instanties) van alleen dit objecttype. Een abstract objecttype moet altijd de generalisatie zijn van één of meerdere objecttypes die niet abstract zijn.

N.B. Eén informatiemodel kan een abstract objecttype bevatten die _binnen dit informatiemodel_ een generalisatie is van geen enkel objecttype. Deze niet abstracte objecttypen kunnen zich immers ook buiten het informatiemodel bevinden en aldaar worden gespecificeerd. Dit komt voor bij informatiemodellen die een abstracte typering definiëren waarop (concretere) informatiemodellen willen aansluiten en nadere invulling aan geven.  

*Toelichting*

Niet abstract wordt ook vaak wel genoemd: concreet.

Bijvoorbeeld het abstract objecttype "Voertuig", met concrete specialisaties "Auto", "Fiets" en "Bromfiets". Dit betekent dat er geen voertuigen mogen bestaan die alleen maar een voertuig zijn en waarbij in het midden gelaten mag worden of het een Auto, Fiets, Bromfiets betreft. Als het "Voertuig" daarentegen niet als abstract is gemodelleerd, dan mogen er wel voertuigen bestaan die alleen maar een voertuig zijn en niet een Auto, Fiets of Bromfiets. In beide gevallen kan er over de objecten gesproken worden als zijnde een voertuig en kunnen deze objecten in algemene zin als zodanig behandeld worden (zoals een generalisatie bedoeld is).

Wanneer een objecttype niet abstract is, oftewel concreet, dan kunnen er objecten bestaan die een instantie van objecttype zijn.

Wanneer een objecttype wel abstract is, dan kunnen er geen objecten bestaan die een instantie van dit objecttype zijn. Er moet dan altijd sprake zijn van een concreet (niet abstract) objecttype die het abstracte objecttype als generalisatie heeft. Objecten zijn dan instanties van dit concrete objecttype en geen instanties van het abstracte objecttype. Wel voldoen deze objecten beide objecttype definities en kunnen deze objecten in algemene zin als zodanig behandeld worden.

Zie ook sectie [Abstracte objecttypes en concrete objecten](#abstracte-objecttypes-en-concrete-objecten) waar
een nadere uitleg wordt gegeven van het fenomeen abstract objecttypen.

*Toepassing:* Enumeratiewaarde

#### Metagegeven: **Populatie**

>   **Definitie Populatie**  
Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.

*Toelichting*

Dit is de beschrijving van de subset van de verzameling van alle instanties van dit objecttype. De subset bevat de instanties die opgenomen zijn in de registratie die met het informatiemodel wordt beschreven. Wordt bijvoorbeeld gebruikt bij basisregistraties om aan te geven dat niet alle instanties van een objecttype opgenomen zijn in de registratie maar alleen die welke voldoen aan een conditie.

*Toepassing:* Objecttype

#### Metagegeven: **Kwaliteit**

>   **Definitie Kwaliteit**  
Beschrijving van de mate waarin in de registratie opgenomen objecten van het desbetreffende type volledig, juist, actueel, nauwkeurig en betrouwbaar zijn.

*Toelichting*

Hier kan in tekst een beschrijving opgenomen worden over de kwaliteit van de inwinning van gegevens bij dit objecttype.

*Toepassing:* Objecttype



### Modelelementbindingen - metagegevens

Bindingen geven aan hoe modelelementen met elkaar verbonden kunnen en mogen worden.

Voorbeeld: de binding tussen een objecttype en een attribuutsoort, om aan te geven dat een attribuutsoort
gemodelleerd kan worden als eigenschap van een objecttype. Een voorbeeld van wat niet mag is de verbinding van een attribuutsoort aan een relatiesoort.
Andere voorbeelden zijn de binding tussen een objecttype en een generalisatie, of tussen een enumeratie en een enumeratiewaarde.

Deze metagegevens zijn alleen nodig voor de binding van modelelementen aan elkaar
en zijn vrijwel altijd een onderdeel van een modelleertaal (waarmee een informatiemodel gemaakt kan worden).
In modelleertalen is de binding niet altijd benoemd en is dan impliciet aanwezig. Het metagegeven hoeft dan in die modelleertaal niet expliciet te worden opgenomen.
Omdat dit hoofdstuk los van een modelleertaal is beschreven zijn de namen van de bindingen wel opgenomen.

Mocht het relevant zijn om de namen van de verbindingen ergens te gebruiken: er zijn twee schrijfwijzen aangegeven die equivalent zijn, gescheiden door een `/`.

De bindingen zijn ook in diagram vorm te lezen aan het begin van dit hoofdstuk, in [Diagrammen van modelelementen](#structuur-metamodel).

#### Metagegeven: **heeft attribuut** 
Verkorte schrijfwijze: **attribuut**

>   **Definitie heeft attribuut**  
>   De binding van een attribuutsoort als eigenschap aan een objecttype.

*Toelichting*

Objecttypen, gegevensgroeptypen of relatieklassen hebben attributsoorten (0,1,n) voor het specificeren van eigenschappen.

*Toepassing*: Objecttype, gegevensgroeptype en relatieklasse.

#### Metagegeven: **heeft gegevensgroep** 
Verkorte schrijfwijze: **gegevensgroep**

>   **Definitie heeft gegevensgroep**  
>   De binding van een gegevensgroep als groep van eigenschappen aan een
>   objecttype of gegevensgroeptype.

*Toelichting*

Objecttypen en relatieklassen hebben gegevensgroepen (0,1,n) voor het specificeren van groepen van eigenschappen.

*Toepassing*: Objecttypen met gegevensgroepen of een gegevensgroeptype dat zelf ook
weer een gegevensgroeptype bevat.

#### Metagegeven: **heeft gegevensgroeptype** 
Verkorte schrijfwijze: **gegevensgroeptype**

>   **Definitie heeft gegevensgroeptype**  
>   De binding van een gegevensgroeptype als waardetype aan een gegevensgroep.

*Toelichting*

Een attribuut met het stereotype gegevensgroep heeft als waardetype een
gegevensgroeptype.

*Toepassing*: Gegevensgroep.

#### Metagegeven: **verwijst naar supertype** 
Verkorte schrijfwijze: **supertype**

>   **Definitie verwijst naar supertype**  
>   De binding van een supertype aan een subtype middels een generalisatie.

*Toelichting*

Een subtype verwijst met een generalisatie naar een supertype.

*Toepassing*: Objecttype en datatype.

#### Metagegeven: **heeft datatype**
Verkorte schrijfwijze: **datatype**

>   **Definitie heeft datatype**  
>   De binding van een datatype aan een eigenschap.

*Toelichting*

Een datatype wordt onder andere toegekend aan een attribuutsoort.

*Toepassing*: Attribuutsoort, keuze, referentie element, data element

#### Metagegeven: **heeft relatiesoort**
Verkorte schrijfwijze: **relatiesoort**

>   **Definitie heeft relatiesoort**  
>   De binding van een objecttype aan een objecttype middels een relatiesoort.

*Toelichting*

Een objecttype kan een relatie hebben naar zichzelf of een ander objecttype.

*Toepassing*: Objecttype, Gegevensgroeptype.

#### Metagegeven: **heeft externe koppeling**
Verkorte schrijfwijze: **externe koppeling**

>   **Definitie heeft externe koppeling**  
>   De binding van een objecttype uit een extern package aan een objecttype.

*Toelichting*

Een objecttype kan een relatie hebben met en objecttype in een extern package.

*Toepassing*: Objecttype, Gegevensgroeptype.

#### Metagegeven: **heeft data element**
Verkorte schrijfwijze: **data element**

>   **Definitie heeft data element**  
>   De binding van een data element aan een gestructureerd datatype.

*Toelichting*

Een gestructureerd datatype bevat meerdere data elementen.

*Toepassing*: gestructureerd datatype.

#### Metagegeven: **bevat enumeratiewaarde**
Verkorte schrijfwijze: **enumeratiewaarde**

>   **Definitie bevat enumeratie waarde**  
>   De binding van een enumeratiewaarde aan een enumeratie.

*Toelichting*

Een enumeratie bevat enumeratiewaarden.

*Toepassing*: enumeratie.

#### Metagegeven: **bevat referentie element**
Verkorte schrijfwijze: **referentie element**

>   **Definitie bevat referentie element**  
>   De binding van een referentie element aan een referentielijst.

*Toelichting*

Een referentie lijst bevat referentie elementen.

*Toepassing*: Referentielijst.

#### Metagegeven: **heeft datatypekeuze**
Verkorte schrijfwijze: **datatypekeuze**

>   **Definitie heeft keuzedatatype**  
>   De binding van een keuze uit datatypen aan een attribuutsoort.

*Toelichting*

Een attribuutsoort kan als datatype een keuze uit datatypen hebben.

*Toepassing*: Attribuutsoort.

#### Metagegeven: **heeft keuzeattribuut**
Verkorte schrijfwijze: **keuzeattribuut**

>   **Definitie heeft keuzeattribuut**  
>   De binding van een keuze uit attributen aan een attribuutsoort of keuze.

*Toelichting*

Een keuze tussen attribuutsoorten kan als eigenschap aan een objecttype, gegevensgroeptype of relatieklasse worden gekoppeld.

*Toepassing*: Objecttype, Gegevensgroeptype, Relatieklasse, Attribuutsoort.

#### Metagegeven: **heeft keuzerelatiedoel**
Verkorte schrijfwijze: **keuzerelatiedoel**

>   **Definitie heeft keuzerelatiedoel**  
>   De binding van een keuze uit relatiedoelen aan een objecttype.

*Toelichting*

Een keuze tussen relatiedoelen kan als eigenschap aan een objecttype of gegevensgroeptype worden gekoppeld.

*Toepassing*: Objecttype, Gegevensgroeptype, Keuze.

#### Metagegeven: **heeft constraint**
Verkorte schrijfwijze: **constraint**

>   **Definitie heef constraint** 
>   De binding van een constraint aan een modelelement.

Het modelelement die een constraint heeft kan zijn: `Objecttype`, `Relatieklasse`, `Gegevensgroeptype`.

*Toelichting*

Een constraint is gekoppeld aan de context van modelelement waarop ze van toepassing is. Dit modelelement kan zijn: `Objecttype`, `Gegevensgroeptype` of `Relatieklasse`.

### Toegestane waarden metagegevens

Toelichting op de toegestane waarden van (bepaalde) metagegevens.

#### Waardebereik

Een aantal metagegevens hebben als datatype `CharacterString`. Aanvullend geldt:

-   Voor lengtes geldt dat er alleen getallen in mogen (van het datatype
    `Integer`).

-   Voor datums geldt dat deze het volgende patroon volgen: `jjjjmmdd`

-   Voor de metagegevens `Definitie` en `Toelichting` geldt dat hiervoor tekst met opmaak (zoals _vet_, _cursief_, _onderstreept_ en _opsommingen_) gebruikt mag worden. Welke opmaak precies gebruikt kan worden, is afhankelijk van de mogelijkheden van de modelleeromgeving en de beoogde toepassing van het model.

Voor de volgende metagegevens geldt een specifiek waardebereik.

| **Metagegeven**                     | **Waardenbereik**                                                          |
|-------------------------------------|----------------------------------------------------------------------------|
| Indicatie materiële historie        | `Ja`, `Nee`                                                                |
| Indicatie formele historie          | `Ja`, `Nee`                                                                |
| Indicatie classificerend            | `Ja`, `Nee`                                                                |
| Indicatie abstract object           | `Ja`, `Nee`                                                                |
| Mogelijk geen waarde                | `Ja`, `Nee`                                                                |
| [Aggregatietype](#metagegeven-aggregatietype) | `Compositie`, `Gedeeld`, `Geen`                                  |
| [Authentiek](#authentieke-gegevens) | `Authentiek`, `Basisgegeven`, `Wettelijk gegeven`, `Landelijk kerngegeven`, `Overig` |

NB: Geef bij de toepassing van `overig` in een informatiemodel aan wat er onder wordt verstaan.

De metagegevens met Ja en Nee zijn semantisch bedoeld als een boolean (er zijn geen andere waarden mogelijk zoals onbekend, overig of geen waarde (leeg)). Voor technische implementatiedoeleinden is het toegestaan om Ja en Nee te interpreteren en eventueel te vervangen door een Boolean. Let wel, voor mens-leesbare functionele documentatie horen altijd de in de tabel aangegeven waarden Ja en Nee te worden gebruikt.

#### Defaultwaarden

Er zijn metagegevens die een defaultwaarde hebben. Het is echter niet nodig om deze defaultwaarde expliciet aan te geven in het informatiemodel. De default staat hier aangegeven. Alleen wanneer er afgeweken wordt van deze default wordt dit in het informatiemodel aangegeven.

Aanwijzing MIM-beheerder: metagegevens met een defaultwaarde mogen niet optioneel zijn. Kies de defaultwaarde defensief.

| **Metagegeven**                     | **Defaultwaarde** |
|-------------------------------------|-------------------|
| Indicatie materiële historie        | `Nee`             |                                                        
| Indicatie formele historie          | `Nee`             |                                                        
| Indicatie classificerend            | `Nee`             |
| Indicatie abstract object           | `Nee`             |
| Mogelijk geen waarde                | `Nee`             |                                                        
| Identificerend                      | `Nee`             |                                                        
| Unidirectioneel                     | `Ja`              |  
| Kardinaliteit attribuut             | `1`               |                                                        
| Aggregatietype                      | `Geen`            |  

Opmerking met betrekking tot de kardinaliteit van relaties: deze staat niet in de tabel. Deze kennen geen defaultwaarde. De kardinaliteit aan de doel kant altijd moet worden aangegeven. De kardinaliteit aan de bron/eigenaar kant van een relatie is optioneel om in te vullen, wanneer er niets is ingevuld dan wordt er niets over de kardinaliteit gezegd en kent deze geen default waarde (in de praktijk betekent dit dat een kardinaliteit aan de bron kant als 0..* geïmplementeerd wordt).
