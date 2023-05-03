import styled, { css } from "styled-components";

export const MainFlexContainer = styled.main`
    position: relative;
    width: 100%;
    display: flex;
    flex-direction: ${({ flexDirection }) => flexDirection || "column"};
    align-items: ${({ alignItems }) => alignItems || "flex-start"};
    justify-content: ${({ justifyContent }) => justifyContent || "flex-start"};

    ${({
        theme: {
            ipad: { width },
        },
    }) => css`
        @media (max-width: ${width}) {
            flex-direction: ${({ flexDirectionIpad }) =>
                flexDirectionIpad || "column"};
            align-items: ${({ alignItemsIpad }) =>
                alignItemsIpad || "flex-start"};
            justify-content: ${({ justifyContentIpad }) =>
                justifyContentIpad || "flex-start"};
        }
    `}
`;

export const DivContainer = styled.div`
    width: ${({ width }) => width || "100%"};
    height: ${({ height }) => height || "initial"};
    display: flex;
    flex-direction: ${({ flexDirection }) => flexDirection || "column"};
    align-items: ${({ alignItems }) => alignItems || "flex-start"};
    justify-content: ${({ justifyContent }) => justifyContent || "flex-start"};
`;
