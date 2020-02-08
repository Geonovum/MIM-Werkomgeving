# Use cases voor Keuze

Een *Keuze* is een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.

*Toelichting:* De keuze is een alternatieve manier voor het modelleren van een constraint.

Een *Keuze* kan op meerdere plekken gebruikt worden, en maakt het mogelijk waar in het metamodel normaal gesproken maar één mogelijkheid bestaat, een opsomming te geven van meerdere mogelijkheden, waarbij in een concreet model altijd precies één van deze mogelijkheden wordt gebruikt.

Dit document beschrijft vijf use cases waarin het modelleren met een *Keuze* van toegevoegde waarde is. Zonder een dergelijke modelconstructie zou het nodig moeten zijn om met een expliciete constraint de keuze aan te geven.

## Use case 1: een keuze tussen twee datatypen

Van een objecttype "Persoon" is relevant op welk adres deze persoon woont. Er is sprake van één attribuutsoort "adres". Het adres kan vervolgens een tekstveld zijn (bijvoorbeeld: "Krankeledenstraat 34 te Amersfoort"), maar ook meer gestructureerd zijn opgenomen, waarbij de elementen straatnaam, huisnummer en woonplaats afzonderlijk zijn opgenomen. Er is sprake van een keuze tussen het primitieve datatype "CharacterString" en het gestructureerde datatype "Adrestype" met de data-elementen "straatnaam", "huisnummer" en "woonplaats".

Onderstaand figuur geeft in zowel UML als Linked Data weer hoe beide modellen er uit zouden zien voor beide afzonderlijke situaties.

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
