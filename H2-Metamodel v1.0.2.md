Metamodel
=========

Dit hoofdstuk beschrijft het metamodel in diagramvorm en in tekst. De eerste
paragraaf bevat diagrammen, in UML; elk biedt een eigen view op een gedeelte van
het model. Het geheel van diagrammen, in samenhang, is opgenomen in bijlage 3.

Uitgangspunten voor het metamodel zijn: - UML 2.5 vormt de basis voor de
conceptuele beschrijving. - Gebruik te maken van de bestaande UML-
modelelementen conform UML van OMG. OMG noemt dit een UML metaclass. Een
voorbeeld hiervan is UML-Class. - Daar waar (semantisch) nodig
extensiemechanismen toe te passen met behoud van de betekenis van de
UML-metaclasses. Er ontstaat dan een MIM metaclass. Hoe deze zich verhouden tot
UML is weergegeven in de bijlage. - Modelelementen hebben één stereotype.
Daarnaast hebben twee verschillende stereotypen nooit dezelfde betekenis.
Stereotypes worden toegepast als er een verbijzondering van een UML constructie
nodig is met behoud van de betekenis van de UML-metaclass. - Uniforme toepassing
van het metamodel in informatiemodellen. Anders gezegd, uitbreiden mag, afwijken
niet, maak voor hetzelfde doel geen alternatieve constructies. - Datatypen zijn
onderdeel van het metamodel en beschrijven de structuur van de data, maar niet
de semantiek/betekenis. De aanbeveling is dan ook om eerst een informatiemodel
te maken zonder datatypen. De regel is dat als alle datatypen uit het model
worden weggelaten, er geen semantische betekenis verloren mag gaan. -
Toolonafhankelijke beschrijving van het metamodel. Omdat VNG Realisatie,
Kadaster en Geonovum en veel andere organisaties Sparx EA gebruiken is er
aanvullend aangegeven hoe het metamodel in Enterprise Architect toegepast wordt.
Hierdoor borgen we deze relatie.

Structuur metamodel
-------------------

Deze paragraaf bevat een overzicht van het metamodel en geeft alle
modelelementen weer in diagram vorm. De beschrijving van de modelelementen in
tekst vorm staan in de volgende paragraaf.

De modelelementen zijn verdeeld over een diagrammen, die elk een eigen view op
een deel van het metamodel tonen. Elk view toont een aantal van de
modelelementen, inclusief hun onderlinge samenhang. Alle views samen vormen het
metamodel als geheel: - KERN, met de belangrijkste modelelementen in onderlinge
samenhang. - DATATYPEN, met de in het model te onderkennen soorten datatypen. -
OVERIGE modelelementen, die niet altijd aan de orde zijn.

Elk modelelement heeft een MIM metaclass. Deze wordt in UML in een
informatiemodel gemodelleerd als een Metaclass van UML 2.5 en een bijbehorende
stereotype. Bijvoorbeeld: de MIM metaclass Objecttype wordt gemodelleerd als een
UML-Class met stereotype «Objecttype». In Sparx EA wordt dit gemodelleerd met
een Class. Niet alle MIM metaclasses hebben een stereotype (nodig). In de kolom
staat dan ‘-‘.

| **MIM metaclass** | **Stereotype** | **Metaclass UML 2.5z** | **In Sparx EA** |
|-------------------|----------------|------------------------|-----------------|
| Objecttype        | «Objecttype»   | (UML) Class            | Class           |

In de diagrammen zijn de UML metaclasses conform UML 2.5 aangeduid als UML
metaclass. Deze in opgenomen in het diagram als ‘blauw gekleurde’ metaclasses.

### Kern

![](media/f12fbb3dc2e205d26a1d0d27cbd325b3.png)

Kern zonder Metagegevens

| **MIM metaclass** | **Stereotype**      | **Metaclass UML 2.5**            | **In Sparx EA**  |
|-------------------|---------------------|----------------------------------|------------------|
| Objecttype        | «Objecttype»        | (UML) Class                      | Class            |
| Attribuutsoort    | «Attribuutsoort»    | (UML) Property                   | Attribute        |
| Gegevensgroep     | «Gegevensgroep»     | (UML) Property                   | Attribute        |
| Gegevensgroeptype | «Gegevensgroeptype» | (UML) Class                      | Class            |
| Generalisatie     | «Generalisatie»     | (UML) Generalization             | Generalization   |
| Relatiesoort      | «Relatiesoort»      | (UML) Association                | Association      |
| Relatieklasse     | «Relatieklasse»     | (UML) Association én (UML) Class | Associationclass |

### Datatypen

![](media/e529a1c0a1d6183d686d5aa57d0d0c63.png)

Datatypen zonder Metagegevens

View 2: Datatypen

| **MIM metaclass**       | **Stereotype**          | **Metaclass UML 2.5**    | **In Sparx EA**    |
|-------------------------|-------------------------|--------------------------|--------------------|
| Primitief datatype      | «Primitief datatype»    | (UML) Primitive Type     | Datatype           |
| Gestructureerd datatype | «Gestructuurd datatype» | (UML) Datatype           | Datatype           |
| Data element            | «Data element»          | (UML) Property           | Attribute          |
| Union                   | «Union»                 | (UML) Datatype           | Datatype           |
| Union element           | «Union element»         | (UML) Property           | Attribute          |
| Enumeratie              | \-                      | (UML) Enumeration        | Enumeration        |
| Enumeratiewaarde        | \-                      | (UML) EnumerationLiteral | EnumerationLiteral |
| Referentielijst         | «Referentielijst»       | (UML) Datatype           | Datatype           |
| Referentie element      | «Referentie element»    | (UML) Property           | Attribute          |
| Codelist                | «Codelist               | (UML) Datatype           | Datatype           |

### Overige

![](media/505b92a05134fb38d9aec81f23a66bad.png)

Constraint

View 3: Constraint

| **MIM metaclass** | **Stereotype** | **Metaclass UML 2.5** | **In Sparx EA** |
|-------------------|----------------|-----------------------|-----------------|
| Constraint        | \-             | (UML) Constraint      | Constraint      |

*Relatierol*

![](media/240ca39c688efb06f70b34b8ec0b36d0.png)

Relatierol

View 4: Relatiesoort en relatierol

| **MIM metaclass**     | **Stereotype** | **Metaclass UML 2.5** | **In Sparx EA** |
|-----------------------|----------------|-----------------------|-----------------|
| Relatierol (abstract) | «Relatierol»   | Property              | AssociationEnd  |
| Relatierol source     | «Relatierol»   | Property              | AssociationEnd  |
| Relatierol target     | «Relatierol»   | Property              | AssociationEnd  |

*Externe koppeling*

| **MIM metaclass** | **Stereotype**      | **Metaclass UML 2.5** | **In Sparx EA** |
|-------------------|---------------------|-----------------------|-----------------|
| Externe koppeling | «Externe koppeling» | (UML) Association     | Association     |

*Packages*

| **MIM metaclass**     | **Stereotype** | **Metaclass UML 2.5** | **In Sparx EA** |
|-----------------------|----------------|-----------------------|-----------------|
| Domein (het eigen IM) | \-             | (UML) Package         | Package         |
| Extern                | «Extern»       | (UML) Package         | Package         |
| View                  | «View»         | (UML) Package         | Package         |

Betekenis modelelementen
------------------------

In deze paragraaf staan alle modelelementen opgesomd, die gebruikt worden bij
het maken van een informatiemodel. Bijna alle hebben een UML-metaclass als
basis, deze is dan aangegeven. Dit is ook opgenomen in diagram vorm, in bijlage
3.

### Objecten en attributen

**1. Objecttype** *- Stereotype «Objecttype»*: De UML-representatie van een
objecttype, uitgedrukt in een stereotype van UML-Class (metaclass).

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Er zijn verschillende modelelementen die gebaseerd zijn op UML-Class, zoals
aangegeven in §2.1. Wanneer een UML-Class in het informatiemodel gelezen
moet worden als een objecttype, dan krijgt deze het stereotype «Objecttype».

Een objecttype is een groep van gelijksoortige objecten. Om duidelijk te
maken wat wordt bedoeld kijken we eerst naar het begrip ‘object’.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

**2. Attribuutsoort** – *Stereotype «Attribuutsoort»*: De UML-representatie van
een attribuutsoort, uitgedrukt in een stereotype van UML-Property2-1
(metaclass).

