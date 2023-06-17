// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Tracecoop {
    string idProdotto;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    // Area di interesse “Tracciabilità/Qualità”

    struct Provenienza {
        string shpLottoProduzione; // da definire dato shapefile lotto prod
        string shpCentroLavorazione; // da definire dato shapefile lotto lav (nota: idLottoProd === idLottoLav)
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

    struct TracciabilitaQualita {
        Provenienza provenienza;
        Cultivar cultivar;
        InfoTemporali infoTemporali;
        Conservazione conservazione;
        Qualita qualita;
        bool salubrita;
    }

    // Area di interesse "Sostenibilità Ambientale"

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
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

    // nota: dati per Emissioni e MitigazioneClima possono coincidere

    struct MitigazioneClima {
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

    uint256 public quantitaRifiutiProdotta = 10;

    struct SostenibilitaAmbiente {
        BioTutela bioTutela;
        WaterTutela waterTutela;
        string dataAnalisiSuolo;
        Emissioni emissioni;
        MitigazioneClima mitigClima;
        uint256 quantitaRifiutiProdotta;
    }

    // Area di interesse “Sostenibilità Sociale”

    struct SostenibilitaSociale {
        bool dirittiLavoratori;
        bool equitaDiversita;
        bool sicurezzaSalute;
        bool hasBeneficiSociali;
    }

    bool isAziendaInnovativa;

    struct Prodotto {
        string idProdotto;
        string nomeSpecie;
        TracciabilitaQualita traccQual;
        SostenibilitaAmbiente sostAmb;
        SostenibilitaSociale sostSoc;
        bool isAziendaInnovativa;
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner);
        _;
    }

    Prodotto[] public listaProdotti;

    Provenienza public provenienza =
        Provenienza({shpLottoProduzione: "Ciao", shpCentroLavorazione: "Ciao"});

    Cultivar public cultivar =
        Cultivar({nome: "WONDERFUL", isLabCertified: true});

    InfoTemporali public infoTempo =
        InfoTemporali({anniImpianto: 10, dataRaccolta: "10/06/2019"});

    Conservazione public conservazione =
        Conservazione({nGiorni: 7, temperatura: 25});

    Qualita public qualita =
        Qualita({dataClassificazione: "24/04/2020", percentualeMercato: 30});

    TracciabilitaQualita traccQual =
        TracciabilitaQualita({
            provenienza: provenienza,
            cultivar: cultivar,
            infoTemporali: infoTempo,
            conservazione: conservazione,
            qualita: qualita,
            salubrita: salubrita
        });

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

    SostenibilitaAmbiente sostAmb =
        SostenibilitaAmbiente({
            bioTutela: bioTutela,
            waterTutela: waterTutela,
            emissioni: emissioni,
            mitigClima: clima,
            dataAnalisiSuolo: dataAnalisiSuolo,
            quantitaRifiutiProdotta: quantitaRifiutiProdotta
        });

    SostenibilitaSociale sostSoc =
        SostenibilitaSociale({
            dirittiLavoratori: true,
            equitaDiversita: true,
            sicurezzaSalute: true,
            hasBeneficiSociali: true
        });

    Prodotto melograno =
        Prodotto({
            idProdotto: "melograno1",
            nomeSpecie: "MELAGRANA",
            traccQual: traccQual,
            sostAmb: sostAmb,
            sostSoc: sostSoc,
            isAziendaInnovativa: true
        });

    // metodi per modificare e visualizzare le info sul prodotto

    // addProdotto onlyOwner ()

    // updateProdotto onlyOwner ()

    // removeProdotto onlyOwner ()
}
