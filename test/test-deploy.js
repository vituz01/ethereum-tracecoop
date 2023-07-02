const { ethers } = require("hardhat")
const fs = require("fs")
const { assert, expect } = require("chai")

describe("Tracecoop", function () {
    let tracecoopFactory, tracecoop

    beforeEach(async function () {
        tracecoopFactory = await ethers.getContractFactory("Tracecoop")
        tracecoop = await tracecoopFactory.deploy()
    })

    it("Should assert that listaProdotti is null since not yet initialized", async function () {
        let [result] = await tracecoop.getListaProdotti()
        assert(result == null)
    })

    /* it("Should add a new product to the listaProdotti", async function () {
        try {
            const newProdotto = fs.readFileSync("test/newProdotto.json")
            console.log(JSON.parse(newProdotto))
            await provider.addProdotto(newProdotto)
            console.log(listaProdotti)
        } catch (e) {
            console.error(e)
        }
    }) */
})
