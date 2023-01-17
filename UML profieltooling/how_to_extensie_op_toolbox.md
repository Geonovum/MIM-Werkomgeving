# Handleiding Extentie maken op MIM-toolbox

Deze handleiding beschrijft hoe je in **Enterprise Architect** een **extensie** maakt **op de MIM-toolbox**. Dit is bijvoorbeeld handig als er extra metamodelconstructies nodig zijn voor het maken van een informatiemodel. Meer informatie en spelregels hiervoor vind je in de [MIM-standaard](https://docs.geostandaarden.nl/mim/mim/#een-eigen-extensie-op-het-metamodel). Een extensie op de MIM-toolbox is ook bedoeld voor het maken van aanvullende constructies die alleen spelen op het niveau van implementatie, of op het niveau van afgeleide technsiche modellen ten behoeve van specifieke interfaces.

Met een extensie breidt je MIM-toolbox uit. Dit is handig wanneer je extra informatie aan modelonderdelen (bijv. objecttypen) wilt toevoegen. Bijvoorbeeld voor:
 - het uitbreiden van de set met metagegevens voor modelonderdelen van een specifiek sector-/domeinmodel (extra tagged values);
 - het uitbreiden van de set met metagegevens voor specifieke toepassingen van het model, zoals bijvoorbeeld in Imvertor of voor een UML-JSON-encodings;
 - het het toevoegen van extra stereotypen.

De handleiding is geschreven voor EA versie 15.2

## Voorbereiding

De MIM-toolbox waarop je een extensie wilt bouwen, in de vorm van een MDG Technology (.xml)
Enterprise Architect

## Stap 1: importeer de MIM-toolbox in de EA-omgeving
 - Open de _project browser_.
 - Klik op de tab _Resources_.
 - Klik op de map _MDG Technologies_.
 - Klik met de rechtermuisknop op _Model Technologies_ en selecteer _Import Technology_.
 - Open de MDG Technology (dit bestand heeft een `.xml`-extensie) van de MIM-toolbox.
 - Klik _Openen_.
 - Selecteer daar linksonderin het diagloogvenster _Import To Model_ en klik vervolgens op _OK_.
