// styles
import {
    Address,
    List,
    Logo,
    LogoText,
    MainNav,
} from "../styles/Navbar.styles.jsx";
import { DivContainer } from "../styles/shared/Container.jsx";

const Navbar = ({ logo, menuItems }) => {
    return (
        <MainNav>
            <DivContainer
                width={"90%"}
                flexDirection={"row"}
                justifyContent={"space-between"}
                alignItems={"center"}
            >
                {/* Logo */}
                <DivContainer
                    width={"fit-content"}
                    flexDirection={"row"}
                    alignItems={"center"}
                >
                    <Logo src={logo} alt="navbar-logo" />
                    <LogoText>D.C Blog</LogoText>
                </DivContainer>
                {/* menu items */}
                <DivContainer
                    width={"fit-content"}
                    flexDirection={"row"}
                    alignItems={"center"}
                >
                    {menuItems.map(({ title, action, type }, index) => (
                        <List key={index} onClick={action}>
                            {type === "address" ? (
                                <Address>{title}</Address>
                            ) : (
                                title
                            )}
                        </List>
                    ))}
                </DivContainer>
            </DivContainer>
        </MainNav>
    );
};

export default Navbar;
