# Transformeren van een MIM model naar een RDFS/OWL/SHACL/SKOS model

## Inleiding

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

## Gebruikte functies

In de SPARQL rules wordt gebruik gemaakt van een aantal SPARQL functies. In onderstaande tabel staan deze opgesomd met de specificatie van de werking.

|Functie|Specificatie|
|-------|------------|
|t:CamelCase|Codeert een tekstveld naar een URI-vorm op basis van (upper) CamelCase regels|
|t:camelCase|Codeert een tekstveld naar een URI-vorm op basis van (lower) camelCase regels|
|t:kebabcase|Codeert een tekstveld naar een URI-vorm op basis van kebabcase regels (een `-` voor spaties)|
|t:classuri|Formuleert de uri voor een klasse op basis van de naam van een MiM resource. De class URI is opgebouwd als `{namespace}#{t:CamelCase(naam)}`. De `{namespace}` is een vooraf vastgestelde waarde die gelijk is aan de te maken ontologie.|
|t:nodeshapeuri|Formuleert de uri voor een nodeshape op basis van de naam van een MiM resource. De nodeshape URI is opgebouwd als `{shape-namespace}#{t:CamelCase(term)}`. De `{shape-namespace}` is een vooraf vastgestelde waarde die gelijk is aan de te maken shapesgraph.|
|t:propertyuri|Formuleert de uri voor een property op basis van de naam van een MiM resource. De property URI is opgebouwd als `{namespace}#{t:camelCase(naam)}`. Zie ook `t:classuri`.|
|t:propertyshapeuri|Formuleert de uri voor een propertyshape op basis van de naam van een MiM resource en de naam van de MIM resource die hiervan de "bezitter" is. De propertyshape URI is opgebouwd als `{namespace}#{t:CamelCase(bezittersnaam)}-{t:camelCase(naam)}`. Zie ook `t:nodeshapeuri`.|
|t:statementuri|Formuleert de uri voor een rdf:Statement op basis van zijn afzonderlijke elementen. Mogelijke invulling kan het maken van een hash zijn op basis van de aaneenschakeling van subject, predicate en object.|
|t:mincount|Formuleert de minimum kardinaliteit op basis van een kardinaliteitsaanduiding (zie bij mim:kardinaliteit). De waarde kan ook unbound zijn, in dat geval wordt ook de variable niet gebound en daardoor de betreffende triple niet opgevoerd.|
|t:maxcount|Formuleert de maximum kardinaliteit op basis van een kardinaliteitsaanduiding (zie bij mim:kardinaliteit). De waarde kan ook unbound zijn, in dat geval wordt ook de variable niet gebound en daardoor de betreffende triple niet opgevoerd.|

> **ISSUE**
>
> Er is, behalve `mim:naam`, geen formeel identificerend gegeven voor de modelelementen. Dit maakt het noodzakelijk om de URI op te bouwen uit de naam van het modelelement, eventueel aangevuld met gegevens van de package. In bepaalde gevallen is het echter veel logischer om te verwijzen naar elementen buiten het eigen model, zoals in Linked Data gebruikelijk is. Bijvoorbeeld bij externe koppelingen, referentielijsten en elementen in de "view" en "extern" packages.
>
> Mogelijke oplossing is het toevoegen van het aspect `mim:identificatie` dat als waarde een URI heeft. Indien dit veld aanwezig is, dan wordt dit veld gebruikt als identificatie i.p.v. de `mim:naam`.

## Klassen

Omdat het getransformeerde model daadwerkelijk een nieuw model is, zullen de elementen in het getransformeerde model ook eigen URI's krijgen. Om de relatie tussen het originele MiM-model het het getransformeerde model op basis van RDFS te behouden, wordt de eigenschap `rdfs:seeAlso` gebruikt.

> **ISSUE**
>
> Gebruik van `rdfs:seeAlso` is niet erg sterk. Een dergelijke eigenschap kan voor heel veel dingen gebruikt worden. Gekeken moet worden of er niet een betere property beschikbaar is voor dergelijke vocabulaires, of dat we een eigen property moeten introduceren binnen de mim vocabulaire, bv: `mim:equivalent`.

### mim:Objecttype

> De typering van een groep objecten (in de werkelijkheid) die binnen een domein relevant zijn en als gelijksoortig worden beschouwd.

Een `mim:Objecttype` wordt vertaald naar een `owl:Class` in combinatie met een `sh:NodeShape`.

