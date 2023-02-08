# Verkenning extensies op de MIM-toolbox

## Hoofdvraag

_In hoeverre is het mogelijk, om alle informatie die je als modelleur nodig hebt voor het maken, publiceren en generen van afgeleide producten van modellen, in Enterprise Architect vanuit één toolboxpage beschikbaar te maken?_ 

## Basisgedachte

Het idee voor het ontwikkelen van een standaard werkwijze voor extensies op de MIM-toolbox komt voort uit de behoefte om modelleurs, die volgens het MIM-metamodel met Enterprise Architect werken en gebruik maken van Imvertor, op een éénduidige manier te faciliteren met een complete toolbox.

Compleet wil in dit geval zeggen dat de modelleur zelf bepaalt welke extra elementen er nodig en profielen hiervan kan importeren, op zo'n manier dat het een extensie vormt op MIM. Zo blijft de MIM-toolbox een zuivere implementatie van de standaard. Tegelijkertijd de herkomst van verschillende tagged value groepen duidelijk herleidbaar is. 

#### (nog verwerken)

_In essentie lijkt het mij wenselijk als je in de EA-werkomgeving in één toolbox alles tot je beschikking hebt voor het maken, publiceren en generen van afgeleide producten van modellen._

#### (nog verwerken)

_Maar het valt mij op dat er hierdoor discussie ontstaat over of de MIM-toolbox een zuivere representatie van het metamodel moet zijn waarbij Geonovum als beheerder van de standaard verantwoordelijk is, of dat de MIM-toolbox juist een zo’n gebruiksvriendelijk mogelijk hulpmiddel voor de modelleur moet zijn._

#### (nog verwerken)

_Voor beide is wat te zeggen, maar ik denk dat het mogelijk is om zonder grote concessies aan beide wensen te voldoen. Ik heb hiervoor wat ideeën die ik graag eens met jou bespreek._

#### Samengevat

 - Modulaire extensies op MIM
 - Gebruiksvriendelijk
 - Alles op één plek bij de hand (dus niet hoeven switchen tussen verschillende toolboxen of profielen)
 - Duidelijk herleidbaar waar wat vandaan komt (wat is MIM, wat is NEN3010, etc.)
 - Profielen te importeren die je nodig hebt die automatisch verzamelen in één toolbox

## Doelgroep

Informatiemodelleurs die volgens de MIM-standaard werken in Enterprise Architect en Imvertor gebruiken voor geautomatiseerde publicatie en schemageneratie.

## Uitdagingen huidige situatie

### MIM-toolbox
Geonovum faciliteert een MIM-toolbox voor gebruik in Enterprise Architect. De toolbox (en de onderliggende profielen) implementeert de MIM-standaard één-op-één. Daardoor beschik je als modelleur over de juiste stereotypen en bijbehorende tagged values.

### Imvertor
In de praktijk maken steeds meer partijen gebruik van de Imvertor software voor het publiceren en genereren van afgeleide producten van informatiemodellen. Hiervoor is het noodzakelijk om aan sommige modelelementen extra informatie toe te voegen (tagged values). Zo heeft het package `«Informatiemodel»` onder andere de extra tags `Afkorting` en `Release` nodig. Je hebt als modelleur dan niet genoeg aan alleen de MIM-toolbox.

### Sectormodellen en andere toepassingen
Ook voor andere toepassingen is het wenselijk om extra informatie (tagged values) te kunnen toevoegen. Of misschien zelfs wel extra stereotypen, als een extensie op het MIM. 

Redenen voor het toevoegen van informatie:
 - technisch
 - inhoudelijk

Denk bijvoorbeeld aan NEN3610, JSON, of voor een specifiek sectormodel.

### Handmatig
Het is mogelijk om deze eigenschappen met de hand toe te voegen, maar dat is bewerkelijk en kan bovendien leiden tot inconsistentie binnen een model of tussen modellen. 

