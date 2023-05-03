import { createGlobalStyle } from "styled-components";

export default createGlobalStyle`
    * {
        --three-px: 3px;
        --seven-px: 7px;
        --ten-px: 10px;

        margin: 0px;
        padding: 0px;
        font-family: sans-serif;
        box-sizing: border-box;
    }
    body, #root {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        color: ${({
            theme: {
                colors: { white01 },
            },
        }) => white01};
        background-color: ${({
            theme: {
                colors: { dark02 },
            },
        }) => dark02};
        /** border: 1px solid black; */
    }
`;