> **ISSUE**
>
> De identificatie van een objecttype is afgeleid van de naam van het objecttype. Het kan zijn dat deze niet uniek is. Bijvoorbeeld als er gebruik wordt gemaakt van packages en in meerdere packages komen dezelfde namen voor.
>
> Mogelijke oplossing: er zijn meerdere oplossingen denkbaar: (a) in het MiM opnemen dat de naam uniek moet zijn, ook over packages heen. (b) afzonderlijke ontologieën (namespaces) maken per package. (c) package naam opnemen waar het mis gaat.
>
> Voorlopige aanname is dat sprake is van (a)

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

### mim:Attribuutsoort

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
> Voorlopige aanname: alle namen van attribuutsoorten zijn uniek.

> **ISSUE**
>
> De transformatie houdt nog niet rekening met het feit dat sommige datatypen in RDF juist geen literals zijn, maar resources. In die gevallen zou dus niet gesproken moeten worden over een `owl:DatatypeProperty`, maar een `owl:ObjectProperty`. Alleen de datatypes enumeratie (klopt dat?) en primitief datatype zouden naar een literal gaan, de overigen naar resources.

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

### Gegevensgroep

> Een typering van een groep van gelijksoortige gegevens die voor een objecttype van toepassing is.

Een `mim:Gegevensgroep` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:ObjectProperty`. De nodekind van de propertyshape is een `sh:BlankNode`. Gedachte hierachter is dat de gegevensgroep de verbinding is tussen een objecttype en een gegevensgroeptype. Een gegevensgroeptype is vervolgens een groep van samenhangende attribuutsoorten, wat overeen komt met een nodeshape (zie ook gegevensgroeptype). Omdat een gegevensgroeptype geen eigen identiteit heeft, zal dit gemodelleerd worden als blank node.

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

### Gegevensgroeptype

> Een groep van met elkaar samenhangende attribuutsoorten. Een gegevensgroeptype is altijd een type van een gegevensgroep.

Een `mim:Gegevensgroeptype` wordt vertaald naar een `sh:NodeShape`.

> **ISSUE**
>
> De manier waarop de URI van een gegevensgroeptype tot stand komt, betekent dat de naam van het gegevensgroeptype uniek moet zijn, inclusief de naam van het objecttype (en mogelijk ook datatype?). Dit wordt op dit moment binnen het MIM niet afgedwongen.
>
> Mogelijke oplossing is om een dergelijke regel wel op te nemen in het MIM.
>
> Voorlopige aanname is dat sprake is van uniciteit over alle elementen die nodeshape kunnen zijn.
>
> NB de naam van een gegevensgroeptype is net als die van een objecttype wel uniek binnen een package.

```
CONSTRUCT {
  ?nodeshape a sh:NodeShape.
  ?nodeshape rdfs:seeAlso ?objecttype.
}
WHERE {
  ?objecttype a mim:Objecttype.
  ?objecttype mim:naam ?objecttypenaam.
  BIND (t:nodeshapeuri(?objecttypenaam) as ?nodeshape)
}
```

### Generalisatie

> De typering van het hiërarchische verband tussen een meer generiek object van een objecttype en een meer specifiek object van een ander objecttype waarbij het laatstgenoemde object eigenschappen van het eerstgenoemde object overerft.

Generalisatie kan gebruikt worden tussen objecttypen, maar ook tussen datatypes. Aangezien zowel objecttypen als datatypen in het RDFS gebaseerde model worden getransformeerd naar een subklasse van `rdfs:Class`, kan in beide gevallen gebruik worden gemaakt van dezelfde transformatie.

Een `mim:Generalisatie` wordt vertaald naar een `rdfs:subClassOf`.

> **ISSUE**
>
> Vertaling van een mim:Generalisatie naar een rdfs:subClassOf betekent dat wat in het MiM een metaklasse is, in Linked Data een eigenschap is geworden en geen (meta)class. Hierdoor is het niet mogelijk om extra kenmerken te verbinden aan een generalisatie. Dit betekent dat het niet mogelijk is om de generalisatie een naam of een alias te geven.
>
> Voorlopige oplossing is om een rdf:Statement toe te voegen. Alternatief zou zijn om een subklassen te maken van `rdfs:subClassOf`.

```
CONSTRUCT {
  ?subtype rdfs:subClassOf ?supertype.
  ?statement rdf:subject ?subtype.
  ?statement rdf:predicate ?rdfs:subClassOf.
  ?statement rdf:object ?supertype.
  ?statement rdfs:seeAlso ?generalisatie.
}
WHERE {
  ?generalisatie a mim:Generalisatie.
  ?generalisatie mim:subtype ?subtype.
  ?generalisatie mim:supertype ?supertype.
  BIND (t:statementuri(?subtype,rdfs:subClasOf,?supertype) as ?statement)
}
```

### Relatiesoort

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

### Relatieklasse

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

### Externe koppeling

> Een associatie waarmee vanuit het perspectief van het eigen informatiemodel een objecttype uit het 'eigen' informatiemodel gekoppeld wordt aan een objecttype van een extern informatiemodel. De relatie zelf hoort bij het 'eigen' objecttype.

Een externe koppeling wordt op dezelfde wijze omgezet als een `mim:Relatiesoort` (zie [Relatiesoort](#relatiesoort)). Het verschil is zichtbaar doordat de betreffende objecttypes uit verschillende modellen komen. Anders dan bij UML is het daarbij niet gebruikelijk om het andere objecttype "in" het eigen model te plaatsen, maar juist om direct naar het andere objecttype te verwijzen. Eventueel kan daarbij ook nog gebruik worden gemaakt van een `owl:imports` om expliciet aan te geven dat een ander model wordt gebruikt.

> **ISSUE**
>
> Hoe kun je aangeven dat sprake is van een ander model? Nu bieden we daar geen ondersteuning voor. Ook het toevoegen van `owl:imports` klinkt als een handmatige stap.
>
> Mogelijke oplossing is het toevoegen van mim:identificatie, waarbij dan de URI expliciet wordt aangegeven als de externe bron. Punt is dan wel dat dit veld niet per sé verplicht is, en het ook zonder dit veld moet werken. Mogelijke oplossing is dan om gebruik te maken van de stereotypen van de packages?

### Relatierol

> **UITZOEKEN**
>
> Verder uitzoeken hoe met relatierol omgegaan moet worden. Feitelijk is de relatierol de daadwerkelijke "naam" van de property, en dus niet de naam van de relatiesoort... Dit lijkt dan dus niet helemaal goed te gaan. Zie ook [Relatiesoort](#relatiesoort).

### Referentielijst

> Een lijst met een opsomming van de mogelijke domeinwaarden van een attribuutsoort, die buiten het model in een externe waardenlijst worden beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel aangepast wordt (in tegenstelling tot bij een enumeratie).

> **ISSUE**
>
> Een referentielijst heeft een `mim:locatie` waarin is gespecificeerd waar de externe bron gevonden kan worden waar de mogelijke waarden zijn opgesomd. Dit KAN een URI of URL zijn en deze bron ZOU bijvoorbeeld een SKOS vocabulaire kunnen zijn. Maar omdat dit niet met zekerheid te zeggen is kunnen we niets met deze externe vocabulaires doen. Dit hoewel een referentielijst wel degelijk onderdeel kan uitmaken van het model in conceptuele zin, hoewel het om beheer- of technische redenen buiten het UML model is geplaatst.
>
> Daarbij komt dat er een verschil is tussen de URI van het conceptschema en de URI waar de concepten zelf zijn op te vragen. Bovendien zijn er ook dan nog meerdere implementaties denkbaar. Alle waardelijsten kunnen in 1 bestand staan, maar ook is het mogelijk dat alle waarden in afzonderlijke bestanden staan. Bovendien zald de URI van de waardelijst en de URI van de waarden niet gelijk aan elkaar zijn.
>
> Zie ook het eerste issue (algemeen): naar `mim:naam` en `mim:alias` lijkt het toevoegen van een `mim:identificatie` wenselijk, wat we kunnen vertalen naar een concrete URI. Daarmee kunnen we de URI van de waardelijst onderscheid van de plaats waar de inhoud van de waardelijst zelf te vinden is (dat zit dan in `mim:locatie`).
> Vervolgens is het toevoegen van een "typering" wenselijk. Deze typering geeft aan wat voor "soort" waardelijst het betreft. Drie waarden zijn denkbaar: (1) Conceptschema, (2) Collectie en (3) Klasse. Geen waarde betekent dat er sprake is van een ander soort typering, of dat de typering onbekend is. In geval van een typering wordt verwacht dat de `mim:locatie` een URL is en dat het veld `mim:identificatie` in ingevuld en een URI is. Bij (1) is deze URI de identificatie van een skos:ConceptScheme, bij (2) is de URI de identificatie van een skos:Collection en bij (3) is de URI de identificatie van een rdfs:Class.

### Referentie element

> Een eigenschap van een object in een referentielijst in de vorm van een gegeven.

### Enumeratie

> Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een statische lijst.

> **Voorstel**

We vertalen een enumeratie zoals beschreven in het NEN 3610 Linked Data profiel:

> Een enumeratie kan verschillende soorten dingen opsommen. Een lijst met waardes, bijv. een opsomming van nummers, maar ook een lijst met concepten, datatypes, of objecten. Het is dan ook niet triviaal om een goede automatische vertaling te bepalen die een enumeratie kan vertalen naar Linked Data. Om deze reden kiezen we voor een standaardtransformatie naar een klasse gelijknamig aan de enumeratieklasse, en instanties van deze klasse voor elk van de geënumereerde waardes. De geënumereeerde waardes worden ook met een `owl:oneOf` constructie begrensd door de enumeratieklasse. De SHACL gegevensregel maakt gebruikt van het `sh:in` construct om de enumeratie uit te drukken.

> In de Inspire RDF Guidelines wordt voorgeschreven om een enumeratie te modelleren als rdfs:Datatype in plaats van als klasse. Dit leidt tot enumeratiewaardes die een literal zijn, met het datatype van de enumeratie. Bijvoorbeeld `"hoog"^^imgolf:NatuurwaardeValue`. De reden om hiervan af te wijken is omdat enumeraties vaker waardelijsten zijn die een object of concept modelleren, dan een lijst van letterlijke waardes. Door deze waardes als objecten te modelleren blijft het mogelijk om nieuwe uitdrukkingen te doen over de waardes.

### Enumeratiewaarde

> Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant gegeven.

### Codelist

> Een referentielijst die extern wordt beheerd, en geen onderdeel is van het informatiemodel.

> **ISSUE**
>
> Een codelist heeft een `mim:locatie` waarin is gespecificeerd waar de externe bron gevonden kan worden waar de mogelijke waarden zijn opgesomd. Dit KAN een URI of URL zijn en deze bron ZOU bijvoorbeeld een SKOS vocabulaire kunnen zijn. Maar omdat dit niet met zekerheid te zeggen is kunnen we niets met deze externe vocabulaires doen. Dit hoewel een codelist wel degelijk onderdeel kan uitmaken van het model in conceptuele zin, hoewel het om beheer- of technische redenen buiten het UML model is geplaatst. Zie ook het overeenkomstige issue bij [Referentielijst](#referentielijst).

## Datatypen

### Primitief datatype

> Een in het eigen model gedefinieerd primitieve datatype. Deze worden wel door de modelleur gecreëerd, met een eigen naam en een eigen definitie (en eigen metagegevens).

Een primitief datatype wordt vertaald naar een `rdfs:Datatype` en een subklasse van xsd:string.

> **ISSUE**
>
> In de tekst staat "Wanneer een Primitief datatype wordt gespecificeerd, dan heeft deze standaard als primitive datatype een CharacterString". Op basis hiervan is de subklasse met xsd:string aangemerkt. De vraag is echter of je deze "standaard" ook kunt veranderen. In het model is echter (nog) niet iets dergelijks opgenomen. Mogelijk zit dit in de generalisatie-relatie? In dat geval zou "standaard" betekenen dat het toevoegen van de xsd:string alleen gebeurt op het moment dat er geen andere subklasserelatie ontstaat.
>
> Voorlopige aanname is dat dit los van elkaar staat.
>
> NB: In MiM 1.0.1 is aangepast dat een Primitief datatype een generalisatie relatie kan hebben met een MiM datatype. Dit is relevant voor dit issue. Zie MiM [3.1.2 Datatype zelf definiëren](https://docs.geostandaarden.nl/mim/mim10/#datatype-zelf-definieren).

```
CONSTRUCT {
  ?datatype a rdfs:Datatype.
  ?datatype rdfs:subClassOf xsd:string.
  ?datatype rdfs:seeAlso ?primitiefdatatype.
}
WHERE {
  ?primitiefdatatype a mim:PrimitiefDatatype.
  ?primitiefdatatype mim:naam ?primitiefdatatypenaam.
  BIND (t:classuri(?primitiefdatatypenaam) as ?datatype)
}
```

### Primitief datatype - standaard datatypen

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

### Gestructureerd datatype

> Specifiek benoemd gestructureerd datatype dat de structuur van een gegeven beschrijft, samengesteld uit minimaal twee elementen.

> **Voorstel:**

Wordt getransformeerd naar een normale klasse met eigenschappen, zoals in het NEN 3610 Linked Data profiel.

### Data element

> Een onderdeel/element van een Gestructureerd datatype die als type een datatype heeft.

### Union

> Gestructureerd datatype, waarmee wordt aangegeven dat er meer dan één mogelijkheid is voor het datatype van een attribuut. Het attribuut zelf krijgt als datatype de union. De union biedt een keuze uit verschillende datatypes, elk afzonderlijk beschreven in een union element.

> **Voorstel:**
Wordt getransformeerd zoals beschreven in https://geonovum.github.io/NEN3610-Linkeddata/#regels-klassen-union.

### Union element

> Een type dat gebruikt kan worden voor het attribuut zoals beschreven in de definitie van Union. Het union element is een onderdeel van een Union, uitgedrukt in een eigenschap (attribute) van een union, die als keuze binnen de Union is gerepresenteerd.

## Packages
> Een package is een benoemde en begrensde verzameling/groepering van modelelementen.

### Domein
> Het eigen IM.

> **UITZOEKEN**
>
> Het domein betreft het eigen IM. Transformatie naar `owl:Ontology` lijkt voor de hand te liggen.

### Extern
> Een groepering van constructies die een externe instantie beheert en beschikbaar stelt aan een informatiemodel en die in het informatiemodel ongewijzigd gebruikt worden.

> **UITZOEKEN**
>
> Het lijkt logisch om een extern package niet te transformeren. De aanname is dat dit al door de externe instantie is gedaan. Mits er voldoende informatie in de UML aanwezig is, kan er een owl:import statement gegenereerd worden.

### View
> Een groepering van objecttypen die gespecificeerd zijn in een extern informatiemodel en vanuit het perspectief van het eigen informatiemodel inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het eigen informatiemodel.

> **UITZOEKEN**
>
> LvdB: ik weet niet precies wat het verschil is tussen `<<Extern>>` en `<<View>>`. Het lijkt in beide gevallen logisch om een extern package niet te transformeren. De aanname is dat dit al door de externe instantie is gedaan. Mits er voldoende informatie in de UML aanwezig is, kan er een owl:import statement gegenereerd worden. Maar voor een `<<View>>` package is dat wellicht overbodig.

## Overig

### Constraint
> Een constraint is een conditie of een beperking, die over een of meerdere modelelementen uit het informatiemodel geldt.

We hebben nog niet gespecificeerd hoe we constraints vertalen. In het NEN3610 Linked Data profiel ook niet. Daar zeggen we over dit onderwerp:

> Een RDF-Ontologie is goed in het uitdrukken van semantiek en semantische relaties maar niet zo goed in het formuleren van constraints op die relaties. De constraints horen ook niet thuis in de open world assumption.

> SHACL voegt de mogelijkheid toe om constraints eenvoudig te formuleren en toe te passen op een ontologie. De afstand tussen UML-XML en een ontologie is daarmee kleiner geworden.

> Een modelleur moet zich wel afvragen of de constraints van belang zijn in de LD toepassing.

Voorstel: alleen vertalen naar documentatie in het MiM model in RDF. Zie bv de [INSPIRE RDF Guidelines](http://inspire-eu-rdf.github.io/inspire-rdf-guidelines/#ref_cr_constraint) waar ze dit ook zo doen. In de toekomst wellicht vertalen naar SHACL.

## Properties

### naam

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

### alias

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

### definitie

> De beschrijving van de betekenis van dit modelelement.

Een `mim:definitie` wordt vertaald naar een `rdfs:comment`

Rationale om niet te kiezen voor `skos:definition`: in de meeste Linked Data vocabulaires is het gebruikelijk om de beschrijving van een klasse op te nemen door middel van een `rdfs:comment`, wat ook de intentie is in het MiM. Het MiM is niet beoogd als een volledig begrippenkader. Het MiM biedt daarnaast de mogelijkheid om expliciet te verwijzen vanuit een modelelement naar een `skos:Concept`. Het ligt dan ook voor de hand om bij dit `skos:Concept` de werkelijke `skos:definition` op te nemen.

> **UITZOEKPUNT**
>
> Ik meende dat het mogelijk was om in het MiM op te geven dat een modelelement *ook* een begrip is. In dat geval zou je dus een andere vertaling kunnen maken, dwz: *wel* naar een `skos:definition`. Dit zou wel beter zijn.

### toelichting

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

### herkomst

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

### herkomstDefinitie

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

### datumOpname

> De datum waarop het modelelement is opgenomen in het informatiemodel.

Een `mim:datumOpname` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

> **UITZOEKEN**
>
> Wellicht is het beter om gebruik te maken van prov om de datum opname in te verwerken?
>
> [MB] Daarmee zou een modelelement een prov:Entity worden. Dit is wel mogelijk, maar minder gebruikelijk. Vaak wordt het gehele model als prov:Entity gezien. Ik heb zelf nog niet gezien dat modelelementen afzonderlijke provenance informatie krijgen. Dit is nog best wel een "dingetje", omdat de meeste Linked Data vocabulaires juist niet zoveel wijzigen, maar voor MiM informatiemodellen zou dat wel eens wat anders kunnen zijn. Als we prov willen gaan gebruiken, vereist dat m.i. nog best wat uitzoekwerk hoe je dit zou moeten toepassen, en ontbreekt op dit moment een (best) practice.

```
CONSTRUCT {
  ?subject mim:datumOpname ?datumopname
}
WHERE {
  ?modelelement mim:datumOpname ?datumopname.
  ?subject rdfs:seeAlso ?modelelement.
}
```

### indicatieMaterieleHistorie

> Indicatie of de materiële historie van het kenmerk van het object te bevragen is.

> **UITZOEKEN**
>
> Hoe gaan we dit doen? Feitelijk moet je deze indicatie omzetten naar daadwerkelijke properties.
>
> Zie voor input het NEN3610 Linked Data Profiel [7.3.4.2.4 Attribuut met stereotype «materieleHistorie»](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-materieleHistorie).

### indicatieFormeleHistorie

> Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is.

> **UITZOEKEN**
>
> Hoe gaan we dit doen? Feitelijk moet je deze indicatie omzetten naar daadwerkelijke properties. Meestal doen we daarbij formele historie als onderdeel van de volledige klasse, maar niet de afzonderlijke elementen.
>
> Zie voor input het NEN3610 Linked Data Profiel [7.3.4.2.5 Attribuut met stereotype «formeleHistorie»](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-formeleHistorie).

### kardinaliteit

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

### authentiek
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

### indicatieAfleidbaar
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

### mogelijkGeenWaarde
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

### locatie
> Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de locatie waar deze te vinden is opgegeven.

Een `mim:locatie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

