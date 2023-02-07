# Verkenning extensies op de MIM-toolbox

## Basisgedachte
Het idee voor het ontwikkelen van een standaard werkwijze voor extensies op de MIM-toolbox komt voort uit de behoefte om modelleurs, die volgens het MIM-metamodel met Enterprise Architect werken en gebruik maken van Imvertor, op een éénduidige manier te faciliteren met een complete toolbox. 
Compleet wil in dit geval zeggen dat de modelleur zelf bepaalt welke extra elementen er nodig en profielen hiervan kan importeren, op zo'n manier dat het een extensie vormt op MIM. Zo blijft de MIM-toolbox een zuivere implementatie van de standaard. Tegelijkertijd de herkomst van verschillende tagged value groepen duidelijk herleidbaar is. 

#### Samengevat

 - Modulaire extensies op MIM
 - Gebruiksvriendelijk
 - Alles op één plek bij de hand (dus niet hoeven switchen tussen verschillende toolboxen of profielen)
 - Duidelijk herleidbaar waar wat vandaan komt (wat is MIM, wat is NEN3010, etc.)
 - Profielen te importeren die je nodig hebt die automatisch verzamelen in één toolbox

## Doelgroep

Informatiemodelleurs die volgens de MIM-standaard werken in Enterprise Architect en Imvertor gebruiken voor geautomatiseerde publicatie en schemageneratie.

## Uitdagingen huidige situatie

Geonovum faciliteert een MIM-toolbox voor gebruik in Enterprise Architect. In deze toolbox (MDG Technology) is de MIM-standaard één-op-één verwerkt. Daardoor beschikt een modelleur over de juiste stereotypen en bijbehorende tagged values.

Steeds meer partijen maken gebruik van Imvertor voor het publiceren van het informatiemodel naar het web. Hiervoor is het noodzakelijk om aan sommige MIM-stereotypen extra informatie toe te voegen (tagged values). Zo heeft het package `«Informatiemodel»` onder andere de extra tags `Afkorting` en `Release` nodig.

Ook voor andere toepassingen is het wenselijk om extra informatie te kunnen toevoegen. Of misschien zelfs wel extra stereotypen, als een extensie op het MIM. 

Denk bijvoorbeeld aan NEN3610, JSON, sector-eigen eigenschappen... 

Het is mogelijk om deze eigenschappen met de hand toe te voegen, maar dat is bewerkelijk en kan bovendien leiden tot inconsistentie binnen een model of tussen modellen. 

Hieruit ontstond het idee om de MIM-toolbox uit te kunnen breiden met modulles die de benodigde extra eigenschappen bevatten. Het mooiste zou zijn als de MIM-toolbox modulair uitbreidbaar is op basis van de extra profielen die geïmporteerd zijn.

Bijvoorbeeld: je hebt een NEN3610-model (dat gebaseerd is op MIM) en je dat wilt kunnen publiceren met Imvertor. Dan is het idee dat je het MIM-profiel met toolbox importeert en daaraan dan los de profielen NEN3610:2022 en Imvertor aan toevoegd. 

Deze verkenning is erop gericht om uit te zoeken in hoeverre deze wens gedeeld wordt, of zoiets mogelijk is en zo ja, hoe we dit kunnen ontwikkelen.

Maar nu: MIM+A en MIM+B zijn twee verschillende toolboxen
Bijv. MIM + IMV + DSG + JSON

Niet alle meta-inforamtie wil je ook in de publicatie laten landen.

De BRO heeft ook verschillende profielen voor conceptuele en logische modellen.

IMvertor geneert ook toolboxen. Die zijn compleet, maar wel 'plat'.

#### Methoden toevoegen tagged values
 1. Handmatig alle tags per modelelemnt toevoegen (Onwenselijk)
 1. Profielen en toolboxen, door Geonovum handmatig ontwikkeld gedistribueerd (Onhandig)
 1. MIM-toolbox met mogelijk profielen voor extensies, door geonovum ontwikkeld en gedistribueerd (Theoretische optie)
 1. MIM-compliant toolbox met alle extra benodigdheden, Automatisch gegenereerd door Imvertor (Mogelijk, maar ongevalideerd)