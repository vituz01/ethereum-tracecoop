// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Tracecoop {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Area di interesse “Tracciabilità/Qualità”
    struct Provenienza {
        string shpLottoProduzione;
        string shpCentroLavorazione;
    }

    struct Cultivar {
        string nome;
        bool isLabCertified;
    }

    struct InfoTemporali {
        uint256 anniImpianto;
        string dataRaccolta;
    }

    struct Conservazione {
        uint256 nGiorni;
        int256 temperatura;
    }

    struct Qualita {
        string dataClassificazione;
        uint256 percentualeMercato;
    }

    bool public salubrita = true;

    struct BioTutela {
        bool hasOrganismiUtili;
        bool hasIncolti;
        bool hasZoneRifugio;
        bool hasSiepi;
        bool hasMacchiaMediterranea;
    }

    struct WaterTutela {
        string dataAnalisiAcque;
        uint256 acquaPerEttaro;
        bool hasStazioniAgrometeo;
        bool hasConsiglioIrriguo;
    }

    string public dataAnalisiSuolo = "24/10/2020";

    struct Emissioni {
        // nota: dati per Emissioni e MitigazioneClima possono coincidere
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

    struct MitigazioneClima {
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

    uint256 public quantitaRifiutiProdotta = 10;

    // Area di interesse “Sostenibilità Sociale”

    bool dirittiLavoratori = true;

    /* struct DirittiLavoratori {
        bool hasAccessoNormativeNazionaliLavoro;
        bool isContrattiConformi;
        bool hasSistemaRegistrazioneOreLavorate;
        bool hasPause;
        bool hasOreMassimeLavoro;
        bool hasBustePaga;
        bool hasInfoSalari;
        bool impiegaMinori;
    } */

    bool equitaDiversita = true; // se azienda è conforme, true

    /* struct EquitaDiversita {
        bool assumeFasceDeboli;
        bool nonDiscriminazione;
        bool hasBeneficiSociali;
    } */

    bool sicurezzaSalute = true; // se azienda è conforme, true

    /* struct SicurezzaSalute {
        bool visiteMediche;
        bool rispettaCondSicurezza;
        bool hasDispositiviSicurezza;
    } */

    bool hasBeneficiSociali = true;

    bool isAziendaInnovativa = true;

    struct Prodotto {
        Provenienza provenienza;
        Cultivar cultivar;
        InfoTemporali infoTemporali;
        Conservazione conservazione;
        Qualita qualita;
        bool salubrita;
        BioTutela bioTutela;
        WaterTutela waterTutela;
        string dataAnalisiSuolo;
        Emissioni emissioni;
        MitigazioneClima clima;
        uint256 quantitaRifiutiProdotta;
    }

    Prodotto[] public listaProdotti;

    Provenienza public provenienza =
        Provenienza({shpLottoProduzione: "Ciao", shpCentroLavorazione: "Ciao"});

    Cultivar public cultivar = Cultivar({nome: "Ciao", isLabCertified: true});

    InfoTemporali public infoTempo =
        InfoTemporali({anniImpianto: 10, dataRaccolta: "10/06/2019"});

    Conservazione public conservazione =
        Conservazione({nGiorni: 7, temperatura: 25});

    Qualita public qualita =
        Qualita({dataClassificazione: "24/04/2020", percentualeMercato: 30});

    BioTutela public bioTutela =
        BioTutela({
            hasOrganismiUtili: true,
            hasIncolti: true,
            hasZoneRifugio: true,
            hasSiepi: true,
            hasMacchiaMediterranea: true
        });

    WaterTutela public waterTutela =
        WaterTutela({
            dataAnalisiAcque: "24/11/2020",
            acquaPerEttaro: 10,
            hasStazioniAgrometeo: true,
            hasConsiglioIrriguo: true
        });

    Emissioni public emissioni =
        Emissioni({
            oreMacchinaPerEttaro: 10,
            distanzaDaCampoACentroLavorazione: 2
        });

    MitigazioneClima public clima =
        MitigazioneClima({
            oreMacchinaPerEttaro: 10,
            distanzaDaCampoACentroLavorazione: 2
        });

    Prodotto melograno =
        Prodotto({
            provenienza: provenienza,
            cultivar: cultivar,
            infoTemporali: infoTempo,
            conservazione: conservazione,
            qualita: qualita,
            salubrita: salubrita,
            bioTutela: bioTutela,
            waterTutela: waterTutela,
            dataAnalisiSuolo: dataAnalisiSuolo,
            emissioni: emissioni,
            clima: clima,
            quantitaRifiutiProdotta: quantitaRifiutiProdotta
        });

    // metodi per modificare e visualizzare le info sul prodotto

    function addProdotto() public {
        listaProdotti.push(melograno);
    }
}
