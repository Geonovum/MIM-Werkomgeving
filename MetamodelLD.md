# Metamodel in Linked Data (LD)

## Ontologisch metamodel in LD

Het MiM uitgedrukt in LD houdt onder ander een ontologisch metamodel in. Dit betekent dat er voor elk van de modelelementen van het MiM een klasse en/of eigenschap gedefinieerd is in termen van RDF, RDFS en OWL. In de hierop volgende paragrafen wordt deze uitwerking geven.

Het MiM is een *metamodel*. Dit betekent dat in termen van het MiM een concreet informatiemodel kan worden uitgewerkt, bijvoorbeeld het informatiemodel Basisregistratie Adressen en Gebouwen. Het MiM is niet bedoeld om vervolgens in termen van dit informatiemodel een concrete dataset te vormen. Hiervoor is een transformatie nodig naar een (technisch) uitwisselings- of opslagmodel nodig.

Op diezelfde manier levert het toepassen van het MiM in RDF geen ontologie of vocabulaire waarin RDF kan worden uitgedrukt: slechts het informatiemodel zelf is op deze manier in RDF uitgedrukt. Voor de vertaalslag naar een ontologie is een afzonderlijke transformatie nodig.

Zo leidt een MiM objecttype "Schip" tot de volgende weergave in RDF:

<div class='ldex'>
@prefix vb: &lt;http://bp4mc2.org/voorbeeld/>.  
@prefix mim: &lt;http://bp4mc2.org/def/mim#>.  

vb:Schip a mim:Objecttype;  
&nbsp;&nbsp;rdfs:label "Schip"@nl;  
.
</div>

```
@prefix vb: &lt;http://bp4mc2.org/voorbeeld/>.  
@prefix mim: &lt;http://bp4mc2.org/def/mim#>.  

vb:Schip a mim:Objecttype;  
  rdfs:label "Schip"@nl;  
.
```

`vb:Schip` is in dit voorbeeld een voorkomen van de klasse `mim:Objecttype`. dit voorkomen kent zelf geen voorkomens. Hiervoor is een vertaling nodig naar een `rdfs:Class`, bijvoorbeeld door:

```
@prefix vbo: &lt;http://bp4mc2.org/voorbeeld/def#>.

vbo:Schip a rdfs:Class;
  rdfs:seeAlso vb:Schip;  
.
vb:Pakjesboot12 a vbo:Schip.
```

## Structuur metamodel in LD

Het RDF model is opgesplitst in twee delen. Zoals gebruikelijk in RDF zijn deze modeldelen via hun URL op het internet te benaderen:

1. de [RDF vocabulaire](media/mim.ttl), met de (meta)klassen en (meta)eigenschappen;
2. de [RDF Shapesgraph](media/mim-shapes.ttl), met "shapes", de structuur die gelden op het gebruik van de klassen en eigenschappen.

In onderstaande paragrafen wordt zowel de vocabulaire als de structuur gezamenlijk per modelelement besproken. Een RDF representatie in turtle wordt gegeven en daarnaast ook een grafische representatie. Hiervoor wordt de verbeelding gebruikt zoals beschreven op https://bp4mc2.org/20181107/#grafische-representatie.

Bij het opstellen van het MiM in RDF is gebruik gemaakt van de tekstuele beschrijving van het MiM. Er is een 1-op-1 omzetting gedaan, zonder enige aanpassing van de beschrijvingen. Dit maakt het mogelijk om een MiM informatiemodel om te zetten van de ene representatie (bijvoorbeeld in UML) naar de andere en weer terug, zonder verlies van informatie.

De volgende regels zijn gebruikt bij de omzetting van de MiM tekst naar RDF:

1. Elk voorkomen van een MiM «metaclass» is omgezet naar een voorkomen van een `owl:Class`;
2. Elk aspect van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:DatatypeProperty`, voor zover sprake is van een aspect dat een waarde heeft die met een datatype is uit te drukken (zoals tekstuele, nummerieke of boolean aspecten);
3. Elk aspect van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:ObjectProperty`, voor zover sprake is van een aspect waarbij de waarde verwijst naar een voorkomen van een andere MiM «metaclass»;
4. Een `rdfs:label` is opgenomen met de naam van de MiM «metaclass» c.q. het aspect;
5. Een `rdfs:comment` is opgenomen met de definitie van de MiM «metaclass» c.q. het aspect.

In een enkel geval ontbreekt in de tekst een beschrijving van het aspect. In dat geval is de target rolnaam gebruikt van de associatie, zoals afgebeeld in het figuur bij de tekst. In het voorkomende geval is hiervan een issue aangemaakt.

Voor de omzetting van de gegevensconstraints (zoals cardinaliteiten, datatypen en properties per klasse), is op de volgende manier een SHACL shape graph gemaakt:

