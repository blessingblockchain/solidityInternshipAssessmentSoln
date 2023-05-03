import { useCallback } from "react";
import { useDispatch, useSelector } from "react-redux";
// actions
import { showCreatePostModal } from "../../_redux/actions";
// components
import Post from "./Post";
//  styles
import { MainScreen, XButton } from "../../_styles/Modal";
import { DivContainer, MainFlexContainer } from "../../styles/shared/Container";

const Modal = () => {
    const dispatch = useDispatch();
    const { createPost } = useSelector((state) => state);

    const handleShowCreatePostModal = useCallback(
        () => dispatch(showCreatePostModal({ showModal: false })),
        [dispatch]
    );
    return (
        <MainScreen>
            <MainFlexContainer
                flexDirection={"row"}
                justifyContent={"flex-end"}
            >
                <XButton onClick={handleShowCreatePostModal}>X</XButton>
            </MainFlexContainer>
            <DivContainer
                height={"100%"}
                flexDirection={"column"}
                justifyContent={"center"}
                alignItems={"center"}
            >
                {createPost.showModal && <Post />}
            </DivContainer>
        </MainScreen>
    );
};

export default Modal;
