import styled from "styled-components";

export const MainNav = styled.main`
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: ${({
        theme: {
            colors: { dark01 },
        },
    }) => dark01};
    padding: 0px 0px 0px calc(var(--ten-px) * 1.5);
    box-shadow: 0px 1px 8px
        ${({
            theme: {
                colors: { white04 },
            },
        }) => white04};
`;

export const Logo = styled.img`
    width: 40px;
    height: auto;
`;

export const LogoText = styled.h4`
    font-size: 1.1rem;
    font-family: cursive;
    font-weight: 400;
`;

export const Address = styled.p`
    color: ${({
        theme: {
            colors: { blue04 },
        },
    }) => blue04};
    font-size: 0.93rem;
    font-family: "Calibri Light";
    font-weight: 600;
`;

export const List = styled.li`
    height: 100%;
    cursor: pointer;
    font-size: 1.1rem;
    font-family: system-ui;
    list-style-type: none;
    padding: calc(var(--ten-px) * 1.6);
    transition: 300ms ease-in;
    border-bottom: 0.5px solid transparent;

    &:hover {
        border-bottom: 1px solid
            ${({
                theme: {
                    colors: { blue02 },
                },
            }) => blue02};
        background-color: ${({
            theme: {
                colors: { white03 },
            },
        }) => white03};
    }
`;
