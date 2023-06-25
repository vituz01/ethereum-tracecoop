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
        string shpCentroLavorazione; // da definire dato shapefile lotto lav (nota: idLottoProd === idLottoLav???)
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

    struct Emissioni {
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

    // nota: dati per Emissioni e MitigazioneClima possono coincidere

    struct MitigazioneClima {
        uint256 oreMacchinaPerEttaro;
        uint256 distanzaDaCampoACentroLavorazione;
    }

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

    struct Prodotto {
        string idProdotto;
        string nomeSpecie;
        TracciabilitaQualita traccQual;
        SostenibilitaAmbiente sostAmb;
        SostenibilitaSociale sostSoc;
        bool isAziendaInnovativa;
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "User is not owner");
        _;
    }

    mapping(string => Prodotto) public getProdottoByID;

    Prodotto[] public listaProdotti;

    // metodi per modificare e visualizzare le info sul prodotto

    function addProdotto(
        string memory _idProdotto,
        string memory _nomeSpecie,
        TracciabilitaQualita memory _traccQual,
        SostenibilitaAmbiente memory _sostAmb,
        SostenibilitaSociale memory _sostSoc,
        bool _isAziendaInnovativa
    ) public onlyOwner {
        bool check = checkIdProdotto(_idProdotto);
        require(check == false, "Product already registered");
        Prodotto memory newProdotto = Prodotto(
            _idProdotto,
            _nomeSpecie,
            _traccQual,
            _sostAmb,
            _sostSoc,
            _isAziendaInnovativa
        );
        listaProdotti.push(newProdotto);
        getProdottoByID[_idProdotto] = newProdotto;
    }

    function removeProdotto(string memory _idProdotto) public onlyOwner {
        uint256 index;
        for (uint256 i = 0; i < listaProdotti.length; i++) {
            if (
                keccak256(bytes(listaProdotti[i].idProdotto)) ==
                keccak256(bytes(_idProdotto))
            ) {
                index = i;
                break;
            }
        }
        delete listaProdotti[index];
        delete (getProdottoByID[_idProdotto]);
    }

    function checkIdProdotto(
        string memory _idProdotto
    ) public view returns (bool) {
        bool check;
        for (uint256 i = 0; i < listaProdotti.length; i++) {
            if (
                keccak256(bytes(listaProdotti[i].idProdotto)) ==
                keccak256(bytes(_idProdotto))
            ) {
                check = true;
                break;
            }
        }
        return check;
    }

    // updateProdotto onlyOwner ()
}
