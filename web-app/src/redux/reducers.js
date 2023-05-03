// actionTypes
import { SET_WALLET, SHOW_CREATE_POST_MODAL } from "./actionTypes";

export const initialState = {
    createPost: {
        loading: false,
        showModal: false,
    },
    listPost: {
        loading: false,
        showScreen: true,
    },
    userProfile: {
        loading: false,
        address: ``,
        showScreen: false,
    },
    wallet: {
        connected: false,
        loading: false,
        address: ``,
    },
};

export const rootReducer = (state = initialState, { type, payload }) => {
    switch (type) {
        case SET_WALLET:
            return {
                ...state,
                wallet: { ...state.wallet, ...payload },
            };
        case SHOW_CREATE_POST_MODAL:
            return {
                ...state,
                createPost: { ...state.createPost, ...payload },
            };

        default:
            return state;
    }
};
