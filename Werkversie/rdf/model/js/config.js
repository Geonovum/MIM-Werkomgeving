
let respecConfig = {
  useLogo: true,
  useLabel: true,
  // title is verplicht! Neem hier de titel van het document op -----------------------
  title: "MIM-ontologie voor informatiemodelleren",
  // subtitle is optioneel. Neem hier de ondertitel van het document op ---------------
  subtitle: "Versie 1.2",
  //-- specStatus is verplicht! (activeer 1 van de volgende) --------------------------
  specStatus: "wv",                   // Werkversie
  //specStatus: "cv",               // Consultatieversie
  //specStatus: "vv",               // Versie ter vaststelling
  //specStatus: "def",              // Vastgestelde versie
  //specStatus: "basis",            // Basis Document
  //-- specType is verplicht bij alle andere dan BASIS ---------------------------------
  //specType: "NO",                 // Norm
  specType: "ST",                 // Standaard
  //specType: "IM",                 // Informatie Model
  //specType: "PR",                 // Praktijkrichtlijn
  //specType: "HR",                     // HandReiking
  //specType: "WA",                 // Werkafspraak
  //specType: "BD",                 // Beheer Documentatie
  //specType: "AL",                 // Algemeen document
  //specType: "BP",                 // Best Practice
  //-- pubDomain is verplicht! (komt in de URL) -------------------------------------
  //-- zie: https://geonovum.github.io/handleiding-tooling/ReSpec/#pubdomain
  pubDomain: "mim",
  //-- license: voor de geldende gebruiksvoorwaarden. Default is cc-by.
  //licence: "cc-by-nd",            // bronvermelding, geen afgeleide werken (default)
  //licence: "cc0",                 // Public Domain Dedication
  licence: "cc-by",                 // Attribution, met bronvermelding
  //-- TODO shortName is verplicht! (komt in de URL: kies logische afkorting)--------------
  shortName: "mim-ontologie",
  
  //-- Repositorynaam op GitHub -------------------------------------------------------
  //-- Neem hier de URL van de github repository op waar het respec document in staat
  github: "https://github.com/Geonovum/MIM-Werkomgeving/Werkversie/rdf/model",
  //-- Repositorynaam/issues op GitHub ------------------------------------------------
  issueBase: "https://github.com/Geonovum/MIM-Werkomgeving/issues/",
  //-- edDraftURI: de URI van de werkversie van het document
  //-- edDraftURI = De URI van de draft version. Deze wordt automatisch afgeleid van de github URI; maar kan hier overschreven worden. 
  edDraftURI: "https://github.com/Geonovum/MIM-Werkomgeving/Werkversie/rdf/model",
	
  //-- publishDate is verplicht -------------------------------------------------------
  //-- NB: in de werkversie uitzetten, want dan pakt Respec de pushdate ---------------
  // publishDate: "2024-04-08",
  
  // -- Eventueel is het mogelijk een versienummer mee te geven, maar bij Geonovum werken we gewoonlijk alleen met datum als onderdeel van de permanente URI.
  //publishVersion: "0.0.2",
  //previousVersion: "0.0.1",
  
  //-- Voor dit blok geldt: alleen als er eerdere versies zijn en altijd beiden aan/uit! 
  previousPublishDate: "2014-05-01",
  previousMaturity: "CV",
  
  //-- TODO: de namen van de Editor(s) / Redacteur(en)---------------------------------------
  //-- vul in: per Editor: name:, company:, companyURL: -------------------------------
  editors:
    [
      {
        name:       "Dick Krijtenburg",
        company:    "Geonovum",
        companyURL: "https://www.geonovum.nl"
      },
      {
        name:       "Paul Janssen",
        company:    "Geonovum",
        companyURL: "https://www.geonovum.nl"
      },
      {
        name:       "Lennart van Bergen",
        company:    "Kadaster",
        companyURL: "https://www.kadaster.nl"
      },
    ],
  //-- de namen van de Author(s) ------------------------------------------------------
  //-- vul in: per Author: name:, company:, companyURL: -------------------------------
  authors:
    [
      {
        name:       "Lennart van Bergen",
        company:    "Kadaster",
        companyURL: "https://www.kadaster.nl"
      },
      {
        name:       "Thies Mesdag",
        company:    "Kadaster",
        companyURL: "https://www.kadaster.nl"
      },
      {
        name:       "Marco Brattinga",
        company:    "Ordina",
        companyURL: "https://www.ordina.nl/"
      },
      {
        name:       "Paul Janssen",
        company:    "Geonovum",
        companyURL: "https://www.geonovum.nl"
      },
      {
        name:       "Pano Maria",
        company:    "Skemu",
        companyURL: "https://skemu.com"
      },
      {
        name:       "Johan Boer",
        company:    "VNG Realisatie",
        companyURL: "https://www.vngrealisatie.nl/"
      },
    ],

  // Create PDF and link to file in header (optional):
  // TODO: Change the filename as preferred.
  // alternateFormats: [
  //     {
  //         label: "pdf",
  //         uri: "template.pdf",
  //     },
  // ],
};