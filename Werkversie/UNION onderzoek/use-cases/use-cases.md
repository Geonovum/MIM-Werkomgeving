# Use cases voor Keuze

Een *Keuze* is een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.

*Toelichting:* De keuze is een alternatieve manier voor het modelleren van een constraint.

Een *Keuze* kan op meerdere plekken gebruikt worden, en maakt het mogelijk waar in het metamodel normaal gesproken maar één mogelijkheid bestaat, een opsomming te geven van meerdere mogelijkheden, waarbij in een concreet geval altijd precies één van deze mogelijkheden wordt gebruikt.

Een belangrijk voordeel van deze modellering is dat de kardinaliteiten zuiver gehouden kunnen worden. Anders gezegd, er kan mee voorkomen worden dat een kardinaliteit van bijvoorbeeld twee kenmerk eerst optioneel gemaakt moet worden en dat hierna via een constraint deze toch weer verplicht gemaakt moeten worden, voor precies één van de mogelijkheden. Het is aan de modelleur om te kiezen voor een constraint of een Keuze.

Dit document beschrijft zes use cases waarin het modelleren met een *Keuze* van toegevoegde waarde is. Zonder een dergelijke modelconstructie zou het nodig moeten zijn om met een expliciete constraint de keuze aan te geven.

De  use cases 1 tot en met 4 hebben betrekking op meerdere kenmerken, waartussen een keuze gemaakt moet worden omdat er van precies 1 sprake is. Dit wordt in MIM een keuze tussen twee (of meer) modelelementen. Dit heet in de verzamelingenleer een XOR constraint.

## Use case 1: een keuze tussen twee datatypen

Van een objecttype "Persoon" is relevant op welk adres deze persoon woont. Er is sprake van één attribuutsoort "adres". Het adres kan vervolgens een tekstveld zijn (bijvoorbeeld: "Krankeledenstraat 34 te Amersfoort"), maar ook meer gestructureerd zijn opgenomen, waarbij de elementen straatnaam, huisnummer en woonplaats afzonderlijk zijn opgenomen. Er is sprake van een keuze tussen het primitieve datatype "CharacterString" en het gestructureerde datatype "Adrestype" met de data-elementen "straatnaam", "huisnummer" en "woonplaats" 

Opmerking: andere modelleringen van een adres zijn ook mogelijk, een adres zou ook een gegevensgroep kunnen zijn en een Adrestype een Gegevensgroeptype, en een adres zou ook als een Objecttype gemodelleerd kunnen worden. In dit voorbeeld is het adres gemodelleerd als een attribuutsoort en het Adrestype als een datatype. 

Onderstaand figuur geeft in zowel UML als Linked Data weer hoe beide modellen er uit zouden zien voor beide afzonderlijke situaties, wanneer er nog geen keuze is gemodelleerd. 

<table><tbody>
<tr><th>UML</th><th>Linked Data</th></tr>
<tr><td><img src="use-case-1-keuze-A.png"/></td><td>
<pre class='ex-turtle'>
vb:Persoon a mim:Objecttype;
  mim:naam "Persoon";
  mim:attribuut [
    a mim:Attribuutsoort;
    mim:naam "adres";
    mim:type mim:CharacterString
  ];
.
</pre></td></tr>
<tr><td><img src="use-case-1-keuze-B.png"/></td><td>
<pre class='ex-turtle'>
vb:Persoon a mim:Objecttype;
  mim:naam "Persoon";
  mim:attribuut [
    a mim:Attribuutsoort;
    mim:naam "adres";
    mim:type vb:Adrestype
  ]
.
vb:Adrestype a mim:GestructureerdDatatype;
  mim:naam "Adrestype";
  mim:dataElement [
    a mim:DataElement;
    mim:naam "huisnummer";
    mim:type mim:CharacterString;
  ];
  mim:dataElement [
    a mim:DataElement;
    mim:naam "straatnaam";
    mim:type mim:CharacterString;
  ];
  mim:dataElement [
    a mim:DataElement;
    mim:naam "woonplaats";
    mim:type mim:CharacterString;
  ]
.
</pre></td></tr>
</tbody></table>

Zonder de mogelijkheid van keuze, zou je te maken krijgen met twee attribuutsoorten met bijbehorend datatype. Echter, in dat geval mogen de attribuutsoorten niet dezelfde naam hebben, aangezien deze bij hetzelfde objecttype horen. Ook zou de kardinaliteit niet kloppen: die zou dan [0..1] moeten worden, maar dat doet geen recht aan het feit dat er één verplicht aanwezig moet zijn, en er ook geen twee naast elkaar mogen zijn. De werkelijke kardinaliteit is [1..1].

