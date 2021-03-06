// entry file for the browser environment
// import stylesheets here
import '../styles/application.css';

// import npm modules that are valid to use only in the browser
import ReactDOM from 'react-dom';
global.ReactDOM = ReactDOM;
import { BrowserRouter } from 'react-router-dom';
// global.History = History;
global.Router = BrowserRouter;
import deepForceUpdate from 'react-deep-force-update'
global.deepForceUpdate = deepForceUpdate;
// import modules common to browser and server side rendering (ssr)
// environments from application_common.js
import './application_common.js';

import init_app from 'isomorfeus_debug_guide_loader.rb';
init_app();
Opal.load('isomorfeus_debug_guide_loader');

if (module.hot) { module.hot.accept(); }