> **ISSUE**
>
> `mim:locatie` wordt zowel gebruikt op het niveau van het datatype, maar ook bij een attribuutsoort. Het lijkt meer voor de hand te liggen om dit allen bij het datatype toe te staan. De vertaling wordt dan ook bij het datatype zelf opgenomen, en zou vertaald kunnen worden naar `rdfs:isDefinedBy`, `wdrs:describeby` of iets dergelijks.

### type
> Het datatype waarmee waarden van deze attribuutsoort worden vastgelegd.

Een `mim:datatype` wordt vertaald naar een `sh:datatype`.

> **ISSUE**
>
> Bepaalde attribuutsoorten kennen wel een `mim:datatype`, maar zullen vertaald worden naar een resource. De vertaling naar een `sh:datatype` is dan niet correct. Feitelijk is het datatype in de Linked Data situatie dan niet meer relevant.
>
> Voorlopig wordt het veld in alle gevallen overgenomen. Beter is om in de gevallen dat geen sprake is van een literal om het veld ook niet mee te nemen (of te laten als `mim:datatype`).

```
CONSTRUCT {
  ?subject sh:datatype ?type
}
WHERE {
  ?modelelement mim:type ?type.
  ?subject rdfs:seeAlso ?modelelement.
}
```

### lengte
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

