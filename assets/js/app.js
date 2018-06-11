// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
// import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket";
import ReactDOM from 'react-dom';
import React from 'react';
import Hello from "./components/hello";
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import {appReducer} from "./reducers/appReducer.js";
import { Persons } from "./container/Persons";
import { FrequencyAnalysis } from "./container/FrequencyAnalysis";
import { PotentialDuplicates } from "./container/PotentialDuplicates";

let store = createStore(
  appReducer,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
)
socket(store)


const App = ({ store }) => (
  <Provider store={store}>
    <PotentialDuplicates />
  </Provider>
)
ReactDOM.render(<App store={store} />, document.getElementById("root"));