Er zijn verschillende modelelementen die gebaseerd zijn op UML-property, zoals
aangegeven in §2.1.2. Wanneer een UML-property in het informatiemodel de
betekenis heeft van een attribuut van een objecttype, dan heeft deze het
stereotype «Attribuutsoort».

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

*Bijvoorbeeld: we kunnen definiëren dat 'persoonsnaam' en 'geslachtsaanduiding'
attribuutsoorten zijn die van toepassing zijn voor het objecttype 'persoon'.
Wanneer ‘oogkleur’ niet relevant is voor het domein, wordt deze niet
gemodelleerd.*

**3. Gegevensgroep** – \* Stereotype «Gegevensgroep»\*: De UML-representatie van
een gegevensgroep, uitgedrukt in een stereotype van UML-property (metaclass).

>   **Definitie Gegevensgroep**

>   Een typering van een groep van gelijksoortige gegevens die voor een
>   objecttype van toepassing is.

*Toelichting:* Dit modelelement verzorgt de modelmatige aankoppeling van een
gegevensgroeptype aan het objecttype waartoe een gegevensgroeptype onlosmakelijk
behoort.

De groep van gegevens is een kenmerk van een object. De gegevensgroep is een
betekenisvol kenmerk van een objecttype. De gegevensgroep heeft altijd als type
een gegevensgroeptype.

*Bijvoorbeeld: een persoon heeft ogen, dit is een onmiskenbaar kernmerk van een
persoon. De gegevensgroep noemen we daarom ‘ogen’. Elk oog heeft een kleur en
een sterkte, waar we waardes van bij willen houden, zoals respectievelijk blauw
en -2. Dit kan per oog verschillen, waardoor het nuttig kan zijn om deze
kenmerken als attribuutsoorten onder te brengen in een gegevensgroeptype Oog. De
gegevensgroep ‘ogen’ krijgt een definitie, en krijgt als type het
Gegevensgroeptype Oog (merk op dat we het kenmerk Oog als modelelement kunnen
definiëren, zonder dat er we er waardes van vastleggen. Alleen van kleur en
sterkte leggen we waardes vast).*

**4. Gegevensgroeptype** – \* Stereotype «Gegevensgroeptype»\*: De
UML-representatie van een gegevensgroeptype, uitgedrukt in een stereotypevan
UML-Class (metaclass).

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

*Bijvoorbeeld: Geboorte bij INGESCHREVEN NATUURLIJK PERSOON (met daarin onder
andere de attribuutsoorten Geboortedatum en Geboortegemeente) en Motor (met
daarin attribuutsoorten over de inhoud, vermogen, serienummer en het soort
motor) bij een SCHIP.*

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

Verbanden met betekenis, die gelegd zijn tussen modelelementen van het type
UML-Class.

**5. Generalisatie:** De UML-representatie van een specialisatie, uitgedrukt in
een UML-generalization (metaclass).

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

*Voorbeeld: PERCEEL is specialisatie van KADASTRAAL ONROERENDE ZAAK,
APPARTEMENTSRECHT is specialisatie van KADASTRAAL ONROERENDE ZAAK. PERCEEL en
APPARTEMENTSRECHT hebben beide ‘Kadastrale aanduiding’ en een ‘relatie met
ONROERENDE ZAAK FILIATIE’.*

>   **Definitie Generalisatie tussen datatypes**

>   De typering van het hiërarchische verband tussen een meer generieke
>   structuur van data in de vorm van een datatype, en een meer specifieke
>   structuur van data in de vorm van een ander datatype, waarbij het
>   laatstgenoemde datatype de eigenschappen van het eerstgenoemde datatype
>   overerft, én een verbijzondering hierin aanbrengt in de vorm van een meer
>   restrictieve definitie, of een meer restrictief patroon/formeel patroon.

*Toelichting:* Het andere datatype is bijvoorbeeld een CharacterString, Integer,
GM Surface of DMO en dient als basis voor een zelf te definiëren datatype (zie
3.1.2.). deze generalisatie is van toepassing op de volgende datatypes:
«Primitief datatype», «Gestructureerd datatype», «Referentielijst», «Codelist»,
«Enumeratie».

**6. Relatiesoort** – *Stereotype «Relatiesoort»*: De UML-representatie van een
relatiesoort, uitgedrukt in een stereotype van UML-association (metaclass).

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

Voorbeeld: relatiesoorten “VERBLIJFSOBJECT is gelegen in een PAND” en “SUBJECT
heeft als correspondentieadres WOONPLAATS”, of korter, “gelegen in”,
“postadres”.

Wanneer een relatie (UML-assocation) gebruikt wordt om objecten aan elkaar te
verbinden, zonder dat er eigenschappen over deze relatie worden vastgelegd, dan
heeft deze het stereotype «Relatiesoort».

**7. Relatieklasse** - *Stereotype «Relatieklasse»*: De UML-representatie van
een Relatieklasse, uitgedrukt in een stereotype van UML-associationClass
(metaclass).

>   **Definitie Relatieklasse**

>   Een relatiesoort met eigenschappen.

*Toelichting:* De relatieklasse geeft aan dat er een relatie is tussen twee
objecten, waarbij er gegevens over deze relatie vastgelegd moeten worden. De
relatie wordt in dit geval behandeld als een object, met gegevens. De gegevens
over de relatie bestaan alleen zolang de relatie tussen beide objecten bestaat
en zolang elk van beide objecten zelf (nog) bestaan.

*Bijvoorbeeld: relatieklasse FUNCTIONARIS (een PERSOON is benoemd als de
FUNCTIONARIS voor een AFDELING en heeft bijvoorbeeld een benoemingsdatum als
attribuut).*

*Opmerking*: de gegevens van de relatie worden voor één relatie vastgelegd en
niet voor meerdere relaties tegelijk. Als dit laatste het geval is, dan worden
de gegevens vastgelegd in een «Objecttype». Een CONTRACT kan bijvoorbeeld ook
een afspraak zijn tussen twee óf méér SUBJECTen, waarbij de gegevens van de
relatie voor alle betrokken objecten hetzelfde zijn. CONTRACT wordt dan
gemodelleerd als objecttype, waarbij beschreven wordt wat er moet gebeuren
wanneer één van de SUBJECTen niet meer bestaat.

**8. Externe koppeling** – *Stereotype «Externe koppeling»*: De
UML-representatie van een externe koppeling, uitgedrukt in een stereotype van
UML-association (metaclass). De source kant van het aggregatietype is
‘composite’ (de gesloten diamant staat aan de kant van het objecttype die de
koppeling legt naar het externe objecttype).

>   **Definitie Externe koppeling**

>   Een associatie waarmee vanuit het perspectief van het eigen informatiemodel
>   een objecttype uit het ‘eigen’ informatiemodel gekoppeld wordt aan een
>   objecttype van een extern informatiemodel. De relatie zelf hoort bij het
>   ‘eigen’ objecttype. Zie ook 3.14.

**9. Relatierol** – *Stereotype «Relatierol»*: De UML-representatie van een
relatierol, uitgedrukt in een stereotype van UML-Property2-2 (metaclass).

>   **Definitie Relatierol**

>   De benaming van de manier waarop een object deelneemt aan een relatie met
>   een ander object.

*Toelichting:* Met relatie wordt in deze elke relatie bedoeld een
*«Relatiesoort»*, *«Relatieklasse»* of *«Externe koppeling»*. Voor
*«*Generalisatie*»* speelt het niet. Een relatie heeft een source kant, die de
eigenaar is van de relatie, en is gericht naar de target kant. De relatierol kan
aan beide kanten een naam en een definitie krijgen.

*Bijvoorbeeld: een kind-ouder relatie. Een PERSOON heeft in de rol ‘ouder van’
een relatie met PERSOON, 0, 1 of meerdere keren. Andersom is de rol ‘kind van’.
Een EIGENDOM kan overgedragen worden van de ene PERSOON naar de andere PERSOON.
De relatie krijgt de naam ‘overdracht’ , met de source rol ‘vervreemder’ en de
target rol ‘verkrijger’.*

### Waardenlijsten

Een datatype waarvan de mogelijke waarden zijn opgesomd in een lijst. De waarde
van een attribuutsoort moet één van de waarden zijn uit de gespecificeerde
waardenlijst.

**10. Referentielijst** – *Stereotype «Referentielijst»*: De UML-representatie
van een referentielijst, uitgedrukt in een stereotype van UML-Datatype
(metaclass).

>   **Definitie Referentielijst**

