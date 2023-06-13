let respecConfig = {
  useLogo: true,
  useLabel: true,
  // title is verplicht! Neem hier de titel van het document op ----------------------
  title: "MIM - Metamodel Informatie Modellering",
  //-- specStatus is verplicht! (activeer 1 van de volgende) --------------------------
  specStatus:   "wv",               // Werkversie
  //specStatus: "cv",               // Consultatieversie
  //specStatus: "vv",               // Versie ter vaststelling
  //specStatus: "def",              // Vastgestelde versie
  //specStatus: "basis",            // Basis Document
  //-- specType is verplicht bij alle andere dan BASIS ---------------------------------
  //specType: "NO",                 // Norm
  specType: "ST",                   // Standaard
  //specType: "IM",                 // Informatie Model
  //specType: "PR",                 // Praktijkrichtlijn
  //specType: "HR",                 // HandReiking
  //specType: "WA",                 // Werkafspraak
  //specType: "BD",                 // Beheer Documentatie
  //specType: "AL",                 // Algemeen document
  //specType: "BP",                 // Best Practice
  specType: "HR",
  //-- pubDomain is verplicht! (komt in de URL) -------------------------------------
  pubDomain: "dk",
  //-- license: voor de geldende gebruiksvoorwaarden. Default is cc-by.
  //licence: "cc-by-nd",            // bronvermelding, geen afgeleide werken (default)
  //licence: "cc0",                 // Public Domain Dedication
  licence: "cc-by",                 // Attribution, met bronvermelding
  //-- shortName is verplicht! (komt in de URL: kies logische afkorting)--------------
  shortName: "NL-ReSpec-GN-template",
  //-- publishDate is verplicht -------------------------------------------------------
  //-- NB: in de werkversie uitzetten, want dan pakt Respec de pushdate ---------------
  //publishDate: "2023-03-28",
  //eventueel is het mogelijk een versienummer mee te geven, maar bij Geonovum werken we gewoonlijk alleen met datum als onderdeel van de permanente URI.
  //publishVersion: "0.0.2",
  //previousVersion: "0.0.1",
  //-- Voor dit blok geldt: alleen als er eerdere versies zijn en altijd beiden aan/uit! 
  //previousPublishDate: "2014-05-01",
  //previousMaturity: "CV",
  //-- de namen van de Editor(s) / Redacteur(en)---------------------------------------
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
      name:       "Gerard Trouborst",
      company:    "Geonovum",
      companyURL: "https://www.geonovum.nl"
    },
    {
      name:       "Lennart van Bergen",
      company:    "Kadaster",
      companyURL: "https://www.kadaster.nl"
    },
  ],
  //-- de namen van de auteur(s) ------------------------------------------------------
  //-- vul in: per auteur: name:, company:, companyURL: -------------------------------
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
      company:    "Geonovum",
      companyURL: "https://www.geonovum.nl"
    },
    {
      name:       "Johan Boer",
      company:    "VNG Realisatie",
      companyURL: "https://www.vngrealisatie.nl/"
    },
  ],
  //neem hier de URL van de github repository op waar het respec document in staat
  github: "https://github.com/Geonovum/MIM-Werkomgeving",
  //-- Repositorynaam/issues op GitHub ------------------------------------------------
  issueBase: "https://github.com/Geonovum/MIM-Werkomgeving/issues/",
  //-- edDraftURI: de URI van de werkversie van het document
  edDraftURI: "https://geonovum.github.io/MIM-Werkomgeving/",
  //-- license: voor de geldende gebruiksvoorwaarden
  licence: "cc-by-nd",              //-- bronvermelding, geen afgeleide werken (default)
  // licence: "cc0",                //-- Public Domain Dedication
  // licence: "cc-by",              //-- Attribution, met bronvermelding


  //-- Voor dit blok geldt: alleen als er eerdere versies zijn en altijd beiden aan/uit!
  previousPublishDate: "2020-02-25",          // Format is "YYYY-MM-DD"
  //reviousMaturity: "GN-DEF",                 // kies 1 van deze 3 regels
  //previousMaturity: "GN-CV",                   // kies 1 van deze 3 regels
  previousMaturity: "GN-VV",                    // kies 1 van deze 3 regels

  //-- Optionele parameters:
  //emailComments: "mim@geonovum.nl",         // reactie mailadres, alleen bij CV!
  //subtitle: "iets",                         // Subtitel van het document
  //maxTocLevel: 4,                             // Aantal niveau's ToC, default is 0

  // Create PDF and link to file in header (optional):
  // alternateFormats: [
  //     {
  //         label: "pdf",
  //         uri: "template.pdf",
  //     },
  // ],
};