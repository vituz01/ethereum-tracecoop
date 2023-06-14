// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Tracecoop {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // Area di interesse “Tracciabilità/Qualità”
    struct Provenienza {
        bytes32[] shpLottoProduzione;
        bytes32 shpCentroLavorazione;
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

    bool salubrita;

    struct bioTutela {
        bool hasOrganismiUtili;
        bool hasIncolti;
        bool hasZoneRifugio;
        bool hasSiepi;
        bool hasMacchiaMediterranea;
    }

    struct waterTutela {
        string dataAnalisiAcque;
        uint256 acquaPerEttaro;
        bool hasStazioniAgrometeo;
        bool hasConsiglioIrriguo;
    }

    struct Suolo {
        string dataAnalisiSuolo;
    }

    struct Emissioni {
        // nota: dati per Emissioni e MitigazioneClima possono coincidere
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

    struct MitigazioneClima {
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

    struct Rifiuti {
        uint256 quantitaRifiutiProdotta;
    }

    // Area di interesse “Sostenibilità Sociale”

    bool dirittiLavoratori;

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

    bool equitaDiversita; // se azienda è conforme, true

    /* struct EquitaDiversita {
        bool assumeFasceDeboli;
        bool nonDiscriminazione;
        bool hasBeneficiSociali;
    } */

    bool sicurezzaSalute; // se azienda è conforme, true

    /* struct SicurezzaSalute {
        bool visiteMediche;
        bool rispettaCondSicurezza;
        bool hasDispositiviSicurezza;
    } */

    bool hasBeneficiSociali;

    bool isAziendaInnovativa;

    struct Prodotto {
        Provenienza provenienza;
        Cultivar cultivar;
        InfoTemporali infoTemporali;
        Conservazione conservazione;
        Qualita qualita;
    }

    Prodotto[] listaProdotti;

    // metodi per modificare e visualizzare le info sul prodotto
}