>   Een lijst met een opsomming van de mogelijke domeinwaarden van een
>   attribuutsoort, die buiten het model in een externe waardenlijst worden
>   beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd
>   aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel
>   aangepast wordt (in tegenstelling tot bij een enumeratie).

*Bijvoorbeeld: referentielijst LAND, referentielijst NATIONALITEIT. Een
NATUURLIJK PERSOON heeft een attribuut geboorteland, van het type LAND.*

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

**11. Referentie element** – *Stereotype «Referentie element»*: De
UML-representatie van een referentie-element uitgedrukt in een stereotype van
UML-Property(metaclass).

>   **Definitie Referentie element**

>   Een eigenschap van een object in een referentielijst in de vorm van een
>   gegeven.

*Bijvoorbeeld: referentielijst LAND kent de referentie-elementen Landcode ISO en
Landnaam, referentielijst NATIONALITEIT kent referentie-element
Nationaliteitcode.*

Een referentie element kan uniek zijn, zoals een code, en is dan op zichzelf
geschikt om gebruikt te worden als referentie (zoals bedoeld in de definitie van
Referentielijst).

**12. Enumeratie** Voor enumeraties is geen stereotype gespecificeerd. In het
metamodel maken we gebruik van de bestaande UML-enumeration (metaclass) voor de
specificaties van een enumeratie.

>   **Definitie Enumeratie**

>   Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een
>   statische lijst.

*Toelichting:* In de registratie krijgt een attribuut één van deze waarden. De
lijst is een statische lijst met constanten (meerdere attributen, zoals bij een
referentielijst, zijn nooit aan de orde).

*Bijvoorbeeld: geslacht (man, vrouw, overig), de typering van een openbare
ruimte (spoorbaan, plein, straat).*

**13. Enumeratiewaarde** Voor enumeratiewaarde is geen stereotype
gespecificeerd. In het metamodel maken we gebruik van de bestaande
UML-enumerationLiteral (metaclass) voor de specificaties van een
enumeratiewaarde.

>   **Definitie Enumeratiewaarde**

>   Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant
>   gegeven.

*Bijvoorbeeld: geslacht: man, vrouw, overig, type openbare ruimte: spoorbaan,
plein, straat.*

**14. Stereotype** «**Codelist**»: De UML-representatie van een codelist,
uitgedrukt in een stereotype van UML-datatype (metaclass).

>   **Definitie Codelist**

>   De definitie van een codelist is gelijk aan de definitie van een
>   referentielijst.

Er is wel een verschil in modellering; zie hiervoor de toelichting.

*Bijvoorbeeld: codelist LAND met daarin (alleen) het attribuut ‘naam’ (de
externe gepubliceerde waardenlijst bevat naast de naam ook de ISO code en de
ontstaansdatum).*

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

Een datatype die de structuur beschrijft waaraan een waarde (zie 2.2.1 Objecten
en attributen) moet voldoen.

Bij elke «Attribuutsoort» wordt gespecificeerd aan welk datatype de data c.q. de
waarde die hiervoor vastgelegd wordt moet voldoen. Het datatype wordt gebruikt
als type van een attribuutsoort.

Anders gezegd, Datatypes zijn veelal herbruikbaar en kunnen gespecificeerd
worden bij diverse «Attribuutsoort»-en.

**15. Primitief datatype** - «Primitief datatype»: in het metamodel maken we
gebruik van de bestaande UML-PrimitiveType (metaclass) voor de specificaties van
een primitief datatype.

**UML-PrimitiveType** Een standaard datatype, zoals bekend in vele
specificatietalen, dat de structuur van een gegeven beschrijft. Het metamodel
volgt waar mogelijk de definities zoals beschreven in ISO standaarden (zie
§3.1). Deze datatypes hebben altijd al een naam en definitie gekregen vanuit
deze standaarden en deze worden gebruikt. Deze worden niet door de modelleur
gecreëerd en hebben daarom geen MIM metaclass.

*Voorbeeld: CharacterString, Integer, DateTime.*

>   **Definitie Primitief datatype**

>   Een in het eigen model gedefinieerd primitieve datatype. Deze worden wel
>   door de modelleur gecreëerd, met een eigen naam en een eigen definitie (en
>   eigen metagegevens).

*Voorbeeld: Documentnummer, Postcode. In het geval van Postcode is de landelijke
definitie in tekst vastgelegd buiten het informatiemodel zelf, waarbij in het
eigen model een modelelement is gemaakt in de vorm van het datatype
Postcode*2-3.

*Toelichting:* Een primitief datatype is een datatype zonder verdere
specificatie over de structuur. Dit datatype kent geen UML-property en dus ook
geen elementen met stereotype «Data element». Dit datatype is enkelvoudig,
oftewel niet samengesteld, en wordt ook wel simpel datatype genoemd.

Wanneer een Primitief datatype wordt gespecificeerd, dan heeft deze standaard
als primitive datatype een CharacterString.

Een informatiemodel definieert datatypes als er behoefte is aan een datatype dat
eenmalig gedefinieerd wordt en op meerdere plekken in het model gebruikt moet
kunnen worden met altijd exact dezelfde structuur en waardenbereik (zie ook
‘patroon’ in 3.5). Dit datatype, met een eigen naam, wordt vervolgens gebruikt
als type van een attribuutsoort.

**16. Gestructureerd datatype** – *stereotype «Gestructureerd datatype»*: De
UML-representatie van een gestructureerd datatype uitgedrukt in UML-datatype
(metaclass) met ten minste twee keer een UML-Property.

>   **Definitie Gestructureerd datatype**

>   Specifiek benoemd gestructureerd datatype dat de structuur van een gegeven
>   beschrijft, samengesteld uit minimaal twee elementen.

*Toelichting:* In UML wordt een Gestructureerd datatype een structured Datatype
genoemd.

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

*Voorbeeld: Gestructureerd datatype Bedrag bestaat uit de data-elementen som en
valuta.*

**17. Data element** - *Stereotype «Data element»*: De UML-representatie van een
data element uitgedrukt in UML-property (metaclass).

>   **Definitie Data element**

>   Een onderdeel/element van een Gestructureerd datatype die als type een
>   datatype heeft.

*Toelichting:* Het data element is een eigenschap van een Gestructureerd
datatype en beschrijft de structuur van een gegeven. Het is niet een eigenschap
van een object en niet hetzelfde als een attribuutsoort.

Het data element beschrijft in combinatie met andere data-elementen de structuur
van een gegeven en heeft zelf een datatype. Dit datatype is meestal een
primitief datatype.

**18. Union** – *Stereotype «Union»*: De UML-representatie van een union
uitgedrukt in UML-datatype (metaclass).

>   **Definitie Union**

>   Gestructureerd datatype, waarmee wordt aangegeven dat er meer dan één
>   mogelijkheid is voor het datatype van een attribuut. Het attribuut zelf
>   krijgt als datatype de union. De union biedt een keuze uit verschillende
>   datatypes, elk afzonderlijk beschreven in een union element.

*Voorbeeld: Union LineOrPolygon. Deze biedt een keuze uit Union element Line of
Union element Polygon.*

**19. Union element** - *Stereotype «Union element»*: De UML-representatie van
een union element uitgedrukt in UML-property (metaclass), dat zelf een type
heeft dat uitgedrukt is in een UML-datatype (metaclass).

>   **Definitie Union element**

>   Een type dat gebruikt kan worden voor het attribuut zoals beschreven in de
>   definitie van Union. Het union element is een onderdeel van een Union,
>   uitgedrukt in een eigenschap (attribute) van een union, die als keuze binnen
>   de Union is gerepresenteerd..

*Voorbeeld: union element Line en union element Polygon zijn beiden onderdeel
van Union LineOrPolygon*

### Packages

Een package is een benoemde en begrensde verzameling/groepering van
modelelementen.

**20. Extern** - *Stereotype «Extern»*: De UML-representatie van een extern
package uitgedrukt in UML-package (metaclass)

>   **Definitie Extern**

>   Een groepering van constructies die een externe instantie beheert en
>   beschikbaar stelt aan een informatiemodel en die in het informatiemodel
>   ongewijzigd gebruikt worden.

*Voorbeeld: het Externe package NEN3610 met datatype NEN3610ID. Het datatype van
attribuutsoort Identificatie wegdeel in RSGB verwijst naar het datatype
NEN3610ID zoals opgenomen in het Externe package.*

**21. View** - *Stereotype «View»*: De UML-representatie van een view package
uitgedrukt in UML-package (metaclass)

>   **Definitie View**

