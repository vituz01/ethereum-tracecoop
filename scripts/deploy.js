// imports
const { ethers } = require("hardhat")

// async main
async function main() {
    const tracecoopFactory = await ethers.getContractFactory("Tracecoop")
    console.log("Deploying contract...")
    const tracecoop = await tracecoopFactory.deploy({
        gasPrice: "1000000000",
    })
    await tracecoop.waitForDeployment()
    console.log(`Deployed contract to: ${await tracecoop.getAddress()}`)
}

// main
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
