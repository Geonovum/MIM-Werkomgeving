# Transformeren van een MIM model naar een RDFS/OWL/SHACL/SKOS model

## Inleiding

Het MiM is een *metamodel*. Dit betekent dat in termen van het MiM een concreet informatiemodel kan worden uitgewerkt, bijvoorbeeld het informatiemodel Basisregistratie Adressen en Gebouwen. Het MiM is niet bedoeld om vervolgens in termen van dit informatiemodel een concrete dataset te vormen. Hiervoor is een transformatie nodig naar een (technisch) uitwisselings- of opslagmodel nodig.

Op diezelfde manier levert het toepassen van het MiM in RDF geen ontologie of vocabulaire waarin RDF kan worden uitgedrukt: slechts het informatiemodel zelf is op deze manier in RDF uitgedrukt. Voor de vertaalslag naar een ontologie is een afzonderlijke transformatie nodig.

Zo leidt een MiM objecttype "Schip" tot de volgende weergave in RDF:

```
@prefix vb: <http://bp4mc2.org/voorbeeld/>.
@prefix mim: <http://bp4mc2.org/def/mim#>.

vb:Schip a mim:Objecttype;
  rdfs:label "Schip"@nl;
.
```

`vb:Schip` is in dit voorbeeld een voorkomen van de klasse `mim:Objecttype`. dit voorkomen kent zelf geen voorkomens. Hiervoor is een vertaling nodig naar (minimaal) een `rdfs:Class`, bijvoorbeeld door:

```
@prefix vbo: <http://bp4mc2.org/voorbeeld/def#>.

vbo:Schip a rdfs:Class;
  rdfs:seeAlso vb:Schip;
.
vb:Pakjesboot12 a vbo:Schip.
```

Dit document beschrijft hoe deze vertaling van het MiM model in RDF naar een RDFS-gebaseerde ontologie plaatsvindt. Daarbij zal niet alleen gebruik worden gemaakt van RDFS, maar ook van de OWL, SHACL en SKOS vocabulaires. De vertaling wordt zo veel mogelijk als SPARQL rules beschreven, zodat een machinale vertaling mogelijk is. De vertaling is beoogd als omkeerbaar. Zo worden ook SPARL rules beschreven die juist vanuit een RDFS-gebaseerde ontologie de vertaling gemaakt kan worden naar een MiM model in RDF.

## Gebruikte functies

In de SPARQL rules wordt gebruik gemaakt van een aantal SPARQL functies. In onderstaande tabel staan deze opgesomd met de specificatie van de werking.

|Functie|Specificatie|
|-------|------------|
|-------|------------|
|t:CamelCase|Codeert een tekstveld naar een URI-vorm op basis van (upper) CamelCase regels|
|t:camelCase|Codeert een tekstveld naar een URI-vorm op basis van (lower) camelCase regels|
|t:kebabcase|Codeert een tekstveld naar een URI-vorm op basis van kebabcase regels (een `-` voor spaties)|
|t:classuri|Formuleert de uri voor een klasse op basis van de naam van een MiM resource. De class URI is opgebouwd als `{namespace}#{t:CamelCase(naam)}`. De `{namespace}` is een vooraf vastgestelde waarde die gelijk is aan de te maken ontologie.|
|t:nodeshapeuri|Formuleert de uri voor een nodeshape op basis van de naam van een MiM resource. De nodeshape URI is opgebouwd als `{shape-namespace}#{t:CamelCase(term)}`. De `{shape-namespace}` is een vooraf vastgestelde waarde die gelijk is aan de te maken shapesgraph|
|t:propertyuri|Formuleert de uri voor een property op basis van de naam van een MiM resource. De property URI is opgebouwd als `{namespace}#{t:camelCase(naam)}`. Zie ook `t:classuri`.|
|t:propertyshapeuri|Formuleert de uri voor een propertyshape op basis van de naam van een MiM resource en de naam van de MIM resource die hiervan de "bezitter" is. De propertyshape URI is opgebouwd als `{namespace}#{t:CamelCase(bezittersnaam)}-{t:camelCase(naam)}`. Zie ook `t:nodeshapeuri`.|

## Klassen

Omdat het getransformeerde model daadwerkelijk een nieuw model is, zullen de elementen in het getransformeerde model ook eigen URI's krijgen. Om de relatie tussen het originele MiM-model het het getransformeerde model op basis van RDFS te behouden, wordt hiervoor de eigenschap `rdfs:seeAlso` gebruikt.

> **ISSUE 1**
>
> Gebruik van `rdfs:seeAlso` is niet erg sterk. Een dergelijke eigenschap kan voor heel veel dingen gebruikt worden. Gekeken moet worden of er niet een betere property beschikbaar is voor dergelijke vocabulaires, of dat we een eigen property moeten introduceren binnen de mim vocabulaire, bv: `mim:equivalent`

### mim:Objecttype

> De typering van een groep objecten (in de werkelijkheid) die binnen een domein relevant zijn en als gelijksoortig worden beschouwd.

Een `mim:Objecttype` wordt vertaald naar een `owl:Class` in combinatie met een `sh:NodeShape`.

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