>   Een groepering van objecttypen die gespecificeerd zijn in een extern
>   informatiemodel en vanuit het perspectief van het eigen informatiemodel
>   inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het
>   eigen informatiemodel.

*Bijvoorbeeld: IMKAD-BRP. Een aantal van de gegevens uit BAG objecten uit de
basisregistratie BAG zijn relevant voor de basisregistratie Kadaster. De
definities van de BAG worden gevolgd. Vanuit modelleringsperspectief wordt dit
gezien als een view.*

### Overig

de metaclass Property isID als het gaat om het modelelement attribuutsoort. De
waarde van isID kan zijn: true of false.

stereotype \<\> als het gaat om het modelelement relatiesoort.

Toelichting

Als er sprake is van een objecttype die meerdere eigenschappen kent met deze
aanduiding isID met waarde true , dan betekent dit dat deze eigenschappen als
combinatie uniek identificerend zijn (en niet, of niet altijd, op zichzelf).

**22. Identificerend** – De UML-representatie van een identificerend kenmerk,
uitgedrukt bij een UML-property (metaclass) met de metaclass property *isId* als
het een *«*attribuutsoort*»* betreft en met het *stereotype «id»*2-4 *bij target
role van de «relatiesoort»* als het een *«relatiesoort»* betreft:

>   **Definitie Identificerend**

>   Een kenmerk van een objecttype die aangeeft of deze eigenschap uniek
>   identificerend is voor alle objecten in de populatie van objecten van dit
>   objecttype.

*Toelichting:* objecten hebben, of krijgen, in een administatie of
gegevensvoorziening vaak één identificerend kenmerk. Dit kenmerk krijgt dan in
UML isId = true. Het kan ook zijn dat een aantal kenmerken in combinatie
identificerend zijn, zoals twee attibuutsoorten of een attribuutsoort en een
relatiesoort. De combinatie met een relatiesoort wordt alleen gedaan voor
objecttypes die zelf geen unieke aanduiding hebben en daarom deze moeten
samenstellen met de unieke aanduiding van een gerelateerde objecttype.

*Voorbeeld: ‘burger service nummer’ van een PERSOON, of ‘identificatie’ van
PAND. Een combinatie van ‘postcode’, ‘huisnummer’, ‘huisnummertoevoeging’ en
‘huisletter’ van een NUMMERAANDUIDING. Een BUURT, deze heeft zelf geen unieke
identificatie. Een BUURT ligt in een WIJK en binnen die WIJK is de BUURT wel
uniek. De WIJK zelf heeft een unieke identificatie. De unieke identificatie van
BUURT is daarom samengesteld uit het attribuut Buurtcode van BUURT en de
verwijzing naar de WIJK (de identificatie van WIJK).*

**23. Constraint** - Voor Constraint is geen stereotype gespecificeerd. In het
metamodel maken we gebruik van de bestaande UML-Constraint (metaclass).

>   **Definitie Constraint**

>   Een constraint is een conditie of een beperking, die over een of meerdere
>   modelelementen uit het informatiemodel geldt.

*Toelichting:* Een constraint kan vastgelegd worden bij alle modelelementen die
als basis een UML-metaclass hebben waarvan UML aangeeft dat hier een
UML-constraint op gedefinieerd mag worden. Aanbeveling is om dit waar mogelijk
op een *«Objecttype»* te doen of eventueel (indien van toepassing) op een
*«Gegevensgroeptype»* of *«Relatieklasse».*

Een constraint wordt altijd in gewone tekst omschreven en optioneel als formele
specificatie in de Object Constraint Language (OCL). Dit is verder uitgewerkt in
Hoofdstuk 3.

*Bijvoorbeeld: een conditionele afhankelijkheid ‘als (optioneel) attribuut 1
leeg is, dan is (optioneel) attribuut 2 verplicht’, of een bijzondere regel,
zoals ‘11-proef is van toepassing op dit attribuut’.*

Specificatie metagegevens
-------------------------

Elk modelelement kent een aantal metagegevens, die bepaalde aspecten van het
modelelement specificeren. Zo is er de *naam* van het modelelement, bijvoorbeeld
het objecttype met als *naam* Pan den een bijbehorende *definitie*, of de *Datum
opname* van het modelelement in het informatiemodel, bijvoorbeeld *Datum opname*
1-1-2012.

Een aantal van deze metagegevens worden gemodelleerd in de modelleertaal UML.
Deze zijn in onderstaande tabellen herkenbaar aan de rode tekst en worden met de
modelleerconstructies de die de modelleertaal biedt vastgelegd. Bijvoorbeeld het
objecttype met de naam Pand wordt gemodelleerd als ‘*Named element’* met als
‘*Name’* Pand (in UML 1.4 heette dit nog UML-Class). Het metagegeven *definitie*
wordt gemodelleerd door tekst op te nemen in de UML-‘*Notes’* van het betrokken
UML-‘*Named element*’.

Een aantal andere metagegevens, zoals de eerder genoemde *Datum opname* met
waarde 1-1-2012. worden als aparte data vastgelegd, in een ‘*Tagged value*’.

Merk op, deze tagged values zijn specifiek voor elk modelelement apart. Dus als
er in H2.2 sprake is van een generalisatie, dan worden deze tagged values niet
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
opgesomd in H2.2.  
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
genoemd in paragraaf 1.5. Dergelijke definities kunnen hetzelfde zijn, of op het
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
betekenis. De alias is optioneel (zie verder ook 3.16).

Verdere toelichting voor UML modellen:

