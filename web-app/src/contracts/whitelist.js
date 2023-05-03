export const abi = [
    {
        inputs: [
            {
                internalType: "uint8",
                name: "_maxWhitelistedAddresses",
                type: "uint8",
            },
        ],
        stateMutability: "nonpayable",
        type: "constructor",
    },
    {
        inputs: [],
        name: "maxWhitelistedAddresses",
        outputs: [
            {
                internalType: "uint8",
                name: "",
                type: "uint8",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [],
        name: "numAddressesWhitelisted",
        outputs: [
            {
                internalType: "uint8",
                name: "",
                type: "uint8",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "",
                type: "address",
            },
        ],
        name: "whitelistedAddresses",
        outputs: [
            {
                internalType: "bool",
                name: "",
                type: "bool",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [],
        name: "addAddressToWhitelist",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
];

// ganache
export const ganacheContractAddress = `0xbe671Bdf0Dc7381e49d9101c6B340991a0739E5e`;
