import React, { useCallback, useEffect, useRef } from "react";
import { Provider, useDispatch, useSelector } from "react-redux";
// actions
import { setWallet } from "./_redux/actions";
// components
import Modal from "./_components/Modal";
import Navbar from "./_components/Navbar";
// contract
import { abi, contractGanacheAddress } from "./contracts/post";
// ethers
import { providers, Contract } from "ethers";
// store, actions
import { showCreatePostModal } from "./_redux/actions";
import store from "./_redux/store";
// styled-components
import { ThemeProvider } from "styled-components";
// styles
import { MainFlexContainer } from "./styles/shared/Container";
import GlobalStyles from "./_styles/Global.styles";
// utils
import { navbar, theme } from "./_utils/data";
// web3modal
import Web3Modal from "web3modal";

const App = () => {
    const dispatch = useDispatch();
    const { createPost, wallet } = useSelector((state) => state);

    const web3modalRef = useRef();

    const menuItems = [
        {
            title: "+",
            action: useCallback(
                () => dispatch(showCreatePostModal({ showModal: true })),
                [dispatch]
            ),
            type: "normal",
        },
        {
            title: wallet.loading ? "..." : wallet.address,
            action: () => {},
            type: "address",
        },
    ];

    const supportedChainIds = [1337, 5];

    const getProviderOrSigner = async (needSigner = false) => {
        const provider = await web3modalRef.current.connect();
        const web3Provider = new providers.Web3Provider(provider);

        // if user is not connected to Goerli network, throw an error
        const _network = await web3Provider.getNetwork();
        const { chainId } = _network;
        if (!supportedChainIds.includes(chainId)) {
            window.alert("Change the network to Goerli!");
            throw new Error("Change the network to Goerli!");
        }

        if (needSigner) {
            const signer = web3Provider.getSigner();
            return signer;
        }
        return web3Provider;
    };

    const connectWallet = async () => {
        try {
            const signer = await getProviderOrSigner(true);
            const address = await signer.getAddress();
            console.log("I got called!");
            console.log(address, signer);
            // setWallet address
            dispatch(setWallet({ address }));
        } catch (error) {
            console.error(error);
        }
    };

    useEffect(() => {
        if (!wallet.connected) {
            // setWallet loading to true
            dispatch(setWallet({ loading: true }));
            web3modalRef.current = new Web3Modal({
                disableInjectedProvider: false,
                network: "5777", // this should point to Ganache
                providerOptions: {},
            });
            connectWallet();
            // setWallet loading to false
            dispatch(setWallet({ loading: false }));
        }
    }, [dispatch, wallet.connected]);

    return (
        <ThemeProvider theme={theme}>
            <GlobalStyles />
            <MainFlexContainer>
                <Navbar logo={navbar.logo} menuItems={menuItems} />
                {createPost.showModal && <Modal />}
            </MainFlexContainer>
        </ThemeProvider>
    );
};

const AppProviderWrapper = () => {
    return (
        <Provider store={store}>
            <App />
        </Provider>
    );
};

export default AppProviderWrapper;
