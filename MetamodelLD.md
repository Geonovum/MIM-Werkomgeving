# Metamodel in Linked Data (LD)

## Ontologisch metamodel in LD

Het MIM uitgedrukt in LD houdt onder ander een ontologisch metamodel in. Dit betekent dat er voor elk van de modelelementen van het MIM een klasse en/of eigenschap gedefinieerd is in termen van RDF, RDFS en OWL. In de hierop volgende paragrafen wordt deze uitwerking geven.

Het MIM is een *metamodel*. Dit betekent dat in termen van het MIM een concreet informatiemodel kan worden uitgewerkt, bijvoorbeeld het informatiemodel Basisregistratie Adressen en Gebouwen. Het MIM is niet bedoeld om vervolgens in termen van dit informatiemodel een concrete dataset te vormen. Zie ook [Typen informatiemodellen](#typen-informatiemodellen): het MIM is niet beoogd voor een informatiemodel op niveau 4. Hiervoor is een transformatie nodig naar een (technisch) uitwisselings- of opslagmodel nodig.

Op diezelfde manier levert het toepassen van het MIM in RDF geen ontologie of vocabulaire waarin RDF kan worden uitgedrukt: slechts het informatiemodel zelf is op deze manier in RDF uitgedrukt. Voor de vertaalslag naar een ontologie is een afzonderlijke transformatie nodig.

Vanuit een Linked Data perspectief is dit bijzonder. Een kernmerk van Linked Data is namelijk dat een informatiemodel op niveau 3 *ook* direct, zonder aanpassingen, bruikbaar is als informatiemodel op niveau 4. Sterk: Linked Data modellen zijn ook bruikbaar op niveau 1 en 2. Dit is vanuit het MIM zelf niet mogelijk. Hiervoor is een vertaalslag nodig naar een "echte" Linked Data ontologie.

Zo leidt een MIM objecttype "Schip" tot de volgende weergave in RDF:

<pre class='ex-turtle'>
@prefix vb: &lt;http://bp4mc2.org/voorbeeld/> .
@prefix mim: &lt;http://bp4mc2.org/def/mim#> .

vb:Schip a mim:Objecttype;
  rdfs:label "Schip"@nl;
.
</pre>

`vb:Schip` is in dit voorbeeld een voorkomen van de klasse `mim:Objecttype`. dit voorkomen kent zelf geen voorkomens. Hiervoor is een vertaling nodig naar een `rdfs:Class`, bijvoorbeeld door:

<pre class='ex-turtle'>
@prefix vbo: &lt;http://bp4mc2.org/voorbeeld/def#>.

vbo:Schip a rdfs:Class;
  rdfs:seeAlso vb:Schip;  
.
vb:Pakjesboot12 a vbo:Schip.
</pre>

De transformatie van het MIM model naar deze RDF ontologie is opgenomen in [sectie 6.4](#transformatie-van-een-mim-model-naar-een-rdf-model).

## Structuur metamodel in LD

Het RDF model is opgesplitst in twee delen. Zoals gebruikelijk in RDF zijn deze modeldelen via hun URL op het internet te benaderen:

1. de [RDF vocabulaire](media/mim.ttl), met de (meta)klassen en (meta)eigenschappen;
2. de [RDF Shapesgraph](media/mim-shapes.ttl), met "shapes", de structuur die gelden op het gebruik van de klassen en eigenschappen.

In onderstaande paragrafen wordt zowel de vocabulaire als de structuur gezamenlijk per modelelement besproken. Een RDF representatie in turtle wordt gegeven en daarnaast ook een grafische representatie. Hiervoor wordt de verbeelding gebruikt zoals beschreven op https://bp4mc2.org/20181107/#grafische-representatie.

Bij het opstellen van het MIM in RDF is gebruik gemaakt van de tekstuele beschrijving van het MIM. Er is een 1-op-1 omzetting gedaan, zonder enige aanpassing van de beschrijvingen. Dit maakt het mogelijk om een MIM informatiemodel om te zetten van de ene representatie (bijvoorbeeld in UML) naar de andere en weer terug, zonder verlies van informatie.

De volgende regels zijn gebruikt bij de omzetting van de MIM tekst naar RDF:

1. Elk voorkomen van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:Class`;
2. Elk aspect van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:DatatypeProperty`, voor zover sprake is van een aspect dat een waarde heeft die met een datatype is uit te drukken (zoals tekstuele, nummerieke of boolean aspecten);
3. Elk aspect van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:ObjectProperty`, voor zover sprake is van een aspect waarbij de waarde verwijst naar een voorkomen van een andere MIM «metaclass»;
4. Een `rdfs:label` is opgenomen met de naam van de MIM «metaclass» c.q. het aspect;
5. Een `rdfs:comment` is opgenomen met de definitie van de MIM «metaclass» c.q. het aspect.

In een enkel geval ontbreekt in de tekst een beschrijving van het aspect. In dat geval is de target rolnaam gebruikt van de associatie, zoals afgebeeld in het figuur bij de tekst. In het voorkomende geval is hiervan een issue aangemaakt.

Voor de omzetting van de gegevensconstraints (zoals cardinaliteiten, datatypen en properties per klasse), is op de volgende manier een SHACL shape graph gemaakt:

1. Elk voorkomen van een MIM «metaclass» kent ook een `sh:NodeShape` met een `sh:name` die overeen komt de originele technische naam (UpperCamelCase);
2. Voor elk voorkomen van een MIM «metaclass» zijn `sh:PropertyShapes` aangemaakt om aan te geven welke aspecten zijn toegestaan voor een MIM «metaclass», de cardinaliteiten en het datatype c.q. de geassocieerde MIM «metaclass».

### Kern

![](media/rdf-kern.png)

Als prefix wordt voor de vocabulaire gebruik gemaakt van `mim`, met de namespace `http://bp4mc2.org/def/mim#`. Voor de shapes wordt als prefix gebruik gemaakt van `shape`, met als namespace `http://bp4mc2.org/def/mim-shapes#`.

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** |
|-------------------|----------------------|------------------|
| Objecttype        | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) | shape:Objecttype |
| Attribuutsoort    | [`mim:Attribuutsoort`](http://bp4mc2.org/def/mim#Attribuutsoort) | shape:Attribuutsoort |
| Gegevensgroep     | [`mim:Gegevensgroep`](http://bp4mc2.org/def/mim#Gegevensgroep) | shape:Gegevensgroep |
| Gegevensgroeptype | [`mim:Gegevensgroeptype`](http://bp4mc2.org/def/mim#Gegevensgroeptype) | shape:Gegevensgroeptype |
| Generalisatie     | [`mim:Generalisatie`](http://bp4mc2.org/def/mim#Generalisatie) | shape:Generalisatie |
| Relatiesoort      | [`mim:Relatiesoort`](http://bp4mc2.org/def/mim#Relatiesoort) | shape:Relatiesoort |
| Relatieklasse     | [`mim:Relatieklasse`](http://bp4mc2.org/def/mim#Relatieklasse) | shape:Relatieklasse |

### Datatypen

![](media/rdf-datatype.png)

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** |
|-------------------|----------------------|------------------|
| \-                      | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) | shape:Datatype |
| Primitief datatype      | [`mim:PrimitiefDatatype`](http://bp4mc2.org/def/mim#PrimitiefDatatype) |shape:PrimitiefDatatype |
| Gestructureerd datatype | [`mim:GestructuurdDatatype`](http://bp4mc2.org/def/mim#GestructuurdDatatype) | shape:GestructuurdDatatype |
| Data element            | [`mim:DataElement`](http://bp4mc2.org/def/mim#DataElement) | shape:DataElement |
| Union                   | [`mim:Union`](http://bp4mc2.org/def/mim#Union) | shape:Union |
| Union element           | [`mim:UnionElement`](http://bp4mc2.org/def/mim#UnionElement) | shape:UnionElement |
| Enumeratie              | [`mim:Enumeratie`](http://bp4mc2.org/def/mim#Enumeratie) | shape:Enumeratie |
| Enumeratiewaarde        | [`mim:Enumeratiewaarde`](http://bp4mc2.org/def/mim#Enumeratiewaarde) | shape:Enumeratiewaarde |
| Referentielijst         | [`mim:Referentielijst`](http://bp4mc2.org/def/mim#Referentielijst) | shape:Referentielijst |
| Referentie element      | [`mim:ReferentieElement`](http://bp4mc2.org/def/mim#ReferentieElement) | shape:ReferentieElement |
| Codelist                | [`mim:Codelist`](http://bp4mc2.org/def/mim#Codelist) | shape:Codelist |

### Overige

*Constraint*

![](media/rdf-constraint.png)

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** |
|-------------------|----------------------|------------------|
| Constraint        | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) | shape:Constraint |

*Relatierol*

![](media/rdf-relatie.png)

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** |
|-------------------|----------------------|------------------|
| Relatierol (abstract) | [`Relatierol`](http://bp4mc2.org/def/mim#Relatierol) | shape:Relatierol |
| Relatierol source     | [`RelatierolSource`](http://bp4mc2.org/def/mim#RelatierolSource) | shape:RelatierolSource |
| Relatierol target     | [`RelatierolTarget`](http://bp4mc2.org/def/mim#RelatierolTarget) | shape:RelatierolTarget |

*Externe koppeling*

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** |
|-------------------|----------------------|------------------|
| Externe koppeling | [`mim:ExterneKoppeling`](http://bp4mc2.org/def/mim#ExterneKoppeling) | shape:ExterneKoppeling |

*Packages*

| **MIM metaclass**     | **Metaclass in RDF** | **Shape in RDF** |
|-----------------------|----------------------|------------------|
| Informatiemodel       | [`mim:Informatiemodel`](http://bp4mc2.org/def/mim#Informatiemodel) | shape:Informatiemodel |
| Domein (het eigen IM) | [`mim:Domein`](http://bp4mc2.org/def/mim#Domein) | shape:Domein |
| Extern                | [`mim:Extern`](http://bp4mc2.org/def/mim#Extern) | shape:Extern |
| View                  | [`mim:View`](http://bp4mc2.org/def/mim#View) | shape:View |

## Nadere specificatie metagegevens in LD

Deze paragraaf is een aanvulling op de paragraaf *'Specificatie metagegevens'* in het hoofdstuk [Metamodel Algemeen](#metamodel-algemeen).

De betekenis van de metagegevens worden in LD gespecificeerd los van de klasse waartoe deze metagegevens behoren. Hieronder is een opsomming gegeven van alle metagegevens en de overeenkomstige meta-eigenschap in RDF. Ook is de definitie hier opgenomen voor zover aanwezig overgenomen uit eerdergenoemde algemene paragraaf.

De gegevensregels (structuur) voor de metagegevens zijn wel specifiek per klasse, en worden in de betreffende paragraaf behandeld.

| **MIM metagegeven** | **Meta-eigenschap in RDF** | **RDF type** | **Definitie** |
|---------------------|----------------------------|--------------|----------------|
| alias | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | owl:DatatypeProperty | De alternatieve weergave van de naam. |
| begrip | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | owl:ObjectProperty | Verwijzing naar een begrip, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd. |
| begripsterm | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | owl:DatatypeProperty | Verwijzing naar een begrip in de vorm van de term, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd. |
| attribuut | [`mim:attribuut`](http://bp4mc2.org/def/mim#attribuut) | owl:ObjectProperty | \- |
| authentiek | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | owl:ObjectProperty | Indien het een authentiek (landelijk) basisgegeven of een als relatiesoort gemodelleerd authentiek (landelijk) basisgegeven is. Basisgegevens zijn altijd gegevens afkomstig uit de landelijke registraties. |
| code | [`mim:code`](http://bp4mc2.org/def/mim#code) | owl:DatatypeProperty | De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code |
| constraint | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | owl:ObjectProperty | \- |
| datum opname | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | owl:DatatypeProperty | De datum waarop het modelelement is opgenomen in het informatiemodel.
| definitie | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | owl:DatatypeProperty | Zie ISO 19103. Vrij vertaald: alle alfanumerieke tekens en speciale tekens die horen bij de gekozen characterset (standaard UTF-8), dus met diakrieten, white spaces, \-teken en newlines of HTML opmaak e.d. Mag starten met spatie. De maximale lengte is onbepaald. |
| element | [`mim:element`](http://bp4mc2.org/def/mim#element) | owl:ObjectProperty | \- |
| formeel patroon | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | owl:DatatypeProperty | Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door de computer wordt herkend. |
| gegevensgroep | [`mim:gegevensgroep`](http://bp4mc2.org/def/mim#gegevensgroep) | owl:ObjectProperty | \- |
| gegevensgroeptype | [`mim:gegevensgroeptype`](http://bp4mc2.org/def/mim#gegevensgroeptype) | owl:ObjectProperty | De verwijzing naar het bijbehorende gegevensgroeptype |
| doel | [`mim:doel`](http://bp4mc2.org/def/mim#doel) | owl:ObjectProperty | Aanduiding van het gerelateerde objecttype die het eindpunt van de relatie aangeeft. Naar objecten van dit objecttype wordt verwezen. |
| herkomst | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | owl:DatatypeProperty | De registratie of het informatiemodel waaraan het modelelement ontleend is dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is. |
| herkomst definitie | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | owl:DatatypeProperty | De registratie of het informatiemodel waaruit de definitie is overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de definitie is samengesteld. |
| identificerend | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | owl:DatatypeProperty | Aanduiding dat attribuutsoort onderdeel uitmaakt van de unieke aanduiding van een object |
| indicatie abstract object | [`mim:indicatieAbstractObject`](http://bp4mc2.org/def/mim#indicatieAbstractObject) | owl:DatatypeProperty | Indicatie dat het objecttype een generalisatie is, waarvan een object als specialisatie altijd voorkomt in de hoedanigheid van een (en slechts één) van de specialisaties van het betreffende objecttype. |
| indicatie afleidbaar | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of relatiesoorten. |
| indicatie formele historie | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | owl:DatatypeProperty | Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is. |
| indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | owl:DatatypeProperty | Indicatie of de materiële historie van het kenmerk van het object te bevragen is. |
| kardinaliteit | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | owl:DatatypeProperty | De kardinaliteit geeft aan hoeveel keer waarden van dit kenmerk van een object kunnen voorkomen bij een object van het betreffende objecttype. |
| kwaliteit | [`mim:kwaliteit`](http://bp4mc2.org/def/mim#kwaliteit) | owl:DatatypeProperty | Voor objecttypen die deel uitmaken van een registratie betreft dit de waarborgen voor de juistheid van de in de registratie opgenomen objecten van het desbetreffende type. |
| lengte | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | owl:DatatypeProperty | De aanduiding van de lengte van een gegeven. |
| locatie | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | owl:DatatypeProperty | Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de locatie waar deze te vinden is opgegeven. |
| mim taal | [`mim:taal`](http://bp4mc2.org/def/mim#taal) | owl:DatatypeProperty | De aanduiding van de taal die gebruikt is voor de modelelementen. |
| mim extensie | [`mim:extensie`](http://bp4mc2.org/def/mim#extensie) | owl:DatatypeProperty | De aanduiding van een extensie op MIM. |
| mim versie | [`mim:versie`](http://bp4mc2.org/def/mim#versie) | owl:DatatypeProperty | De versie van de MIM specificatie die gebruikt is om het informatiemodel in uit te drukken. |
| mogelijk geen waarde | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | owl:DatatypeProperty | Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk is of de waarde er werkelijk ook niet is. |
| naam | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | owl:DatatypeProperty | De naam van een modelelement |
| bron | [`mim:bron`](http://bp4mc2.org/def/mim#bron) | owl:ObjectProperty | Aanduiding van het bronobject in een relatie tussen objecten. Een bronoject heeft middels een relatiesoort een relatie met een doelobject. |
| patroon | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | owl:DatatypeProperty | De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur. |
| populatie | [`mim:populatie`](http://bp4mc2.org/def/mim#populatie) | owl:DatatypeProperty | Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)- registratie voorhanden zijn. |
| specificatie formeel | [`mim:specificatieFormeel`](http://bp4mc2.org/def/mim#specificatieFormeel) | owl:DatatypeProperty | De beschrijving van de constraint in een formele specificatietaal, in OCL |
| specificatie tekst | [`mim:specificatieTekst`](http://bp4mc2.org/def/mim#specificatieTekst) | owl:DatatypeProperty | De specificatie van de constraint in normale tekst.
| subtype | [`mim:subtype`](http://bp4mc2.org/def/mim#subtype) | owl:ObjectProperty | \- |
| supertype | [`mim:supertype`](http://bp4mc2.org/def/mim#supertype) | owl:ObjectProperty | \- |
| toelichting | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | owl:DatatypeProperty | Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding. |
| type | [`mim:type`](http://bp4mc2.org/def/mim#type) | owl:ObjectProperty | Het datatype waarmee waarden van deze attribuutsoort worden vastgelegd. |
| aggregatietype | [`mim:aggregatietype`](http://bp4mc2.org/def/mim#aggregatietype) | owl:ObjectProperty | Standaard betreft het geen aggregatie (Geen). Het aggregatietype mag 'Compositie' zijn. Dit wordt gedaan als er een afhankelijkheid is in die zin dat de target niet kan bestaan zonder de source: de target vervalt als de source vervalt. |
| unidirectioneel | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | owl:DatatypeProperty | De richting van een relatie, welke betekenis geeft aan de relatie vanuit het perspectief van de eigenaar van de relatie. |
| uniekeAanduiding | [`mim:uniekeAanduiding`](http://bp4mc2.org/def/mim#uniekeAanduiding) | owl:DatatypeProperty | Voor objecttypen die deel uitmaken van een (basis)registratie of informatiemodel betreft dit de wijze waarop daarin voorkomende objecten (van dit type) uniek in de registratie worden aangeduid. |
| waarde | [`mim:waarde`](http://bp4mc2.org/def/mim#waarde) | owl:ObjectProperty | \- |

### Modellering metagegevens voor objecten en attributen in LD

**Specificatie voor mim:Objecttype**

De objecttypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|---------------------------|----------------|-------------------|--------------|
| Naam                      | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                     | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                  | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                 | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst definitie        | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname              | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Unieke aanduiding         | [`mim:uniekeAanduiding`](http://bp4mc2.org/def/mim#uniekeAanduiding) | 1 | tekst |
| Populatie                 | [`mim:populatie`](http://bp4mc2.org/def/mim#populatie) | 0..1 | tekst |
| Kwaliteit                 | [`mim:kwaliteit`](http://bp4mc2.org/def/mim#kwaliteit) | 0..1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Indicatie abstract object | [`mim:indicatieAbstractObject`](http://bp4mc2.org/def/mim#indicatieAbstractObject) | 1 | boolean |
| Attribuut                 | [`mim:attribuut`](http://bp4mc2.org/def/mim#attribuut) | 0..n | [`mim:Attribuutsoort`](http://bp4mc2.org/def/mim#Attribuutsoort) |
| Gegevensgroep             | [`mim:gegevensgroep`](http://bp4mc2.org/def/mim#gegevensgroep) | 0..n | [`mim:Gegevensgroep`](http://bp4mc2.org/def/mim#Gegevensgroep) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

**Specificatie voor mim:Attribuutsoort**

De attribuutsoorten worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Identificerend               | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | 0..1 | tekst |

Het veld `mim:authentiek` verwijst naar één van de volgende mogelijke waarden:

| **Authenticiteit** | **Definitie** |
|--------------------|---------------|
| [`mim:Authentiek`](http://bp4mc2.org/def/mim#Authentiek) | Indien het een authentiek (landelijk) basisgegeven of een als relatiesoort gemodelleerd authentiek (landelijk) basisgegeven is. Basisgegevens zijn altijd gegevens afkomstig uit de landelijke registraties. |
| [`mim:Basisgegeven`](http://bp4mc2.org/def/mim#Basisgegeven) | Indien het een landelijk basisgegeven of een als relatiesoort gemodelleerd (landelijk) basisgegeven is in een landelijke registratie, maar in die registratie géén authentiek gegeven is. |
| [`mim:LandelijkKerngegeven`](http://bp4mc2.org/def/mim#LandelijkKerngegeven) | Indien het een gegeven of een als relatiesoort gemodelleerd gegeven is in een landelijk sector- en domein-overstijgend informatiemodel en geen authentiek gegeven en geen basisgegeven is. |
| [`mim:GemeentelijkKerngegeven`](http://bp4mc2.org/def/mim#GemeentelijkKerngegeven) | \- |
| [`mim:OverigeAuthenticiteit`](http://bp4mc2.org/def/mim#OverigeAuthenticiteit) | Indien het géén van de voorgaande categorieën betreft. Veelal gaat het dan om proces-, taakveld- of domeinspecifieke gegevens. |

**Specificatie voor mim:Gegevensgroep**

De gegevensgroepen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Gegevensgroeptype            | [`mim:gegevensgroeptype`](http://bp4mc2.org/def/mim#gegevensgroeptype) | 1 | [`mim:Gegevensgroeptype`](http://bp4mc2.org/def/mim#Gegevensgroeptype) |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |

**Specificatie voor mim:Gegevensgroeptype**

De gegevensgroeptypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Attribuut                 | [`mim:attribuut`](http://bp4mc2.org/def/mim#attribuut) | 0..n | [`mim:Attribuutsoort`](http://bp4mc2.org/def/mim#Attribuutsoort) |
| Gegevensgroep             | [`mim:gegevensgroep`](http://bp4mc2.org/def/mim#gegevensgroep) | 0..n | [`mim:Gegevensgroep`](http://bp4mc2.org/def/mim#Gegevensgroep) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

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

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Unidirectioneel              | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | 1 | boolean |
| Bron                         | [`mim:bron`](http://bp4mc2.org/def/mim#bron) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Doel                         | [`mim:doel`](http://bp4mc2.org/def/mim#doel) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Type aggregatie              | [`mim:typeAggregatie`](http://bp4mc2.org/def/mim#typeAggregatie) | 1 | Aggregatietype |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |

Het veld `mim:typeAggregatie` verwijst naar één van de volgende mogelijke waarden:

| **Aggregatietype** | **Definitie** |
|--------------------|---------------|
| [`mim:None`](http://bp4mc2.org/def/mim#None) | Er is geen sprake van een aggregate |
| [`mim:Composite`](http://bp4mc2.org/def/mim#Composite) | Compositie (gesloten wiebertje) |
| [`mim:Aggregate`](http://bp4mc2.org/def/mim#Aggregate) | Aggregatie (open wiebertje) |

**Specificatie voor mim:Relatierol**

Voor relatierollen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |

#### Relatierol is leidend (alternatief 2)

Verplichte benoeming van de rol van de target in een relatie met de bijbehoren
de metagegevens en optioneel de benoeming van de naam van de relatie.

**Specificatie voor «Relatiesoort»**

De relatiesoorten worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |

**Specificatie voor «Relatierol»**

Voor relatierol worden bij de target rol van een relatiesoort de volgende
aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
mim#Objecttype) |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |

### Specificatie metagegevens voor overige relaties

**Specificatie voor mim:Generalisatie bij objecttypen**

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Subtype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#subtype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Supertype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#supertype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |

**Specificatie voor mim:Generalisatie bij datatypen**

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Subtype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#subtype) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Supertype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#supertype) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |

**Specificatie voor mim:Relatieklasse**

De relatieklassen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |
| Constraint                   | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

**Specificatie voor mim:Externe koppeling**

Externe koppelingen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Bron                         | [`mim:bron`](http://bp4mc2.org/def/mim#bron) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Doel                         | [`mim:doel`](http://bp4mc2.org/def/mim#doel) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Type aggregatie              | [`mim:typeAggregatie`](http://bp4mc2.org/def/mim#typeAggregatie) | 1 | Aggregatietype |
| Unidirectioneel              | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | 1 | boolean |

### Specificatie metagegevens voor waardenlijsten

Waar in onderstaande specificaties sprake is van een locatie, wordt in Linked Data termen veronderstelt dat op deze locatie de waardenlijst te vinden is. Concreet betekent dit dat via content negotiation de waardenlijst in een specifieke serialisatie van Linked Data is op te halen (zoals: JSON-LD, RDF/XML, Turtle). Vervolgens wordt verondersteld dat de resources in dit bestand de afzonderlijke waarden van de waardenlijst zijn, of andere metagegevens van de waardenlijst. Zo ligt voor de hand dat het bestand een resource bevat met dezelfde URL als opgegeven in de locatie, waarmee nadere informatie kan worden aangegeven.

**Specificatie voor mim:Referentielijst**

Voor referentielijsten worden de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |
| Referentie-element           | [`mim:referentieElement`](http://bp4mc2.org/def/mim#referentieElement) | 1..* | [`mim:ReferentieElement`](http://bp4mc2.org/def/mim#ReferentieElement) |

**Specificatie voor mim:ReferentieElement**

De referentie-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Identificerend               | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | 0..1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |

**Specificatie voor mim:codeList**

Voor codelist worden de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |

### Specificatie metagegevens voor datatypen

Het betreft metagegevens voor in het informatiemodel gedefinieerde datatypen,
oftewel exclusief datatypen die al buiten het model bestaan, zoals Integer,
DateTime, Surface.

**Specificatie voor mim:PrimitiefDatatype**

De datatypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |

**Specificatie voor mim:GestructureerdDatatype**

Voor Gestructureerde datatypen worden de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Data-element                 | [`mim:dataElement`](http://bp4mc2.org/def/mim#dataElement) | 0..* | [`mim:DataElement`](http://bp4mc2.org/def/mim#DataElement) |

**Specificatie voor mim:DataElement**

De data-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |

**Specificatie voor mim:Union**

De unions worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Union-element                | [`mim:unionElement`](http://bp4mc2.org/def/mim#unionElement) | 2..* | [`mim:UnionElement`](http://bp4mc2.org/def/mim#UnionElement) |

**Specificatie voor mim:UnionElement**

De unionelementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |

### Specificatie metagegevens voor packages

**Specificatie voor mim:Informatiemodel**

Informatiemodel packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| MIM versie                   | [`mim:versie`](http://bp4mc2.org/def/mim#versie) | 1 | tekst |
| MIM extensie                 | [`mim:extensie`](http://bp4mc2.org/def/mim#extensie) | 0..1 | tekst |
| MIM taal                     | [`mim:taal`](http://bp4mc2.org/def/mim#taal) | 0..1 | tekst |
| Informatiedomein             | TODO | 1..1 | tekst |
| Informatiemodel type         | TODO | 1..1 | tekst |
| Relatiemodelleringtype       | TODO | 1..1 | tekst |

**Specificatie voor mim:Domein**

Domein packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |

**Specificatie voor mim:Extern**

Externe packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |

**Specificatie voor mim:View**

Externe packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |

### Specificatie metagegevens - overig

#### Specificatie voor Enumeratie

Enumeraties betreffen de metaclass Enumeration en worden naar de volgende
aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Waarde                       | [`mim:waarde`](http://bp4mc2.org/def/mim#Enumeratiewaarde) | 1..* | [`mim:Waarde`](http://bp4mc2.org/def/mim#Enumeratiewaarde)

#### Specificatie voor Enumeratiewaarde

De enumeratiewaarde zelf betreft de metaclass UML-EnumerationLiteral en kent
volgende aspecten:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |
| Code                         | [`mim:code`](http://bp4mc2.org/def/mim#code) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |

Een enumeratiewaarde mag geen alias hebben, omdat in UML het alias-veld wordt gebruikt voor de mim:code. Mocht toch een `mim:alias` zijn opgegeven voor een enumeratiewaarde, dan dient deze gelezen te worden als een `mim:code`. In het RDF model is `mim:code` een subproperty van een `mim:alias`.

#### Specificatie voor een Constraint

De enumeratiewaarde zelf betreft de metaclass UML-EnumerationLiteral en kent
volgende aspecten:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Specificatie-tekst           | [`mim:specificatieTekst`](http://bp4mc2.org/def/mim#specificatieTekst) | 0..1 | tekst |
| Specificatie-formeel         | [`mim:specificatieFormeel`](http://bp4mc2.org/def/mim#specificatieFormeel) | 0..1 | tekst |

# Linked Data Tooling

volgt
