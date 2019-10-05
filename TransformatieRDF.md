## Transformeren van een MIM model naar een RDFS/OWL/SHACL/SKOS model

### Inleiding

Het MiM is een *metamodel*. Dit betekent dat in termen van het MiM een concreet informatiemodel kan worden uitgewerkt, bijvoorbeeld het informatiemodel Basisregistratie Adressen en Gebouwen. Het MiM is niet bedoeld om vervolgens in termen van dit informatiemodel een concrete dataset te vormen. Hiervoor is een transformatie nodig naar een (technisch) uitwisselings- of opslagmodel, bijvoorbeeld een XSD schema of een RDMS database definitie.

Op diezelfde manier levert het toepassen van het MiM in RDF geen ontologie of vocabulaire waarin RDF kan worden uitgedrukt in een concrete Linked Data dataset. Slechts het informatiemodel zelf is op deze manier in RDF uitgedrukt. Een afzonderlijke transformatie is nodig voor de vertaalslag naar een ontologie voor een concrete Linked Data.

Zo leidt een MiM objecttype "Schip" tot de volgende weergave in RDF:

```
@prefix vb: <http://bp4mc2.org/voorbeeld/>.
@prefix mim: <http://bp4mc2.org/def/mim#>.

vb:Schip a mim:Objecttype;
  rdfs:label "Schip"@nl;
.
```

`vb:Schip` is in dit voorbeeld een voorkomen van de klasse `mim:Objecttype`. Dit voorkomen, `vb:Schip`, kent zelf geen voorkomens. Het is dan ook niet mogelijk om te stellen:

```
vb:depakjesboot a vb:Schip.
```

`vb:Schip` is immers geen klasse maar zelf een voorkomen! Om te kunnen uitdrukken dat de pakjesboot een voorkomen van de klasse Schip is, is een vertaling nodig naar een `rdfs:Class` of `owl:Class`, bijvoorbeeld door:

```
@prefix vbo: <http://bp4mc2.org/voorbeeld/def#>.

vbo:Schip a rdfs:Class;
  rdfs:seeAlso vb:Schip;
.
vb:Pakjesboot12 a vbo:Schip.
```

Dit document beschrijft hoe deze vertaling van het MiM model in RDF naar een RDFS-gebaseerde ontologie plaatsvindt. Daarbij zal niet alleen gebruik worden gemaakt van RDFS, maar ook van de OWL, SHACL en SKOS vocabulaires. De vertaling wordt zo veel mogelijk als SPARQL rules beschreven, zodat een machinale vertaling mogelijk is. De vertaling is beoogd als omkeerbaar. De SPARQL rules die vanuit een RDFS-gebaseerde ontologie de vertaling maken naar een MiM model in RDF, zullen daarom ook worden beschreven (in deze versie van het document zijn deze nog niet opgenomen).

### Gebruikte functies

In de SPARQL rules wordt gebruik gemaakt van een aantal SPARQL functies. In onderstaande tabel staan deze opgesomd met de specificatie van de werking.

|Functie|Specificatie|
|-------|------------|
|t:CamelCase|Codeert een tekstveld naar een URI-vorm op basis van (upper) CamelCase regels|
|t:camelCase|Codeert een tekstveld naar een URI-vorm op basis van (lower) camelCase regels|
|t:kebabcase|Codeert een tekstveld naar een URI-vorm op basis van kebabcase regels (een `-` voor spaties)|
|t:classuri|Formuleert de uri voor een klasse op basis van de naam van een MiM resource. De class URI is opgebouwd als `{namespace}#{t:CamelCase(naam)}`. De `{namespace}` is een vooraf vastgestelde waarde die gelijk is aan de te maken ontologie.|
|t:nodeshapeuri|Formuleert de uri voor een nodeshape op basis van de naam van een MiM resource. De nodeshape URI is opgebouwd als `{shape-namespace}#{t:CamelCase(term)}`. De `{shape-namespace}` is een vooraf vastgestelde waarde die gelijk is aan de te maken shapesgraph.|
|t:propertyuri|Formuleert de uri voor een property op basis van de naam van een MiM resource. De property URI is opgebouwd als `{namespace}#{t:camelCase(naam)}`. Zie ook `t:classuri`.|
|t:propertyshapeuri|Formuleert de uri voor een propertyshape op basis van de naam van een MiM resource en de naam van de MIM resource die hiervan de "bezitter" is. De propertyshape URI is opgebouwd als `{shape-namespace}#{t:CamelCase(bezittersnaam)}-{t:camelCase(naam)}`. Zie ook `t:nodeshapeuri`.|
|t:nodepropertyuri|Formuleert de uri voor een property op basis van de naam van een MiM resource en de naam van de MIM resource die hiervan de "bezitter" is. De property URI is opgebouwd als `{namespace}#{t:CamelCase(bezittersnaam)}-{t:camelCase(naam)}`. Zie ook `t:classuri`.|
|t:statementuri|Formuleert de uri voor een rdf:Statement op basis van zijn afzonderlijke elementen. Mogelijke invulling kan het maken van een hash zijn op basis van de aaneenschakeling van subject, predicate en object.|
|t:mincount|Formuleert de minimum kardinaliteit op basis van een kardinaliteitsaanduiding (zie bij mim:kardinaliteit). De waarde kan ook unbound zijn, in dat geval wordt ook de variable niet gebound en daardoor de betreffende triple niet opgevoerd.|
|t:maxcount|Formuleert de maximum kardinaliteit op basis van een kardinaliteitsaanduiding (zie bij mim:kardinaliteit). De waarde kan ook unbound zijn, in dat geval wordt ook de variable niet gebound en daardoor de betreffende triple niet opgevoerd.|

> **ISSUE**
>
> Er is, behalve `mim:naam`, geen formeel identificerend gegeven voor de modelelementen. Dit maakt het noodzakelijk om de URI op te bouwen uit de naam van het modelelement, eventueel aangevuld met gegevens van de package. In bepaalde gevallen is het echter veel logischer om te verwijzen naar elementen buiten het eigen model, zoals in Linked Data gebruikelijk is. Bijvoorbeeld bij externe koppelingen, referentielijsten en elementen in de "view" en "extern" packages.
>
> Mogelijke oplossing is het toevoegen van het aspect `mim:identificatie` dat als waarde een URI heeft. Indien dit veld aanwezig is, dan wordt dit veld gebruikt als identificatie i.p.v. de `mim:naam`. Mogelijk alternatief is de mogelijkheid om namespace te ondersteunen bij de package (voorkeur). Uitdaging is ook dat de naam mogelijk natuurlijke taal kan zijn, wat je dan nog moet vertalen. Andere uitdaging is dat elk modelelement in één package ook in die namespace komt. En soms wil je attribuutsoorten hergebruiken en daar dus iets uit een andere namespace wilt gebruiken. Mogelijk kan het veld `mim:locatie` hier nog een rol spelen, aangezien dit een vergelijkbare rol heeft.

> **ISSUE**
>
> Hoewel nergens expliciet geformuleerd, kent een MiM model in zijn representatie volgorde: attribuutsoorten worden in een bepaalde volgorde getoond binnen een objecttype, referentiewaarden worden in een bepaalde volgorde getoond in een referentielijst. Het MiM kent echter geen aspect waarin deze volgorde is opgenomen. Hierdoor zal de volgorde verdwijnen in het getransformeerde model en zal sprake zijn van een willekeurige volgorde.
>
> Mogelijke oplossing is het toevoegen van het aspect `mim:volgnummer`, waarmee een volgorde kan worden opgegeven.

> **ISSUE**
>
> Er zit nog een foutje in de transformatie: `rdfs:seeAlso` wordt in sommige gevallen gebruikt om meerdere resources. Bijvoorbeeld `mim:Objecttype` leidt tot zowel een `owl:Class` als een `sh:NodeShape`. Gevolg is dat bij de transformatie aspecten als `mim:naam`, `mim:definitie`, `mim:constraint` bij beide resources terecht komen. Beter zou zijn als het maar bij één van de twee terecht komt.

### Overzicht

Onderstaande tabellen geven een overzicht van alle transformaties en een referentie naar de betreffende transformatieregel

#### Klassen