In MIM modelleren we daarom het adres daarom als een attribuutsoort, met als datatype een keuze tussen het datatype CharacterString en het datatype Adrestype. 

TODO: het wel goede voorbeeld graag opnemen als figuur. 

## Use case 2: een keuze tussen twee attribuutsoorten

Bij een objecttype "Betalingsopdracht" moet, naast het bedrag, ook een betalingskenmerk worden opgenomen OF een omschrijving. Eén van beide attribuutsoorten moet worden ingevuld. Het is niet toegestaan dat beide velden worden ingevuld: alleen een betalingskenmerk, of alleen een omschrijving.

Onderstaand figuur geeft in zowel UML als Linked Data weer hoe beide modellen er uit zouden zien voor beide afzonderlijke situaties.

<table><tbody>
<tr><th>UML</th><th>Linked Data</th></tr>
<tr><td><img src="use-case-2-keuze-A.png"/></td><td>
<pre class='ex-turtle'>
vb:Betalingsopdracht a mim:Objecttype;
  mim:naam "Betalingsopdracht";
  mim:attribuut [
    a mim:Attribuutsoort;
    mim:naam "bedrag";
    mim:type mim:Decimal;
    mim:kardinaliteit "1";
  ];
  mim:attribuut [
    a mim:Attribuutsoort;
    mim:naam "betalingskenmerk";
    mim:type mim:CharacterString;
    mim:kardinaliteit "1";
  ]
.
</pre></td></tr>
<tr><td><img src="use-case-2-keuze-B.png"/></td><td>
<pre class='ex-turtle'>
vb:Betalingsopdracht a mim:Objecttype;
  mim:naam "Betalingsopdracht";
  mim:attribuut [
    a mim:Attribuutsoort;
    mim:naam "bedrag";
    mim:type mim:Decimal;
    mim:kardinaliteit "1";
  ];
  mim:attribuut [
    a mim:Attribuutsoort;
    mim:naam "omschrijving";
    mim:type mim:CharacterString;
    mim:kardinaliteit "1";
  ]
.
</pre></td></tr>
</tbody></table>

Zonder de mogelijkheid van keuze zouden beide attribuutsoorten opgenomen zijn bij het objecttype. Dit is in deze use-case geen probleem. Wel is de kardinaliteit ook in dit geval dan niet correct: die zou dan [0..1] moeten worden, maar dat doet geen recht aan het feit dat er één verplicht aanwezig moet zijn, en er ook geen twee naast elkaar mogen zijn. De werkelijke kardinaliteit is [1..1] op de keuze zelf.

## Use case 3: een keuze tussen twee relatiesoorten

Een objecttype "Persoon" kan getrouwd zijn met een ander persoon, of een geregistreerd partnerschap hebben met een ander persoon. Het is niet mogelijk dat een persoon beide relaties heeft. Er is sprake van een keuze tussen OF getrouwd zijn, OF geregistreerd partnerschap.

Onderstaand figuur geeft in zowel UML als Linked Data weer hoe beide modellen er uit zouden zien voor beide afzonderlijke situaties.

<table><tbody>
<tr><th>UML</th><th>Linked Data</th></tr>
<tr><td><img src="use-case-3-keuze-A.png"/></td><td>
<pre class='ex-turtle'>
vb:Persoon a mim:Objecttype;
  mim:naam "Persoon";
.
vb:echtgenootVan a mim:Relatiesoort;
  mim:naam "echtgenoot van";
  mim:doel vb:Persoon;
  mim:bron vb:Persoon;
  mim:kardinaliteit "0..1";
.
</pre></td></tr>
<tr><td><img src="use-case-3-keuze-B.png"/></td><td>
<pre class='ex-turtle'>
vb:Persoon a mim:Objecttype;
  mim:naam "Persoon";
.
vb:geregistreerdPartnerVan a mim:Relatiesoort;
  mim:naam "geregistreerd partner van";
  mim:doel vb:Persoon;
  mim:bron vb:Persoon;
  mim:kardinaliteit "0..1";
.
</pre></td></tr>
</tbody></table>

Zonder de mogelijkheid van keuze zouden beide relatiesoorten opgenomen zijn bij het objecttype. Hiermee zou niet zichtbaar zijn dat er slechts één van de twee relatiesoorten aanwezig mogen zijn.

Merk op: use case 2 en 3 zijn eigenlijk vergelijkbaar, bij use case 2 gaat het om attribuutsoorten, bij use case 3 gaat het om relatiesoorten, maar vanuit het perspectief van keuze gaat het in beide gevallen om een keuze tussen twee elementen die verbonden zijn met een objecttype.

## Use case 4: Een keuze tussen twee relatiedoelen

