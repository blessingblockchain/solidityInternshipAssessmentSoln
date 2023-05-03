import styled from "styled-components";

export const Title = styled.h1`
    width: 100%;
    padding: var(--seven-px) calc(var(--seven-px) * 2.5);
    font-family: Calibri Light;
    border-bottom: 1px solid
        ${({
            theme: {
                colors: { white04 },
            },
        }) => white04};
`;

export const Form = styled.form`
    width: 500px;
    height: 380px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    border-radius: 3px;
    background-color: ${({
        theme: {
            colors: { dark01 },
        },
    }) => dark01};
`;

export const FormContainer = styled.div`
    width: 100%;
    height: 65%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: calc(var(--seven-px) * 1.4) var(--three-px);
`;

export const TextLabel = styled.label`
    font-weight: 100;
    font-size: 0.95rem;
    font-family: "Calibri Light";
`;

export const TextInput = styled.input`
    width: 200px;
    font-size: 1.1rem;
    font-weight: 700;
    font-family: "Calibri Light";
    padding: var(--seven-px);
    outline: none;
    color: ${({
        theme: {
            colors: { white02 },
        },
    }) => white02};
    border-bottom: 1px solid
        ${({
            theme: {
                colors: { white05 },
            },
        }) => white05};
    background-color: ${({
        theme: {
            colors: { dark04 },
        },
    }) => dark04};
    border: none;
    border-bottom: 1px solid
        ${({
            theme: {
                colors: { white05 },
            },
        }) => white05};
    transition: 350ms ease-in-out;

    &:active {
        background-color: ${({
            theme: {
                colors: { dark03 },
            },
        }) => dark03};
    }
`;

export const TextDiv = styled.div`
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    padding: var(--ten-px);
`;

export const Button = styled.button`
    border: none;
    border-radius: 3px;
    font-size: 1.02rem;
    scale: 0.97;
    padding: calc(var(--seven-px) * 2.2) calc(var(--ten-px) * 3.1);
    color: ${({
        theme: {
            colors: { white02 },
        },
    }) => white02};
    background-color: ${({
        theme: {
            colors: { blue03 },
        },
    }) => blue03};
    transition: 350ms ease-in-out;

    &:hover {
        scale: 1;
        background-color: ${({
            theme: {
                colors: { blue02 },
            },
        }) => blue02};
    }
`;