### Profielen en Toolboxen
Hieruit ontstond het idee om de MIM-toolbox uit te kunnen breiden met modulles die de benodigde extra eigenschappen bevatten. Het mooiste zou zijn als de MIM-toolbox modulair uitbreidbaar is op basis van de extra profielen die geïmporteerd zijn.

>**Voorbeeld**: Je hebt een NEN3610-model (dat gebaseerd is op MIM) en je dat wilt kunnen publiceren met Imvertor. Dan is het idee dat je het MIM-profiel met toolbox importeert en daaraan dan los de profielen NEN3610:2022 en Imvertor aan toevoegd. 

### Verkenning
Deze verkenning is erop gericht om uit te zoeken:
 - huidige werkwijze
 - bezwaren 
 - in hoeverre deze wens gedeeld wordt, 
 - of zoiets mogelijk is, en zo ja:
 - hoe we dit kunnen ontwikkelen.
 - alternatieven
 - voor- en nadelen?


Maar nu: MIM+A en MIM+B zijn twee verschillende toolboxen
Bijv. MIM + IMV + DSG + JSON

Niet alle meta-inforamtie wil je ook in de publicatie laten landen.

De BRO heeft ook verschillende profielen voor conceptuele en logische modellen.

IMvertor geneert ook toolboxen. Die zijn compleet, maar wel 'plat'.

#### Methoden toevoegen tagged values
 1. **Handmatig** alle tags per modelelemnt toevoegen
 1. **Profielen** en **toolboxen**, door **Geonovum handmatig** ontwikkeld gedistribueerd
 1. **MIM-toolbox** met mogelijk **profielen voor extensies**, door **Geonovum handmatig** ontwikkeld en gedistribueerd
 1. **MIM-compliant toolbox** met alle extra benodigdheden, **Automatisch gegenereerd door Imvertor**
 
Aan alle methoden zitten voor en nadelen. Deze worden in de volgende verder uiteengezet.
`(...)`
 
### Voor- en nadelen verschillende methoden

| | Volledig handmatig | Aparte Toolbox per extensie | Eén Complete Toolboxpage | Automatisch gegenereerd vanuit Imvertor |
| -- | -- | -- | -- | -- |
| a | b | c | d | e |


 • Imvertor heeft van alles een configuratie op de server beschikbaar staan
 • Je zou alles met de hand kunnen doen
 • Dan en dan biedt je het aan imvertor aan
 • Dat is het 
    • Of [a] OK omdat het voldoet aan de minimumeisen (van MIM?) 
    • Of [b] je bent compleet
 • Ergens daartussen ligt de waarheid, dat weet je niet precies.

 KANTTEKENING
 • Maar Imvertor heeft eigen eigenschappen
 • Bijvoorbeeld de Tag 'Release', zonder deze informatie, draait Imvertor niet
 • Hiervoor zou je dan een aparte toolbox moeten maken.
 • Uitbreiden op MIM.
 • En die toolbox introduceert dan het stereotype: «Informatiemodel» mét de tag 'Release'
 • Dat kun je doen.
 • Dat ziet er ook mooi uit.
 • En dan heb je de toolbox in eigen hand.

 Maar
 • Op server van imvertor staan open source alle configuraties:
 • Dus, wat is mim11 en mim111 en wat is json-ext op mim111?
 • Dat is allemaal al gedefinieerd
 • In config van report zie je dat allemaal staan
 • Vier jaar geleden kwam de vraag: kunnen we één toolbox generen waar dat allemaal inzit?
 • Imvertor genereert ze nu automatisch, maar de ervaring is dat sommige toolboxen niet draaien.
 • Arjan heeft veel moeite gedaan om boven tafel te krijgen waar een toolbox precies aan moet voldoen,
 • Maar sparx lijkt dit zelf onder de hoed te willen houden.
 • Daardoor is het nadeel van automatische generatie m.b.v. imvertor dat je nooit zeker weet of de toolbox (correct) laadt
 • Het voordeel van het zelf genereren (vanuit ea) is dat je zeker weet dat het laadt en anders kun je bij sparx aankloppen.