-   De alias is te specificeren voor NamedElements (zoals UML-Class,
    UML-association, UML-UML-Datatype en UML-property). De alias is in UML
    gespecificeerd bij de metaclass Element
    Import[2-10](https://github.com/Geonovum/MIM-Werkomgeving/blob/master/H2-Metamodel%20v1.0.2.md#fn2-10).
    In Enterprise Architect is de alternatieve weergave aan te zetten in de
    properties van een Diagram, via: use alias if available.

Bijvoorbeeld: OnroerendeZaak heeft als alias Onroerende zaak.

*Toepassing*: alle modelelementen die een naam hebben, uitgezonderd de
Enumeratiewaarde voetnoot1.

Voetnoot 1: Een uitzondering is gemaakt voor UML modellen voor de
UML-EnumerationLiteral. De ‘naam’ betreft hier een daadwerkelijk waarde, waarin
de naam gelijk staat aan de waarde. Het is daarom expliciet ongewenst om
hiervoor een alternatieve naamgeving te gebruiken. De alias wordt hier, mede
daarom, gebruikt voor (alleen) de modellering van het metadata aspect Code,
welke aanvullend is op naam (niet een alternatief van naam).

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

Meestal staat in dit metagegeven aangegeven ‘\<mijn IM\>’, bijvoorbeeld BRK als
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
is, en is verwerkt. Verdere toelichting, zie hoofdstuk 3.

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
is, en is verwerkt. Verdere toelichting, zie hoofdstuk 3.

Zie hoofdstuk 3.

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
geen waarde. Meer hierover is beschreven in hoofdstuk 3.

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

Getallen kunnen altijd positief of negatief zijn. *Bijvoorbeeld: ‘1’ als de
lengte exact 1 is; ‘1..2’ als de lengte 1 tot en met 2 lang kan zijn; '‘1,2’
voor Decimale getallen met 1 cijfer voor de komma en 2 erna.* Dit is van -9,99
tot +9,99; Dit is verder toegelicht in hoofdstuk 3.

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

### Specificatie metagegevens voor objecten en attributen

**Specificatie voor «Objecttype»**

De objecttypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**2-6                 | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                                                                                                                          | **In UML 2.5**2-5                        | **In EA**2-7                                                                                                                                                    |
|-------------------------------|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Naam√**                     | 1                 | Algemeen metagegeven. 2-8.                                                                                                                                                                                                                                                                                                               | *name van de metaclass Named element*    | *Name*                                                                                                                                                          |
| **Alias**                     | 0..1              | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                    |                                          | *Alias*                                                                                                                                                         |
| **Herkomst**                  | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                    |                                          | *Tagged value*                                                                                                                                                  |
| **Definitie√**                | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                    | *Body van de metaclass Comment*          | *Notes*                                                                                                                                                         |
| **Herkomst definitie√**       | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                    |                                          | *Tagged value*                                                                                                                                                  |
| **Datum opname**              | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                    |                                          | *Tagged value*                                                                                                                                                  |
| **Unieke aanduiding√**        | 1                 | Voor objecttypen die deel uitmaken van een (basis)registratie of informatiemodel betreft dit de wijze waarop daarin voorkomende objecten (van dit type) uniek in de registratie worden aangeduid.                                                                                                                                        | *-*                                      | *isId bij attribuutsoort, --- of --- stereotype «isId» bij target role relatiesoort --- of --- een combinatie van deze twee, elk hiervan meer keren toepasbaar* |
| **Populatie√**                | 0..1              | Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.                                                                                                                               |                                          | *Tagged value*                                                                                                                                                  |
| **Kwaliteit√**                | 0..1              | Voor objecttypen die deel uitmaken van een registratie betreft dit de waarborgen voor de juistheid van de in de registratie opgenomen objecten van het desbetreffende type.                                                                                                                                                              |                                          | *Tagged value*                                                                                                                                                  |
| **Toelichting√**              | 0..1              | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                                    |                                          | *Tagged value*                                                                                                                                                  |
| **Indicatie abstract object** | 1                 | Conceptueel model: indicatie dat het objecttype een generalisatie is, waarvan een object als specialisatie altijd voorkomt in de hoedanigheid van een (en slechts één) van de specialisaties van het betreffende objecttype. Logisch model: Indicatie dat er geen instanties (objecten) voor het betreffende objecttype mogen voorkomen. | *isAbstract bij de metaclass Classifier* | *Abstract*                                                                                                                                                      |

**Specificatie voor «Attribuutsoort»**

De attribuutsoorten worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                  | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                          | **In UML 2.5**                                                   | **In EA**       |
|---------------------------------------------|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------|-----------------|
| **Naam √**                                  | 1                 | Algemeen metagegeven.                                                                                                                                                                                    | *name van de metaclass Named element*                            | *Name*          |
| **Alias**                                   | 0..1              | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Alias*         |
| **Herkomst**                                | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Definitie √**                             | 1                 | Algemeen metagegeven.                                                                                                                                                                                    | *Body van de metaclass Comment*                                  | *Notes*         |
| **Herkomst definitie √**                    | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Datum opname**                            | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Domein** *(aspecten van een waarde/data)* |                   | *Domein is zelf geen metadata aspect. Onder het kopje ‘domein’ vallen een aantal metadata aspecten die gelden voor een waarde, oftewel de eisen waaraan een waarde van een attribuutsoort moet voldoen.* |                                                                  |                 |
| **- Type**                                  | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **- Lengte**                                | 0..1              | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **- Patroon**                               | 0..1              | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **- Formeel Patroon**                       | 0..1              | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Indicatie materiële historie √**          | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Indicatie formele historie √**            | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Locatie**                                 | 0..1              | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *taggged value* |
| **Kardinaliteit √**                         | 1                 | Algemeen metagegeven.                                                                                                                                                                                    | *lowerValue en upperValue van de metaclass Multiplicity Element* | *Multiplicity*  |
| **Authentiek √**                            | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Toelichting √**                           | 0..1              | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Indicatie afleidbaar**                    | 1                 | Algemeen metagegeven.                                                                                                                                                                                    | *isDerived bij metaclass Property*                               | *isDerived*     |
| **Mogelijk geen waarde**                    | 1                 | Algemeen metagegeven.                                                                                                                                                                                    |                                                                  | *Tagged value*  |
| **Identificerend**                          | 0..1              | Algemeen metagegeven.                                                                                                                                                                                    | *isID bij de metaclass Property*                                 | *isID*          |

**Specificatie voor «Gegevensgroep»**

De gegevensgroepen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                       | **Kardinaliteit** | **Toelichting**                                        | **In UML 2.5**                                                   | **In EA**                                                               |
|----------------------------------|-------------------|--------------------------------------------------------|------------------------------------------------------------------|-------------------------------------------------------------------------|
| **Naam**                         | 1                 | Algemeen metagegeven.                                  | *name van de metaclass Named element*                            | *Name*                                                                  |
| **Alias**                        | 0..1              | Algemeen metagegeven.                                  |                                                                  | *Alias*                                                                 |
| **Definitie**                    | 1                 | Algemeen metagegeven.                                  | *Body van de metaclass Comment*                                  | *Notes*                                                                 |
| **Toelichting**                  | 0..1              | Algemeen metagegeven.                                  |                                                                  | *Tagged value*                                                          |
| **Gegevensgroeptype**            | 1                 | De verwijzing naar het bijbehorende gegevensgroeptype. |                                                                  | *Type*                                                                  |
| **Herkomst**                     | 1                 | Algemeen metagegeven.                                  |                                                                  | *Tagged value*                                                          |
| **Herkomst definitie**           | 1                 | Algemeen metagegeven.                                  |                                                                  | *Tagged value*                                                          |
| **Datum opname**                 | 1                 | Algemeen metagegeven.                                  |                                                                  | *Tagged value*                                                          |
| **Indicatie materiële historie** | 1                 | Algemeen metagegeven.                                  |                                                                  | *Tagged value*                                                          |
| **Indicatie formele historie**   | 1                 | Algemeen metagegeven.                                  |                                                                  | *Tagged value*                                                          |
| **Kardinaliteit**                | 1                 | Algemeen metagegeven.                                  | *lowerValue en upperValue van de metaclass Multiplicity Element* | *Multiplicity van de source role van de bijbehorende composite relatie* |
| **Authentiek**                   | 1                 | Algemeen metagegeven.                                  |                                                                  | *Tagged value*                                                          |

**Specificatie voor «Gegevensgroeptype»**

De gegevensgroeptypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**       | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                        | **In EA**      |
|------------------|-------------------|-----------------------|---------------------------------------|----------------|
| **Naam**         | 1                 | Algemeen metagegeven. | *name van de metaclass Named element* | *Name*         |
| **Alias**        | 0..1              | Algemeen metagegeven. |                                       | *Alias*        |
| **Datum opname** | 1                 | Algemeen metagegeven. |                                       | *Tagged value* |

### Specificatie metagegevens voor relaties

**Relatiesoort en relatierol**

Het metamodel heeft twee manieren om een relatie tussen twee objecttypen te
beschrijven. Deze keuze wordt aangegeven in de eigen extensie, zoals beschreven
in paragraaf 1.8. Alleen het gekozen alternatief is relevant voor de modellering
in uw informatiemodel. - Alternatief 1: Verplichte benoeming van de naam van de
relatie met de bijbehorende metagegevens\*\* - Alternatief 2: Verplichte
benoeming van de rol van de target in een relatie met de bijbehorende
metagegevens en optioneel de benoeming van de naam van de relatie.

Beide alternatieven gebruiken relatiesoort en relatierol, maar met andere regels
voor gebruik.

#### Relatiesoort leidend (alternatief 1)

Relatiesoort is verplicht, met een naam en met een definitie en deze is leidend.
Metadata aspecten worden hierbij altijd vastgelegd. Het gebruik van relatierol
is optioneel (zowel bij source en target). Áls er een relatierol target wordt
vastgelegd, dan is de metadata hierbij wel verplicht.

**Specificatie voor «Relatiesoort»**

De relatiesoorten worden naar de volgende aspecten gespecificeerd.

| **Aspect**                        | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                             | **In UML 2.5**                                                  | **In EA**                                                           |
|-----------------------------------|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|---------------------------------------------------------------------|
| **Naam√**                         | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       | *name van metaclass Named element*                              | *Name*                                                              |
| **Alias**                         | 0..1              | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Alias*                                                             |
| **Uni-directioneel**              | 1                 | Het gerelateerde objecttype (de target) waarvan het objecttype, die de eigenaar is van deze relatie (de source), kennis heeft. Alle relaties zijn altijd gericht van het objecttype (source) naar het gerelateerde objecttype (target).     |                                                                 | *Direction van de betreffende assiciation (van source naar target)* |
| **Objecttype**                    | 1                 | Het objecttype waarvan de relatie een eigenschap is.                                                                                                                                                                                        | */source: related Element bij Relationship Element*             | *Source*                                                            |
| **Gerelateerd objecttype**        | 1                 | Het objecttype waarmee een objecttype een logisch verband heeft                                                                                                                                                                             | */target: related Element bij Relationship Element*             | *Target*                                                            |
| **Type aggregatie**               | 1                 | Standaard betreft het geen aggregatie (None). Het type aggregatie mag ‘composite’ zijn. Dit wordt gedaan als er een afhankelijkheid is in die zin dat de target niet kan bestaan zonder de source: de target vervalt als de source vervalt. | *isComposite bij metaclass Property*                            | *Aggregation van de source role met waarde composite*               |
| **Kardinaliteit√**                | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       | *lowerValue en upperValue van de metaclass MultiplicityElement* | *Multiplicity van de target role*                                   |
| **Herkomst**                      | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |
| **Definitie√**                    | 1                 | Algemeen metagegeven..                                                                                                                                                                                                                      | *Body van de metaclass Comment*                                 | *Notes*                                                             |
| **Toelichting√**                  | 0..1              | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |
| **Herkomst definitie√**           | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |
| **Datum opname**                  | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |
| **Indicatie materiële historie√** | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |
| **Indicatie formele historie√**   | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |
| **Authentiek√**                   | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |
| **Indicatie afleidbaar**          | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       | *isDerived bij UML metaclass Assocation*                        | *isDerived*                                                         |
| **Mogelijk geen waarde**          | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                       |                                                                 | *Tagged value*                                                      |

**Specificatie voor «Relatierol»**

Voor relatierollen worden naar de volgende aspecten gespecificeerd.

| **Aspect**    | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                       | **In EA** |
|---------------|-------------------|-----------------------|--------------------------------------|-----------|
| **Naam**      | 0..1              | Algemeen metagegeven. | *name van de metaclass Namedelement* | *Name*    |
| **Alias**     | 0..1              | Algemeen metagegeven. |                                      | *Alias*   |
| **Definitie** | 0..1              | Algemeen metagegeven. | *Body van de metaclass Comment*      | *Notes*   |

#### Relatierol is leidend (alternatief 2)

Verplichte benoeming van de rol van de target in een relatie met de bijbehoren
de metagegevens en optioneel de benoeming van de naam van de relatie.

**Specificatie voor «Relatiesoort»**

De relatiesoorten worden naar de volgende aspecten gespecificeerd.

| **Aspect**    | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                       | **In EA** |
|---------------|-------------------|-----------------------|--------------------------------------|-----------|
| **Naam**      | 0..1              | Algemeen metagegeven. | *name van de metaclass NamedElement* | *Name*    |
| **Alias**     | 0..1              | Algemeen metagegeven. |                                      | *Alias*   |
| **Definitie** | 0..1              | Algemeen metagegeven. | *Body van de metaclass Comment*      | *Notes*   |

**Specificatie voor «Relatierol»**

Voor relatierol worden bij de target rol van een relatiesoort de volgende
aspecten gespecificeerd.

| **Aspect**                        | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                                                   | **In EA**      |
|-----------------------------------|-------------------|-----------------------|------------------------------------------------------------------|----------------|
| **Naam**                          | 1                 | Algemeen metagegeven. | *name van de metaclass*                                          | *Name*         |
| **Alias**                         | 0..1              | Algemeen metagegeven. |                                                                  | *Alias*        |
| **Herkomst**                      | 1                 | Algemeen metagegeven. |                                                                  | *Tagged value* |
| **Definitie√ \***                 | 1                 | Algemeen metagegeven. | *Body van de metaclass Comment*                                  | *Notes*        |
| **Herkomst definitie√**           | 1                 | Algemeen metagegeven. |                                                                  | *Tagged value* |
| **Datum opname**                  | 1                 | Algemeen metagegeven. |                                                                  | *Tagged value* |
| **Kardinaliteit√**                | 1                 | Algemeen metagegeven. | *lowerValue en upperValue van de metaclass Multiplicity Element* | *Multiplicity* |
| **Indicatie materiële historie√** | 1                 | Algemeen metagegeven. |                                                                  | *Tagged value* |
| **Indicatie formele historie√**   | 1                 | Algemeen metagegeven. |                                                                  | *Tagged value* |
| **Authentiek√ \***                | 1                 | Algemeen metagegeven. |                                                                  | *Tagged value* |
| **Mogelijk geen waarde**          | 1                 | Algemeen metagegeven. |                                                                  | *Tagged value* |
| **Toelichting√ \***               | 0..1              | Algemeen metagegeven. |                                                                  | *Tagged value* |

**Specificatie voor «Generalisatie» tussen objecttypes**

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                 | **Kardina liteit** | **Toelichting**                                                     | **In UML 2.5**                                      | **In EA** |
|----------------------------|--------------------|---------------------------------------------------------------------|-----------------------------------------------------|-----------|
| **Naam**                   | 0..1               | Algemeen metagegeven. *Standaard ‘is specialisatie van’.*           | *name van de etaclass Named element*                | *Name*    |
| **Alias**                  | 0..1               | Algemeen metagegeven.                                               |                                                     | *Alias*   |
| **Objecttype**             | 1                  | Het objecttype dat een specialisatie is van een (ander) objecttype. | */source: related Element bij Relationship Element* | *Source*  |
| **Gerelateerd objecttype** | 1                  | Het objecttype dat de generalisatie is van een (ander) objecttype.  | */target: related Element bij Relationship Element* | *Target*  |

**Specificatie voor «Generalisatie» tussen datatypes**

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                 | **Kardinaliteit** | **Toelichting**                                                 | **In UML 2.5**                                      | **In EA** |
|----------------------------|-------------------|-----------------------------------------------------------------|-----------------------------------------------------|-----------|
| **Naam**                   | 0..1              | Algemeen metagegeven.                                           | *name van de metaclass Named element*               | *Name*    |
| **Alias**                  | 0..1              | Algemeen metagegeven.                                           |                                                     | *Alias*   |
| **Datatype**               | 1                 | Het datatype dat een specialisatie is van een (ander) datatype. | */source: related Element bij Relationship Element* | *Source*  |
| **Gerelateerd objecttype** | 1                 | Het datatype dat de generalisatie is van een (ander) datatype.  | */target: related Element bij Relationship Element* | *Target*  |

**Specificatie voor «Relatieklasse»**

De relatieklassen worden naar de volgende aspecten gespecificeerd:

| **Aspect**    | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                        | **In EA** |
|---------------|-------------------|-----------------------|---------------------------------------|-----------|
| **Naam**      | 1                 | Algemeen metagegeven. | *name van de metaclass Named element* | *Name*    |
| **Alias**     | 0..1              | Algemeen metagegeven. |                                       | *Alias*   |
| **Definitie** | 1                 | Algemeen metagegeven. | *Body van de metaclass Comment*       | *Notes*   |

**Specificatie voor «Externe koppeling»**

Externe koppelingen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                 | **Kardi naliteit** | **Toelichting**                                                                                                                                                                                                                                                                                                                  | **In UML 2.5**                                      | **In EA**                            |
|----------------------------|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|--------------------------------------|
| **Naam**                   | 0..1               | Algemeen metagegeven. Standaard ‘betreft’.                                                                                                                                                                                                                                                                                       | *name van de metaclass Named element*               | *Name*                               |
| **Alias**                  | 0..1               | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                            |                                                     | *Alias*                              |
| **Datum opname**           | 1                  | Algemeen metagegeven.                                                                                                                                                                                                                                                                                                            |                                                     | *Tagged value*                       |
| **Objecttype**             | 1                  | Het objecttype waarvan de relatie een eigenschap is.                                                                                                                                                                                                                                                                             | */source: related Element bij Relationship Element* | *Source*                             |
| **Type aggregatie**        | 1                  | Aanduiding dat het een compositie relatie is. Waarde is altijd Composite.                                                                                                                                                                                                                                                        | *isComposite van Property*                          | *Aggregation in de Source role*      |
| **Gerelateerd objecttype** | 1                  | Het objecttype uit een extern informatiemodel waarmee een objecttype een logische verbinding heeft.                                                                                                                                                                                                                              | */target: related Element bij Relationship Element* | *Target*                             |
| **Uni-directioneel**       | 1                  | Het gerelateerde objecttype uit een extern informatiemodel (de target) waarvan het objecttype die de eigenaar van deze relatie is (de source) kennis heeft. Het aggregation type van de source is altijd ‘composition’. Alle relaties zijn altijd gericht van het objecttype (source) naar het gerelateerde objecttype (target). |                                                     | *Direction (van source naar target)* |

### Specificatie metagegevens voor waardenlijsten

**Specificatie voor «Referentielijst»**

Voor referentielijsten worden de volgende aspecten gespecificeerd:

| **Aspect**       | **Kardinaliteit** | **Toelichting**           | **In UML 2.5**                       | **In EA**      |
|------------------|-------------------|---------------------------|--------------------------------------|----------------|
| **Naam**         | 1                 | Algemeen metagegeven.     | *name van de metaclass Namedelement* | *Name*         |
| **Alias**        | 0..1              | Algemeen metagegeven.     |                                      | *Alias*        |
| **Herkomst**     | 1                 | Algemeen metagegeven. 2-9 |                                      | *Tagged value* |
| **Definitie**    | 1                 | Algemeen metagegeven.     | *Body van de metaclass Comment*      | *Notes*        |
| **Datum opname** | 1                 | Algemeen metagegeven.     |                                      | *Tagged value* |
| **Toelichting**  | 0..1              | Algemeen metagegeven.     |                                      | *Tagged value* |
| **Locatie**      | 1..1              | Algemeen metagegeven.     |                                      | *Tagged value* |

**Specificatie voor «Referentie element»**

De referentie-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                  | **Kardi naliteit** | **Toelichting**       | **In UML 2.5**                                                   | **In EA**                            |
|---------------------------------------------|--------------------|-----------------------|------------------------------------------------------------------|--------------------------------------|
| **Naam**                                    | 1                  | Algemeen metagegeven. | *name van de metaclass Named element*                            | *Name*                               |
| **Alias**                                   | 0..1               | Algemeen metagegeven. |                                                                  | *Alias*                              |
| **Definitie**                               | 1                  | Algemeen metagegeven. | *Body van de metaclass Comment*                                  | *Notes*                              |
| **Datum opname**                            | 1                  | Algemeen metagegeven. |                                                                  | *Tagged value*                       |
| **Domein** *(aspecten van een waarde/data)* |                    |                       |                                                                  |                                      |
| **- Type**                                  | 1                  | Algemeen metagegeven. |                                                                  | *Type*                               |
| **- Lengte**                                | 0..1               | Algemeen metagegeven. |                                                                  | *Tagged value*                       |
| **- Patroon**                               | 0..1               | Algemeen metagegeven. |                                                                  | *Tagged value*                       |
| **- Formeel patroon**                       | 0..1               | Algemeen metagegeven. |                                                                  | *Tagged value*                       |
| **Kardinaliteit**                           | 1                  | Algemeen metagegeven. | *lowerValue en upperValue van de metaclass Multiplicity Element* | *Multiplicity van de de target role* |
| **Identificerend**                          | 0..1               | Algemeen metagegeven. | *isID van de metaclass Property*                                 | *isID bij de betreffende class*      |
| **Toelichting**                             | 0..1               | Algemeen metagegeven. |                                                                  | *Tagged value*                       |

**Specificatie voor «codeList»**

Voor codelist worden de volgende aspecten gespecificeerd:

| **Aspect**       | **Kardinaliteit** | **Toelichting**                                                                                                                                                                                                                                  | **In UML 2.5**                        | **In EA**      |
|------------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|----------------|
| **Naam**         | 1                 | Algemeen metagegeven. *De naam van de lijst zoals gespecificeerd in de catalogus van de desbetreffende registratie dan wel, indien het een door de eigen organisatie toegevoegde lijst betreft, de door de eigen organisatie vastgestelde naam.* | *name van de metaclass Named element* | *Name*         |
| **Alias**        | 0..1              | Algemeen metagegeven.                                                                                                                                                                                                                            | *Alias*                               |                |
| **Herkomst**     | 1                 | Algemeen metagegeven. 11                                                                                                                                                                                                                         |                                       | *tagged value* |
| **Definitie**    | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                            | *Body van de metaclass Comment*       | *Notes*        |
| **Datum opname** | 1                 | Algemeen metagegeven.                                                                                                                                                                                                                            |                                       | *tagged value* |
| **Toelichting**  | 0..1              | Algemeen metagegeven.                                                                                                                                                                                                                            |                                       | *tagged value* |
| **Locatie**      | 1..1              | Algemeen metagegeven.                                                                                                                                                                                                                            |                                       | *tagged value* |

### Specificatie metagegevens voor datatypen

Het betreft metagegevens voor in het informatiemodel gedefinieerde datatypen,
oftewel exclusief datatypen die al buiten het model bestaan, zoals Integer,
DateTime, Surface.

**Specificatie voor «Primitief datatype»**

De datatypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                  | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                        | **In EA**      |
|---------------------------------------------|-------------------|-----------------------|---------------------------------------|----------------|
| **Naam**                                    | 1                 | Algemeen metagegeven. | *name van de metaclass Named element* | *Name*         |
| **Definitie**                               | 0..1              | Algemeen metagegeven. | *Body van de metaclass Comment*       | *Notes*        |
| **Domein** *(aspecten van een waarde/data)* |                   |                       |                                       |                |
| **- Lengte**                                | 0..1              | Algemeen metagegeven. |                                       | *Tagged value* |
| **- Patroon**                               | 0..1              | Algemeen metagegeven. |                                       | *Tagged value* |
| **- Formeel patroon**                       | 0..1              | Algemeen metagegeven. |                                       | *Tagged value* |
| **Herkomst**                                | 1                 | Algemeen metagegeven. |                                       | *Tagged value* |
| **Datum opname**                            | 1                 | Algemeen metagegeven. |                                       | *Tagged value* |

**Specificatie voor «Gestructureerd datatype»**

Voor Gestructureerde datatypen worden de volgende aspecten gespecificeerd:

| **Aspect**          | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                        | **In EA**      |
|---------------------|-------------------|-----------------------|---------------------------------------|----------------|
| **Naam**            | 1                 | Algemeen metagegeven. | *name van de metaclass Named element* | *Name*         |
| **Herkomst**        | 1                 | Algemeen metagegeven. |                                       | *Tagged value* |
| **Definitie**       | 1                 | Algemeen metagegeven. | *Body van de metaclass Comment*       | *Notes*        |
| **Patroon**         | 0..1              | Algemeen metagegeven. |                                       | *Tagged value* |
| **Formeel patroon** | 0..1              | Algemeen metagegeven. |                                       | *Tagged value* |
| **Datum opname**    | 1                 | Algemeen metagegeven. |                                       | *Tagged value* |

**Specificatie voor «Data element»**

De data-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                                  | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                                                  | **In EA**      |
|---------------------------------------------|-------------------|-----------------------|-----------------------------------------------------------------|----------------|
| **Naam**                                    | 1                 | Algemeen metagegeven. | *name van de metaclass Named element*                           | *Name*         |
| **Definitie**                               | 0..1              | Algemeen metagegeven. | *Body van de metaclass Comment*                                 | *Notes*        |
| **Domein** *(aspecten van een waarde/data)* |                   |                       |                                                                 |                |
| **- Type**                                  | 1                 | Algemeen metagegeven. |                                                                 | *Type*         |
| **- Lengte**                                | 0..1              | Algemeen metagegeven. |                                                                 | *Tagged value* |
| **- Patroon**                               | 0..1              | Algemeen metagegeven. |                                                                 | *Tagged value* |
| **- Formeel patroon**                       | 0..1              | Algemeen metagegeven. |                                                                 | *Tagged value* |
| **Kardinaliteit**                           | 1                 | Algemeen metagegeven. | *lowerValue en upperValue van de metaclass MultiplicityElement* | *Multiplicity* |

**Specificatie voor «Union»**

De unions worden naar de volgende aspecten gespecificeerd:

| **Aspect**       | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                       | **InEA**       |
|------------------|-------------------|-----------------------|--------------------------------------|----------------|
| **Naam**         | 1                 | Algemeen metagegeven. | *name van de metaclass Namedelement* | *Name*         |
| **Herkomst**     | 1                 | Algemeen metagegeven. |                                      | *Tagged value* |
| **Definitie**    | 1                 | Algemeen metagegeven. | *Body van de metaclass Comment*      | *Notes*        |
| **Datum opname** | 1                 | Algemeen metagegeven. |                                      | *Tagged value* |

**Specificatie voor «Union element»**

De unionelementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**            | **Kardinaliteit** | **Toelichting**                                                            | **In UML 2.5**                                                  | **In EA**      |
|-----------------------|-------------------|----------------------------------------------------------------------------|-----------------------------------------------------------------|----------------|
| **Naam**              | 1                 | Algemeen metagegeven.                                                      | *name van de metaclass Named element*                           | *Name*         |
| **Definitie**         | 0..1              | Algemeen metagegeven.                                                      | *Body van de metaclass Comment*                                 | *Notes*        |
| **- Type**            | 1                 | Algemeen metagegeven.                                                      |                                                                 | *Type*         |
| **- Patroon**         | 0..1              | Algemeen metagegeven.                                                      |                                                                 | *Tagged value* |
| **- Formeel patroon** | 0..1              | Algemeen metagegeven.                                                      |                                                                 | *Tagged value* |
| **Kardinaliteit**     | 1                 | Algemeen metagegeven. *De kardinaliteit van een unionelement is altijd 1.* | *lowerValue en upperValue van de metaclass MultiplicityElement* | *Multiplicity* |

### Specificatie metagegevens voor packages

**Specificatie voor «Extern»**

Externe packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**      | **Kardinaliteit** | **Toelichting**                                                                                                                                        | **In UML 2.5**                       | **In EA**      |
|-----------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------|----------------|
| **Naam**        | 1                 | Algemeen metagegeven. *De naam van het externe package zoals gespecificeerd door de externe instantie.*                                                | *name van de metaclass Namedelement* | *Name*         |
| **Locatie**     | 1                 | Algemeen metagegeven.                                                                                                                                  |                                      | *Tagged value* |
| **Definitie**   | 1                 | Algemeen metagegeven. *De beschrijving van de betekenis van het package, gezien vanuit het eigen informatiemodel. Bijvoorbeeld: bron van definities.*  | *Body van de metaclass Comment*      | *Notes*        |
| **Herkomst \*** | 1                 | Algemeen metagegeven. *De registratie of het informatiemodel waaraan het package ontleend is. Bij een view is de herkomst nooit de eigen organisatie.* |                                      | *Tagged value* |

**Specificatie voor «View»**

View packages worden naar de volgende aspecten gespecificeerd, analoog aan
«Extern»:

| **Aspect**      | **Kardinaliteit** | **Toelichting**                                                                                                                                        | **In UML 2.5**                        | **In EA?**     |
|-----------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|----------------|
| **Naam**        | 1                 | Algemeen metagegeven. *Deze is, indien mogelijk, analoog aan de naamgeving in het externe schema waar de view over gaat, eventueel met een prefix.*    | *name van de metaclass Named element* | *Name*         |
| **Locatie**     | 1                 | Algemeen metagegeven.                                                                                                                                  |                                       | *Tagged value* |
| **Definitie**   | 1                 | Algemeen metagegeven.                                                                                                                                  | *Body van de metaclass Comment*       | *Notes*        |
| **Herkomst \*** | 1                 | Algemeen metagegeven. *De registratie of het informatiemodel waaraan het package ontleend is. Bij een view is de herkomst nooit de eigen organisatie.* |                                       | *Tagged value* |

### Specificatie metagegevens - overig

#### Specificatie voor Enumeratie

Enumeraties betreffen de metaclass Enumeration en worden naar de volgende
aspecten gespecificeerd:

| **Aspect**    | **Kardinaliteit** | **Toelichting**       | **In UML 2.5**                        | **In EA** |
|---------------|-------------------|-----------------------|---------------------------------------|-----------|
| **Naam**      | 1                 | Algemeen metagegeven. | *name van de metaclass Named element* | *Name*    |
| **Definitie** | 1                 | Algemeen metagegeven. | *Body van de metaclass Comment*       | *Notes*   |

#### Specificatie voor Enumeratiewaarde

De enumeratiewaarde zelf betreft de metaclass UML-EnumerationLiteral en kent
volgende aspecten:

| **Aspect**    | **Kardinaliteit** | **Toelichting**                                                                                                                                          | **In UML 2.5**                          | **In EA** |
|---------------|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------|-----------|
| **Naam**      | 1                 | Algemeen metagegeven.                                                                                                                                    | *name van de metaclass Named element*   | *Name*    |
| **Definitie** | 0..1              | Algemeen metagegeven. *De beschrijving van de betekenis van de enumeratiewaarde zoals gespecificeerd in de catalogus van de desbetreffende registratie.* | *Body van de metaclass Comment*         | *Notes*   |
| **Code**      | 0..1              | De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code (niet te verwarren met alias, zoals bedoeld in 2.6.1).            | *Alias van de metaclass Element Import* | *Alias*   |

#### Specificatie voor een Constraint

Constraint betreft de metaclass UML Constraint en wordt naar de volgende
aspecten gespecificeerd:

| **Aspect**               | **Kardinaliteit** | **Toelichting**                                                           | **In UML 2.5**                        | **In EA**                  |
|--------------------------|-------------------|---------------------------------------------------------------------------|---------------------------------------|----------------------------|
| **Naam√**                | 1                 | Algemeen metagegeven.                                                     | *name van de metaclass Named element* | *Name*                     |
| **Specificatie tekst**   | 0..1              | De specificatie van de constraint in normale tekst.                       |                                       | *Notes (type = invariant)* |
| **Specificatie formeel** | 0..1              | De beschrijving van de constraint in een formele specificatietaal, in OCL |                                       | *Notes (type =OCL)*        |

#### Tagged values en waardenbereik tagged values

Tagged values, zoals genoemd in de UML-extensie kolom zijn altijd van het
datatype CharacterString. Aanvullend geldt:

-   Voor lengtes geldt dat er alleen getallen in mogen (van het datatype
    Integer).

-   Voor datums geldt dat deze het volgende patroon volgen: jjjjmmdd

| **Tagged value**             | **Waardenbereik**                                                                     |
|------------------------------|---------------------------------------------------------------------------------------|
| Indicatie materiële historie | Ja, Nee, zie Groep                                                                    |
| Indicatie formele historie   | Ja, Nee, zie Groep                                                                    |
| Mogelijk geen waarde         | Ja, Nee                                                                               |
| Authentiek2-11               | Authentiek, Basisgegeven, Landelijk kerngegeven, Gemeentelijk kerngegeven, Overig2-12 |

Metamodel Tooling
-----------------

Er is een metamodel *profiel* gemaakt in Sparx Enterprise Architect, dat
gebruikt kan worden bij het modelleren van een informatiemodel. Dit profiel kan
je inladen en daarna kan je kiezen uit de metamodel elementen. Het profiel is
faciliterend en zorgt dat (de meeste) modelelementen van het informatiemodel
automatisch voldoen aan dit metamodel. Het is niet vereist om dit profiel te
gebruiken. Het is niet toegestaan om het profiel te wijzigen. Het is wel
toegestaan om het profiel uit te breiden, naar de behoefte van de eigen
organisatie.

Er is een tool *Imvertor*, die kan controleren of een informatiemodel voldoet
aan dit metamodel en zo niet, wat de reden daarvan is. Deze tool is open source
en is te vinden op [www.imvertor.org](http://www.imvertor.org).

**Voetnoten**

2-1: In versies voor UML 2.5 heette deze nog UML-attribute.

2-2: In versies voor UML 2.5 werd de rol nog op UML-associationEnd gedefinieerd.

2-3: Opmerking: *w*anneer het datatype Postcode landelijk zodanig beschikbaar is
gemaakt zodat hier gebruik van gemaakt kan worden in het model, dan hoeft
Postcode niet meer in het eigen model opgenomen te worden.

2-4: In UML 2.5 heeft een target role een UML-Property waarop **isID** kan
worden gespecificeerd. In Enterprise Architect nog niet. Daarom wordt er
tijdelijk gewerkt met dit stereotype. Op termijn komt deze te vervallen.

2-5: In deze kolom is opgenomen hoe het element in UML2.5 is benoemd. Het
betreft veelal overerving van een gegeven van een UML metaclass die niet in dit
document is benoemd.

2-6: Aspect met aanduiding √ is conform stelselafspraken voor basisregistraties.
Een \* is conform de stelselcatalogus. Die ook de paragraaf in H3 hierover.

2-7: Rode tekst in de kolom ‘In EA’ betreft een standaard element binnen Sparx
EA. Zwarte tekst in de kolom ‘in EA’ betreft uitbreiding op UML Metamodel, via
tagged values of aanvullende stereotypes.

2-8: In (basis) registraties is dit meestal gespecificeerd in een catalogus van
objecten en begrippen. Deze opmerking geldt voor elk metadata aspect naam van de
andere modelelementen. Indien het modelelement niet voorkomt in een dergelijke
catalogus is dan kiest u uiteraard een eigen naam.

2-9: Deze specificatie is toegevoegd t.o.v. de registratiecatalogus aangezien
het hier niet om een registratie gaat maar wel duidelijk moet zijn in welke
registratie de (verwijzing naar de) lijst voorkomt (indien van toepassing).

2-10: Element import wordt in UML ingezet voor het importeren van een
NamedElement uit een ander package. In dit metamodel wordt de alias (nog) niet
zo gebruikt.

2-11: Voor toelichting, zie paragraaf 3.11

2-12: Geef bij overig in uw eigen informatiemodel aan wat u er onder verstaat.
