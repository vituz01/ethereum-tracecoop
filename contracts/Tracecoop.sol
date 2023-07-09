// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

contract Tracecoop {

    string idProdotto;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    // Area di interesse “Tracciabilità/Qualità”

    struct Provenienza {
        string[] comuniLottoProduzione;
        string comuneCentroLavorazione;
    }

    struct Cultivar {
        string nome;
        bool isLabCertified;
    }

    struct InfoTemporali {
        uint256 annoImpianto;
        string dataRaccolta;
    }

    struct Conservazione {
        uint256 nGiorni;
        int256 temperatura;
    }

    struct Qualita {
        string dataClassificazione;
        uint256 kgPerMercato;
        uint256 kgPerIndustria;
        uint256 kgPerScarto;
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

    mapping(string => Prodotto) idToProdotto;

    Prodotto[] internal listaProdotti;

    // CRUD operations

    function addProdotto(
        string memory _idProdotto,
        string memory _nomeSpecie,
        TracciabilitaQualita memory _traccQual,
        SostenibilitaAmbiente memory _sostAmb,
        SostenibilitaSociale memory _sostSoc,
        bool _isAziendaInnovativa
    ) public onlyOwner {
        require(
            checkIfProdottoIsPresent(_idProdotto) == false,
            "Product already registered"
        );
        Prodotto memory newProdotto = Prodotto(
            _idProdotto,
            _nomeSpecie,
            _traccQual,
            _sostAmb,
            _sostSoc,
            _isAziendaInnovativa
        );
        listaProdotti.push(newProdotto);
        idToProdotto[_idProdotto] = newProdotto;
    }

    function getListaProdotti() public view returns (Prodotto[] memory) {
        return listaProdotti;
    }

    function getProdottoById(
        string memory _idProdotto
    ) public view returns (Prodotto memory) {
        require(
            checkIfProdottoIsPresent(_idProdotto) == true,
            "Product not found"
        );
        return idToProdotto[_idProdotto];
    }

    function removeProdotto(string memory _idProdotto) public onlyOwner {
        require(
            checkIfProdottoIsPresent(_idProdotto) == true,
            "Product not found"
        );
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
        delete (idToProdotto[_idProdotto]);
    }

    function updateInfoProdotto(
        string memory _idProdotto,
        string memory _nomeSpecie,
        TracciabilitaQualita memory _traccQual,
        SostenibilitaAmbiente memory _sostAmb,
        SostenibilitaSociale memory _sostSoc,
        bool _isAziendaInnovativa
    ) public onlyOwner {
        require(
            checkIfProdottoIsPresent(_idProdotto) == true,
            "Product not found"
        );
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
        listaProdotti[index].idProdotto = _idProdotto;
        listaProdotti[index].nomeSpecie = _nomeSpecie;
        listaProdotti[index].traccQual = _traccQual;
        listaProdotti[index].sostAmb = _sostAmb;
        listaProdotti[index].sostSoc = _sostSoc;
        listaProdotti[index].isAziendaInnovativa = _isAziendaInnovativa;
        idToProdotto[_idProdotto] = listaProdotti[index];
    }

    // Retrieve specific output (anni impianto arboreo)

    function getAnniImpianto(string memory _idProdotto) public view returns(uint256) {
        Prodotto memory target = getProdottoById(_idProdotto);
        uint256 timestamp = block.timestamp;
        uint256 blockYear = (timestamp / 31536000) + 1970; // 31536000 seconds in a year
        uint256 annoCostruzioneImpianto = target.traccQual.infoTemporali.annoImpianto;
        uint256 anniImpianto = blockYear - annoCostruzioneImpianto;
        return anniImpianto;
    }

    /* Does not work since Solidity does not support floating point division

    function getPercentualeMercato(string memory _idProdotto) public view returns(uint256) {
        Prodotto memory target = getProdottoById(_idProdotto);
        uint256 totale = target.traccQual.qualita.kgPerMercato + target.traccQual.qualita.kgPerIndustria + target.traccQual.qualita.kgPerScarto;
        uint256 percentualeMercato = (target.traccQual.qualita.kgPerMercato * 1e18 / totale);
        return percentualeMercato;
    }

    */


    //utility functions

    function checkIfProdottoIsPresent(
        string memory _idProdotto
    ) internal view returns (bool) {
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

}
