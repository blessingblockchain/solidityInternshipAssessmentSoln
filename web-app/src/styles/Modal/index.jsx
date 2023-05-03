import styled from "styled-components";

export const MainScreen = styled.main`
    position: fixed;
    top: 0;
    left: 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    width: 100%;
    height: 100vh;
    background-color: ${({
        theme: {
            colors: { dark03 },
        },
    }) => dark03};
`;

export const XButton = styled.button`
    border: none;
    font-size: 1.1rem;
    font-weight: 400;
    padding: calc(var(--ten-px) * 1.5);
    text-transform: uppercase;
    color: ${({
        theme: {
            colors: { white04 },
        },
    }) => white04};
    background-color: transparent;
    margin: 1px 0px 0px 0px;

    &:hover {
        color: ${({
            theme: {
                colors: { white02 },
            },
        }) => white02};
        background-color: ${({
            theme: {
                colors: { red01 },
            },
        }) => red01};
        outline: 1px solid
            ${({
                theme: {
                    colors: { white03 },
                },
            }) => white03};
    }
`;
