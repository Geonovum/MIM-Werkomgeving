# Handleiding Extensie maken op MIM-toolbox

De handleiding is geschreven voor EA versie 15.2

Deze handleiding gebruik **DiSGeo** als voorbeeld. Voor het **informatiemodel DiSGeo** zijn voor de MIM-stereotypen `«Objecttype»` en `«Attribuutsoort»` meta-informatie nodig in de vorm van extra tagged values. Voor [Objecttype](https://geonovum.github.io/disgeo-imsor/modelleerprincipes/#specificatie-voor-objecttype) gaat dat om het toevoegen van `Actualiteit` en `Inwinning verplicht`, voor [Attribuutsoort](https://geonovum.github.io/disgeo-imsor/modelleerprincipes/#specificatie-voor-attribuutsoort) zijn dat: `Inwinningsregels` en `Positionele juistheid`.

## Introductie
Deze handleiding beschrijft hoe je in **Enterprise Architect** een **extentie** maakt **op de MIM-toolbox**. Dit is bijvoorbeeld handig als er extra metamodelconstructies nodig zijn voor het maken van een informatiemodel. Meer informatie en spelregels hiervoor vind je in de [MIM-standaard](https://docs.geostandaarden.nl/mim/mim/#een-eigen-extensie-op-het-metamodel). Een extensie op de MIM-toolbox is ook bedoeld voor het maken van aanvullende constructies die alleen spelen op het niveau van implementatie, of op het niveau van afgeleide technsiche modellen ten behoeve van specifieke interfaces.

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

## Stap 3: Modelleer de toolbox-extentie

 - Vouw het package `«profile»DISGEO` uit
 - Dubbelklik op het diagram
 - Hierdoor opent het diagram en verschijnt de bijbehorende toolbox: `UML::Profile`
 - Ga in het toolboxmenu naar _Metaclass_ en sleep dit element in het diagram.
 - Er verschijnt nu een venster _Extend Metaclass_.
 - Klik in de linkerkolom op _Stereotypes_. Hierdoor verschijnen aan de rechterkant alle stereotypen die MIM kent. 

>**Let op**: deze zijn alleen beschikbaarbaar nadat je de MIM-toolbox hebt geïmporteerd (zie: [stap: 1](#stap-1-importeer-de-mim-toolbox-in-de-ea-omgeving)).

 - Zoek in de lijst aan de rechterkant `«Objecttype»` en `«Attribuutsoort»` op, selecteer deze en klik op _OK_.
 - Deze worden nu toegevoegd aan het diagram.
 - Zoek nu in het toolboxmenu Add Stereotype op (onder Profile Helpers) en sleep dit element op het diagram.
 - er verschijnt nu een venster Add Stereotype
 - Geef een naam op voor het stereotype. In het geval van dit voorbeeld is gekozen voor Attribuutsoort, maar dit kan elke andere willekeurige naam zijn.
 - Klik vervogens op de button Add Metaclass.
 - Hier geef je de UML-metaklasse op waarop je extentie plaatsvindt.
 - Je moet hiervoor weten van welke UML-metaklasse het MIM-stereotype is afgeleid. Je kunt dat hier terugvinden in [hoofdstuk 3 van de MIM-standaard](https://docs.geostandaarden.nl/mim/mim/#metamodel-in-uml).


## Stap 4: Modelleer het diagram?

## Stap 5: Modelleer het toolbox-menu

## Stap 6: Exporteer/Genereer (naar) MDG

>**NOTE**: [linkOpnemen](www.example.com) naar hoofdstuk in de **handleiding MIM-toolbox genereren**.

## Stap 7: Importeer MDG

>**NOTE**: [linkOpnemen](www.example.com) naar hoofdstuk in de **handleiding MIM-toolbox**.

## Stap 8: Werken met de extensie