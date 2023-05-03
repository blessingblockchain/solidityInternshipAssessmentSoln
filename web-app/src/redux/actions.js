import { SET_WALLET, SHOW_CREATE_POST_MODAL } from "./actionTypes";

/**
 *
 * @param {object} payload this can be any of the available properties found in initialState.createPost
 * @returns `{type: SHOW_CREATE_POST_MODAL, payload}`
 */
export const showCreatePostModal = (payload) => ({
    type: SHOW_CREATE_POST_MODAL,
    payload,
});

export const setWallet = (payload) => ({
    type: SET_WALLET,
    payload,
});
