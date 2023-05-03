// redux store
import { configureStore } from "@reduxjs/toolkit";
// reducer
import { rootReducer } from "./reducers";

export default configureStore({ reducer: rootReducer });