1. Elk voorkomen van een MiM «metaclass» kent ook een `sh:NodeShape` met een `sh:name` die overeen komt de originele technische naam (UpperCamelCase);
2. Voor elk voorkomen van een MiM «metaclass» zijn `sh:PropertyShapes` aangemaakt om aan te geven welke aspecten zijn toegestaan voor een MiM «metaclass», de cardinaliteiten en het datatype c.q. de geassocieerde MiM «metaclass».

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
| gerelateerd objecttype | [`mim:gerelateerdObjecttype`](http://bp4mc2.org/def/mim#gerelateerdObjecttype) | owl:ObjectProperty | Het objecttype waarmee een objecttype een logisch verband heeft |
| herkomst | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | owl:DatatypeProperty | De registratie of het informatiemodel waaraan het modelelement ontleend is dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is. |
| herkomst definitie | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | owl:DatatypeProperty | De registratie of het informatiemodel waaruit de definitie is overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de definitie is samengesteld. |
| identificerend | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | owl:DatatypeProperty | Aanduiding dat attribuutsoort onderdeel uitmaakt van de unieke aanduiding van een object |
| indicatie abstract object | [`mim:indicatieAbstractObject`](http://bp4mc2.org/def/mim#indicatieAbstractObject) | owl:DatatypeProperty | Conceptueel model: indicatie dat het objecttype een generalisatie is, waarvan een object als specialisatie altijd voorkomt in de hoedanigheid van een (en slechts één) van de specialisaties van het betreffende objecttype. Logisch model: Indicatie dat er geen instanties (objecten) voor het betreffende objecttype mogen voorkomen. |
| indicatie afleidbaar | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of relatiesoorten. |
| indicatie formele historie | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | owl:DatatypeProperty | Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is. |
| indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | owl:DatatypeProperty | Indicatie of de materiële historie van het kenmerk van het object te bevragen is. |
| kardinaliteit | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | owl:DatatypeProperty | De kardinaliteit geeft aan hoeveel keer waarden van dit kenmerk van een object kunnen voorkomen bij een object van het betreffende objecttype. |
| kwaliteit | [`mim:kwaliteit`](http://bp4mc2.org/def/mim#kwaliteit) | owl:DatatypeProperty | Voor objecttypen die deel uitmaken van een registratie betreft dit de waarborgen voor de juistheid van de in de registratie opgenomen objecten van het desbetreffende type. |
| lengte | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | owl:DatatypeProperty | De aanduiding van de lengte van een gegeven. |
| locatie | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | owl:DatatypeProperty | Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de locatie waar deze te vinden is opgegeven. |
| mogelijk geen waarde | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | owl:DatatypeProperty | Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk is of de waarde er werkelijk ook niet is. |
| naam | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | owl:DatatypeProperty | De naam van een modelelement |
| objecttype | [`mim:objecttype`](http://bp4mc2.org/def/mim#objecttype) | owl:ObjectProperty | Het objecttype waarvan de relatie een eigenschap is. |
| patroon | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | owl:DatatypeProperty | De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur. |
| populatie | [`mim:populatie`](http://bp4mc2.org/def/mim#populatie) | owl:DatatypeProperty | Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)- registratie voorhanden zijn. |
| specificatie formeel | [`mim:specificatieFormeel`](http://bp4mc2.org/def/mim#specificatieFormeel) | owl:DatatypeProperty | De beschrijving van de constraint in een formele specificatietaal, in OCL |
| specificatie tekst | [`mim:specificatieTekst`](http://bp4mc2.org/def/mim#specificatieTekst) | owl:DatatypeProperty | De specificatie van de constraint in normale tekst.
| subtype | [`mim:subtype`](http://bp4mc2.org/def/mim#subtype) | owl:ObjectProperty | \- |
| supertype | [`mim:supertype`](http://bp4mc2.org/def/mim#supertype) | owl:ObjectProperty | \- |
| toelichting | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | owl:DatatypeProperty | Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding. |
| type | [`mim:type`](http://bp4mc2.org/def/mim#type) | owl:ObjectProperty | Het datatype waarmee waarden van deze attribuutsoort worden vastgelegd. |
| type aggregatie | [`mim:typeAggregatie`](http://bp4mc2.org/def/mim#typeAggregatie) | owl:ObjectProperty | Standaard betreft het geen aggregatie (None). Het type aggregatie mag 'composite' zijn. Dit wordt gedaan als er een afhankelijkheid is in die zin dat de target niet kan bestaan zonder de source: de target vervalt als de source vervalt. |
| unidirectioneel | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | owl:DatatypeProperty | Het gerelateerde objecttype (de target) waarvan het objecttype, die de eigenaar is van deze relatie (de source), kennis heeft. |
| uniekeAanduiding | [`mim:uniekeAanduiding`](http://bp4mc2.org/def/mim#uniekeAanduiding) | owl:DatatypeProperty | Voor objecttypen die deel uitmaken van een (basis)registratie of informatiemodel betreft dit de wijze waarop daarin voorkomende objecten (van dit type) uniek in de registratie worden aangeduid. |
| waarde | [`mim:waarde`](http://bp4mc2.org/def/mim#waarde) | owl:ObjectProperty | \- |

### Modellering metagegevens voor objecten en attributen in LD

**Specificatie voor mim:Objecttype**

De objecttypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|---------------------------|----------------|-------------------|--------------|
| Naam                      | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                     | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
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
| Unidirectioneel              | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | 1 | boolean |
| Objecttype                   | [`mim:objecttype`](http://bp4mc2.org/def/mim#objecttype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Gerelateerd objecttype       | [`mim:gerelateerdObjecttype`](http://bp4mc2.org/def/mim#gerelateerdObjecttype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
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
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |

#### Relatierol is leidend (alternatief 2)

### Specificatie metagegevens voor overige relaties

**Specificatie voor mim:Generalisatie bij objecttypen**

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Subtype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#subtype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Supertype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#supertype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |

**Specificatie voor mim:Generalisatie bij datatypen**

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Subtype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#subtype) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Supertype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#supertype) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |

### Specificatie metagegevens voor waardenlijsten

### Specificatie metagegevens voor datatypen

### Specificatie metagegevens voor packages

### Specificatie metagegevens - overig

#### Specificatie voor Enumeratie

#### Specificatie voor Enumeratiewaarde

#### Specificatie voor een Constraint

# Linked Data Tooling

**Voetnoten**

<aside id='ld-n-1' class='note'>
</aside>