|MiM-klasse|Vertaling|Referentie|
|----------|---------|----------|
|`mim:Objecttype`|`owl:Class`, `sh:NodeShape`|[Objecttype](#objecttype)|
|`mim:Attribuutsoort`|`owl:ObjectProperty`, `owl:DatatypeProperty`, `sh:PropertyShape`|[Attribuutsoort](#attribuutsoort)|
|`mim:Gegevensgroep`|`sh:PropertyShape`, `owl:ObjectProperty`|[Gegevensgroep](#gegevensgroep)|
|`mim:Gegevensgroeptype`|`owl:Class`, `sh:NodeShape`|[Gegevensgroeptype](#gegevensgroeptype)|
|`mim:Generalisatie`|`rdfs:subClassOf` `rdf:Statement`|[Generalisatie](#generalisatie)|
|`mim:Relatiesoort`|`sh:PropertyeShape`, `owl:ObjectProperty`|[Relatiesoort](#relatiesoort)|
|`mim:Relatieklasse`|`rdf:Statement`|[Relatieklasse](#relatieklasse)|
|`mim:ExterneKoppeling`|`sh:PropertyShape`, `owl:ObjectProperty`|[Externe koppeling](#externe-koppeling)|
|`mim:Relatierol`|n.n.b.|[Relatierol](#relatierol)|
|`mim:Referentielijst`|n.n.b.|[Referentielijst](#referentielijst)|
|`mim:ReferentieElement`|n.n.b.|[Referentie-element](#referentie-element)|
|`mim:Enumeratie`|n.n.b.|[Enumeratie](#enumeratie)|
|`mim:Enumeratiewaarde`|n.n.b.|[Enumeratiewaarde](#enumeratiewaarde)|
|`mim:Codelist`|n.n.b.|[Codelist](#codelist)|
|`mim:Datatype`|n.v.t.|Abstracte klasse|
|`mim:PrimitiefDatatype`|`rdfs:Datatype`|[Primitief datatype](#primitief-datatype)|
|`mim:GestructureerdDatatype`|`sh:NodeShape`|[Gestructureerd datatype](#gestructureerd-datatype)|
|`mim:DataElement`|`owl:ObjectProperty`, `owl:DatatypeProperty`, `sh:PropertyShape`|[Data element](#data-element)|
|`mim:Union`|`sh:xone`, `rdf:List`|[Union](#union)|
|`mim:UnionElement`|Blank node binnen de `rdf:List`|[Union element](#union-element)|
|`mim:Domein`|`owl:Ontology`|[Domein](#domein)|
|`mim:Extern`|`owl:imports`|[Extern](#extern)|
|`mim:View`|`owl:imports`|[View](#view)|
|`mim:Id`|n.n.b.|-|
|`mim:Identificerend`|n.n.b.|-|
|`mim:Constraint`|`mim:Constraint`|[Constraint](#constraint)|
|`mim:RelatierolSource`|n.n.b.|[Relatierol](#relatierol)|
|`mim:RelatierolTarget`|n.n.b.|[Relatierol](#relatierol)|

#### Eigenschappen

|MiM-eigenschap|Vertaling|Referentie|
|--------------|---------|----------|
|`mim:naam`|`rdfs:label`|[naam](#naam)|
|`mim:alias`|`skos:altLabel`|[alias](#alias)|
|`mim:begrip`|`dct:source`|[begrip](#begrip)|
|`mim:begripsterm`|`dc:source`|[begripsterm](#begripsterm)|
|`mim:definitie`|`rdfs:comment`|[definitie](#definitie)|
|`mim:toelichting`|`mim:toelichting`|[toelichting](#toelichting)|
|`mim:herkomst`|`mim:herkomst`|[herkomst](#herkomst)|
|`mim:herkomstDefinitie`|`mim:herkomstDefinitie`|[herkomst definitie](#herkomst-definitie)|
|`mim:datumOpname`|`mim:datumOpname`|[datum opname](#datum-opname)|
|`mim:indicatieMaterieleHistorie`|n.n.b.|[indicatie materiële historie](#indicatie-materi%C3%ABle-historie)|
|`mim:indicatieFormeleHistorie`|n.n.b.|[indicatie formele historie](#indicatie-formele-historie)|
|`mim:kardinaliteit`|`sh:minCount`, `sh:maxCount`|[kardinaliteit](#kardinaliteit)|
|`mim:authentiek`|`mim:authentiek`|[authentiek](#authentiek)|
|`mim:indicatieAfleidbaar`|`mim:indicatieAfleidbaar`|[indicatie afleidbaar](#indicatie-afleidbaar)|
|`mim:mogelijkGeenWaarde`|`mim:mogelijkGeenWaarde`, `sh:minCount`|[mogelijk geen waarde](#mogelijk-geen-waarde)
|`mim:locatie`|`mim:locatie`|[locatie](#locatie)|
|`mim:type`|`sh:datatype`, `sh:node`|[type](#type)|
|`mim:lengte`|`sh:maxLength`|[lengte](#lengte)|
|`mim:patroon`|`mim:patroon`|[patroon](#patroon)|
|`mim:formeelPatroon`|`sh:pattern`|[formeel patroon](#formeel-patroon)|
|`mim:uniekeAanduiding`|`mim:uniekeAanduiding`|[unieke aanduiding](#uniekeaanduiding)
|`mim:populatie`|`mim:populatie`|[populatie](#populatie)|
|`mim:kwaliteit`|`mim:kwaliteit`|[kwaliteit](#kwaliteit)|
|`mim:indicatieAbstractObject`|`mim:indicatieAbstractObject`|[indicatie abstract object](#indicatie-abstract-object)|
|`mim:identificerend`|`mim:identificerend`|[identificerend](#identificerend)|
|`mim:gegevensgroeptype`|`sh:node`|[gegevensgroeptype](#gegevensgroeptype-eigenschap)|
|`mim:unidirectioneel`|n.n.b.|[unidirectioneel](#unidirectioneel)|
|`mim:objecttype`|`sh:property`|[objecttype](#objecttype-eigenschap)|
|`mim:gerelateerdObjecttype`|`sh:class`|[gerelateerd objecttype](#gerelateerd-objecttype)|
|`mim:typeAggregatie`|`mim:typeAggregatie`|[type aggregatie](#type-aggregatie)|
|`mim:subtype`|`rdfs:subClassOf`|[Generalisatie](#generalisatie)|
|`mim:supertype`|`rdfs:subClassOf`|[Generalisatie](#generalisatie)|
|`mim:code`|n.n.b.|[code](#code)|
|`mim:specificatieTekst`|`mim:specificatieTekst`|[specificatie-tekst](#specificatie-tekst)|
|`mim:specificatieFormeel`|`mim:specificatieFormeel`|[specificatie-formeel](#specificatie-formeel)|
|`mim:attribuut`|`sh:property`|[attribuut](#attribuut)|
|`mim:gegevensgroep`|`sh:property`|[gegevensgroep](#gegevensgroep-eigenschap)|
|`mim:waarde`|n.n.b.|[Enumeratie](#enumeratie)|
|`mim:constraint`|`mim:constraint`|[Constraint](#constraint)|
|`mim:element`|`sh:property`|[Data element](#data-element)|

#### Instanties (datatypen)

|MIM datatype|Vertaling|Referentie|
|------------|---------|----------|
|`mim:CharacterString`|`xsd:string`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:Integer`|`xsd:integer`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:Real`|`xsd:decimal`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:Boolean`|`xsd:boolean`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:Date`|`xsd:date`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:DateTime`|`xsd:dateTime`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:Year`|`xsd:gYear`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:Day`|`xsd:gDay`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:Month`|`xsd:gMonth`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|
|`mim:URI`|`xsd:anyURI`|[Primitief datatype - standaard datatypen](#primitief-datatype---standaard-datatypen)|

### Klassen

Omdat het getransformeerde model daadwerkelijk een nieuw model is, zullen de elementen in het getransformeerde model ook eigen URI's krijgen. Om de relatie tussen het originele MiM-model het het getransformeerde model op basis van RDFS te behouden, wordt de eigenschap `rdfs:seeAlso` gebruikt.

> **ISSUE**
>
> Gebruik van `rdfs:seeAlso` is niet erg sterk. Een dergelijke eigenschap kan voor heel veel dingen gebruikt worden. Gekeken moet worden of er niet een betere property beschikbaar is voor dergelijke vocabulaires, of dat we een eigen property moeten introduceren binnen de mim vocabulaire, bv: `mim:equivalent`.

#### Objecttype

> De typering van een groep objecten (in de werkelijkheid) die binnen een domein relevant zijn en als gelijksoortig worden beschouwd.

Een `mim:Objecttype` wordt vertaald naar een `owl:Class` in combinatie met een `sh:NodeShape`.

> **ISSUE**
>
> De identificatie van een objecttype is afgeleid van de naam van het objecttype. Het kan zijn dat deze niet uniek is. Bijvoorbeeld als er gebruik wordt gemaakt van packages en in meerdere packages komen dezelfde namen voor.
>
> Mogelijke oplossing: er zijn meerdere oplossingen denkbaar: (a) in het MiM opnemen dat de naam uniek moet zijn, ook over packages heen. (b) afzonderlijke ontologieën (namespaces) maken per package. (c) package naam opnemen waar het mis gaat.
>
> Dit is gerelateerd aan de issue over packages. MiM zegt niet zoveel over packages, maar dit zou wel beter moeten zijn. De standaarden waar NEN 3610 op gebaseerd zijn, zeggen hier wel wat over: hier nog naar kijken. Zie ook issue over `mim:naam`, mogelijk `mim:namespace` ondersteunen en dan dat alles uniek is binnen de package die een namespace heeft. Binnen UML is de klassenaam wel uniek binnen een package, maar MiM zegt hier formeel niet iets over.
>
> Voorlopige aanname is dat sprake is van (a).

```
CONSTRUCT {
  ?class a owl:Class.
  ?class rdfs:seeAlso ?objecttype.
  ?nodeshape a sh:NodeShape.
  ?nodeshape rdfs:seeAlso ?objecttype.
  ?nodeshape sh:targetClass ?class.
}
WHERE {
  ?objecttype a mim:Objecttype.
  ?objecttype mim:naam ?objecttypenaam.
  BIND (t:classuri(?objecttypenaam) as ?class)
  BIND (t:nodeshapeuri(?objecttypenaam) as ?nodeshape)
}
```

#### Attribuutsoort

> De typering van gelijksoortige gegevens die voor een objecttype van toepassing is.

Een `mim:Attribuutsoort` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:DatatypeProperty`. De nodekind van de propertyshape is een `sh:Literal`.

In OWL is een property anders dan in het MiM een *first class citizen*. Dit betekent dat als in twee objecttypen gebruik wordt gemaakt van een attribuutsoort die dezelfde naam heeft, dit leidt tot twee verschillende attribuutsoorten. In OWL zou dit echter leiden tot maar één attribuutsoort, tenzij daadwerkelijk sprake is van verschil in betekenis.

> **ISSUE**
>
> Het is niet mogelijk om automatisch vast te stellen wanneer sprake is van één property of wanneer sprake is van meerdere properties. Veilig is om een property te maken per objecttype. Maar dit leidt niet tot een goed OWL model. Beter is om een property te maken op basis van de naam van de attribuutsoort, maar dan krijg je problemen als twee namen hetzelfde zijn (!).
> Dit probleem speelt overigens niet alleen bij een mim:Attribuutsoort, maar ook bij een mim:Gegevensgroep en een mim:Relatie.
>
> Mogelijke oplossing: toevoegen van een kenmerk bij een attribuutsoort waarin je de scope van de attribuutsoort kunt opgeven: algemeen of klasse-specifiek. In het geval van een klasse-specifiek atribuutsoort, dan wordt in OWL de naam afgeleid van zowel de attribuutsoort als het objecttype (of gegevensgroeptype). Of er zou een extra kenmerk bij kunnen met daar de "globale naam" van het attribuutsoort. Dat is mogelijk wat makkelijker. Vervolgens zou de globale naam uniek moeten zijn voor het gehele model, waarbij standaard de globale naam gelijk is aan de naam van de attribuutsoort (en anders moet je een foutmelding krijgen)
>
> Voorlopige aanname: alle namen van attribuutsoorten zijn uniek. De kardinaliteit in het MiM model ondersteunt alleen dat een attribuutsoort uniek bij (bv) een objecttype hoort, maar dit is op zich ook juist want de PropertyShape hoort wel uniek bij de NodeShape, alleen (semantisch) kan de rdf:Property loshangen. Het is wel een discussie wat je zou willen. Op zich is het goed als er bij het MiM al over wordt nagedacht, en dat hier extra eisen aan worden gesteld (bv in het meest extreme geval: alle attribuutsoortnamen moeten unieke zijn..)

> **ISSUE**
>
>De transformatie houdt nog niet rekening met het feit dat sommige datatypen in RDF juist geen literals zijn, maar resources. In die gevallen zou dus niet gesproken moeten worden over een `owl:DatatypeProperty`, maar een `owl:ObjectProperty`. Alleen de datatypes enumeratie (klopt dat?) en primitief datatype zouden naar een literal gaan, de overigen naar resources.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de attribuutsoort "bezit" en de naam van de attribuutsoort. De URI van de datatypeproperty wordt afgeleid van de naam van de attribuutsoort.

```
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?datatypeproperty.
  ?propertyshape sh:nodekind sh:Literal.
  ?propertyshape rdfs:seeAlso ?attribuutsoort.
  ?datatypeproperty a owl:DatatypeProperty.
  ?datatypeproperty rdfs:seeAlso ?attribuutsoort.
}
WHERE {
  ?attribuutsoort a mim:Attribuutsoort.
  ?attribuutsoort mim:naam ?attribuutsoortnaam.
  ?bezitter mim:attribuut ?attribuutsoort.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:propertyshapeuri(?bezittersnaam,?attribuutsoortnaam) as ?propertyshape)
  BIND (t:propertyuri(?attribuutsoortnaam) as ?datatypeproperty)
}
```

#### Gegevensgroep

> Een typering van een groep van gelijksoortige gegevens die voor een objecttype van toepassing is.

Een `mim:Gegevensgroep` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:ObjectProperty`. De nodekind van de propertyshape is een `sh:BlankNode`. Gedachte hierachter is dat de gegevensgroep de verbinding is tussen een objecttype en een gegevensgroeptype. Een gegevensgroeptype is vervolgens een groep van samenhangende attribuutsoorten, wat overeen komt met een class en een nodeshape (zie ook gegevensgroeptype). Omdat een gegevensgroeptype geen eigen identiteit heeft, zal dit gemodelleerd worden als blank node.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de gegevensgroep "bezit" en de naam van de gegevensgroep. De URI van de objectproperty wordt afgeleid van de naam van de gegevensgroep.

```
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?objectproperty.
  ?propertyshape sh:nodekind sh:BlankNode.
  ?propertyshape rdfs:seeAlso ?gegevensgroep.
  ?objectproperty a owl:ObjectProperty.
  ?objectproperty rdfs:seeAlso ?gegevensgroep.
}
WHERE {
  ?gegevensgroep a mim:Gegevensgroep.
  ?gegevensgroep mim:naam ?gegevensgroepnaam.
  ?bezitter mim:gegevensgroep ?gegevensgroep.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:propertyshapeuri(?bezittersnaam,?gegevensgroepnaam) as ?propertyshape)
  BIND (t:propertyuri(?gegevensgroepnaam) as ?objectproperty)
}
```

#### Gegevensgroeptype

> Een groep van met elkaar samenhangende attribuutsoorten. Een gegevensgroeptype is altijd een type van een gegevensgroep.

Een `mim:Gegevensgroeptype` wordt vertaald naar een `owl:Class` en een `sh:NodeShape`, net zoals een `mim:Objecttype`.

> **ISSUE**
>
> De manier waarop de URI van een gegevensgroeptype tot stand komt, betekent dat de naam van het gegevensgroeptype uniek moet zijn, inclusief de naam van het objecttype (en mogelijk ook datatype?). Dit wordt op dit moment binnen het MIM niet afgedwongen.
>
> Mogelijke oplossing is om een dergelijke regel wel op te nemen in het MIM.
>
> Voorlopige aanname is dat sprake is van uniciteit over alle elementen die nodeshape kunnen zijn.
>
> NB de naam van een gegevensgroeptype is net als die van een objecttype wel uniek binnen een package.

> **ONDERZOEKEN**
>
> Er is nu geen verschil meer tussen een gegevensgroeptype en een objecttype. Het MiM maakt echter wel onderscheid. Het verschil is alleen zichtbaar doordat een gegevensgroeptype als blank node verbonden is (zie ook [Gegevensgroep](#gegevensgroep)).

```
CONSTRUCT {
  ?class a owl:Class.
  ?class rdfs:seeAlso ?gegevensgroeptype.
  ?nodeshape a sh:NodeShape.
  ?nodeshape rdfs:seeAlso ?gegevensgroeptype.
  ?nodeshape sh:targetClass ?class.
}
WHERE {
  ?gegevensgroeptype a mim:Gegevensgroeptype.
  ?gegevensgroeptype mim:naam ?gegevensgroeptypenaam.
  BIND (t:classuri(?gegevensgroeptypenaam) as ?class)
  BIND (t:nodeshapeuri(?gegevensgroeptypenaam) as ?nodeshape)
}
```

#### Generalisatie

> De typering van het hiërarchische verband tussen een meer generiek object van een objecttype en een meer specifiek object van een ander objecttype waarbij het laatstgenoemde object eigenschappen van het eerstgenoemde object overerft.

Generalisatie kan gebruikt worden tussen objecttypen, maar ook tussen datatypes. Aangezien zowel objecttypen als datatypen in het RDFS gebaseerde model worden getransformeerd naar een subklasse van `rdfs:Class`, kan in beide gevallen gebruik worden gemaakt van dezelfde transformatie.

Een `mim:Generalisatie` wordt vertaald naar een `rdfs:subClassOf`.

> **ISSUE**
>
> Generalisatie is in Linked Data ook mogelijk op properties, en daar ook wel gebruikelijk. Dit wordt nu niet door het MiM ondersteunt. Het is handig als dit wordt toegevoegd.

> **ISSUE**
>
> Vertaling van een mim:Generalisatie naar een rdfs:subClassOf betekent dat wat in het MiM een metaklasse is, in Linked Data een eigenschap is geworden en geen (meta)class. Hierdoor is het niet mogelijk om extra kenmerken te verbinden aan een generalisatie. Dit betekent dat het niet mogelijk is om de generalisatie een naam of een alias te geven.
>
> Voorlopige oplossing is om een rdf:Statement toe te voegen. Alternatief zou zijn om een subklassen te maken van `rdfs:subClassOf`.
> We beschouwen dit issue als opgelost, wel even rationale toevoegen.

```
CONSTRUCT {
  ?subject rdfs:subClassOf ?object.
  ?statement a rdf:Statement.
  ?statement rdf:subject ?subject.
  ?statement rdf:predicate rdfs:subClassOf.
  ?statement rdf:object ?object.
  ?statement rdfs:seeAlso ?generalisatie.
}
WHERE {
  ?generalisatie a mim:Generalisatie.
  ?generalisatie mim:subtype ?subtype.
  ?generalisatie mim:supertype ?supertype.
  ?subject rdfs:seeAlso ?subtype.
  ?object rdfs:seeAlso ?supertype.
  ?subject a ?type.
  ?object a ?type.
  FILTER (?type != sh:NodeShape)
  BIND (t:statementuri(?subtype,rdfs:subClasOf,?supertype) as ?statement)
}
```

#### Relatiesoort

> De typering van het structurele verband tussen een object van een objecttype en een (ander) object van een ander (of hetzelfde) objecttype.

> **ISSUE**
>
> In het MiM is het toegestaan om te kiezen tussen gebruik van `mim:Relatiesoort` OF `mim:Relatierol`.
>
> Voorlopige aanname: `mim:Relatiesoort` wordt gebruikt.


Een `mim:Relatiesoort` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:ObjectProperty`. De nodekind van de propertyshape is een `sh:IRI`.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de relatiesoort "bezit" en de naam van de relatiesoort. De URI van de objectproperty wordt afgeleid van de naam van de relatiesoort.

```
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?objectproperty.
  ?propertyshape sh:nodekind sh:IRI.
  ?propertyshape rdfs:seeAlso ?relatiesoort.
  ?objectproperty a owl:ObjectProperty.
  ?objectproperty rdfs:seeAlso ?relatiesoort.
}
WHERE {
  ?relatiesoort a mim:Relatiesoort.
  ?relatiesoort mim:naam ?relatiesoortnaam.
  ?bezitter mim:objecttype ?relatiesoort.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:propertyshapeuri(?bezittersnaam,?relatiesoortnaam) as ?propertyshape)
  BIND (t:propertyuri(?relatiesoortnaam) as ?objectproperty)
}
```

#### Relatieklasse

> Een relatiesoort met eigenschappen.

Een `mim:Relatieklasse` wordt vertaald naar een subklasse van `rdf:Statement`, waarbij bovendien ook de transformatieregels voor een `mim:Objecttype` en een `mim:Relatiesoort` worden gevolgd.

```
CONSTRUCT {
  ?class a owl:Class.
  ?class rdfs:subClassOf rdf:Statement.
  ?class rdfs:seeAlso ?relatieklasse.
  ?nodeshape a sh:NodeShape.
  ?nodeshape rdfs:seeAlso ?relatieklasse.
  ?nodeshape sh:targetClass ?class.
  ?nodeshape sh:property [
    sh:path rdf:predicate;
    sh:hasValue ?objectproperty;
    sh:minCount 1;
    sh:maxCount 1;
  ];
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?objectproperty.
  ?propertyshape sh:nodekind sh:IRI.
  ?propertyshape rdfs:seeAlso ?relatieklasse.
  ?objectproperty a owl:ObjectProperty.
  ?objectproperty rdfs:seeAlso ?relatieklasse.
}
WHERE {
  ?relatieklasse a mim:Relatiesoort.
  ?relatieklasse mim:naam ?relatieklassenaam.
  ?bezitter mim:objecttype ?relatieklasse.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:classuri(?relatieklassenaam) as ?class)
  BIND (t:nodeshapeuri(?relatieklassenaam) as ?nodeshape)
  BIND (t:propertyshapeuri(?bezittersnaam,?relatieklassenaam) as ?propertyshape)
  BIND (t:propertyuri(?relatieklassenaam) as ?objectproperty)
}
```

#### Externe koppeling

> Een associatie waarmee vanuit het perspectief van het eigen informatiemodel een objecttype uit het 'eigen' informatiemodel gekoppeld wordt aan een objecttype van een extern informatiemodel. De relatie zelf hoort bij het 'eigen' objecttype.

Een externe koppeling wordt op dezelfde wijze omgezet als een `mim:Relatiesoort` (zie [Relatiesoort](#relatiesoort)). Het verschil is zichtbaar doordat de betreffende objecttypes uit verschillende modellen komen. Anders dan bij UML is het daarbij niet gebruikelijk om het andere objecttype "in" het eigen model te plaatsen, maar juist om direct naar het andere objecttype te verwijzen. Eventueel kan daarbij ook nog gebruik worden gemaakt van een `owl:imports` om expliciet aan te geven dat een ander model wordt gebruikt.

> **ISSUE**
>
> Hoe kun je aangeven dat sprake is van een ander model? Nu bieden we daar geen ondersteuning voor. Ook het toevoegen van `owl:imports` klinkt als een handmatige stap.
>
> Mogelijke oplossing is het toevoegen van mim:identificatie, waarbij dan de URI expliciet wordt aangegeven als de externe bron. Punt is dan wel dat dit veld niet per sé verplicht is, en het ook zonder dit veld moet werken. Mogelijke oplossing is dan om gebruik te maken van de stereotypen van de packages?

#### Relatierol

> **UITZOEKEN**
>
> Verder uitzoeken hoe met relatierol omgegaan moet worden. Feitelijk is de relatierol de daadwerkelijke "naam" van de property, en dus niet de naam van de relatiesoort... Dit lijkt dan dus niet helemaal goed te gaan. Zie ook [Relatiesoort](#relatiesoort).

#### Referentielijst

> Een lijst met een opsomming van de mogelijke domeinwaarden van een attribuutsoort, die buiten het model in een externe waardenlijst worden beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel aangepast wordt (in tegenstelling tot bij een enumeratie).

> **ISSUE (blocking)**
>
> Een referentielijst heeft een `mim:locatie` waarin is gespecificeerd waar de externe bron gevonden kan worden waar de mogelijke waarden zijn opgesomd. Dit KAN een URI of URL zijn en deze bron ZOU bijvoorbeeld een SKOS vocabulaire kunnen zijn. Maar omdat dit niet met zekerheid te zeggen is kunnen we niets met deze externe vocabulaires doen. Dit hoewel een referentielijst wel degelijk onderdeel kan uitmaken van het model in conceptuele zin, hoewel het om beheer- of technische redenen buiten het UML model is geplaatst.
>
> Daarbij komt dat er een verschil is tussen de URI van het conceptschema en de URI waar de concepten zelf zijn op te vragen. Bovendien zijn er ook dan nog meerdere implementaties denkbaar. Alle waardelijsten kunnen in 1 bestand staan, maar ook is het mogelijk dat alle waarden in afzonderlijke bestanden staan. Bovendien zald de URI van de waardelijst en de URI van de waarden niet gelijk aan elkaar zijn.
>
> Zie ook het eerste issue (algemeen): naar `mim:naam` en `mim:alias` lijkt het toevoegen van een `mim:identificatie` wenselijk, wat we kunnen vertalen naar een concrete URI. Daarmee kunnen we de URI van de waardelijst onderscheid van de plaats waar de inhoud van de waardelijst zelf te vinden is (dat zit dan in `mim:locatie`).
> Vervolgens is het toevoegen van een "typering" wenselijk. Deze typering geeft aan wat voor "soort" waardelijst het betreft. Drie waarden zijn denkbaar: (1) Conceptschema, (2) Collectie en (3) Klasse. Geen waarde betekent dat er sprake is van een ander soort typering, of dat de typering onbekend is. In geval van een typering wordt verwacht dat de `mim:locatie` een URL is en dat het veld `mim:identificatie` in ingevuld en een URI is. Bij (1) is deze URI de identificatie van een skos:ConceptScheme, bij (2) is de URI de identificatie van een skos:Collection en bij (3) is de URI de identificatie van een rdfs:Class.

#### Referentie element

> Een eigenschap van een object in een referentielijst in de vorm van een gegeven.

#### Enumeratie

> Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een statische lijst.

> **Voorstel**

We vertalen een enumeratie zoals beschreven in het NEN 3610 Linked Data profiel:

> Een enumeratie kan verschillende soorten dingen opsommen. Een lijst met waardes, bijv. een opsomming van nummers, maar ook een lijst met concepten, datatypes, of objecten. Het is dan ook niet triviaal om een goede automatische vertaling te bepalen die een enumeratie kan vertalen naar Linked Data. Om deze reden kiezen we voor een standaardtransformatie naar een klasse gelijknamig aan de enumeratieklasse, en instanties van deze klasse voor elk van de geënumereerde waardes. De geënumereeerde waardes worden ook met een `owl:oneOf` constructie begrensd door de enumeratieklasse. De SHACL gegevensregel maakt gebruikt van het `sh:in` construct om de enumeratie uit te drukken.

> In de Inspire RDF Guidelines wordt voorgeschreven om een enumeratie te modelleren als rdfs:Datatype in plaats van als klasse. Dit leidt tot enumeratiewaardes die een literal zijn, met het datatype van de enumeratie. Bijvoorbeeld `"hoog"^^imgolf:NatuurwaardeValue`. De reden om hiervan af te wijken is omdat enumeraties vaker waardelijsten zijn die een object of concept modelleren, dan een lijst van letterlijke waardes. Door deze waardes als objecten te modelleren blijft het mogelijk om nieuwe uitdrukkingen te doen over de waardes.

[MB] Eens met de richting. Daarbij wel de opmerking dat we, anders dan bij NEN 3610, juist nu wel tot de juiste vertaling willen komen. Zie ook de uitwerking bij referentielijst. Als we die volgen, kunnen we op basis van het type de juiste vertaalvorm selecteren.

#### Enumeratiewaarde

> Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant gegeven.

#### Codelist

> Een referentielijst die extern wordt beheerd, en geen onderdeel is van het informatiemodel.

> **ISSUE**
>
> Een codelist heeft een `mim:locatie` waarin is gespecificeerd waar de externe bron gevonden kan worden waar de mogelijke waarden zijn opgesomd. Dit KAN een URI of URL zijn en deze bron ZOU bijvoorbeeld een SKOS vocabulaire kunnen zijn. Maar omdat dit niet met zekerheid te zeggen is kunnen we niets met deze externe vocabulaires doen. Dit hoewel een codelist wel degelijk onderdeel kan uitmaken van het model in conceptuele zin, hoewel het om beheer- of technische redenen buiten het UML model is geplaatst. Zie ook het overeenkomstige issue bij [Referentielijst](#referentielijst).

### Datatypen

#### Primitief datatype

> Een in het eigen model gedefinieerd primitieve datatype. Deze worden wel door de modelleur gecreëerd, met een eigen naam en een eigen definitie (en eigen metagegevens).

Een primitief datatype wordt vertaald naar een `rdfs:Datatype`. Indien er geen subklasse aanwezig is naar een andere datatype, dan wordt per default een subklasse van xsd:string toegevoegd.

```
CONSTRUCT {
  ?datatype a rdfs:Datatype.
  ?datatype rdfs:subClassOf xsd:string.
  ?datatype rdfs:seeAlso ?primitiefdatatype.
}
WHERE {
  ?primitiefdatatype a mim:PrimitiefDatatype.
  ?primitiefdatatype mim:naam ?primitiefdatatypenaam.
  FILTER NOT EXISTS {
    ?generalisatie mim:subtype ?primitiefdatatype
  }
  BIND (t:classuri(?primitiefdatatypenaam) as ?datatype)
}

CONSTRUCT {
  ?datatype a rdfs:Datatype.
  ?datatype rdfs:seeAlso ?primitiefdatatype.
}
WHERE {
  ?primitiefdatatype a mim:PrimitiefDatatype.
  ?primitiefdatatype mim:naam ?primitiefdatatypenaam.
  ?generalisatie mim:subtype ?primitiefdatatype
  BIND (t:classuri(?primitiefdatatypenaam) as ?datatype)
}
```

#### Primitief datatype - standaard datatypen

Voor standaard datatypen maakt RDF gebruik van de XSD datatypen. Onderstaande tabel geeft de mapping weer vanuit de datatypen die in het MiM zijn gespecificeerd.

|MIM datatype|XSD Datatype|
|------------|------------|
|`mim:CharacterString`|`xsd:string`|
|`mim:Integer`|`xsd:integer`|
|`mim:Real`|`xsd:decimal`|
|`mim:Boolean`|`xsd:boolean`|
|`mim:Date`|`xsd:date`|
|`mim:DateTime`|`xsd:dateTime`|
|`mim:Year`|`xsd:gYear`|
|`mim:Day`|`xsd:gDay`|
|`mim:Month`|`xsd:gMonth`|
|`mim:URI`|`xsd:anyURI`|

Deze vertaaltabel kan worden doorgevoerd via `rdfs:seeAlso` statements, aangezien deze vervolgens gebruikt wordt in de transformatieregel voor generalisatie en in de transformatieregel voor het aspect `mim:type`.

```
CONSTRUCT {
  mim:CharacterString a mim:PrimitiefDatatype.
  mim:Integer a mim:PrimitiefDatatype.
  mim:Real a mim:PrimitiefDatatype.
  mim:Boolean a mim:PrimitiefDatatype.
  mim:Date a mim:PrimitiefDatatype.
  mim:DateTime a mim:PrimitiefDatatype.
  mim:Year a mim:PrimitiefDatatype.
  mim:Day a mim:PrimitiefDatatype.
  mim:Month a mim:PrimitiefDatatype.
  mim:URI a mim:PrimitiefDatatype.
  xsd:string rdfs:seeAlso mim:CharacterString.
  xsd:integer rdfs:seeAlso mim:Integer.
  xsd:decimal rdfs:seeAlso mim:Real.
  xsd:boolean rdfs:seeAlso mim:Boolean.
  xsd:date rdfs:seeAlso mim:Date.
  xsd:dateTime rdfs:seeAlso mim:DateTime.
  xsd:gYear rdfs:seeAlso mim:Year.
  xsd:gDay rdfs:seeAlso mim:Day.
  xsd:gMonth rdfs:seeAlso mim:Month.
  xsd:anyURI rdfs:seeAlso mim:URI.
}
WHERE {}
```

#### Gestructureerd datatype

> Specifiek benoemd gestructureerd datatype dat de structuur van een gegeven beschrijft, samengesteld uit minimaal twee elementen.

Een `mim:GestructureerdDatatype` wordt vertaald naar een `sh:NodeShape`. Er wordt geen `sh:Class` aangemaakt zoals bij een `mim:Objecttype`, aangezien conform het MiM een gestructureerd datatype slechts een structuur schetst en geen semantiek.

> **ISSUE**
>
> De manier waarop de URI van een gestructureerdDatatype tot stand komt, betekent dat de naam van het gestructureerdDatatype uniek moet zijn, inclusief de naam van het objecttype. Dit wordt op dit moment binnen het MIM alleen afgedwongen binnen een package, maar niet overstijgend aan packages.
>
> Mogelijke oplossing is om een dergelijke regel wel op te nemen in het MIM.
>
> Voorlopige aanname is dat sprake is van uniciteit over alle elementen die nodeshape kunnen zijn.

```
CONSTRUCT {
  ?nodeshape a sh:NodeShape.
  ?nodeshape rdfs:seeAlso ?gestructureerddatatype.
}
WHERE {
  ?gestructureerddatatype a mim:GestructureerdDatatype.
  ?gestructureerddatatype mim:naam ?gestructureerddatatypenaam.
  BIND (t:nodeshapeuri(?gestructureerddatatypenaam) as ?nodeshape)
}
```

#### Data element

> Een onderdeel/element van een Gestructureerd datatype die als type een datatype heeft.

Een `mim:DataElement` wordt op dezelfde wijze omgezet als een `mim:Attribuutsoort`, waarbij het gestructureerd datatype de "bezitter" is van het data element. De relatie tussen het gestructureerd datatype en het data element wordt direct meegenomen in de transformatie.

De URI van de propertyshape wordt afgeleid van de naam van het gestructureerde datatype dat het data element "bezit" en de naam van het data element. De URI van de datatypeproperty wordt ook op die manier afgeleid. Dit in afwijking van de wijze waarop dit bij een attribuutsoort gebeurt. Reden is het feit dat een data element echt uniek bij een gestructureerd datatype hoort, conform het metamodel (er is sprake van een compositie-aggregatie).

> **ISSUE**
>
> Een data element hoort uniek bij een gestructureerd datatype. In Linked Data zijn properties "first class citizens" en kan de property wel los bestaan. Ook bij data elementen kan dit voorkomen. Bijvoorbeeld als generieke eigenschappen als `rdf:value` of `rdfs:label` wordt gebruikt als data elementen. Zie ook het issue bij [Attribuutsoort](#attribuutsoort).
>
> Conform het metamodel, ligt het voor de hand om bij data elementen juist wel te kiezen voor properties die uniek zijn voor een gestructureerd datatype. Dit maakt hergebruik van bestaande properties niet mogelijk. De oplossing hiervoor zou eventueel kunnen liggen in het ondersteunen van `mim:identificatie` (zie ook het eerste issue), waarbij de `mim:identificatie` de geconstrueerde issue zou overriden.

```
CONSTRUCT {
  ?nodeshape sh:property ?propertyshape.
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?datatypeproperty.
  ?propertyshape sh:nodekind sh:Literal.
  ?propertyshape rdfs:seeAlso ?attribuutsoort.
  ?datatypeproperty a owl:DatatypeProperty.
  ?datatypeproperty rdfs:seeAlso ?attribuutsoort.
}
WHERE {
  ?dataelement a mim:DataElement.
  ?dataelement mim:naam ?dataelementnaam.
  ?bezitter mim:element ?dataelement.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:nodeshapeuri(?bezittersnaam) as ?nodeshape)
  BIND (t:propertyshapeuri(?bezittersnaam,?dataelementnaam) as ?propertyshape)
  BIND (t:nodepropertyuri(?dataelementnaam) as ?datatypeproperty)
}
```


#### Union

> Gestructureerd datatype, waarmee wordt aangegeven dat er meer dan één mogelijkheid is voor het datatype van een attribuut. Het attribuut zelf krijgt als datatype de union. De union biedt een keuze uit verschillende datatypes, elk afzonderlijk beschreven in een union element.

> **Voorstel:**
Wordt getransformeerd zoals beschreven in https://geonovum.github.io/NEN3610-Linkeddata/#regels-klassen-union.

[MB] Het lijkt erop dat in het MiM een union veel beperkter is dan in standaard UML. Daardoor kan de transformatie ook eenvoudiger plaatsvinden. Daarnaast is het handig om de rdf:List afzonderlijk te modelleren, conform het MiM.

Een union is feitelijk een onderdeel van de specificatiek van een attribuutsoort. In het MiM wordt deze als afzonderlijk modelelement opgenomen en kan daardoor ook hergebruikt of worden voorzien van extra meta-informatie. Een `min:Union`, in combinatie met het `mim:type` wordt vertaald naar een `sh:xone` waarbij de Union zelf een rdf:List is. In deze transformatieregel wordt ook de transformatie van `mim:type` meegenomen. Deze wordt hiermee niet opgenomen bij de transformatie van `mim:type` zelf (zie ook [Type](#type)). Merk op dat een empty list normaal gesproken wordt gerepresenteerd met `rdf:nil`. Dat is in ons geval niet handig, aangezien we expliciet een instantie willen aanmaken van het type `rdf:List`. Aangezien het MiM vereist dat minimaal twee union elementen aanwezig zijn, ontstaat altijd een correcte lijst.

```
CONSTRUCT {
  ?list a rdf:List.
  ?list rdf:rest rdf:nil.
  ?list rdfs:seeAlso ?union.
}
WHERE {
  ?union a mim:Union.
  ?union mim:naam ?unionnaam.
  BIND (t:nodeshapeuri(?unionnaam) as ?list)
}

CONSTRUCT {
  ?subject sh:xone ?union
}
WHERE {
  ?modelelement mim:type ?type.
  ?type rdfs:subClassOf*/rdf:type mim:Union.
  ?subject rdfs:seeAlso ?modelelement.
  ?union rdfs:seeAlso ?type.
}
```

#### Union element

> Een type dat gebruikt kan worden voor het attribuut zoals beschreven in de definitie van Union. Het union element is een onderdeel van een Union, uitgedrukt in een eigenschap (attribute) van een union, die als keuze binnen de Union is gerepresenteerd.

Een `mim:unionElement` wordt vertaald naar een element in de lijst van de Union.

Anders dan andere voorbeelden, wordt hier geen CONSTRUCT query gebruikt, omdat de lijst recursief wordt opgebouwd, in combinaties van DELETE en INSERT queries. Nieuwe elementen worden aan het begin van de lijst toegevoegd (er wordt geen volgorde verondersteld, zie ook het algemene issue over volgorde bovenaan). Het union element wordt zelf als blank node toegevoegd.

Onderstaand voorbeeld geeft aan hoe de conversie uiteindelijk plaatsvindt:

> **ISSUE**
>
> Eigenlijk is het helemaal niet mooi dat het zo ingewikkeld wordt. Maar DAT het zo gebeurt is een beperking van UML. We kunnen het ook eenvoudiger maken door het weg te laten, en in MiM expliciet op te nemen dat voor dit element deze waarden niet gelden.

```
ex:GeometrischObject a mim:Objecttype;
  mim:naam "Geometrisch object";
  mim:attribuut ex:geometrie;
.
ex:geometrie a mim:Attribuutsoort;
  mim:naam "geometrie";
  mim:datatype ex:LineOrPolygon;
.
ex:LineOrPolygon a mim:Union;
  mim:naam "Line or polygon";
  mim:element ex:Line;
  mim:element ex:Polygon;
.
ex:Line a mim:UnionElement;
  mim:naam "Line";
  mim:type gml:Line;
.
ex:Polygon a mim:UnionElement;
  mim:naam "Polygon";
  mim:type gml:Polygon;
.

shape:GeometrischObject-geometrie a sh:PropertyShape;
  rdfs:label "geometrie";
  rdfs:seeAlso ex:geometrie;
  sh:xone shape:LineOrPolygon;
.
shape:LineOrPolygon a rdf:List;
  rdfs:label "Line or polygon";
  rdfs:seeAlso ex:LineOrPolygon;
  rdf:first [
    rdfs:label "Line";
    rdfs:seeAlso ex:Line;
    sh:datatype gml:Line
  ];
  rdf:rest (
    [
      rdfs:label "Polygon";
      rdfs:seeAlso ex:Polygon;
      sh:datatype gml:Polygon
    ]
  );
.
```

De list in bovenstaand voorbeeld is niet geheel in de `()` vorm neergezet, zodat ook de extra eigenschappen zichtbaar kunnen worden gemaakt. Feitelijk is bovenstaande formeel gezien gelijk aan:

```
shape:GeometrischObject-geometrie a sh:PropertyShape;
  rdfs:label "geometrie";
  rdfs:seeAlso ex:geometrie;
  sh:xone (
    [ sh:datatype gml:Line ]
    [ sh:datatype gml:Polygon ]  
  )
.
```

De meer uitgebreide vorm is gekozen om ook de aanvullende informatie over Union en Unionelement kwijt te kunnen.

```
DELETE {
  ?endoflist rdf:rest rdf:nil
}
INSERT {
  ?list rdf:first [ rdfs:seeAlso ?unionelement ];
  ?list rdf:rest ?endoflist.
}
WHERE {
  ?unionelement a mim:UnionElement.
  ?union mim:element ?unionelement.
  ?list rdfs:seeAlso ?union.
  ?list rdf:rest* ?endoflist.
  ?endoflist rdf:rest rdf:nil.
}

DELETE {
  ?endoflist rdf:rest rdf:nil.
  ?realendoflist rdf:rest ?endoflist.
}
INSERT {
  ?realendoflist rdf:rest rdf:nil
}
WHERE {
  ?list a rdf:List.
  ?list rdf:rest* ?realendoflist.
  ?realendoflist rdf:rest ?endoflist.
  ?endoflist rdf:rest rdf:nil.
}
```

De tweede delete-insert query is een "opruimquery": aangezien we zijn begonnen met een rdf:List in plaats van een rdf:nil, moeten we het einde van de lijst er nog weer afknippen.

### Packages
> Een package is een benoemde en begrensde verzameling/groepering van modelelementen.

#### Domein
> Het eigen IM.

> **UITZOEKEN**
>
> Het domein betreft het eigen IM. Transformatie naar `owl:Ontology` lijkt voor de hand te liggen. In het MiM lijkt dit stereotype niet formeel beschreven. Hoe achterhalen we deze? En kunnen er meerdere packages met stereotype domein zijn binnen een model? Mogelijk moeten we dan meerdere owl:Ontologies aanmaken? Dit is gerelateerd aan het issue over dubbele namen bij bv [Objecttype](#objecttype).

#### Extern
> Een groepering van constructies die een externe instantie beheert en beschikbaar stelt aan een informatiemodel en die in het informatiemodel ongewijzigd gebruikt worden.

> **UITZOEKEN**
>
> Het lijkt logisch om een extern package niet te transformeren. De aanname is dat dit al door de externe instantie is gedaan. Mits er voldoende informatie in de UML aanwezig is, kan er een owl:import statement gegenereerd worden. Hiervoor lijkt minimaal noodzakelijk dat een locatie opgegeven kan worden. Wellicht dat het element `mim:locatie` dan ook toegepast zou kunnen worden op package niveau?

#### View
> Een groepering van objecttypen die gespecificeerd zijn in een extern informatiemodel en vanuit het perspectief van het eigen informatiemodel inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het eigen informatiemodel.

> **UITZOEKEN**
>
> LvdB: ik weet niet precies wat het verschil is tussen `<<Extern>>` en `<<View>>`. Het lijkt in beide gevallen logisch om een extern package niet te transformeren. De aanname is dat dit al door de externe instantie is gedaan. Mits er voldoende informatie in de UML aanwezig is, kan er een owl:import statement gegenereerd worden. Maar voor een `<<View>>` package is dat wellicht overbodig.

### Overig

#### Constraint
> Een constraint is een conditie of een beperking, die over een of meerdere modelelementen uit het informatiemodel geldt.

Een constraint (en bijbehorende gegevens) worden direct overgenomen in het vertaalde model als blank node. Het MiM kent voor een constraint twee aspecten: tekstueel en formeel. Het MiM doet daarbij geen uitspraak over de taal die voor het formele model moet worden gehanteerd. Daarmee is een transformatie niet op zijn plaats. Zie ook de [INSPIRE RDF Guidelines](http://inspire-eu-rdf.github.io/inspire-rdf-guidelines/#ref_cr_constraint) waar een vergelijkbare redenatie wordt gevolgd.

```
CONSTRUCT {
  ?subject mim:constraint ?constraint.
  ?constraint ?prop ?obj.
}
WHERE {
  ?modelelement mim:constraint ?constraint.
  ?subject rdfs:seeAlso ?modelelement.
  ?constraint ?prop ?obj.
}
```

### Properties

#### naam

> De naam van een modelelement

Een `mim:naam` wordt vertaald naar een `rdfs:label`.

> **ISSUE**
>
> In UML wil het nog wel eens gebruikelijk zijn om voor de naam van een modelelement een technische vorm te kiezen. Bijvoorbeeld "KadastraalObject" in plaats van "Kadastraal object". In Linked Data is het gebruikelijk dat het rdfs:label een voor mensen leesbaar label is, dus *met* spaties. De shacl `sh:name` property leent zich wat meer voor een technische naam. Het is echter niet duidelijk in het MiM wat wordt bedoeld.
>
> Mogelijke oplossing: een "naamgevingsconventie" toevoegen aan het totale MiM model, waaruit blijkt of sprake is van technische namen of van namen die voldoen aan de gebruikelijke spellingsregels.
>
> Voorlopige aanname: de naam voldoet aan de gebruikelijke spellingsregels.
>
> Aanvulling LvdB: MiM heeft een paragraaf over naamgevingsconventies, echter is er een keuzevrijheid tussen naamgeving in of natuurlijke taal, of machineleesbare taal. Zie MiM [3.16 Naamgevingsconventies](https://docs.geostandaarden.nl/mim/mim10/#naamgevingsconventies).

> **ISSUE**
>
> In UML is het niet gebruikelijk om taal toe te voegen aan een eigenschap. In Linked Data is het prima mogelijk om meerdere talen te ondersteunen en ook aan te geven om welke taal het gaat.
>
> Mogelijke oplossing: op het metaniveau van het model aangeven om welke taal het gaat, wat vervolgens in het gehele model wordt gebruikt.
>
> Voorlopige aanname: we veronderstellen geen taal.

```
CONSTRUCT {
  ?subject rdfs:label ?naam
}
WHERE {
  ?modelelement mim:naam ?naam.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### alias

> De alternatieve weergave van de naam.

Een `mim:alias` wordt vertaald naar een `skos:altLabel`

> **ISSUE**
>
> Aangezien in UML er niet direct een mogelijkheid is om taal te ondersteunen, wordt het alias nog wel eens gebruikt om een andere taal aan te duiden. Ook wordt het alias wel eens gebruikt om het onderscheid te maken tussen een meer technische naam (bv in CamelCase) en een functionele naam (met spaties enzo). Indien dit het geval is, dan klopt de vertaling naar `skos:altLabel` niet.
>
> Mogelijke oplossing: zie de oplossing bij issue 9
>
> Voorlopige aanname: dat een mim:alias daadwerkelijk een alternatieve weergave van de naam is.

```
CONSTRUCT {
  ?subject skos:altLabel ?alias
}
WHERE {
  ?modelelement mim:alias ?alias.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### begrip

> Verwijzing naar een begrip, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.

Een `mim:begrip` wordt vertaald naar een `dct:source`

```
CONSTRUCT {
  ?subject dct:source ?begrip
}
WHERE {
  ?modelelement mim:begrip ?begrip.
  ?subject rdfs:seeAlso ?modelelement
}
```

#### begripsterm

> Verwijzing naar een begrip in de vorm van de term, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.

Een `mim:begripsterm` wordt vertaald naar een `dc:source`. Het heeft de voorkeur om geen gebruik te maken van dit aspect, maar om gebruik te maken van het aspect `mim:begrip`, waarmee een directe verwijzing kan worden gemaakt naar het begrip zelf.

```
CONSTRUCT {
  ?subject dc:source ?begrip
}
WHERE {
  ?modelelement mim:begripsterm ?begripsterm.
  ?subject rdfs:seeAlso ?modelelement
}
```

#### definitie

> De beschrijving van de betekenis van dit modelelement.

Een `mim:definitie` wordt vertaald naar een `rdfs:comment`

Rationale om niet te kiezen voor `skos:definition`: in de meeste Linked Data vocabulaires is het gebruikelijk om de beschrijving van een klasse op te nemen door middel van een `rdfs:comment`, wat ook de intentie is in het MiM. Het MiM is niet beoogd als een volledig begrippenkader. Het MiM biedt daarnaast de mogelijkheid om expliciet te verwijzen vanuit een modelelement naar een `skos:Concept`. Het ligt dan ook voor de hand om bij dit `skos:Concept` de werkelijke `skos:definition` op te nemen.

> **UITZOEKPUNT**
>
> Ik meende dat het mogelijk was om in het MiM op te geven dat een modelelement *ook* een begrip is. In dat geval zou je dus een andere vertaling kunnen maken, dwz: *wel* naar een `skos:definition`. Dit zou wel beter zijn.

#### toelichting

> Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding.

Een `mim:toelichting` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

*Aanbevolen wordt om geen gebruik te maken van mim:toelichting, maar gebruik te maken van de verwijzing naar expliciet gedefinieerde begrippen, waarbij de toelichting bij het begrip zelf wordt opgenomen*.

```
CONSTRUCT {
  ?subject mim:toelichting ?toelichting
}
WHERE {
  ?modelelement mim:toelichting ?toelichting.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### herkomst

> De registratie of het informatiemodel waaraan het modelelement ontleend is dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is.

Een `mim:herkomst` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:herkomst ?herkomst
}
WHERE {
  ?modelelement mim:herkomst ?herkomst.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### herkomst definitie

> De registratie of het informatiemodel waaruit de definitie is overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de definitie is samengesteld.

Een `mim:herkomstDefinitie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

*Aanbevolen wordt om geen gebruik te maken van mim:herkomstDefinitie, maar gebruik te maken van de verwijzing naar expliciet gedefinieerde begrippen, waarbij de herkomst van de definitie bij het begrip zelf wordt opgenomen*.

```
CONSTRUCT {
  ?subject mim:herkomstDefinitie ?herkomstdefinitie
}
WHERE {
  ?modelelement mim:herkomstDefinitie ?herkomstdefinitie.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### datum opname

> De datum waarop het modelelement is opgenomen in het informatiemodel.

Een `mim:datumOpname` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:datumOpname ?datumopname
}
WHERE {
  ?modelelement mim:datumOpname ?datumopname.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### indicatie materiële historie

> Indicatie of de materiële historie van het kenmerk van het object te bevragen is.

> **UITZOEKEN**
>
> Hoe gaan we dit doen? Feitelijk moet je deze indicatie omzetten naar daadwerkelijke properties.
>
> Zie voor input het NEN3610 Linked Data Profiel [7.3.4.2.4 Attribuut met stereotype «materieleHistorie»](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-materieleHistorie).

#### indicatie formele historie

> Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is.

> **UITZOEKEN**
>
> Hoe gaan we dit doen? Feitelijk moet je deze indicatie omzetten naar daadwerkelijke properties. Meestal doen we daarbij formele historie als onderdeel van de volledige klasse, maar niet de afzonderlijke elementen.
>
> Zie voor input het NEN3610 Linked Data Profiel [7.3.4.2.5 Attribuut met stereotype «formeleHistorie»](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-formeleHistorie).

#### kardinaliteit

De `mim:kardinaliteit` wordt vertaald naar `sh:minCount` en `sh:maxCount`. Daarbij wordt de volgende tabel gebruikt om de string-waarde van mim:kardinaliteit om te zetten. Een `-` betekent dat de betreffende triple niet wordt opgenomen in het model.

Daarnaast wordt `min:kardinaliteit` ook direct overgenomen in het vertaalde model. De reden hiervoor is tweeledig. Enerzijds maakt het daarmee eenvoudiger om de originele kardinaliteit weer te geven. Voor niet-SHACL experts kan het verwarrend zijn dat het ontbreken van zowel sh:minCount als sh:maxCount betekent dat sprake is van een 0..* kardinaliteit. Anderzijds maakt het de terugvertaling in geval van een `min:mogelijkGeenWaarde` mogelijk, aangezien dit veld invloed kan hebben op de sh:minCount (zie ook [mogelijk-geen-waarde](#mogelijkgeenwaarde)).

|mim:kardinaliteit|sh:minCount|sh:maxCount|
|-----------------|-----------|-----------|
|1|1|1|
|*|-|-|
|0..1|-|1|
|0..*|-|-|
|1..1|1|1|
|1..*|1|-|
|a..z|a|z|

In de laatste regel moet voor a en z een geheel getal vanaf 1 worden gelezen.

```
CONSTRUCT {
  ?propertyshape sh:minCount ?mincount.
}
WHERE {
  ?modelelement mim:kardinaliteit ?kardinaliteit.
  ?modelelement mim:mogelijkGeenWaarde ?mogelijkgeenwaarde.
  ?propertyshape rdfs:seeAlso ?modelelement.
  BIND (t:mincount(?kardinaliteit) as ?mincount)
  FILTER(NOT(?mogelijkgeenwaarde))
}

CONSTRUCT {
  ?propertyshape sh:maxCount ?maxcount.
}
WHERE {
  ?modelelement mim:kardinaliteit ?kardinaliteit.
  ?propertyshape rdfs:seeAlso ?modelelement.
  BIND (t:maxcount(?kardinaliteit) as ?maxcount)
}
```

#### authentiek
> Aanduiding of het kenmerk een authentiek gegeven betreft.

Een `mim:authentiek` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:authentiek ?authentiek
}
WHERE {
  ?modelelement mim:authentiek ?authentiek.
  ?subject rdfs:seeAlso ?modelelement.
}
```

> **UITZOEKEN**
>
> Wellicht net als bij `mim:datumOpname` te overwegen om hiervoor prov te gebruiken.
>
> [MB] Welke eigenschap zou hiervoor geschikt zijn? Ik vind deze lastig, omdat mim:authentiek heel dicht tegen de wet- en regelgeving aanzit, en dus specifiek MiM is.

#### indicatie afleidbaar
> Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of relatiesoorten.

Een `mim:indicatieAfleidbaar` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:indicatieAfleidbaar ?indicatieafleidbaar
}
WHERE {
  ?modelelement mim:indicatieAfleidbaar ?indicatieafleidbaar.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### mogelijk geen waarde
> Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk is of de waarde er werkelijk ook niet is.

Een `mim:mogelijkGeenWaarde` wordt direct, zonder aanpassing, overgenomen in het vertaalde model, waarbij in een enkel geval een aanpassing wordt gedaan aan de manier waarop `mim:kardinaliteit` wordt getransformeerd.

Linked Data gaat in beginsel uit van een "open word assumptie". Dit houdt onder andere in dat Linked Data er van uitgaat dat elk aspect mogelijk geen waarde kan hebben. Met SHACL kan deze assumptie worden beperkt. Zo zal bij een verplicht veld (zoals kardinaliteit 1..* of 1..1) daadwerkelijk ook een waarde aanwezig moeten zijn. Het MiM gaat in beginsel  uit van een "closed world assumptie", het veld `mim:mogelijkGeenWaarde` is juist bedoeld om deze assumptie te verruimen. Doordat het veld `mim:mogelijkGeenWaarde` altijd een waarde heeft ("Ja" of "Nee"), kan het veld ook worden gelezen als *als de waarde in de werkelijkheid bestaat, dan is deze ook aanwezig*. Dit maakt dat het veld `mim:mogelijkGeenWaarde` feitelijk in de context van Linked Data het model in vele gevallen een gesloten model maakt, vandaar ook het gebruik van SHACL waarmee we deze beperkingen kunnen opleggen. Indien sprake is van een "mogelijk geen waarde" dan is het wel noodzakelijk om de transformatieregel voor `mim:kardinaliteit` aan te passen, conform onderstaande tabel:

|`mim:mogelijkGeenWaarde`|`mim:kardinaliteit`|Aanpassing             |
|------------------------|-------------------|-----------------------|
| Nee                    | 0..x              |geen                   |
| Nee                    | 1..x              |geen                   |
| Ja                     | 0..x              |geen                   |
| Ja                     | 1..x              |sh:minCount verwijderd |
| Ja                     | n..x (met n>1)    |sh:minCount verwijderd |

"sh:minCount verwijderd" houdt in dat de kardinaliteit 0..x wordt. Deze aanpassing is opgenomen in de transformatieregel van [kardinaliteit](#kardinaliteit).

Zie ook het NEN3610 Linked Data Profiel [7.3.4.2.3 Attribuut met stereotype «voidable»](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-voidable) voor meer achtergrondinformatie.

```
CONSTRUCT {
  ?subject mim:mogelijkGeenWaarde ?mogelijkgeenwaarde
}
WHERE {
  ?modelelement mim:mogelijkGeenWaarde ?mogelijkgeenwaarde.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### locatie
> Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de locatie waar deze te vinden is opgegeven.

Een `mim:locatie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

> **ISSUE**
>
> `mim:locatie` wordt zowel gebruikt op het niveau van het datatype, maar ook bij een attribuutsoort. Het lijkt meer voor de hand te liggen om dit allen bij het datatype toe te staan. De vertaling wordt dan ook bij het datatype zelf opgenomen, en zou vertaald kunnen worden naar `rdfs:isDefinedBy`, `wdrs:describeby` of iets dergelijks.

#### type
> Het datatype waarmee waarden van deze attribuutsoort worden vastgelegd.

De vertaling van een `mim:type` hangt af van de vertaling van het datatype waar naar wordt verwezen:

- Voor primitieve datatypes wordt vertaald naar een `sh:datatype`;
- Voor gestructureerde datatypes wordt vertaald naar een `sh:node`;
- Voor een enumeratie wordt vertaald naar een `sh:node`;
- Voor een referentielijst wordt vertaald naar een `sh:node`;
- Voor een codelijst wordt vertaald naar een `sh:node`;
- Voor een union wordt de vertaling opgepakt bij de transformatieregel van union zelf (zie ook [Union](#union))
- In geval van zelfgespecificeerde datatypen wordt vertaald conform het betreffende supertype.

```
CONSTRUCT {
  ?subject sh:datatype ?datatype
}
WHERE {
  ?modelelement mim:type ?type.
  ?type rdfs:subClassOf*/rdf:type mim:PrimitiefDatatype.
  ?subject rdfs:seeAlso ?modelelement.
  ?datatype rdfs:seeAlso ?type.
}

CONSTRUCT {
  ?subject sh:node ?datatype
}
WHERE {
  ?modelelement mim:type ?type.
  ?type rdfs:subClassOf*/rdf:type ?mimtype.
  ?subject rdfs:seeAlso ?modelelement.
  ?subject a sh:NodeShape.
  ?datatype rdfs:seeAlso ?type.
  FILTER (?mimtype = mim:GestructureerdDatatype
       || ?mimtype = mim:Enumeratie
       || ?mimtype = mim:Referentielijst
       || ?mimtype = mim:Codelijst
  )
}

```

#### lengte
> De aanduiding van de lengte van een gegeven.

Een `mim:lengte` wordt vertaald naar een `sh:maxLength`.

```
CONSTRUCT {
  ?subject sh:maxLength ?lengte
}
WHERE {
  ?modelelement mim:lengte ?lengte.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### patroon
> De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur.

De structuur van `mim:patroon` is in woorden beschreven. Deze wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:patroon ?patroon
}
WHERE {
  ?modelelement mim:patroon ?patroon.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### formeel patroon
> Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door de computer wordt herkend.

`mim:formeelPatroon` wordt beschreven met `sh:pattern`.

> **ISUE**
>
> Het MiM stelt dat het formeelPatroon door de computer moet worden herkend, zonder specifiek te zijn op welke manier. `sh:pattern` vereist dat dit voldoet aan een reguliere expressie. Voorstel is om dit toe tevoegen aan het MiM.

```
CONSTRUCT {
  ?subject sh:pattern ?formeelpatroon
}
WHERE {
  ?modelelement mim:formeelPatroon ?formeelpatroon.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### unieke aanduiding
> Voor objecttypen die deel uitmaken van een (basis)registratie of informatiemodel betreft dit de wijze waarop daarin voorkomende objecten (van dit type) uniek in de registratie worden aangeduid.

Een `mim:uniekeAanduiding` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:uniekeAanduiding ?uniekeaanduiding
}
WHERE {
  ?modelelement mim:uniekeAanduiding ?uniekeaanduiding.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### populatie
> Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.

Een `mim:populatie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:populatie ?populatie
}
WHERE {
  ?modelelement mim:populatie ?populatie.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### kwaliteit
> Voor objecttypen die deel uitmaken van een registratie betreft dit de waarborgen voor de juistheid van de in de registratie opgenomen objecten van het desbetreffende type.

Een `mim:kwaliteit` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:kwaliteit ?kwaliteit
}
WHERE {
  ?modelelement mim:kwaliteit ?kwaliteit.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### indicatie abstract object
> Conceptueel model: indicatie dat het objecttype een generalisatie is, waarvan een object als specialisatie altijd voorkomt in de hoedanigheid van een (en slechts één) van de specialisaties van het betreffende objecttype. Logisch model: Indicatie dat er geen instanties (objecten) voor het betreffende objecttype mogen voorkomen.

In een MiM conform informatiemodel kunnen zowel abstracte als concrete klassen voorkomen. In UML kun je daarvan afleiden dat je geen instanties mag hebben van abstracte klassen, maar alleen van concrete klassen. In RDF wordt geen onderscheid gemaakt tussen het abstract of concreet zijn van klassen. In RDF worden klassen beschouwd als sets van dingen. Als je een set kunt beschrijven, dan kunnen er ook dingen zijn die tot die set behoren.

Een `mim:indicatieAbstractObject` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:indicatieAbstractObject ?indicatieabstractobject
}
WHERE {
  ?modelelement mim:indicatieAbstractObject ?indicatieabstractobject.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### identificerend
> Een kenmerk van een objecttype die aangeeft of deze eigenschap uniek identificerend is voor alle objecten in de populatie van objecten van dit objecttype.

Een `mim:identificerend` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:identificerend ?identificerend
}
WHERE {
  ?modelelement mim:identificerend ?identificerend.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### gegevensgroeptype (eigenschap)

> De verwijzing naar het bijbehorende gegevensgroeptype.

Een `mim:gegevensgroeptype` wordt vertaald naar een `sh:class` met als waarde de URI van de class die het bijbehorende gegevensgroeptype representeert. Zie [Gegevensgroep](#gegevensgroep) en [Gegevensgroeptype](#gegevensgroeptype) voor meer uitleg.

```
CONSTRUCT {
  ?subject sh:class ?object
}
WHERE {
  ?modelelement mim:gegevensgroeptype ?gegevensgroeptype.
  ?subject rdfs:seeAlso ?modelelement.
  ?subject a sh:NodeShape.
  ?object rdfs:seeAlso ?gegevensgroeptype.
  ?object a owl:Class.
}
```

#### unidirectioneel
> **ISSUE**
>
> LvdB: ik begrijp niet goed wat de betekenis is van het aspect 'unidirectioneel' in MiM. Het lijkt te gaan over de richting van de relatie.

Bij `<<relatiesoort>>`:

> Het gerelateerde objecttype (de target) waarvan het objecttype, die de eigenaar is van deze relatie (de source), kennis heeft. Alle relaties zijn altijd gericht van het objecttype (source) naar het gerelateerde objecttype (target).

Bij `<<Externe koppeling>>`:
> Het gerelateerde objecttype uit een extern informatiemodel (de target) waarvan het objecttype die de eigenaar van deze relatie is (de source) kennis heeft. Het aggregation type van de source is altijd ‘composition’. Alle relaties zijn altijd gericht van het objecttype (source) naar het gerelateerde objecttype (target).

#### objecttype (eigenschap)
Bij `<<Relatiesoort>>` en `<<Externe koppeling>>`:
> Het objecttype waarvan de relatie een eigenschap is.

Een `mim:objecttype` wordt vertaald naar een `sh:property` die hoort bij de de NodeShape van het objecttype. Zie voor meer informatie over hoe relaties tussen objecttypen worden vertaald de paragrafen [Relatiesoort](#relatiesoort) en [Externe koppeling](#externe-koppeling).

```
CONSTRUCT {
  ?objecttype sh:property ?modelelement
}
WHERE {
  ?modelelement mim:objecttype ?objecttype.
  ?subject rdfs:seeAlso ?modelelement.
  ?object rdfs:seeAlso ?objecttype.
}
```

#### gerelateerd objecttype
Bij `<<Relatiesoort>>`
> Het objecttype waarmee een objecttype een logisch verband heeft

Bij `<<Externe koppeling>>`:
> Het objecttype uit een extern informatiemodel waarmee een objecttype een logische verbinding heeft.

Een `mim:gerelateerdObjecttype` wordt vertaald naar een `sh:class` met als waarde de URI van de Class die het gerelateerde objecttype representeert. Zie voor meer informatie over hoe relaties tussen objecttypen worden vertaald de paragrafen [Relatiesoort](#relatiesoort) en [Externe koppeling](#externe-koppeling).

```
CONSTRUCT {
  ?subject sh:class ?object
}
WHERE {
  ?modelelement mim:gerelateerdObjecttype ?gerelateerdobjecttype.
  ?subject rdfs:seeAlso ?modelelement.
  ?object rdfs:seeAlso ?gerelateerdobjecttype.
}
```

#### type aggregatie
> Standaard betreft het geen aggregatie (None). Het type aggregatie mag ‘composite’ zijn. Dit wordt gedaan als er een afhankelijkheid is in die zin dat de target niet kan bestaan zonder de source: de target vervalt als de source vervalt.

Aggregatie- en compositie-associaties worden gemodelleerd zoals simpele relatiesoorten, gebruikmakend van de specifieke naam die de associatie in het oorspronkelijke model heeft. Een `mim:typeAggregatie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

```
CONSTRUCT {
  ?subject mim:typeAggregatie ?typeaggregatie
}
WHERE {
  ?modelelement mim:typeAggregatie ?typeaggregatie.
  ?subject rdfs:seeAlso ?modelelement.
}
```

#### code
> De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code (niet te verwarren met alias, zoals bedoeld in 2.6.1).

> **ISSUE**
>
> We hebben nog niet gespecificeerd hoe we enumeraties vertalen. In NEN3610-LD is standaardtransformatie een transformatie naar een klasse gelijknamig aan de enumeratieklasse, en instanties van deze klasse voor elk van de geënumereerde waardes. Als we dit volgen zouden we de `mim:code` kunnen vertalen naar een `rdfs:label` of `skos:altLabel`.

#### specificatie-tekst
> De specificatie van de constraint in normale tekst.

> **ISSUE**
>
> We hebben nog niet gespecificeerd hoe we constraints vertalen. Voorstel: alleen vertalen naar documentatie in het MiM model in RDF. In de toekomst wellicht vertalen naar SHACL.

Een `mim:specificatieTekst` wordt direct, zonder aanpassing, overgenomen in het vertaalde model, als onderdeel van de [transformatieregel voor constraints](#constraint).

#### specificatie-formeel
> De beschrijving van de constraint in een formele specificatietaal, in OCL.

> **ISSUE**
>
> We hebben nog niet gespecificeerd hoe we constraints vertalen. Voorstel: alleen vertalen naar documentatie in het MiM model in RDF. In de toekomst wellicht vertalen naar SHACL.

Een `mim:specificatieFormeel` wordt direct, zonder aanpassing, overgenomen in het vertaalde model, als onderdeel van de [transformatieregel voor constraints](#constraint).

#### attribuut

Een `mim:attribuut` wordt vertaald naar een `sh:property` die hoort bij de de NodeShape van de bezitter van het attribuut. Zie ook [Attribuutsoort](#attribuutsoort).

```
CONSTRUCT {
  ?nodeshape sh:property ?propertyshape
}
WHERE {
  ?modelelement mim:attribuut ?attribuutsoort.
  ?nodeshape rdfs:seeAlso ?modelelement.
  ?nodeshape a sh:NodeShape.
  ?propertyshape rdfs:seeAlso ?attribuutsoort.
  ?propertyshape a sh:PropertyShape.

}
```

#### gegevensgroep (eigenschap)

Een `mim:gegevensgroep` wordt vertaald naar een `sh:property` die hoort bij de de NodeShape van de bezitter van het attribuut. Zie ook [Gegevensgroep](#gegevensgroep).

```
CONSTRUCT {
  ?nodeshape sh:property ?propertyshape
}
WHERE {
  ?modelelement mim:gegevensgroep ?gegevensgroep.
  ?nodeshape rdfs:seeAlso ?modelelement.
  ?nodeshape a sh:NodeShape.
  ?propertyshape rdfs:seeAlso ?gegevensgroep.
  ?propertyshape a sh:PropertyShape.

}
```