### patroon
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

### formeelPatroon
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

### uniekeAanduiding
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

### populatie
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

### kwaliteit
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

### indicatieAbstractObject
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

### identificerend
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

### gegevensgroeptype-eigenschap

> De verwijzing naar het bijbehorende gegevensgroeptype.

Een `mim:gegevensgroeptype` wordt vertaald naar een `sh:node` met als waarde de URI van de NodeShape die het bijbehorende gegevensgroeptype representeert. Zie [Gegevensgroep](#gegevensgroep) en [Gegevensgroeptype](#gegevensgroeptype) voor meer uitleg.

```
CONSTRUCT {
  ?subject sh:node ?object
}
WHERE {
  ?modelelement mim:gegevensgroeptype ?gegevensgroeptype.
  ?subject rdfs:seeAlso ?modelelement.
  ?object rdfs:seeAlso ?gegevensgroeptype.
}
```

### unidirectioneel
> **ISSUE**
>
> LvdB: ik begrijp niet goed wat de betekenis is van het aspect 'unidirectioneel' in MiM. Het lijkt te gaan over de richting van de relatie.

Bij `<<relatiesoort>>`:

> Het gerelateerde objecttype (de target) waarvan het objecttype, die de eigenaar is van deze relatie (de source), kennis heeft. Alle relaties zijn altijd gericht van het objecttype (source) naar het gerelateerde objecttype (target).

Bij `<<Externe koppeling>>`:
> Het gerelateerde objecttype uit een extern informatiemodel (de target) waarvan het objecttype die de eigenaar van deze relatie is (de source) kennis heeft. Het aggregation type van de source is altijd ‘composition’. Alle relaties zijn altijd gericht van het objecttype (source) naar het gerelateerde objecttype (target).

### objecttype
Bij `<<Relatiesoort>>` en `<<Externe koppeling>>`:
> Het objecttype waarvan de relatie een eigenschap is.

Een `mim:objecttype` wordt vertaald als onderdeel van de vertaling van [Relatiesoort](#relatiesoort) of [Externe koppeling](#externe-koppeling).

### gerelateerdObjecttype
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

### datatype
> Het datatype dat een specialisatie is van een (ander) datatype.

Een `mim:datatype` is in UML het source datatype van een generalisatie tussen datatypen. Net als bij een generalisatie tussen objecttypen wordt dit vertaald naar een `rdfs:subclassOf` waarbij `mim:datatype` wordt vertaald naar de subject class waarbij de generalisatie wordt gedefinieerd.

Zie ook [Generalisatie](#generalisatie).

### gerelateerdDatatype
> Het datatype dat de generalisatie is van een (ander) datatype.

Een `mim:gerelateerdDatatype` is in UML het target datatype van een generalisatie tussen datatypen. Net als bij een generalisatie tussen objecttypen wordt dit vertaald naar een `rdfs:subclassOf` waarbij `mim:gerelateerdDatatype` wordt vertaald naar de object class van de `rdfs:subclassOf`.

Zie ook [Generalisatie](#generalisatie).

### typeAggregatie
> Standaard betreft het geen aggregatie (None). Het type aggregatie mag ‘composite’ zijn. Dit wordt gedaan als er een afhankelijkheid is in die zin dat de target niet kan bestaan zonder de source: de target vervalt als de source vervalt.

Aggregatie- en compositie-associaties worden gemodelleerd zoals simpele relatiesoorten, gebruikmakend van de specifieke naam die de associatie in het oorspronkelijke model heeft. Een `mim:typeAggregatie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

### code
> De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code (niet te verwarren met alias, zoals bedoeld in 2.6.1).

> ** ISSUE
>
> We hebben nog niet gespecificeerd hoe we enumeraties vertalen. In NEN3610-LD is standaardtransformatie een transformatie naar een klasse gelijknamig aan de enumeratieklasse, en instanties van deze klasse voor elk van de geënumereerde waardes. Als we dit volgen zouden we de `mim:code` kunnen vertalen naar een `rdfs:label` of `skos:altLabel`.

### specificatieTekst
> De specificatie van de constraint in normale tekst.

> ** ISSUE
>
> We hebben nog niet gespecificeerd hoe we constraints vertalen. Voorstel: alleen vertalen naar documentatie in het MiM model in RDF. In de toekomst wellicht vertalen naar SHACL.

Een `mim:specificatieTekst` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

### specificatieFormeel
> De beschrijving van de constraint in een formele specificatietaal, in OCL.

> ** ISSUE
>
> We hebben nog niet gespecificeerd hoe we constraints vertalen. Voorstel: alleen vertalen naar documentatie in het MiM model in RDF. In de toekomst wellicht vertalen naar SHACL.

Een `mim:specificatieFormeel` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.