Een objecttype "Vervoersmiddel" heeft een eigenaar. Dit kan een persoon zijn, of een bedrijf, maar niet beiden. Er is sprake van één relatiesoort ("eigenaar") en een keuze tussen twee relatiedoelen, de objecttypen "persoon" en "bedrijf".

Onderstaand figuur geeft in zowel UML als Linked Data weer hoe beide modellen er uit zouden zien voor beide afzonderlijke situaties.

<table><tbody>
<tr><th>UML</th><th>Linked Data</th></tr>
<tr><td><img src="use-case-4-keuze-A.png"/></td><td>
<pre class='ex-turtle'>
vb:Vervoersmiddel a mim:Objecttype;
  mim:naam "Vervoersmiddel";
.
vb:Persoon a mim:Objecttype;
  mim:naam "Persoon";
.
vb:eigenaar a mim:Relatiesoort;
  mim:naam "eigenaar";
  mim:doel vb:Vervoersmiddel;
  mim:bron vb:Persoon;
  mim:kardinaliteit "1";
.
</pre></td></tr>
<tr><td><img src="use-case-4-keuze-B.png"/></td><td>
<pre class='ex-turtle'>
vb:Vervoersmiddel a mim:Objecttype;
  mim:naam "Vervoersmiddel";
.
vb:Persoon a mim:Objecttype;
  mim:naam "Bedrijf";
.
vb:eigenaar a mim:Relatiesoort;
  mim:naam "eigenaar";
  mim:doel vb:Vervoersmiddel;
  mim:bron vb:Bedrijf;
  mim:kardinaliteit "1";
.
</pre></td></tr>
</tbody></table>

Zonder de mogelijkheid van keuze, zou je te maken krijgen met twee relatiesoorten met bijbehorend objecttype. Een alternatief zou zijn om gebruik te maken van een relatieklasse (een specialisatie van relatiesoort), waarbij dan toegestaan zou moeten worden dat een relatieklasse meer dan één relatiedoel mag hebben (eigenlijk een soort van tertiare relatie). Dit wordt echter niet ondersteund vanuit het MIM. Bij twee relatiesoorten zouden deze niet dezelfde naam mogen hebben, aangezien deze hetzelfde objecttype als bron hebben. Ook zou de kardinaliteit niet kloppen: die zou dan [0..1] moeten worden, maar dat doet geen recht aan het feit dat er één verplicht aanwezig moet zijn, en er ook geen twee naast elkaar mogen zijn. De werkelijke kardinaliteit is [1..1].

Merk op: use case 1 en 4 zijn eigenlijk vergelijkbaar, bij use case 1 gaat het om datatypen, bij use case 4 gaat het om objecttypen, maar vanuit het perspectief van keuze gaat het in beide gevallen om een keuze tussen twee elementen die verbonden zijn met een objecttype.

## Use case 5: Een keuze tussen twee verschijningsvormen van een attribuutsoort

Van een objecttype "Persoon" kan geregistreerd worden wat het telefoonnummer van deze persoon is. Minimaal dient er één telefoonnummer geregistreerd te worden, maar het mogen er ook meerdere zijn. Een dergelijk telefoonnummer kan een privé telefoonnummer zijn, of een zakelijk telefoonnummer.

Deze use case lijkt sterk op use case 2 (waarbij ook sprake was van een keuze tussen attribuutsoorten). Het verschil is dat bij deze use case vanuit een conceptueel perspectief sprake is van een meer algemeen attribuutsoort "telefoonnummer", die verschillende verschijningsvormen kent.

## Use case 6: Een keuze tussen twee verschijningsvormen van een relatiesoort

Een objecttype "Persoon" kan gerelateerd zijn aan een objecttype "Locatie". Een dergelijk adres-relatie kan betrekking hebben op het (formele) woonadres, correspondentieadres of verblijfsadres.

Deze use case lijkt sterk op use case 3 (waarbij ook sprake was van een keuze tussen relatiesoorten). Het verschil is dat bij deze use case vanuit een conceptueel perspectief sprake is van een meer algemene relatiesoort "adres", die verschillende verschijningsvormen kent. Daarnaast lijken use case 5 en 6 op elkaar: het betreft vergelijkbare constructies met als verschil de keuze tussen attribuutsoort dan wel relatiesoort.

(Merk op: er is geen noodzaak voor een keuze tussen datatypen of relatiedoelen op deze wijze, aangezien een datatype-keuze of objecttype-keuze al mogelijk is via een specialisatie van een datatype dan wel objecttype).

**Opmerking MB**: ik vraag me dan ook af of use cases 5 en 6 wel horen bij "Keuze". Ik zou deze eerder plaatsen bij generalisatie/specialisatie, zoals bij datatype en objecttype.
