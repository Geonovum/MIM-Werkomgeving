# Handleiding Extensie maken op MIM-toolbox

De handleiding is geschreven voor EA versie 15.2

Deze handleiding neemt het maken van een **DiSGeo-extensie op MIM** als voorbeeld. Voor het **informatiemodel DiSGeo** zijn voor de MIM-stereotypen `«Objecttype»` en `«Attribuutsoort»` meta-informatie nodig in de vorm van extra tagged values. Voor [Objecttype](https://geonovum.github.io/disgeo-imsor/modelleerprincipes/#specificatie-voor-objecttype) gaat dat om het toevoegen van `Actualiteit` en `Inwinning verplicht`, voor [Attribuutsoort](https://geonovum.github.io/disgeo-imsor/modelleerprincipes/#specificatie-voor-attribuutsoort) zijn dat: `Inwinningsregels` en `Positionele juistheid`.

## Inhoud

 1. [Importeer de MIM-toolbox in de EA-omgeving](#stap-1-importeer-de-mim-toolbox-in-de-ea-omgeving)
 1. [Maak de package-structuur aan voor de extensie](#stap-2-maak-de-package-structuur-aan-voor-de-extensie)
 1. [Modelleer de toolbox-extensie](#stap-3-modelleer-de-toolbox-extensie)
 1. [Modelleer het toolbox-menu](#stap-4-modelleer-het-toolbox-menu)
 1. [Modelleer het diagram](#stap-5-modelleer-het-diagram)
 1. [Genereer MDG Technology](#stap-6-genereer-mdg-technology)
 1. [Werken met de toolbox](#stap-7-werken-met-de-toolbox)

## Introductie
Deze handleiding beschrijft hoe je in **Enterprise Architect** een **extensie** maakt **op de MIM-toolbox**. Dit is bijvoorbeeld handig als er extra metamodelconstructies nodig zijn voor het maken van een informatiemodel. Meer informatie en spelregels hiervoor vind je in de [MIM-standaard](https://docs.geostandaarden.nl/mim/mim/#een-eigen-extensie-op-het-metamodel). Een extensie op de MIM-toolbox is ook bedoeld voor het maken van aanvullende constructies die alleen spelen op het niveau van implementatie, of op het niveau van afgeleide technsiche modellen ten behoeve van specifieke interfaces.

Met een extensie breidt je MIM-toolbox uit. Dit is handig wanneer je extra informatie aan modelonderdelen (bijv. objecttypen) wilt toevoegen. Bijvoorbeeld voor:
 - het uitbreiden van de set met metagegevens voor modelonderdelen van een specifiek sector-/domeinmodel (extra tagged values);
 - het uitbreiden van de set met metagegevens voor specifieke toepassingen van het model, zoals bijvoorbeeld in Imvertor of voor een UML-JSON-encodings;
 - het het toevoegen van extra stereotypen.

## Voorbereiding

Zorg dat je de volgende twee zaken bij de hand hebt:
 1. Enterprise Architect: Het is handig om de volgende venster te openen
    - Browser
    - Toolbox
    - Properties
    - Features
 1. De MIM-toolbox waarop je een extensie wilt bouwen, in de vorm van een MDG Technology (.xml). Hier vind je de [meest actuele versie](https://register.geostandaarden.nl/informatiemodel/mim/1.1.1/) van de toolbox 

## Stap 1: Importeer de MIM-toolbox in de EA-omgeving
 - Open de _project browser_.
 - Klik op de tab _Resources_.
 - Klik op de map _MDG Technologies_.
 - Klik met de rechtermuisknop op _Model Technologies_ en selecteer _Import Technology_.
 - Open de MDG Technology (dit bestand heeft een `.xml`-extensie) van de MIM-toolbox.
 - Klik _Openen_.
 - Selecteer daar linksonderin het diagloogvenster _Import To Model_ en klik vervolgens op _OK_.

Indien je geen foutmelding krijgt, heb je de MIM-toolbox succesvol geïmporteerd.

## Stap 2: Maak de package-structuur aan voor de extensie

 - Klik in de project browser linksbovenin op de map met het gele sterretje, of druk `Ctrl+Shift+M`.
 - Hierdoor open de Model Wizard.
 - Selecteer het tabblad _Model Patterns_.
 - Klik daaronder op _Model Technologies Perspective_.
 - Ga naar _Management_ en selecter vervolgens: _MDG Technology Builder_.
 - In het venster verschijnen nu verschillende Model Patterns. Dit zijn templates voor het maken van modellen. 
 - Kies nu onder _MDG Technology Builder_ voor _Basic Template_ en klik linksonderin op _Create Pattern(s)_.
 - Geef in het dialoogvenster dat nu verschijnt de extensie die je gaat maken een naam. Bijvoorbeeld 'DiSGeo' en klik op _OK_.

In de project browser zie dat er nu een nieuwe package DiSGeo is toegevoegd. Dat package bevat een 
 - _diagram_;
 - een `«profile»`;
 - een `«diagram profile»`;
 - en een `«toolbox profile»`.

Je hebt nu succesvol de package structuur aangemaakt.

## Stap 3: Modelleer de toolbox-extensie

 - Vouw het package `«profile»DISGEO` uit
 - Dubbelklik op het diagram
 - Hierdoor opent het diagram en verschijnt de bijbehorende toolbox: `UML::Profile`
 - Ga in het toolboxmenu naar _Metaclass_ en sleep dit element in het diagram.
 - Er verschijnt nu een venster _Extend Metaclass_.
 - Klik in de linkerkolom op _Stereotypes_. Hierdoor verschijnen aan de rechterkant alle stereotypen die MIM kent. 

>**Let op**: deze zijn alleen beschikbaarbaar _nadat_ je de MIM-toolbox hebt geïmporteerd (zie: [stap: 1](#stap-1-importeer-de-mim-toolbox-in-de-ea-omgeving)).

 - Zoek in de lijst aan de rechterkant `«Objecttype»` en `«Attribuutsoort»` op, selecteer deze en klik op _OK_.
 - Deze worden nu toegevoegd aan het diagram.
 - Zoek nu in het toolboxmenu _Add Stereotype_ op (onder _Profile Helpers_) en sleep dit element op het diagram.
 - er verschijnt nu een venster Add Stereotype.
 - We gaan nu een stereotype maken dat dient als extensie op het MIM-stereotype `«Attribuutsoort»`.
 - Geef een naam op voor het stereotype. In het geval van dit voorbeeld is gekozen voor `Attribuutsoort`, maar dit kan elke andere willekeurige naam zijn.
 - Klik vervogens op de button _Add Metaclass_.
 - Hier geef je de UML-metaklasse op waarop je extensie plaatsvindt. Als je niet weet van welke UML-metaklasse je stereotype wordt afgeleid, zoek dit dan op in hoofdstuk 3 van de ](https://docs.geostandaarden.nl/mim/mim/#metamodel-in-uml).

 >**Info**: In hoofdstuk 3 van de MIM-standaard staat beschreven van welke UML-metaklasse elk MIM-stereotype is afgeleid. Omdat je een extensie maakt op MIM, is de nieuwe extensie automatisch óók een extensie op een UML-type. Desondanks moet je dit in Enterprise Architect expliciet benoemen.

 - Laat de overige instellingen staan en klik op _Volgende_.
 - In dit venster, _Define Tagged Values_, kun je de extra metadata-elementen opvoeren.
 - Klik met de rechtermuisknop in de kolom _Property_
 - Kies uit het menu _Add Tagged Value_.
 - Voer een naam op voor de tagged value
 - In het geval van dit voorbeeld `Actualiteit`.
 - In de linkerkolom kun je nog een standaardwaarde opvoeren, maar dat is niet verplicht.
 - In dit voorbeeld laten blijft dit veld leeg.
 - Herhaal deze stap voor alle toe te voegen tagged values die je aan dit element wilt toevogen.
 - Als je klaar bent, kun je bovenstaande stappen herhalen voor `«Objecttype»`. Klik daarna op _Voltooien_

Je ziet nu het nieuwe stereotype met de tagged values. Daarnaast heeft het nu een relatie met de UML-metaklasse `«Attribute»`. Als laatste onderdeel van deze stap moet nu de relatie gelegd worden tussen het nieuwe stereotype en het MIM-stereotype. Dit gaat als volgt:

 - Klik nu op het element `Attribuutsoort`.
 - Er verschijnen nu rechts van het element een aantal iconen.
 - Klik op de witte pijl met de muisknop ingedrukt en sleep dit naar het bijbehorende MIM-type (het bovenste icoon)
 - Kies uit het menu dat nu verschijnt voor _Generalization_.
 - Je extensie-type heeft nu een relatie met `MIM::Attribuutsoort` én `UML::Attribute`.
 - Herhaal deze stappen voor `«Objecttype»`.

Als laatste stap is het handig om het kleurenschema van het modelelement gelijk te maken aan dat van MIM. Dat gaat als volgt:

 - Klik met de rechtermuisknop op het nieuwe element `Objecttype`.
 - Navigeer naar _Appearance_ en klik op _Default Appearance_.
 - Nu opent een venster met dezelfde naam.
 - Klik op _Background Color_.
 - Klik op _More Colors_.
 - Selecteer het tabblad _Custom_.
 - En vul vervolgens onderstaande waarden in

```
   Hue:   128
   Sat:   245
   Lum:   230
   Red:   206
   Green: 253
   Blue:  254
```

 - Klik op _OK_.
 - Zet _Border Color_ en _Font Color_ op zwart.
 - Klik op _OK_.
 - Herhaal deze stap voor de andere modelelementen, in dit geval `Attribuutsoort`.

Je hebt nu succesvol het profiel van je extensie aangemaakt.

## Stap 4: Modelleer het toolbox-menu
In deze stap maak je de menupagina van de toolbox. Hiermee bepaal je hoe en welke stereotypes zichtbaar zijn in het menu. Het doel van de DiSGeo-extensie is om bestaande MIM-stereotypen uitbreiden met extra _tagged values_. Daarvoor introduceerden we in EA onder de moterkap weliswaar twee nieuwe stereotypen (`«Objectype»` en `«Attribuutsoort»`), maar die willen we niet expliciet terugzien in de toolbox. In de toolbox willen we `«Objecttype»` en `«Attribuutsoort»` aanbieden.

 - Open het lege diagram uit het package `«toolbox profile»DISGEO`.
 - Sleep uit de toolbox die bij dit diagram hoort de _Profile Helper_ _Add Toolbox Page_ op het diagram.
 - Het venster _Add Toolbox Page_ opent nu.
 - Vul de naam in van de toolboxpagina die je wilt maken. In dit geval maken we een kopie van de MIM-toolbox, dus noemen we deze (eerste) pagina: _MIM: Objecten en attributen_.
 - klik vervolgens op de Add-button en selecteer de optie _Add Stereotype_.
 - Het venster _Select A Profile Element_ opent nu.
 - Navigeer naar het package `«profile»`DISGEO en selecter `«stereotype»Objecttype` en klik op OK.
 - In de eerste rij van de tabel in het venster _Add Toolbox Page_, is nu dit stereotype toegevoegd.
 - Voor de leesbaarheid is het fijn om het type een **alias** mee te geven (anders heet het toolbox-item `DISGEO::Objectype(UML::Class)`. Vanwege het eerder genoemde uitgangspunt, krijgt dit stereotype het alias **Objecttype**.
 - Voeg nu op dezelfde manier **Attribuutsoort** toe en klik **_nog niet_** op _OK_.

 - Je hebt nu de twee nieuwe stereotypes toegevoeg aan de toolboxpagina:

```diff
+ DISGEO::Objecttype(UML::Class)
+ DISGEO::Attribuutsoort(UML::Attribute)
```

 In de MIM-toolbox heeft deze pagina nog drie andere stereotypes. Deze kun je uit het package MIM-UML halen. Deze beschrijving gaat ervan uit dat je hierover beschikt.

 - Klik nogmaals op de Add-button en navigeer nu naar het package `«MIM-UMLprofile»` en voeg de volgende elementen toe:

```diff
DISGEO::Objecttype(UML::Class)
DISGEO::Attribuutsoort(UML::Attribute)
+ • MIM::Gegevensgroep(UML::Attribute)
+ • MIM::Gegevensgroeptype(UML::Class)
+ • MIM_Keuzeattribuut::Keuze(UML::Attribute)
```

 - Geef ze de bijbehorende aliassen uit het MIM-profiel
 - Klik nu op _OK_.
 - Voeg de toolboxpage toe voor _**MIM-Relaties**_, _**MIM-Datatypen**_, _**MIM-Waardelijsten**_ en _**MIM-Packages**_.
 - Herhaal hiervoor de voorgaande stappen.

 Je hebt nu met succes het toolboxmenu gemaakt. Het is in alle gevallen mogelijk om de namen van de stereotypen met de hand op te voeren. De schrijfwijze luistert heel nauw, dus heeft het de voorkeur gebruik te maken van _Add Stereotype_.

## Stap 5: Modelleer het diagram

 - Open het lege diagram uit het package `«Diagram Profile»Disgeo`.
 - Sleept uit de toolbox die bij dit diagram hoort de _Profile Helper_ _Add Diagram Extention_ op het diagram.
 - Het venster _Add Diagram Extention_ opent nu.
 - Geef een naam op voor het diagram en kies bij _Extention Type_ voor `Class`.
 - Geef bij _Description_ eventueel een beschrijving op voor de toepassing van dit diagram. Het is handig om hier te vermelden dat je dit diagram nodig hebt om voor de MIM-toolbox inclusief extensie!
 - Vouw onder _Properties_ de lijst met _General_ uit.
 - Kies bij _Toolbox Profile_ uit de lijst met namen, de naam van het profiel, in dit geval: **DISGEO** en klik op _OK_.
 - Klik nu op het modelelement `«metaclass» Diagram Logical` en voeg bij _Features_ een nieuw attribuut toe met de naam: `toolboxPage`.
 Vul bij _Initial Value_ de het volgende in:

 ```
 MIM: Objecten en attributen=1;MIM: Relaties=1;MIM: Datatypen=1;MIM: Waardelijsten=1;MIM: Packages=1;UML: Connectors=0;
 ```

 - Dit geeft aan welke onderdelen van de het toolbox menu uit- (waarde: `1`) of ingevouwen (waarde: `0`) zijn.

Je hebt nu succesvol een _Diagram Profile_ aangemaakt.

## Stap 6: Genereer MDG Technology

Je hebt nu succesvol de volgende drie profielen gemaakt:
 - `«profile»DISGEO`
 - `«diagram profile»DISGEO`
 - `«toolbox profile»DISGEO`

In de volgende stap lees je hoe je de profielen publiceert
Volg [deze link](https://github.com/Geonovum/MIM-Werkomgeving/tree/master/UML%20profieltooling#2--profiel-publiceren) voor een beschrijving.

Nadat je elk profiel gepubliceert hebt, 'bundel' je ze in een MDG Technology. 
Hoe je dat doet, lees je [hier](https://github.com/Geonovum/MIM-Werkomgeving/tree/master/UML%20profieltooling#3--genereer-mdg-technologie)


## Stap 7: Werken met de toolbox

Kijk hier voor de meest actuele [handleiding](https://github.com/Geonovum/MIM-Werkomgeving/tree/master/UML%20profieltooling/werkversie1.1.1#readme) voor het gebruik van toolboxen in EA.

>**NOTE**: nog toevoegen