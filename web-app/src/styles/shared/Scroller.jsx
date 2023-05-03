import styled from "styled-components";

export const Scroller = styled.main`
    position: relative;
    width: 100%;
    height: calc(100% - 20px);
    display: flex;
    flex-direction: ${({ flexDirection }) => flexDirection || "row"};
    align-items: ${({ alignItems }) => alignItems || "flex-start"};
    justify-content: ${({ justifyContent }) => justifyContent || "flex-star"};
    overflow: ${({ overflow }) => overflow || "scroll hidden"};
    border-radius: 5px;
    padding: ${({ padding }) => padding};
    border: ${({ borderWidth }) => borderWidth || "0px"} solid
        ${({ borderColor, theme: { white033 } }) => borderColor || white033};

    &::-webkit-scrollbar {
        display: none;
    }

    @media (max-width: 500px) {
        flex-direction: ${({ flexDirection }) => flexDirection || "column"};
        border: 3px solid green;
    }
`;

export const ScrollContainer = styled.div`
    width: fit-content;
    height: 100%;
    display: flex;
    flex-wrap: ${({ flexWrap }) => flexWrap || "nowrap"};
    flex-direction: ${({ flexDirection }) => flexDirection || "row"};
    align-items: ${({ alignItems }) => alignItems || "flex-start"};
    justify-content: ${({ justifyContent }) => justifyContent || "flex-start"};
`;
