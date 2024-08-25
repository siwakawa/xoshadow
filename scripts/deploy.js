async function main() {
    // Deploy the Verifier contract
    const Verifier = await ethers.getContractFactory("Verifier");
    const verifier = await Verifier.deploy();
    await verifier.deployed();
    console.log("Verifier deployed to:", verifier.address);

    // Deploy the XOShadow contract, passing the Verifier contract address
    const XOShadow = await ethers.getContractFactory("XOShadow");
    const xoShadow = await XOShadow.deploy(verifier.address);
    await xoShadow.deployed();
    console.log("XOShadow deployed to:", xoShadow.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
