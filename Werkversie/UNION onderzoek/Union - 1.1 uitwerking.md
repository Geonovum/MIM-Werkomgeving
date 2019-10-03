#### Was:

#### Union

>   **Definitie Union**

>   Gestructureerd datatype, waarmee wordt aangegeven dat er meer dan één
>   mogelijkheid is voor het datatype van een attribuut. Het attribuut zelf
>   krijgt als datatype de union. De union biedt een keuze uit verschillende
>   datatypes, elk afzonderlijk beschreven in een union element.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Union LineOrPolygon. Deze biedt een keuze uit Union element Line of Union element Polygon.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Union element

>   **Definitie Union element**

>   Een type dat gebruikt kan worden voor het attribuut zoals beschreven in de
>   definitie van Union. Het union element is een onderdeel van een Union,
>   uitgedrukt in een eigenschap (attribute) van een union, die als keuze binnen
>   de Union is gerepresenteerd..

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Union element Line en union element Polygon zijn beiden onderdeel van Union LineOrPolygon.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### WORDT

#### Keuze

>   **Definitie Keuze**

Gestructureerd data type voor groepering van keuze opties. Elke element
representeert een keuze optie. Een keuze kent drie verschillende keuzetypen: een
keuze uit verschillende attribuutsoorten, keuze uit verschillende datatypes en
een keuze uit verschillende relatiedoelen.

#### Attribuutkeuze

>   **Definitie Attribuutkeuze**

>   Het attribuut dat een Keuze met attribuutsoorten als keuze elementen bindt
>   aan een objecttype.

#### Datatypekeuze

>   **Definitie Datatypekeuze**

>   Het element dat in een Keuze gebruikt wordt om een datatype als keuze optie
>   aan te geven. Het element is een onderdeel van een klasse met het stereotype
>   Keuze, uitgedrukt in een attribute van die klasse.

#### Doelkeuze

>   **Definitie Doelkeuze**

>   Het element dat in een Keuze gebruikt wordt om een relatiedoel als keuze
>   optie aan te geven. Het element is een onderdeel van een klasse met het
>   stereotype Keuze, uitgedrukt in een attribute van die klasse.

Toelichting op het gebruik van Keuze:

Het stereotype \<\<Keuze\>\> wordt gebruikt voor het modelleren van keuze opties
op het niveau van attributen, datatypen en relaties van een objectype. Deze
keuze opties kunnen ook met constraints gemodelleerd worden. Het gebruik van het
stereotype \<\<Keuze\>\> als alternatief voor constraints maakt de keuze optie
leesbaarder in het model en specifieke keuzes worden herbruikbaar in het model.
Tevens kunnen er gestandaardiseerde encodingregels voor het stereotype opgesteld
en toegepast worden.

Het stereotype \<\<Keuze\>\> kent drie keuzetypen. Elk keuzetype betekent
conceptueel iets anders.

1.  keuze tusen attribuutsoorten.

2.  keuze tussen datatypen die bij één attribuut horen.

3.  keuze tussen relatietargets die bij één relatie horen.

De drie keuzetypen worden gespecificeerd door verschillende combinaties van
stereotypen. Encodingregels moeten hier rekening mee houden.

**1) Keuze tussen attribuutsoorten.**

Voorbeeld:

Een objecttype Persoon heeft een attribuut telefoonnummer. Het telefoonnummer is
het privenummer of werknummer. Dit wordt gerealiseerd met de volgende
modelconstructie.

![](media/f7bcaa7a45cec0d52f850795ff5a1332.png)

Attribuutkeuze geeft aan dat telefoonnummer een keuze realiseert tussen
verschillende attribuutsoorten. In de Keuze zijn als keuze elementen de
attribuutsoorten opgenomen.

Conceptueel zijn de attributen telefoonnummer, privenummer en werknummer van
belang.

**2) Keuze tussen datatypen die bij één attribuutsoort horen**

Voorbeeld:

Een objecttype Gebouw heeft een attribuut geometrie. Geometrie kan als datatype
een punt (GM_Point) of een vlak (GM_Surface) zijn. Dit wordt gerealiseerd met de
volgende modelconstructie.

![](media/15b86f157d2b0e54358036f694552921.png)

Het attribuut geometrie heeft in dit geval als datatype de \<\<Keuze\>\>
PuntOfVlak met twee attributen puntgeometrie.GM_Point en
vlakgeometrie.GM_Surface met stereotype Datatypekeuze.

In het conceptuele model hebben PuntOfVlak en de beide attribuutnamen geen
betekenis en zijn alleen opgenomen om de datatype GM_Surface en GM_Point te
koppelen aan het attribuut geometrie. In een technische realisatie moeten ze
daarom niet geimplementeerd worden.

**3) Keuze tussen relatietargets die bij één relatie horen.**

Voorbeeld:

Een objecttype JuridischDocument heeft een relatie ‘betreft rechtspersoon’ naar
of een objecttype NatuurlijkPersoon of een objecttype NietNatuurlijkPersoon. Dit
wordt gerealiseerd met de volgende modelconstructie.

![](media/b13d107b2ba921dd181c2afa7ec1d1d0.png)

De relatie ‘betreft rechtspersoon’ heeft als doel-element een Keuze met de
attributen natuurlijkPersoon en nietNatuurlijkPersoon met stereotype Doelkeuze.

In het conceptuele model hebben de doelkeuze attributen natuurlijkPersoon en
nietNatuurlijkPersoon geen betekenis. In een technische realisatie moeten ze
daarom niet geimplementeerd worden.