Een `mim:Attribuutsoort` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:DatatypeProperty`.

In OWL is een property anders dan in het MiM een *first class citizen*. Dit betekent dat als in twee objecttypen gebruik wordt gemaakt van een attribuutsoort die dezelfde naam heeft, dit leidt tot twee verschillende attribuutsoorten. In OWL zou dit echter leiden tot maar één attribuutsoort, tenzij daadwerkelijk sprake is van verschil in betekenis.

> **ISSUE 2**
>
> Het is niet mogelijk om automatisch vast te stellen wanneer sprake is van één property of wanneer sprake is van meerdere properties. Veilig is om een property te maken per objecttype. Maar dit leidt niet tot een goed OWL model. Beter is om een property te maken op basis van de naam van de attribuutsoort, maar dan krijg je problemen als twee namen hetzelfde zijn (!).
>
> Mogelijke oplossing: toevoegen van een kenmerk bij een attribuutsoort waarin je de scope van de attribuutsoort kunt opgeven: algemeen of klasse-specifiek. In het geval van een klasse-specifiek atribuutsoort, dan wordt in OWL de naam afgeleid van zowel de attribuutsoort als het objecttype (of gegevensgroeptype). Of er zou een extra kenmerk bij kunnen met daar de "globale naam" van het attribuutsoort. Dat is mogelijk wat makkelijker. Vervolgens zou de globale naam uniek moeten zijn voor het gehele model, waarbij standaard de globale naam gelijk is aan de naam van de attribuutsoort (en anders moet je een foutmelding krijgen)
>
> Voorlopige aanname: alle namen van attribuutsoorten zijn uniek.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de attribuutsoort "bezit" en de naam van de attribuutsoort. De URI van de datatypeproperty wordt afgeleid van de naam van de attribuutsoort.

```
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?datatypeproperty.
  ?datatypeproperty a owl:DatatypeProperty.
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

## Properties

### mim:naam

> De naam van een modelelement

Een `mim:naam` wordt vertaald naar een `rdfs:label`

> **ISSUE 3**
>
> In UML wil het nog wel eens gebruikelijk zijn om voor de naam van een modelelement een technische vorm te kiezen. Bijvoorbeeld "KadastraalObject" in plaats van "Kadastraal object". In Linked Data is het gebruikelijk dat het rdfs:label een voor mensen leesbaar label is, dus *met* spaties. De shacl `sh:name` property leent zich wat meer voor een technische naam. Het is echter niet duidelijk in het MiM wat wordt bedoeld.
>
> Mogelijke oplossing: een "naamgevingsconventie" toevoegen aan het totale MiM model, waaruit blijkt of sprake is van technische namen of van namen die voldoen aan de gebruikelijke spellingsregels.
>
> Voorlopige aanname: de naam voldoet aan de gebruikelijke spellingsregels.

> **ISSUE 4**
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

### mim:alias

> De alternatieve weergave van de naam.

Een `mim:alias` wordt vertaald naar een `skos:altLabel`

> **ISSUE 5**
>
> Aangezien in UML er niet direct een mogelijkheid is om taal te ondersteunen, wordt het alias nog wel eens gebruikt om een andere taal aan te duiden. Ook wordt het alias wel eens gebruikt om het onderscheid te maken tussen een meer technische naam (bv in CamelCase) en een functionele naam (met spaties enzo). Indien dit het geval is, dan klopt de vertaling naar `skos:altLabel` niet.
>
> Mogelijke oplossing: zie de oplossing bij issue 4
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

### mim:definitie

> De beschrijving van de betekenis van dit modelelement.

Een `mim:definitie` wordt vertaald naar een `skos:comment`

> Rationale om niet te kiezen voor `skos:definition`: in de meeste Linked Data vocabulaires is het gebruikelijk om de beschrijving van een klasse op te nemen door middel van een `rdfs:comment`, wat ook de intentie is in het MiM. Het MiM is niet beoogd als een volledig begrippenkader. Het MiM biedt daarnaast de mogelijkheid om expliciet te verwijzen vanuit een modelelement naar een `skos:Concept`. Het ligt dan ook voor de hand om bij dit `skos:Concept` de werkelijke `skos:definition` op te nemen.

> **UITZOEKPUNT**
>
> Ik meende dat het mogelijk was om in het MiM op te geven dat een modelelement *ook* een begrip is. In dat geval zou je dus een andere vertaling kunnen maken, dwz: *wel* naar een `skos:definition`. Dit zou wel beter zijn.

### mim:toelichting

> Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding.

Een `mim:toelichting` wordt niet vertaald en blijft in het vertaalde model als zodanig aanwezig.

*Aanbevolen wordt om geen gebruik te maken van mim:toelichting, maar gebruik te maken van de verwijzing naar expliciet gedefinieerde begrippen, waarbij de toelichting bij het begrip zelf wordt opgenomen*

```
CONSTRUCT {
  ?subject mim:toelichting ?toelichting
}
WHERE {
  ?modelelement mim:toelichting ?toelichting.
  ?subject rdfs:seeAlso ?modelelement.
}
```
