const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MockERC20", function () {
    let token;
    let owner;

    beforeEach(async function () {
        // Obtén las cuentas de prueba
        [owner] = await ethers.getSigners();

        // Despliega el contrato MockERC20
        const TokenFactory = await ethers.getContractFactory("MockERC20");
        token = await TokenFactory.deploy();

        // Asegúrate de que el contrato esté desplegado
        await token.deployed();

        console.log("MockERC20 deployed to:", token.address);
    });

    it("Debe desplegar correctamente y asignar el balance inicial", async function () {
        // Verificar que el contrato se haya desplegado correctamente
        expect(token.address).to.properAddress;

        // Verificar que el balance inicial de la cuenta sea 1,000,000 tokens
        const balance = await token.balanceOf(owner.address);
        expect(balance).to.equal(ethers.utils.parseUnits("1000000", 18));
    });
});
